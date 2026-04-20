#!/usr/bin/env bash
# Migrate v2.2 session files to v2.16 frontmatter (additive only).
# Adds null `thread_id`, `checkpoint_stage`, `convergence_state` fields if absent.
# Safe to re-run (idempotent). Preserves v2.2 behavior (null fields = v2.2 path).
#
# Usage:
#   bash tests/session-regression/migrate-v2-2-to-v2-16.sh [--dry-run]

set -euo pipefail

DRY_RUN=0
if [ "${1:-}" = "--dry-run" ]; then
  DRY_RUN=1
fi

SESSIONS_DIR="${MUSE_SESSIONS_DIR:-$HOME/.muse/sessions}"

if [ ! -d "$SESSIONS_DIR" ]; then
  echo "No sessions directory at $SESSIONS_DIR — nothing to migrate."
  exit 0
fi

echo "== Migrating sessions in $SESSIONS_DIR =="
[ "$DRY_RUN" = "1" ] && echo "   (DRY RUN — no writes)"
echo ""

MIGRATED=0
SKIPPED=0
TOTAL=0

for session_file in "$SESSIONS_DIR"/*.md; do
  [ -f "$session_file" ] || continue
  TOTAL=$((TOTAL + 1))
  base=$(basename "$session_file")

  # Idempotence: skip if already migrated (has thread_id field, even if null)
  if grep -q "^thread_id:" "$session_file"; then
    printf "  %-60s SKIP (already v2.16)\n" "$base"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  # Must have frontmatter bounded by ---
  if ! head -1 "$session_file" | grep -q "^---$"; then
    printf "  %-60s SKIP (no YAML frontmatter)\n" "$base"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  if [ "$DRY_RUN" = "1" ]; then
    printf "  %-60s WOULD migrate (+ thread_id, checkpoint_stage, convergence_state)\n" "$base"
    MIGRATED=$((MIGRATED + 1))
    continue
  fi

  # Backup
  cp "$session_file" "$session_file.bak.pre-v2-16"

  # Get timestamp from bash (macOS awk lacks strftime)
  migrated_at=$(date -u +%Y-%m-%dT%H:%M:%SZ)

  # Find the SECOND `---` line (close of frontmatter) and inject new fields before it.
  # Using awk to track state: in_fm = 1 between first and second ---, then inject.
  tmp_file=$(mktemp)
  awk -v ts="$migrated_at" '
    BEGIN { fm_start = 0; fm_end = 0; injected = 0 }
    /^---$/ {
      if (fm_start == 0) {
        fm_start = 1
        print $0
        next
      } else if (fm_end == 0 && injected == 0) {
        print "thread_id: null"
        print "parent_session: null"
        print "checkpoint_stage: null"
        print "convergence_state: null"
        print "migrated_from: v2.2"
        print "migrated_at: " ts
        injected = 1
        fm_end = 1
        print $0
        next
      }
    }
    { print }
  ' "$session_file" > "$tmp_file"

  mv "$tmp_file" "$session_file"
  printf "  %-60s MIGRATED\n" "$base"
  MIGRATED=$((MIGRATED + 1))
done

echo ""
echo "== Summary =="
echo "  Total files:  $TOTAL"
echo "  Migrated:     $MIGRATED"
echo "  Skipped:      $SKIPPED"
echo ""
if [ "$DRY_RUN" = "1" ]; then
  echo "Dry-run complete. Re-run without --dry-run to apply."
else
  echo "Backups saved as <filename>.bak.pre-v2-16."
  echo "To rollback: for f in $SESSIONS_DIR/*.bak.pre-v2-16; do mv \"\$f\" \"\${f%.bak.pre-v2-16}\"; done"
fi
