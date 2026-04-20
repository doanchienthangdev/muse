---
description: Incrementally re-mine a living persona's corpus folder (v2.15.0-alpha). Detects new or modified source files via `corpus_fingerprint` staleness comparison, dispatches the v2.14 research pipeline in delta mode over only the new material, merges findings into the existing persona (appending sources, proposing new cognitive patterns / signature moves / analogous cases for user review). Interactive with backup + draft + diff + confirm. Preserves the persona's shipped structure; does NOT rebuild from scratch (use `/muse:rebuild` for that).
allowed-tools: Read, Glob, Bash, Write, Edit, AskUserQuestion, Agent
argument-hint: <persona-id> [--check]
---

# muse:refresh — incremental re-mine for living personas (v2.15.0-alpha)

**Args**: $ARGUMENTS

## Step 0 — Parse arguments

Parse `$ARGUMENTS` into `(persona_id, check_only)`. Order-independent.

- `/muse:refresh seth-godin` → full interactive refresh: detect stale → delta-mine → merge → diff → confirm → write
- `/muse:refresh seth-godin --check` → staleness detection only, no subagent dispatch, no writes

**Validate**:
- `persona_id` matches `^[a-z][a-z0-9-]{0,30}$`
- Reject `..`, `/`, symlinks, shell metacharacters
- `persona_id` is required (no `--all --refresh` in v2.15 — batch refresh is deferred until corpus-change frequency justifies it)

If `persona_id` is missing or invalid, print usage and exit.

## Step 1 — Load persona + fingerprint

Read `personas/<persona-id>.md`. If not found, print:

```
Persona "<persona-id>" not found in personas/. Did you mean:
  <list of fuzzy matches from existing persona IDs>
```

and exit.

Parse the frontmatter. Extract:
- `id`, `name`, `living_status`
- `corpus_fingerprint` (optional v2.15 field)

If `living_status` is `historical`, print a soft warning:

```
Note: <persona-id> is a historical figure (living_status: historical).
Refresh is typically used for living figures whose corpora grow over time.
Proceeding anyway — but if the .archives folder is static, this is a no-op.
```

Continue either way.

## Step 2 — Staleness check (from RESEARCH_PIPELINE.md appendix)

Run `compare_fingerprint(persona_id)` per the algorithm in `RESEARCH_PIPELINE.md` Appendix A.

**Implementation (run as bash)**:

```bash
# Extract from frontmatter
PID="<persona-id>"
SRC=".archives/personas/<persona-id>"
LAST_MINED="<from frontmatter or empty>"

# Existence check
if [ ! -d "$SRC" ]; then
  echo "STATE: corpus_missing"
  exit 1
fi

# Count files per bucket
declare -A current_counts
for bucket in articles books transcripts notes; do
  if [ -d "$SRC/$bucket" ]; then
    count=$(find "$SRC/$bucket" -type f \( -name "*.md" -o -name "*.txt" -o -name "*.srt" -o -name "*.vtt" -o -name "*.json" -o -name "*.pdf" \) 2>/dev/null | wc -l | tr -d ' ')
  else
    count=0
  fi
  current_counts[$bucket]=$count
done
current_counts[root]=$(find "$SRC" -maxdepth 1 -type f \( -name "*.md" -o -name "*.txt" -o -name "*.srt" -o -name "*.vtt" -o -name "*.json" -o -name "*.pdf" \) 2>/dev/null | wc -l | tr -d ' ')

# mtime check — any files newer than last_mined?
if [ -n "$LAST_MINED" ]; then
  NEWER=$(find "$SRC" -type f -newermt "$LAST_MINED" 2>/dev/null)
else
  NEWER=""  # no fingerprint → cannot compare mtime
fi

# Size drift
TOTAL_BYTES=$(find "$SRC" -type f -exec stat -f "%z" {} + 2>/dev/null | awk '{sum+=$1} END {print sum}')
```

Compare `current_counts` against `fp.bucket_counts`, `TOTAL_BYTES` against `fp.total_bytes` (>5% diff = drift), `NEWER` non-empty = stale.

**Report the state**:

| State | Message | Next action |
|---|---|---|
| `fresh` | "No changes detected since $last_mined. Nothing to refresh." | Exit 0 |
| `stale` | "Detected N new/modified files since $last_mined. Proceeding with delta mine." | Go to Step 3 |
| `missing_fingerprint` | "Persona has no corpus_fingerprint (pre-v2.15 or hand-edited). Recommend `/muse:rebuild $PID` for full re-mine, or `/muse:update $PID` to add a fingerprint without re-mining." | Exit 0 |
| `corpus_missing` | "Corpus folder `.archives/personas/$PID/` does not exist. Recommend `/muse:build $PID` from scratch after locating the corpus." | Exit 1 |

**If `--check` flag set**: print the state report (including list of new files for `stale` state) and exit 0 without proceeding.

## Step 3 — Delta-mode pipeline dispatch

**Only runs if Step 2 returned `stale`.**

Compute the delta file set:

```bash
# Files newer than fingerprint.last_mined
NEW_FILES=$(find "$SRC" -type f -newermt "$LAST_MINED" \( -name "*.md" -o -name "*.txt" -o -name "*.srt" -o -name "*.vtt" -o -name "*.json" -o -name "*.pdf" \))

# Plus files that weren't in the prior fingerprint.bucket_counts (net-new files in previously-empty buckets)
# For each bucket where current count > fingerprint count, include all files in that bucket
```

Group the delta files by bucket (articles / books / transcripts / notes / root).

Print a delta summary:

```
Delta detected:
  articles: +5 new (27 → 32)
  books: +0 (18)
  transcripts: +1 new (5 → 6)
  notes: +0 (0)
  root: +0 (1)

New files:
  articles/seth-godin-2026-04-15-the-long-tail.md
  articles/seth-godin-2026-04-16-brand-vs-reputation.md
  ...
  transcripts/2026-04-10-akimbo-episode-217.srt

Total: 6 new files, ~240KB
```

**AskUserQuestion**:

Re-grounding: "Project: muse (persona runtime repo). Branch: main. Task: Refresh <persona-id> with N new files mined since last build."

Simplify: "<persona-id> has been mined before. We just found N new source files that weren't in the last mine. I'll run the pipeline over just those new files and propose what to merge into the existing persona — no rebuild, just append."

Options:
- A) Proceed with delta mine (Recommended — Completeness: 10/10, CC: ~5 min)
- B) Skip this refresh, just update the fingerprint to now() without mining
- C) Abort

If B → skip to Step 7 (fingerprint-only update). If C → exit. If A → continue.

**Dispatch the pipeline** per `RESEARCH_PIPELINE.md` Stage 1 → Stage 2, but with these modifications:

- File list is restricted to the delta set (do NOT re-scan unchanged files)
- Subagent prompt gets the `=== DELTA MODE ===` block documented in `RESEARCH_PIPELINE.md` Appendix A
- Pass the existing persona file content to each subagent so they can distinguish "already represented" from "genuinely new"
- Envelope merges via Stage 3 → Stage 4 as normal (triple-verification still applies — new findings must still pass cross-domain + predictive + exclusive tests)

## Step 4 — Delta analysis + merge plan

For each finding in the delta envelope, classify:

1. **Strengthens existing item** — same cognitive pattern / signature move as an existing one, additional citation(s). Queue action: append source_ref to the existing item's sources[].
2. **New cognitive pattern** — not in current persona. Queue action: user review.
3. **New signature move** — new trigger/test-probe. Queue action: user review.
4. **New analogous case** — new documented reasoning case. Queue action: user review.
5. **Era supplement** — new content from an identifiable new era/phase of the figure's thinking. Queue action: append to `## Era evolution` section if present, else create it.
6. **Noise** — low-signal, already well-represented. Queue action: skip.

Build a merge proposal:

```
Merge plan for <persona-id>:

STRENGTHENS (auto-append on accept):
  + signature_move "Name the anomaly" gains +2 citations from new articles
  + cognitive_pattern #7 "Permission is earned" gains +1 citation

NEW ITEMS (need your review):
  • NEW signature_move proposal: "The story of the hamburger" (analogous-case category)
    Trigger: "You have a feature, not a story"
    Sources: articles/seth-godin-2026-04-15-the-long-tail.md (3 mentions)
  • NEW cognitive_pattern proposal: "Distinguishing necessity from sufficiency"
    Sources: 2 articles + 1 transcript
  • NEW analogous_case proposal: "The disappearance of the video store"

SKIPPED (noise or already covered):
  - 3 findings already well-represented in existing persona
  - 2 findings below signal threshold (Jaccard overlap with existing items >0.85)
```

For each NEW item, dispatch an **AskUserQuestion** with A/B/C options:

Re-grounding: "Project: muse. Branch: main. Task: Refreshing <persona-id>. <N of M> new items to review."

Simplify: "The pipeline found a new [signature move / cognitive pattern / analogous case] that isn't in the current persona. The evidence: [brief summary + citation]. Do you want to add it?"

Options:
- A) Add as new [category] item (Recommended — Completeness: 9/10)
- B) Add as "era supplement" note in `## Era evolution` section instead
- C) Skip (mark as noise)

## Step 5 — Draft the updated persona

Construct the refreshed persona file:

1. Read the current `personas/<persona-id>.md` in full
2. Apply STRENGTHENS actions: append new source_refs to existing items' sources[] arrays
3. Apply NEW item decisions from Step 4:
   - A) → insert new item in the appropriate section (signature_moves, cognitive_patterns, on_analogous_problems) following the existing section's format
   - B) → append to `## Era evolution` section (create section if absent)
   - C) → skip
4. Update footer version: patch bump (e.g., 2.0.0 → 2.0.1) with note `· refreshed YYYY-MM-DD (+N findings from delta mine)`
5. Update frontmatter `corpus_fingerprint` to the current folder state

Write draft to `/tmp/<persona-id>.refresh.draft.md`.

**Do NOT overwrite `personas/<persona-id>.md` yet.**

## Step 6 — Compliance + regression + diff + confirm

Run against the draft:

1. **C1-C12 compliance check** — all must PASS (HARD-GAPs) or be SOFT-DRIFT. Draft was built from a compliant base + additive changes, so this should pass unless the user's choices introduced a gap.
2. **Regression harness**: `bash tests/build-regression/run.sh` filtered to just this persona. Should PASS (may have +N signature-move names vs. golden file, but no names removed).
3. **Ghost-citation check**: for any NEW quote added from strengthens-actions or new items, verify the quote appears in its cited source file.
4. **Balanced provenance**: distribution of citations across source files should not have gone worse — if ≥80% of new citations land in one file, WARN (could mean the delta pipeline over-weighted one new file).

**Show the diff**:

```bash
diff -u personas/<persona-id>.md /tmp/<persona-id>.refresh.draft.md
```

**AskUserQuestion** for final confirmation:

Re-grounding: "Project: muse. Branch: main. Task: Final confirm on <persona-id> refresh draft."

Simplify: "I drafted the updated persona. Diff shows M additions, N updates, 0 removals. Compliance: PASS. Ghost-citation: PASS. Regression: PASS. Ready to write?"

Options:
- A) Accept — atomically write draft over live file (Recommended — Completeness: 10/10)
- B) Review the diff in detail before applying
- C) Abort (draft stays in /tmp for inspection)

If A → Step 7. If B → print full diff, then re-ask A/C. If C → exit, leave draft in /tmp.

## Step 7 — Atomic write + fingerprint update

1. Backup: `cp personas/<persona-id>.md personas/<persona-id>.md.bak.$(date +%Y%m%d%H%M%S)`
2. Atomic move: `mv /tmp/<persona-id>.refresh.draft.md personas/<persona-id>.md`
3. The fingerprint was already written into the draft frontmatter in Step 5.

**Fingerprint-only mode** (Step 3 option B): skip steps 1-5 entirely. Just edit the live persona's `corpus_fingerprint.last_mined`, `bucket_counts`, `total_files`, `total_bytes` to current folder state. Backup first.

## Step 8 — Analytics log

Append to `~/.muse/analytics/refresh.jsonl`:

```json
{
  "ts": "2026-04-22T11:00:00Z",
  "persona_id": "<id>",
  "state": "stale",
  "delta_files": 6,
  "delta_bytes": 245760,
  "items_added": 2,
  "items_updated": 3,
  "items_skipped": 5,
  "duration_s": 287,
  "pipeline_version": "v2.14",
  "refresh_mode": "delta" | "fingerprint_only"
}
```

Create `~/.muse/analytics/` if missing. Best-effort; don't fail the refresh on analytics-write errors.

## Step 9 — Close

Print:

```
Refreshed <persona-id>:
  +<items_added> new findings merged
  +<items_updated> existing items gained citations
  corpus_fingerprint updated: <bucket_counts summary>
  Backup: personas/<id>.md.bak.<ts>

Next steps:
  - Review the refreshed persona: personas/<persona-id>.md
  - Run a test session: /muse:who "<relevant question>"
  - If you want to roll back: cp personas/<id>.md.bak.<ts> personas/<id>.md
```

## Guarantees + non-guarantees

**Guarantees**:
- Never deletes existing persona content (only adds or strengthens)
- Always creates a backup before writing
- Never writes the draft if C1-C12 or ghost-citation or regression fails
- Fingerprint-only mode lets you reset the staleness clock without re-mining (useful after a manual edit)

**Non-guarantees**:
- Does not re-audit existing persona items for quality — assumes the shipped persona is already good. If you suspect the base persona has problems, use `/muse:rebuild` instead.
- Does not re-run the Synthesis Plan audit (Step 3.5 in `/muse:build`) — delta items go through a lighter review because they're additive.
- Does not detect file deletions as meaningful signal — if a source file is removed from the corpus, the persona keeps citing it (sources[] is append-only in refresh mode). Use `/muse:rebuild` to prune.

## When to use `/muse:refresh` vs alternatives

| Scenario | Use |
|---|---|
| Seth Godin published 10 new blog posts since I built his persona | `/muse:refresh seth-godin` |
| I found a new interview that adds depth to an existing cognitive pattern | `/muse:refresh <id>` |
| I suspect my original persona missed something fundamental | `/muse:rebuild <id>` |
| I want to add the v2.15 `corpus_fingerprint` field to an old persona without re-mining | `/muse:update <id>` |
| The corpus folder was moved or renamed | Update `src_folder` in frontmatter manually, then `/muse:refresh` |
| A C-check failed on the persona | `/muse:update <id>` |

## Error handling

- **Pipeline timeout**: if a delta-mode subagent times out, fall back to v2.14 retry protocol (one retry with simplified prompt). If still fails, surface partial findings to the user with a warning — they can accept the partial delta or abort.
- **Envelope malformed**: skip the delta mine; fall back to fingerprint-only update (option B from Step 3).
- **User aborts mid-Step 4**: no backup is created, no writes happen, draft stays in /tmp for next session if needed.
- **Fingerprint write fails**: the persona is written with updated content but no fingerprint update — next `/muse:refresh` will see the persona as `missing_fingerprint` and prompt for `/muse:rebuild` or `/muse:update`. Recoverable.

---

*Skill version: 2.15.0-alpha · part of muse-core · complements `/muse:build` (initial build) and `/muse:rebuild` (full re-mine). Requires v2.15+ persona schema with `corpus_fingerprint` frontmatter field.*
