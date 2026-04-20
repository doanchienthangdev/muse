#!/usr/bin/env bash
# lib/thread-lock.sh — Cross-platform thread-level write lock (v2.16.0-alpha)
#
# Uses mkdir + PID-file for atomic lock acquisition. Works on Linux, macOS, and most Unix.
# flock is Linux-only and unreliable on macOS, so we roll our own.
#
# Usage:
#   source lib/thread-lock.sh
#   thread_lock_acquire <thread-dir> || exit 1
#   # ... do write operations ...
#   thread_lock_release <thread-dir>
#
# Or convenience wrapper:
#   thread_with_lock <thread-dir> 'bash commands here'

# Acquire a lock on the given thread directory. Returns 0 on success, 1 on failure.
# Waits up to 5 seconds (5x retry with 1s sleep between).
thread_lock_acquire() {
  local thread_dir="$1"
  local lock_dir="$thread_dir/.lock"
  local max_retries=5
  local retry=0

  mkdir -p "$thread_dir"

  while [ "$retry" -lt "$max_retries" ]; do
    # Atomic mkdir attempt
    if mkdir "$lock_dir" 2>/dev/null; then
      # Won the race. Write owner info.
      local host
      host=$(hostname)
      echo "$$" > "$lock_dir/pid"
      echo "$host" > "$lock_dir/host"
      date -u +%Y-%m-%dT%H:%M:%SZ > "$lock_dir/acquired_at"
      return 0
    fi

    # Lock exists. Check if we can steal it.
    if [ -f "$lock_dir/pid" ]; then
      local owner_pid
      owner_pid=$(cat "$lock_dir/pid" 2>/dev/null || echo "")
      local owner_host
      owner_host=$(cat "$lock_dir/host" 2>/dev/null || echo "")
      local this_host
      this_host=$(hostname)

      # Steal conditions:
      # 1. Same host + owner PID dead (kill -0 fails)
      # 2. Different host + lock mtime > 60s
      local should_steal=0
      if [ "$owner_host" = "$this_host" ] && [ -n "$owner_pid" ]; then
        if ! kill -0 "$owner_pid" 2>/dev/null; then
          should_steal=1
        fi
      fi

      if [ "$should_steal" = "0" ]; then
        # Check mtime
        local lock_age_ok=0
        if [ -d "$lock_dir" ]; then
          # Get lock dir mtime
          local lock_mtime
          lock_mtime=$(stat -f %m "$lock_dir" 2>/dev/null || stat -c %Y "$lock_dir" 2>/dev/null || echo "0")
          local now_s
          now_s=$(date +%s)
          local age=$(( now_s - lock_mtime ))
          if [ "$age" -gt 60 ]; then
            should_steal=1
          fi
        fi
      fi

      if [ "$should_steal" = "1" ]; then
        echo "thread-lock: stealing stale lock (owner PID $owner_pid host $owner_host)" >&2
        rm -rf "$lock_dir" 2>/dev/null
        # Retry immediately
        continue
      fi
    fi

    # Still locked by live process. Wait and retry.
    retry=$(( retry + 1 ))
    if [ "$retry" -lt "$max_retries" ]; then
      sleep 1
    fi
  done

  echo "thread-lock: failed to acquire after $max_retries retries; another process owns $lock_dir" >&2
  return 1
}

thread_lock_release() {
  local thread_dir="$1"
  local lock_dir="$thread_dir/.lock"

  # Only remove if we own it (PID check)
  if [ -f "$lock_dir/pid" ]; then
    local owner_pid
    owner_pid=$(cat "$lock_dir/pid" 2>/dev/null || echo "")
    if [ "$owner_pid" = "$$" ]; then
      rm -rf "$lock_dir"
      return 0
    fi
  fi

  # Not our lock — don't touch it
  return 1
}

# Convenience wrapper: acquire, run commands, release.
# Usage: thread_with_lock <thread-dir> '<bash commands>'
thread_with_lock() {
  local thread_dir="$1"
  shift

  if ! thread_lock_acquire "$thread_dir"; then
    return 1
  fi

  # Ensure release on exit (even on error)
  trap "thread_lock_release '$thread_dir'" EXIT

  # Run the commands
  eval "$@"
  local rc=$?

  # Clean up trap + release
  trap - EXIT
  thread_lock_release "$thread_dir"

  return $rc
}

# iCloud Drive detection helper
is_icloud_path() {
  local path="$1"
  case "$path" in
    */Library/Mobile\ Documents/*) return 0 ;;
    *)
      # Check if it's a symlink into iCloud
      if [ -L "$path" ]; then
        local target
        target=$(readlink "$path")
        case "$target" in
          */Library/Mobile\ Documents/*) return 0 ;;
        esac
      fi
      return 1
      ;;
  esac
}

# Self-test when invoked directly
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
  echo "== thread-lock self-test =="
  TMPDIR=$(mktemp -d)
  echo "  Test dir: $TMPDIR"

  # Test 1: basic acquire + release
  if thread_lock_acquire "$TMPDIR"; then
    echo "  [PASS] acquire"
    [ -d "$TMPDIR/.lock" ] && echo "  [PASS] lock dir exists"
    thread_lock_release "$TMPDIR"
    [ ! -d "$TMPDIR/.lock" ] && echo "  [PASS] release"
  else
    echo "  [FAIL] initial acquire"
    exit 1
  fi

  # Test 2: double-acquire blocks (briefly)
  thread_lock_acquire "$TMPDIR"
  echo "  [INFO] second acquire should fail or wait..."
  if ! thread_lock_acquire "$TMPDIR" 2>/dev/null; then
    echo "  [PASS] second acquire fails (as expected, same PID hold)"
    # Actually, same-PID would be re-entrant? No — lock check is PID equality in release, not acquire.
    # But mkdir fails because dir exists. So good.
  fi
  thread_lock_release "$TMPDIR"

  # Test 3: iCloud path detection
  if is_icloud_path "/Users/test/Library/Mobile Documents/Documents"; then
    echo "  [PASS] iCloud path detected"
  else
    echo "  [FAIL] iCloud path not detected"
  fi
  if ! is_icloud_path "/Users/test/Documents"; then
    echo "  [PASS] non-iCloud path correctly not detected"
  fi

  rm -rf "$TMPDIR"
  echo "== self-test complete =="
fi
