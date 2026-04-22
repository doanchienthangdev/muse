# Installing Muse on Windows

## TL;DR

```powershell
iwr -useb https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.ps1 | iex
```

If it prints a red `[fail]` message, run `wsl --install` (or install Git for Windows), reboot, and re-run the installer.

---

## Why a separate Windows installer?

Muse slash commands map to filenames: `/muse:aristotle` reads `commands/muse:aristotle.md`. The colon is load-bearing — it keeps muse's commands in a distinct namespace so they never collide with other Claude Code skills.

Native Windows **NTFS reserves `:` for Alternate Data Streams** and will not let an ordinary file be named `muse:aristotle.md`. Clone the repo from a PowerShell or cmd prompt and Git will either:

- refuse to check out the `commands/` directory (sparse-checkout fallback), or
- silently sanitize the colon into a substitute character, which breaks the `/muse:*` slash command mapping.

**POSIX-style filesystems don't have this problem.** Both of Windows' supported POSIX layers work out of the box:

| Layer | How it handles colons | How to install |
|-------|----------------------|----------------|
| **WSL2** (recommended) | ext4 / 9p filesystem, colons are fully legal | `wsl --install` then reboot |
| **Git Bash** (fallback) | MSYS2 emulation maps `:` transparently | `winget install --id Git.Git` |

The `install.ps1` script detects which one you have and delegates the install to `install.sh` running inside it. No files live on native NTFS with invalid names.

---

## Recommended setup — WSL2

1. **Install WSL2** (one time, requires reboot):
   ```powershell
   wsl --install
   ```
   This installs Ubuntu by default. Any WSL2 distro works.

2. **Install muse** (in any shell — cmd, PowerShell, or Windows Terminal):
   ```powershell
   iwr -useb https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.ps1 | iex
   ```
   The installer detects WSL2 and runs `install.sh` inside it. Muse lands at `~/.claude/skills/muse` **inside the WSL2 filesystem** (not `C:\Users\You\...`). Slash commands go to `~/.claude/commands/`.

3. **Run Claude Code from inside WSL2**:
   ```bash
   wsl                       # drop into WSL
   claude                    # start Claude Code
   /muse:who what's up?      # triage persona by question
   ```
   Claude Code must run inside WSL2 to see the colon-named commands.

> **Why inside WSL?** Claude Code running on native Windows scans `C:\Users\You\.claude\commands\` — which cannot hold `muse:*.md` files. Claude Code running inside WSL2 scans the WSL-side `~/.claude/commands/`, where the files live and the filesystem accepts colons.

---

## Fallback — Git Bash

If you can't install WSL2 (corporate policy, older Windows, etc.):

1. **Install Git for Windows** (includes Git Bash):
   ```powershell
   winget install --id Git.Git
   ```

2. **Run the installer**:
   ```powershell
   iwr -useb https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.ps1 | iex
   ```
   With no WSL2 present, `install.ps1` falls back to Git Bash.

3. **Known limitation**: Claude Code on native PowerShell/cmd may still not enumerate colon-named files even though Git Bash created them. If `/muse:*` commands don't appear after a Claude Code restart, switch to WSL2.

---

## Troubleshooting

### `wsl --install` says "already installed" but `install.ps1` says WSL is missing

The installer checks `wsl --list --quiet` for a usable distro. Install one:
```powershell
wsl --install -d Ubuntu
wsl --set-default Ubuntu
```

### Installer succeeded but `/muse:*` commands don't appear in Claude Code

1. **Are you running Claude Code inside WSL2?** `wsl` first, then `claude`. Claude Code on native Windows cannot see WSL files reliably.
2. **Did Claude Code restart?** It scans `~/.claude/commands/` once at session start.
3. **Check the files exist inside WSL**:
   ```bash
   wsl ls ~/.claude/commands/muse:*.md | head -5
   ```
   You should see `muse:who.md`, `muse:list.md`, etc.

### I cloned the repo manually from PowerShell and the `commands/` folder is missing or partial

This is the colon-on-NTFS failure mode. Delete the broken clone:
```powershell
Remove-Item -Recurse -Force ~/.claude/skills/muse
```
Then run `install.ps1` — it delegates to WSL/Git Bash and avoids the NTFS trap.

### I want to pin a specific version

Set env vars before invoking the installer:
```powershell
$env:MUSE_REF = "v2.32.0-alpha"
iwr -useb https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.ps1 | iex
```

Supported env vars (same as `install.sh`):

| Var | Default | Meaning |
|---|---|---|
| `MUSE_REPO` | `https://github.com/doanchienthangdev/muse` | Source repo (useful for forks) |
| `MUSE_REF` | `main` | Branch or tag |
| `MUSE_TARGET` | `$HOME/.claude/skills/muse` | Install path (POSIX path inside WSL/Git Bash) |

---

## Why not just rename the files?

Renaming `commands/muse:aristotle.md` → `commands/muse-aristotle.md` would:

- Change every slash command name (`/muse:aristotle` → `/muse-aristotle`)
- Break every README, doc, session file, and user muscle memory built over 32 releases
- Fragment the namespace — muse commands would no longer visually group together
- Require shipping two parallel command sets (one for Windows, one for everyone else) and keeping them in sync

The colon is part of muse's public API. Delegating to WSL/Git Bash on Windows is a one-time install friction that keeps the rest of the ecosystem clean.

---

## Uninstall

**Inside WSL2 or Git Bash:**
```bash
rm -rf ~/.claude/skills/muse
rm -f ~/.claude/commands/muse:*.md
# sessions preserved at ~/.muse/sessions/ — delete if desired
```

Session artifacts at `~/.muse/sessions/` are kept on uninstall by design. Delete them explicitly if you want a clean slate.
