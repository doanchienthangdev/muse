# muse install — Windows PowerShell entry point
#
# Usage:
#   iwr -useb https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.ps1 | iex
#
# What it does:
#   1. Detects WSL2 (recommended)      -> delegates to bash install.sh inside WSL
#   2. Falls back to Git Bash          -> runs install.sh inside Git Bash
#   3. Errors out with WSL2 install instructions if neither is available
#
# Why WSL/Git Bash are required:
#   Muse uses filenames with colons (e.g., commands/muse:aristotle.md).
#   Native Windows NTFS reserves `:` for Alternate Data Streams, so pure
#   PowerShell / cmd cannot host these files. WSL2 (ext4 / 9p) and Git Bash
#   (MSYS2 emulation) both handle colons transparently.
#
# Customization (set env var before running):
#   $env:MUSE_REPO     = "https://github.com/your-fork/muse"  (default: doanchienthangdev/muse)
#   $env:MUSE_REF      = "v2.32.0-alpha"                       (default: main)
#   $env:MUSE_TARGET   = "/custom/path/to/muse"                (default: ~/.claude/skills/muse)

#Requires -Version 5.0
$ErrorActionPreference = "Stop"

$Repo   = if ($env:MUSE_REPO)   { $env:MUSE_REPO }   else { "https://github.com/doanchienthangdev/muse" }
$Ref    = if ($env:MUSE_REF)    { $env:MUSE_REF }    else { "main" }
$Target = if ($env:MUSE_TARGET) { $env:MUSE_TARGET } else { '$HOME/.claude/skills/muse' }

# Build the bash command that the install.sh inside WSL/Git Bash will receive.
# We delegate to the published install.sh rather than re-implementing its logic.
$RawInstall = "https://raw.githubusercontent.com/$([System.Uri]::new($Repo).AbsolutePath.Trim('/'))/$Ref/install.sh"

Write-Host ""
Write-Host "   +==================================+" -ForegroundColor Cyan
Write-Host "   |          M   U   S   E           |" -ForegroundColor Cyan
Write-Host "   |                                  |" -ForegroundColor Cyan
Write-Host "   |  Windows installer (delegating)  |" -ForegroundColor Cyan
Write-Host "   +==================================+" -ForegroundColor Cyan
Write-Host ""

# ---------------------------------------------------------------
# 1. Detect WSL2
# ---------------------------------------------------------------
$HasWSL = $false
try {
    $null = & wsl.exe --status 2>&1
    if ($LASTEXITCODE -eq 0) {
        # Ensure at least one distro is installed and usable
        $distros = (& wsl.exe --list --quiet 2>$null) -split "`n" | Where-Object { $_ -and $_.Trim() -ne '' }
        if ($distros.Count -gt 0) {
            $HasWSL = $true
            Write-Host "[ok] WSL2 detected (distros: $($distros -join ', '))" -ForegroundColor Green
        }
    }
} catch {
    # wsl.exe not present
}

# ---------------------------------------------------------------
# 2. Detect Git Bash
# ---------------------------------------------------------------
$GitBashPath = $null
foreach ($candidate in @(
    "$env:ProgramFiles\Git\bin\bash.exe",
    "${env:ProgramFiles(x86)}\Git\bin\bash.exe",
    "$env:LOCALAPPDATA\Programs\Git\bin\bash.exe",
    "$env:USERPROFILE\scoop\apps\git\current\bin\bash.exe"
)) {
    if ($candidate -and (Test-Path $candidate)) {
        $GitBashPath = $candidate
        Write-Host "[ok] Git Bash detected at $candidate" -ForegroundColor Green
        break
    }
}

# ---------------------------------------------------------------
# 3. Abort if neither is present
# ---------------------------------------------------------------
if (-not $HasWSL -and -not $GitBashPath) {
    Write-Host ""
    Write-Host "[fail] Neither WSL2 nor Git Bash is available." -ForegroundColor Red
    Write-Host ""
    Write-Host "Muse uses filenames containing colons (e.g., commands/muse:aristotle.md)," -ForegroundColor Yellow
    Write-Host "which are invalid on native Windows NTFS. You need one of:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Option 1 (recommended) -- Install WSL2:" -ForegroundColor White
    Write-Host "    wsl --install"
    Write-Host "    (reboot, then re-run this installer)"
    Write-Host ""
    Write-Host "  Option 2 -- Install Git for Windows (includes Git Bash):" -ForegroundColor White
    Write-Host "    winget install --id Git.Git"
    Write-Host "    (then re-run this installer)"
    Write-Host ""
    Write-Host "Docs: https://learn.microsoft.com/windows/wsl/install" -ForegroundColor Cyan
    exit 1
}

# ---------------------------------------------------------------
# 4. Preferred path: WSL2
# ---------------------------------------------------------------
if ($HasWSL) {
    Write-Host ""
    Write-Host "[info] Installing muse inside WSL2..." -ForegroundColor Cyan
    Write-Host "[info] Target inside WSL: ~/.claude/skills/muse" -ForegroundColor Cyan
    Write-Host ""

    # Pass MUSE_REPO/REF/TARGET to the bash process so the upstream install.sh honors them.
    $envPrelude = "MUSE_REPO='$Repo' MUSE_REF='$Ref'"
    if ($env:MUSE_TARGET) {
        $envPrelude += " MUSE_TARGET='$env:MUSE_TARGET'"
    }

    # Prefer curl; fall back to wget if curl isn't in the WSL distro.
    $bashCmd = "set -e; if command -v curl >/dev/null; then $envPrelude sh -c `"curl -fsSL $RawInstall | sh`"; elif command -v wget >/dev/null; then $envPrelude sh -c `"wget -qO- $RawInstall | sh`"; else echo 'ERROR: need curl or wget inside WSL (sudo apt install curl)'; exit 1; fi"

    & wsl.exe bash -lc $bashCmd
    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "[fail] WSL install exited with code $LASTEXITCODE" -ForegroundColor Red
        exit $LASTEXITCODE
    }

    Write-Host ""
    Write-Host "[ok] muse installed inside WSL2." -ForegroundColor Green
    Write-Host ""
    Write-Host "IMPORTANT -- Claude Code must run inside WSL2 to see these commands:" -ForegroundColor Yellow
    Write-Host "    wsl"
    Write-Host "    claude"
    Write-Host ""
    Write-Host "Then try:  /muse:who what should I think about today?" -ForegroundColor Cyan
    exit 0
}

# ---------------------------------------------------------------
# 5. Fallback: Git Bash
# ---------------------------------------------------------------
Write-Host ""
Write-Host "[info] WSL2 not available -- installing via Git Bash..." -ForegroundColor Cyan
Write-Host "[warn] Claude Code on native PowerShell/cmd may not see colon-named commands." -ForegroundColor Yellow
Write-Host "[warn] For best results, install WSL2 and re-run." -ForegroundColor Yellow
Write-Host ""

$envPrelude = "MUSE_REPO='$Repo' MUSE_REF='$Ref'"
if ($env:MUSE_TARGET) {
    $envPrelude += " MUSE_TARGET='$env:MUSE_TARGET'"
}

$bashCmd = "set -e; if command -v curl >/dev/null; then $envPrelude sh -c `"curl -fsSL $RawInstall | sh`"; else echo 'ERROR: curl not found in Git Bash'; exit 1; fi"

& $GitBashPath -lc $bashCmd
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "[fail] Git Bash install exited with code $LASTEXITCODE" -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host ""
Write-Host "[ok] muse installed via Git Bash." -ForegroundColor Green
Write-Host ""
Write-Host "If /muse:* commands don't appear in Claude Code:" -ForegroundColor Yellow
Write-Host "  1. Confirm Claude Code sees ~/.claude/commands/muse:*.md files"
Write-Host "  2. If they're missing, install WSL2 and re-run this installer:"
Write-Host "     wsl --install"
Write-Host ""
