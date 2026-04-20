---
description: Resume an existing muse session from its last checkpoint (v2.16.0-alpha). Alternative to `/muse:<persona> --resume <path>` — takes a session file path and automatically dispatches to the correct persona. Supports completed, partial, paused, and aborted session files.
allowed-tools: Read, Bash, AskUserQuestion
argument-hint: <path-to-session-file.md>
---

# muse:continue — resume a session (v2.16.0-alpha)

**Args**: $ARGUMENTS

## Step 0 — Parse + validate

Parse `$ARGUMENTS` as a single path to a session file. Validate:

- File exists
- Has YAML frontmatter (first line is `---`)
- Frontmatter `type` is `muse-session`
- Frontmatter has `persona` field

If any check fails, print:
```
/muse:continue expects a path to a session file (markdown with muse-session frontmatter).
Usage:  /muse:continue ~/.muse/sessions/<filename>.md

To list sessions: ls ~/.muse/sessions/
```
and exit.

## Step 1 — Version check

If frontmatter `version` is `2.2` (pre-v2.16), print:
```
This session is in v2.2 format. Migrate to v2.16 first:
  bash tests/session-regression/migrate-v2-2-to-v2-16.sh

Then re-run /muse:continue.
```
and exit. Migration adds the required v2.16 fields (thread_id, checkpoint_stage, convergence_state) without changing any v2.2 content.

If frontmatter `version` is `2.16` or later, proceed.

## Step 2 — Status routing

Extract `status` from frontmatter. Handle each case:

**`status: active`** — session in progress but user reopened it (e.g., previous conversation ended mid-session). Proceed to Step 3 resume.

**`status: completed`** — session already finished. `AskUserQuestion`:
- A) View the session (I'll print the file contents, no resume)
- B) Start a new session in the same thread (if `thread_id` is set — creates a new linked session)
- C) Cancel

**`status: handed_off`** — session was explicitly handed off to another persona. Extract `handed_off_to` path and print:
```
This session was handed off at stage <handoff_at_stage> to:
  <handed_off_to>

To continue the thread, run:
  /muse:continue <handed_off_to>
```
Exit.

**`status: paused`** (from `/dontknow`) — session paused cleanly. Proceed to Step 3 resume.

**`status: aborted`** — session was explicitly aborted (user Ctrl+C or similar). `AskUserQuestion`:
- A) Resume anyway (Recommended) — useful if abort was accidental
- B) View only
- C) Cancel

If user picks A on aborted, proceed to Step 3.

**`.partial.md` suffix** (v2.2 legacy fallback) — proceed to Step 3.

## Step 3 — Dispatch to persona

Extract `persona` from frontmatter. Load `~/.claude/skills/muse/commands/muse:<persona>.md` (the per-persona slash command) OR directly invoke the SESSION.md flow with the persona file loaded.

Call the persona's slash command equivalent to:
```
/muse:<persona> --resume <path-to-this-session>
```

The persona pre-flight (per SESSION.md) handles:
1. Loading the persona file
2. Reading the session file body to reconstruct context
3. Jumping to the next stage after `checkpoint_stage`
4. Continuing the mode's stage graph

## Step 4 — Print resume banner

Before the first stage output, print:
```
=== Resuming session ===
Persona: <Full Name>
Mode: <MODE>
Thread: <thread_id or "(single-session)">
Last stage: <checkpoint_stage>
Started: <started_at>
Last checkpoint: <session file mtime>
Stages completed: <stages_run joined with commas>
Convergence state: <convergence_state or "n/a">
===
```

Then enter the appropriate stage per SESSION.md Resume workflow algorithm (section "Resume workflow").

## Step 5 — Continue session normally

From here on, the session proceeds exactly as if it were freshly invoked with the original question. Checkpoint-every-stage writes continue to update the same file. Stage 5 / artifact generation writes finalize `ended_at` + `status: completed` + any artifact file.

## Fallback behavior

- **Path contains `..` or `/` symbols outside `~/.muse/sessions/`** — reject for safety
- **Persona named in session is not installed** — print "`<persona>` persona not installed; run /muse:list" and exit
- **Session frontmatter missing required fields** — print which field is missing + exit
- **Bash tool unavailable** — fall back to main-agent Read of the file + manual parse; still works

## Related commands

- `/muse:refresh <persona-id>` — for refreshing a persona file from new corpus (v2.15)
- `/muse:rebuild <persona-id>` — for full persona rebuild (v2.15)
- `/muse:list` — list installed personas
- `ls ~/.muse/sessions/` — list existing session files

---

*Skill version: 2.16.0-alpha · part of muse-core · complements v2.16 checkpoint-every-stage persistence. See SESSION.md "Resume workflow" for the algorithm.*
