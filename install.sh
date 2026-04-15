#!/usr/bin/env sh
# muse install — agentic skill framework for Claude Code
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh
#
# What it does:
#   1. Verifies git is available (only dependency)
#   2. Refuses to run as root
#   3. Clones muse repo to ~/.claude/skills/muse/
#   4. Prints welcome message

set -eu

REPO="${MUSE_REPO:-https://github.com/doanchienthangdev/muse}"
REF="${MUSE_REF:-main}"
TARGET="${MUSE_TARGET:-$HOME/.claude/skills/muse}"

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

# Check for existing install
if [ -e "$TARGET" ]; then
  echo "Muse already installed at $TARGET"
  echo "To update:   cd $TARGET && git pull"
  echo "To reinstall: rm -rf $TARGET, then re-run this script"
  exit 0
fi

# Ensure parent dir exists
mkdir -p "$(dirname "$TARGET")"

# Clone
echo "Cloning Muse from $REPO ($REF) to $TARGET..."
git clone --depth 1 --branch "$REF" "$REPO" "$TARGET"

# Welcome
cat <<EOF

   ╔══════════════════════════════════╗
   ║          M   U   S   E           ║
   ║                                  ║
   ║  Think with the greats           ║
   ╚══════════════════════════════════╝

Installed at: $TARGET

Try your first session in Claude Code:

    muse:feynman why is the sky blue?

Or explore what's installed:

    muse:list

Full docs: $TARGET/README.md
GitHub:    $REPO

Zero dependencies. Runs entirely in your agent session.
EOF
