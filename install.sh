#!/usr/bin/env sh
# muse install — agentic skill framework for Claude Code
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh
#
# What it does:
#   1. Verifies git is available (only dependency)
#   2. Refuses to run as root
#   3. Clones muse repo to ~/.claude/skills/muse/        (skipped if already installed)
#   4. Copies slash command files to ~/.claude/commands/ (always, idempotent refresh)
#   5. Creates session directory ~/.muse/sessions/       (always, idempotent)
#   6. Prints welcome message
#
# Idempotent: safe to re-run. If muse is already installed, the clone is skipped
# but the slash commands are refreshed from the existing clone. To update the
# clone itself, run: cd ~/.claude/skills/muse && git pull

set -eu

REPO="${MUSE_REPO:-https://github.com/doanchienthangdev/muse}"
REF="${MUSE_REF:-main}"
TARGET="${MUSE_TARGET:-$HOME/.claude/skills/muse}"
COMMANDS_DIR="${MUSE_COMMANDS_DIR:-$HOME/.claude/commands}"
SESSIONS_DIR="${MUSE_SESSIONS_DIR:-$HOME/.muse/sessions}"

# Refuse root
if [ "$(id -u)" = "0" ]; then
  echo "ERROR: refusing to run as root. Install as your normal user." >&2
  exit 1
fi

# Require git
if ! command -v git >/dev/null 2>&1; then
  echo "ERROR: git is required. Install: brew install git (macOS) or apt install git (Linux)" >&2
  exit 1
fi

# Check for existing install — skip clone but still refresh commands + sessions
SKIP_CLONE=0
if [ -e "$TARGET" ]; then
  echo "Muse skill already installed at $TARGET"
  echo "Refreshing slash commands and session directory (idempotent)..."
  echo "(To update the skill itself: cd $TARGET && git pull)"
  SKIP_CLONE=1
fi

# Clone (only if not already present)
if [ "$SKIP_CLONE" -eq 0 ]; then
  mkdir -p "$(dirname "$TARGET")"
  echo "Cloning Muse from $REPO ($REF) to $TARGET..."
  git clone --depth 1 --branch "$REF" "$REPO" "$TARGET"
fi

# Install slash commands — always, idempotent
# Copies ~/.claude/skills/muse/commands/muse:*.md → ~/.claude/commands/muse:*.md
mkdir -p "$COMMANDS_DIR"
if [ -d "$TARGET/commands" ]; then
  # Use a loop instead of wildcard cp to tolerate the zero-match case and to
  # handle filenames with colons safely across shells.
  for cmd in "$TARGET/commands/"muse:*.md; do
    [ -f "$cmd" ] || continue
    cp "$cmd" "$COMMANDS_DIR/"
  done
  cmd_count=$(find "$TARGET/commands" -maxdepth 1 -name 'muse:*.md' -type f 2>/dev/null | wc -l | tr -d ' ')
  echo "Installed $cmd_count slash commands to $COMMANDS_DIR/"
else
  echo "WARN: $TARGET/commands/ not found — slash commands not installed."
  echo "      v2.1 requires the commands/ directory in the muse repo."
fi

# Create sessions directory — always, idempotent
mkdir -p "$SESSIONS_DIR"
session_count=$(find "$SESSIONS_DIR" -maxdepth 1 -name '*.md' -type f 2>/dev/null | wc -l | tr -d ' ')
if [ "$session_count" -eq 0 ]; then
  echo "Session directory ready: $SESSIONS_DIR/ (empty — sessions will land here)"
else
  echo "Session directory: $SESSIONS_DIR/ ($session_count existing sessions preserved)"
fi

# Welcome
cat <<EOF

   ╔══════════════════════════════════╗
   ║          M   U   S   E           ║
   ║                                  ║
   ║  Think with the greats           ║
   ╚══════════════════════════════════╝

Installed at: $TARGET
Commands:     $COMMANDS_DIR/muse:*.md (8 personas)
Sessions:     $SESSIONS_DIR/

=== v2.1 — Structured Sessions ===

Try a deep 5-stage session in Claude Code (saves a markdown file to $SESSIONS_DIR/):

    /muse:feynman why is my code slow?
    /muse:socrates what do I actually mean by "community"?
    /muse:dieter-rams my landing page isn't converting

All 8 personas available as slash commands:
    /muse:feynman         /muse:socrates        /muse:seneca
    /muse:marcus-aurelius /muse:aristotle       /muse:confucius
    /muse:lao-tzu         /muse:dieter-rams

=== v2.0 — Quick free-text (still works) ===

For a quick conversational gut-check (no file saved):

    muse:feynman quick sanity check on this idea

Or use multi-persona modes:

    muse:all should I pivot?
    muse:debate aristotle vs lao-tzu ship fast or ship polished?

=== Next step ===

If the slash commands don't appear immediately, restart Claude Code or open a
new session. Claude Code scans ~/.claude/commands/ at session start.

Full docs: $TARGET/README.md
GitHub:    $REPO
Sessions:  $TARGET/docs/SESSIONS.md

Zero dependencies. Runs entirely in your agent session.
EOF
