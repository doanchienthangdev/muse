# Muse v2.16 — Thread + Digest Layer

**This file is the load-bearing spec for multi-session continuity.**

A **thread** groups multiple muse sessions that are working on the same problem. The thread's **digest** is a rolled-up summary loaded into every session in the thread at pre-flight, giving the persona memory across days.

---

## Why threads

Without threads, every muse session is cold-start. A user thinking about "how to find 100 first customers" over 3 evenings has 3 unrelated Paul Graham sessions. Paul Graham doesn't remember what they concluded yesterday; the user has to re-explain context each time.

With threads:
- Session 1: creates thread `first-100-customers`, produces key insights + commitments → writes to digest
- Session 2 (3 days later): loads the digest at pre-flight → Paul Graham opens with "You already decided to talk to 10 users face-to-face. Where are we on that?"
- Session 3 (hands off to Feynman via `/handoff`): inherits the thread, digest, current framing → Feynman picks up the baton with full context

---

## Directory structure

```
~/.muse/
├── sessions/
│   ├── 2026-04-15-182417-paul-graham-first-100-customers.md
│   ├── 2026-04-18-103000-paul-graham-first-100-customers.md
│   └── 2026-04-22-143000-feynman-first-100-customers-continued.md
└── threads/
    └── first-100-customers/
        ├── digest.md                    # the thread digest (loaded at pre-flight)
        ├── followups.md                 # bookmarks from all sessions in this thread
        ├── .lock/                       # mkdir-based lock during writes (short-lived)
        └── digest-archive/              # compaction history (last 5)
            └── 2026-04-18T10-30-00Z.md
```

Thread slug rules: `^[a-z0-9][a-z0-9-]{0,40}$` (path-traversal-safe).

---

## Thread slug derivation (precedence)

1. **`--thread=<slug>` flag** on `/muse:<persona>` invocation — explicit user-provided slug. Validated against regex above. User-provided wins.
2. **Inherited from `parent_session`** — if the user invokes `/muse:continue <path>` and the parent has a `thread_id`, that's the thread.
3. **Auto-derived** from the first session's slug (same algorithm as session-filename slug: first 3-5 significant words of question, snake_cased, max 40 chars).
4. **Fallback** — `thread-<unix_ts>` (never hit in practice).

### Collision handling

When creating a new thread via steps 3 or 4 (auto-derive or fallback):

1. Check `~/.muse/threads/<slug>/digest.md` for existing thread.
2. If absent → create fresh thread with the candidate slug.
3. If present:
   - Read existing thread's `original_question` field from digest frontmatter.
   - Compute Jaccard similarity (first 100 chars, lowercased, token set) between existing and current question.
   - If Jaccard ≥ 0.8 → **inherit** the existing thread_id (same problem, same thread). Print `Thread: <slug> (continuing existing thread)`.
   - If Jaccard < 0.8 → **collision** on different questions. Append 4-char hash of current question to slug: `<slug>-<hash4>` (e.g., `100-first-customers-a3f2`). Birthday-paradox collision-safe up to ~200 threads per slug prefix.

User always sees resolved `thread_id` printed at pre-flight. They can pass it explicitly next time to avoid re-derivation.

### Explicit collision recovery

If the user wants to split two accidentally-merged threads, manual path: delete digest + rename session files' `thread_id` fields. No automated split tool in v2.16 (deferred to v2.17).

---

## Digest schema

File: `~/.muse/threads/<slug>/digest.md`

```yaml
---
thread_id: first-100-customers
original_question: "How do I find my first 100 customers?"
created_at: 2026-04-15T11:24:17Z
updated_at: 2026-04-22T14:30:00Z
session_count: 3
sessions:
  - path: ~/.muse/sessions/2026-04-15-182417-paul-graham-first-100-customers.md
    persona: paul-graham
    mode: STANDARD
    started_at: 2026-04-15T11:24:17Z
    ended_at: 2026-04-15T11:45:00Z
    status: completed
    key_insights_count: 3
    convergence_state: null
  - path: ~/.muse/sessions/2026-04-18-103000-paul-graham-first-100-customers.md
    persona: paul-graham
    mode: EXPLORE
    started_at: 2026-04-18T10:30:00Z
    ended_at: 2026-04-18T11:20:00Z
    status: completed
    key_insights_count: 2
    convergence_state: converged
  - path: ~/.muse/sessions/2026-04-22-143000-feynman-first-100-customers-continued.md
    persona: feynman
    mode: EXPLORE
    started_at: 2026-04-22T14:30:00Z
    ended_at: null
    status: active
    key_insights_count: 0
    convergence_state: null
total_stages_run: 14
personas_visited: [paul-graham, feynman]
---

# Thread digest: first-100-customers

## Original question
> How do I find my first 100 customers?

## What we've figured out (accumulated key insights, newest last)

1. [paul-graham, 2026-04-15] Your 100 first users probably come from ONE channel, and you don't know which yet. Ship to 10 and learn which.
2. [paul-graham, 2026-04-15] Network effects require N > threshold. Measure yours before guessing.
3. [paul-graham, 2026-04-15] The 'all your users at once' failure mode: 100 strangers who don't know each other.
4. [paul-graham, 2026-04-18] User-interview loop: 10 → 20 → 50 is a better shape than 100 at once.
5. [paul-graham, 2026-04-18] "Do things that don't scale" means concierge the first 50 personally.

## What we rejected

- Hiring SDRs before PMF (session 1 Stage 4)
- Growth hacks before channel clarity (session 2 Stage 3 probe revealed: we don't know what our channel IS yet)

## What we committed to

- [x] Talk to 10 users face-to-face (session 1) — DONE (per session 2 framing update)
- [ ] Ship email-onboarding test (session 2) — due 2026-04-29
- [ ] (session 3 in progress — Feynman examining the technical path)

## Open questions / tangents (from /bookmark across all sessions)

- What's the right pricing anchor for pre-launch? (session 1, stage 2)
- Does Paul's consumer advice apply to infra? (session 2, stage 1)
- Feynman: "is my 'channel' actually a hypothesis or a fact?" (session 3, stage 0.5)

## Framing evolution

- Session 1: "How do I find 100 users?"
- Session 2 (pivot after convergence pivot): "How do I find 100 users who tell their friends?"
- Session 3 (handoff to Feynman): "What physics / first-principles constraint lower-bounds my acquisition rate?"
```

---

## Pre-flight digest injection

When a session is invoked with `--thread=<slug>` OR resumed with a parent that has `thread_id`:

1. Orchestrator reads `~/.muse/threads/<slug>/digest.md`
2. Injects into the persona's system prompt as an additional context block:

```
=== THREAD CONTEXT ===
This user has been thinking about this with you (and possibly other personas) 
already. Here is what you have established together across prior sessions. 
Bring CONTINUITY to this session — reference prior conclusions, don't re-litigate 
what was already decided, don't re-derive insights already landed on. 
Surface what has CHANGED since the last session.

<digest markdown body — everything after the YAML frontmatter>
=== END THREAD CONTEXT ===
```

3. First-stage output SHOULD acknowledge the thread state. Example Stage 1 framing opener with thread:
   > "We've already landed on user interviews as the channel. Today we're working on the email test. What specifically are you stuck on?"
   
   Not:
   > "So, you want to find 100 first customers. Let's frame this..." (that's cold-start voice)

---

## Digest write path (at session Stage 5)

After a session's Stage 5 completes (artifact or log emitted), the orchestrator updates the thread digest:

1. Acquire lock: `mkdir ~/.muse/threads/<slug>/.lock` (atomic on POSIX local FS)
2. If lock acquisition fails: wait 1s, retry up to 5x. Between retries, check PID-file: if lock's owner process is dead OR mtime >60s, steal.
3. Read current digest.
4. Append new session entry to `sessions:` list (frontmatter).
5. Increment `session_count`, `total_stages_run`.
6. Add `persona` to `personas_visited` if not present.
7. Extract key insights from the just-completed session's "## Key insights" body section → append to digest's "## What we've figured out" list with attribution.
8. Extract debate positions + decisions → append to digest's "## What we rejected" / "## What we committed to" sections.
9. Extract bookmarks from session → append to "## Open questions / tangents".
10. If session's Stage 1 framing differs from the previous session's framing → add entry to "## Framing evolution".
11. Update `updated_at` timestamp.
12. Check digest size: if > 2000 words, compact (see below).
13. Write atomically: `mv digest.md.tmp digest.md`.
14. Release lock: `rm -rf .lock/`.

---

## Digest compaction

Triggered when digest exceeds 2000 words post-write.

1. Backup current digest to `~/.muse/threads/<slug>/digest-archive/<ISO-timestamp>.md`.
2. Rotate archive: keep last 5, delete older.
3. Compaction rules (applied in order until under 2000 words):
   - Drop "What we rejected" entries older than the most recent 2 sessions (keep recent rejections; they're still active)
   - Keep the 10 MOST RECENT key insights (drop older)
   - Keep ALL open commitments (never drop these)
   - Keep ALL bookmarks (they're a to-do list, not a log)
   - Keep the full "Framing evolution" section (it's a small narrative)
4. If still > 2000 words after all rules: log warning and let it grow; the 2000-word target is soft.

Audit recovery: `cat ~/.muse/threads/<slug>/digest-archive/<latest>.md` shows what was dropped.

---

## Thread-level bookmark file

`~/.muse/threads/<slug>/followups.md` (created on first `/bookmark`):

```markdown
# Followups — <slug>

Bookmarks from any session in this thread. Each line:
  [<timestamp>, <persona>, stage <stage_id>] <note>

---

- [2026-04-15T11:35:00Z, paul-graham, stage_2] What's the right pricing anchor for pre-launch?
- [2026-04-18T10:50:00Z, paul-graham, stage_1] Does Paul's consumer advice apply to infra?
- [2026-04-22T14:38:00Z, feynman, stage_0_5] "Is my 'channel' actually a hypothesis or a fact?"
```

Single-session mode (no thread_id) → bookmarks go to `<session-path>.followups.md` instead.

---

## Failure modes

| Mode | Handling |
|---|---|
| Digest missing but thread dir exists | Rebuild from all sessions with this thread_id (fallback scan of `~/.muse/sessions/*.md`) |
| Digest corrupt (invalid YAML) | Write warning; read body content as opaque context; don't fail the session |
| Thread dir missing but session frontmatter has thread_id | Create thread dir + fresh digest; warn user ("thread re-initialized") |
| Two sessions write concurrently | Lock serializes; second waits; eventually both commit |
| Stale lock > 60s AND owner PID dead | Steal, warn user in stderr |
| `~/.muse` on iCloud Drive (detected via path contains `Library/Mobile Documents/`) | Warn at startup: "iCloud path detected; concurrent multi-machine sessions may corrupt digests" |

---

*Version: 2.16.0-alpha · part of muse-core · consumed by SESSION.md pre-flight + Stage 5 write path. Enables multi-session thinking continuity.*
