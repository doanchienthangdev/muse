# Structured sessions (v2.1+, current: v2.3.2-alpha)

Every installed persona is available as a **slash command** (e.g., `/muse:feynman`, `/muse:socrates`, and any persona you've added locally via `/muse:build`) that runs a structured session and saves the transcript to `~/.muse/sessions/`. The starter pack ships 8 persona slash commands but the set is dynamic — add a persona locally and it gets its own slash command automatically on next `install.sh`. This doc explains what happens during a session, what the saved file looks like, and how to find / read / share / resume past sessions.

v2.2 added **adaptive session modes** — Stage 0 detects the shape of your question and picks QUICK / STANDARD / DEEP / CRITIC. The 5-stage flow described below is STANDARD mode; QUICK compresses to 2 stages, DEEP adds Stage 0.5 Premise Challenge and Stage 3.5 Alternative Paths, CRITIC replaces Stage 1 with artifact loading and Stage 3 with prioritized findings.

For the v2.0 free-text conversational mode (`muse:feynman <q>` without slash, no file saved), see [`README.md`](../README.md) and `SKILL.md`. That path still works for Codex CLI / Gemini CLI users. This document covers the structured slash command path used by Claude Code.

---

## Why structured sessions

v2.0 shipped Muse as a conversational skill: you typed `muse:feynman <question>` and got a 150-250 word reply with up to 6 rounds of free-form Q&A, all ephemeral. Users reported two problems:

1. **Too shallow.** Free-form conversation skips the discipline of actually walking through a persona's distinctive cognitive moves in order. Sessions felt like a lighter ChatGPT with persona flavoring, not like working through a problem with a deliberate thinking partner.

2. **No artifact.** Even when a session surfaced a real insight, there was nothing to re-read later, nothing to grep across sessions to find patterns, nothing to share with a cofounder. The insight lived in the chat transcript and decayed.

v2.1 fixes both by adding a structured workflow and a saved file. v2.0 free-text is still there for quick gut-checks, so you don't lose the fast path.

---

## The 5 stages

Every v2.1 session walks through the same 5 stages in order. The persona's signature moves become **lenses** at each stage — the agent picks the move that best fits the stage's thinking category from the persona's own list. That's how Feynman's `simplification test` ends up at Stage 1 (Frame), his `hand calculation` ends up at Stage 3 (Test), and his `speed_vs_quality` debate position ends up at Stage 4 (Decide) — without forcing all personas to have exactly 5 moves in exactly the right categories.

### Stage 1 — FRAME

The persona reframes your question using their distinctive opening move. Simplification (Feynman), definition hunting (Socrates), value of emptiness (Lao Tzu), ten principles (Rams), view from above (Marcus Aurelius).

After the reframe, you hit an `AskUserQuestion` with 4 options. The options are **distinctively persona-flavored** — not a generic "refactor / rewrite / hybrid / other" menu. For a Feynman session on "should I rewrite the codebase," the 4 options force you to pick which *pain* you're actually feeling (iteration speed vs correctness vs comprehension vs your own words), because Feynman's move is to define the real problem before discussing solutions.

Option D is always a fallback to free-text ("none of the above — let me describe it").

### Stage 2 — EXAMINE

The persona surfaces the hidden assumption, contradiction, or unexamined belief underneath the framing you picked. This is the `curiosity first` move (Feynman), `elenchus` (Socrates), `four causes analysis` (Aristotle), `rectification of names` (Confucius).

Stage 2 has NO multiple-choice menu. You react in your own words via a free-text follow-up. Not every thinking stage has 4 valid next moves — sometimes the user needs to push back naturally. Forcing options here would feel scripted.

### Stage 3 — TEST

The persona applies their distinctive **probe** — the measurable, inverted, subtractive, or contrarian move that produces the "huh, didn't see that" moment. Feynman's `hand calculation`, Rams's `as little design as possible`, Seneca's `premeditatio malorum`, Lao Tzu's emptiness test.

Stage 3 presents an `AskUserQuestion` with 3 concrete probes you could actually run (each time-bounded and measurable) plus an escape hatch D. You pick which test to commit to running — not a philosophical answer, an actual experiment.

### Stage 4 — DECIDE

The persona forces a choice on the real fork the session has surfaced, drawing on their `debate_positions` data. Feynman pushes for quality measured by understanding. Socrates pushes for inquiry over certainty. Lao Tzu pushes for flow over force.

Stage 4 is the most loaded `AskUserQuestion`. Four options:
- **A** — the persona's preferred side, framed positively
- **B** — the counter-side, framed fairly (not a strawman)
- **C** — a compromise or second counter, if one legitimately exists
- **D** — **escape hatch**: "Tell <persona> they're wrong about this — discuss alternative"

D is mandatory. The escape hatch protects against railroading. If you pick D, the session doesn't force the persona's stance — it asks why you reject the framing and either pivots to a new fork or skips to Stage 5.

### Stage 5 — COMMIT

The persona collapses everything into ONE concrete next action. Specific, time-bound, measurable — something you'll actually do this week, not "think about it more." You get a lightweight 2-option AskUserQuestion: **A** accept and save, or **B** refine the action before committing.

When you pick A, the session file is written to `~/.muse/sessions/`, the path is printed, and the session closes.

---

## How to start a session

From inside Claude Code, type:

```
/muse:<persona> <your question>
```

For example:

```
/muse:feynman should I use Redis or Postgres for session storage?
/muse:socrates what do I actually mean by "product-market fit"?
/muse:dieter-rams my landing page has 11 CTAs, which should I cut?
/muse:marcus-aurelius my team is scattered across 10 priorities
/muse:lao-tzu our sales funnel is stuck, we've tried more of everything
```

All 8 persona commands available:

- `/muse:feynman`
- `/muse:socrates`
- `/muse:seneca`
- `/muse:marcus-aurelius`
- `/muse:aristotle`
- `/muse:confucius`
- `/muse:lao-tzu`
- `/muse:dieter-rams` (interpretive disclaimer shown at top of session)

If slash commands don't appear after install, **restart Claude Code**. Command discovery happens at session start.

---

## Where sessions live

All session files are saved to `~/.muse/sessions/` by default. This directory is:

- **Per-user private state** — not in the repo, not committed, not shared with anyone unless you explicitly copy a file somewhere
- **Cross-project** — the same directory holds sessions from whichever project's CWD you started them in. The CWD is captured in each session's frontmatter under `cwd:` for later filtering
- **Survives reinstall** — `install.sh` uses `mkdir -p` (idempotent) and never deletes existing session files
- **Created on first install** — you don't need to `mkdir` anything yourself

You can override the location by setting `MUSE_SESSIONS_DIR` before running `install.sh`:

```bash
MUSE_SESSIONS_DIR=~/Documents/muse-sessions sh install.sh
```

But the default is almost always what you want.

---

## Session filename format

```
<YYYY-MM-DD-HHMMSS>-<persona>-<slug>.md
```

Example: `2026-04-16-143052-feynman-redis-postgres-session-storage.md`

- **Timestamp** is local time when the session started, generated via `date +%Y-%m-%d-%H%M%S`
- **Persona** is the persona ID (e.g., `feynman`, `marcus-aurelius`, `dieter-rams`)
- **Slug** is the first 3-5 significant words of your question, snake-cased, max 40 chars, with articles and punctuation stripped

Sorted alphabetically, the filenames sort chronologically (by timestamp prefix), which is exactly what you want when you `ls -lt` the directory.

---

## Session file format

Every session file has three parts: frontmatter (grep-friendly metadata), body (stage-by-stage record), and footer (metadata + citations).

### Frontmatter fields

```yaml
---
type: muse-session
version: 2.1
status: completed              # or "aborted" if session was interrupted
persona: feynman
persona_name: Richard Feynman
started_at: 2026-04-16T14:30:52+07:00
ended_at: 2026-04-16T14:45:14+07:00
duration_seconds: 862
branch: feature/auth-rewrite   # git branch if in a repo, else null
cwd: /Users/doanchienthang/code/myapp
question: "Should I use Redis or Postgres for session storage?"
slug: redis-postgres-session-storage
moves_used:
  - simplification_test
  - curiosity_first
  - cargo_cult_detection
  - speed_vs_quality_position
escape_hatches_used: 0
session_format: 5-stage-v2.1
living_status: historical      # or "living" for Rams, with disclaimer
---
```

**Grep use cases**:

```bash
# Find all sessions where cargo-cult detection surfaced something
grep -l "moves_used:.*cargo_cult_detection" ~/.muse/sessions/*.md

# Find all Socrates sessions in March 2026
ls ~/.muse/sessions/2026-03-*-socrates-*.md

# Count escape hatches used this month (if >5, workflow needs tuning)
grep "escape_hatches_used: [1-9]" ~/.muse/sessions/2026-04-*.md | wc -l

# Find the longest session so far (duration sort)
grep -l "duration_seconds: [0-9][0-9][0-9][0-9]" ~/.muse/sessions/*.md
```

### Body sections

The body records each stage with the persona's output, your choice at each STOP (`[x]` marker on the chosen option, unchecked `[ ]` for others), and a short insight summary per stage. Ending with a 3-bullet key insights summary, citations resolved from the persona's `sources[]`, and session metadata.

The `[x]` / `[ ]` markers are invaluable for re-reading. You can see what options you didn't pick — *"wait, why didn't I choose option B?"* — and the cognitive fork is preserved, not hidden.

---

## Re-reading and resuming

Sessions are plain markdown files. To re-read one, just open it:

```bash
cat ~/.muse/sessions/2026-04-16-143052-feynman-redis-postgres-session-storage.md
```

Or inside Claude Code, paste the file path as a message — Claude will read it via its Read tool and you can continue the conversation from there. There's no special "resume" command; the file IS the resume point.

To continue a session's line of thinking in a new session, start a new session with the same persona and reference the old file path:

```
/muse:feynman continue the thread from ~/.muse/sessions/2026-04-16-143052-feynman-redis-postgres-session-storage.md
```

The agent will Read the old file and pick up the context.

---

## Finding patterns across sessions

The sessions directory accretes over time and becomes your private thinking archive. Useful queries:

```bash
# Sessions where you used the escape hatch
grep -l "escape_hatches_used: [1-9]" ~/.muse/sessions/*.md

# Sessions about pricing
grep -l 'question:.*pric' ~/.muse/sessions/*.md

# All Feynman sessions, newest first
ls -lt ~/.muse/sessions/*-feynman-*.md

# Count sessions per persona
for p in feynman socrates seneca marcus-aurelius aristotle confucius lao-tzu dieter-rams; do
  n=$(ls ~/.muse/sessions/*-$p-*.md 2>/dev/null | wc -l | tr -d ' ')
  printf "%-18s %s\n" "$p" "$n"
done

# Average session duration
grep "duration_seconds:" ~/.muse/sessions/*.md | awk '{sum+=$NF; n++} END {print sum/n " seconds"}'
```

---

## Sharing sessions

A session file is a markdown file. To share:

- **To a cofounder, privately**: `cat ~/.muse/sessions/<file>.md` and paste into whatever channel you use
- **To a public gist**: `gh gist create ~/.muse/sessions/<file>.md` (if you have `gh` installed)
- **To a blog post**: copy and edit the body sections into your CMS, remove the frontmatter

Muse does not ship built-in sharing tooling. Sessions are yours. You decide what to share.

---

## Pruning

Sessions accumulate forever by default. They're small (typically 3-8 KB each), so 100 sessions is ~500 KB — not a disk concern.

If you want to prune, there's no built-in command. Use `find`:

```bash
# Preview: sessions older than 90 days
find ~/.muse/sessions -type f -name "*.md" -mtime +90

# Delete after reviewing
find ~/.muse/sessions -type f -name "*.md" -mtime +90 -delete

# Archive instead of delete
mkdir -p ~/.muse/sessions/archive
find ~/.muse/sessions -maxdepth 1 -type f -name "*.md" -mtime +90 -exec mv {} ~/.muse/sessions/archive/ \;
```

---

## Troubleshooting

**"Unknown command: /muse:feynman"** — slash commands live at `~/.claude/commands/muse:*.md`. Check they exist: `ls ~/.claude/commands/muse:*.md`. If the list is empty, re-run `install.sh`. If the files are there but Claude Code still says unknown, restart Claude Code (command discovery happens at session start).

**Session file not written** — check that `~/.muse/sessions/` exists and is writable: `ls -ld ~/.muse/sessions/`. If missing, run `mkdir -p ~/.muse/sessions`. If permissions are wrong, `chmod u+w ~/.muse/sessions`.

**Session feels scripted / 4 options all feel the same** — you hit the distinctiveness risk. The persona's data may not be rich enough for the 5-stage workflow to produce truly different options across stages. Report it as an issue so we can sharpen the persona file.

**Stage 4 escape hatch counter too high** — if you're hitting D in Stage 4 often, the workflow may be too rigid for your question types. That's usage data worth reporting. The workflow is designed to loosen after real usage shows where it binds.

**Want quick conversational mode without 15-minute session** — use free-text `muse:feynman <q>` (no slash) for the v2.0 lightweight path. No file saved, no structured stages, just a fast chat. Both paths coexist.

---

## What's NOT shipped in v2.1

- `/muse:debate`, `/muse:chain`, `/muse:critic` slash commands (defer to v2.2 — different workflows, not 5-stage)
- `/muse:all`, `/muse:list`, `/muse:build`, `/muse:spike` slash commands (v2.2+)
- Session search / list / prune commands (use `grep`, `ls`, `find` in the meantime)
- Session sharing tooling (sessions are markdown, sharing is `cat`)
- Session schema validator (sessions are markdown for humans, not machines)

These are all explicit non-goals for v2.1. If you want them sooner, open an issue.
