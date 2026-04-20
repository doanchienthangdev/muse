---
description: Explicit full rebuild of an existing persona (v2.15.0-alpha). Backs up the current persona, runs the full `/muse:build` pipeline from scratch against the corpus folder, then presents an A/B comparison between the existing and newly-built draft. User picks which to keep (accept new, keep old, or merge manually). Replaces the manual `cp; rm; /muse:build` workflow with a safer interactive one. Use this when you suspect the existing persona has systematic gaps or when you want to retrofit v2.13+ pipeline improvements onto an old persona.
allowed-tools: Read, Glob, Bash, Write, Edit, AskUserQuestion, Agent
argument-hint: <persona-id>
---

# muse:rebuild — full rebuild with A/B comparison (v2.15.0-alpha)

**Args**: $ARGUMENTS

## Step 0 — Parse arguments

Parse `$ARGUMENTS` into `(persona_id)`. Trim whitespace.

**Validate**:
- `persona_id` matches `^[a-z][a-z0-9-]{0,30}$`
- Reject `..`, `/`, symlinks, shell metacharacters
- `personas/<persona-id>.md` must exist (use `/muse:build` for brand-new personas)

If persona doesn't exist, print:

```
Persona "<persona-id>" not found in personas/.
To build a new persona from scratch, use:
  /muse:build <persona-id>
```

and exit.

## Step 1 — Backup the current persona

Always create a backup before rebuild, regardless of what happens later:

```bash
TS=$(date +%Y%m%d%H%M%S)
cp "personas/<persona-id>.md" "personas/<persona-id>.md.bak.$TS"
```

Record the backup path for later reporting.

## Step 2 — Snapshot the current persona

Extract key structural data from the existing persona for Step 5 A/B comparison:

```
SNAPSHOT:
  file: personas/<persona-id>.md
  line_count: <N>
  signature_moves: [list of move names]
  signature_moves_by_category:
    framing: [...]
    inquiry: [...]
    test-probe: [...]
  cognitive_patterns: [list of pattern names]
  analogous_cases: [list of case names]
  taglines_count: <N>
  debate_positions_count: <N>
  sources_count: <N>
  version: <frontmatter or footer version>
  has_corpus_fingerprint: <true|false>
  last_mined: <from fingerprint, or "never (pre-v2.15)">
```

Store this in working memory.

## Step 3 — Preserve old file + invoke /muse:build under the hood

**Preserve the existing file** so it isn't clobbered by the build:

```bash
mv "personas/<persona-id>.md" "personas/<persona-id>.md.rebuild-preserved"
```

Now `personas/<persona-id>.md` does not exist — from `/muse:build`'s perspective, this is a fresh build.

**Invoke `/muse:build <persona-id>`** via the full build workflow:

- Read `commands/muse:build.md` and execute Steps 0 through 6 as if the user typed `/muse:build <persona-id>` directly
- The build will:
  - Step 0-2: discover the corpus, detect buckets
  - Step 3: run the v2.14 research pipeline (RESEARCH_PIPELINE.md Stages 1-5)
  - Step 3.5: Synthesis Plan + Audit
  - Step 4: draft persona with inline gates
  - Step 5-5.95b: spec review, ghost-citation, save-gate
  - Step 6: atomic write to `personas/<persona-id>.md`
- **DO NOT** run Step 7 of the build (the "success" close message) — rebuild has its own close

If the build fails or is aborted by the user mid-way:
- Restore the original: `mv "personas/<persona-id>.md.rebuild-preserved" "personas/<persona-id>.md"`
- Print: "Build failed. Original persona restored. Backup still at personas/<id>.md.bak.<ts>."
- Exit 1

If the build succeeds, the new draft now lives at `personas/<persona-id>.md`.

## Step 4 — Dual-file state for comparison

After successful build:

```
personas/<persona-id>.md                      — NEW draft from rebuild (written by /muse:build Step 6)
personas/<persona-id>.md.rebuild-preserved    — OLD persona before rebuild
personas/<persona-id>.md.bak.<ts>             — safety backup (from Step 1, identical to .rebuild-preserved)
```

Read both files and extract the same structural snapshot (line_count, signature_moves, cognitive_patterns, etc.) for the NEW draft.

## Step 5 — A/B presentation

Present the comparison:

```
A/B COMPARISON — <persona-id>

OLD (before rebuild)                   NEW (after rebuild)
----------------------                  --------------------
Version:      1.0.0                    2.0.0
Line count:   280                      342
Last mined:   2026-01-15 (pre-v2.15)   2026-04-22

SIGNATURE MOVES
Old (5):
  - Move A (framing)
  - Move B (inquiry)
  - Move C (test-probe)
  - Move D (inquiry)
  - Move E (test-probe)

New (6):
  + Move A (framing)           [kept]
  + Move B' (inquiry)           [renamed from Move B]
  + Move C (test-probe)        [kept]
  + Move D (inquiry)           [kept]
  - Move E (test-probe)        [dropped]
  + Move F (framing)           [new]
  + Move G (test-probe)        [new]

Added:    Move B' (renamed), Move F, Move G
Removed:  Move E
Kept:     Move A, Move C, Move D

COGNITIVE PATTERNS
Old: 7 patterns
New: 9 patterns
  Added:   2 new patterns (<list>)
  Removed: 0
  Kept:    7

ANALOGOUS CASES
Old: 3
New: 5
  Added:   2 new cases (<list>)

TAGLINES
Old: 5
New: 7
  Added:   2 context-specific taglines

DEBATE POSITIONS
Old: 5 canonical dilemmas covered
New: 6 canonical dilemmas covered (full set)

SOURCES
Old: 14 unique citations
New: 31 unique citations (+17)

SYNTHESIS PLAN COVERAGE
Old: N/A (pre-v2.13)
New: 92% of Synthesis Plan items drafted

COMPLIANCE
Old: C1-C8 PASS, C9 SOFT-DRIFT (only 2 taglines)
New: C1-C12 all PASS (v2.2.1 gates + save-gate)

REGRESSION
Both pass golden signature-move name test (70%+ overlap maintained).
```

## Step 6 — User choice via AskUserQuestion

Re-grounding: "Project: muse (persona runtime repo). Branch: main. Task: Finalize <persona-id> rebuild — pick between old persona and new rebuild draft."

Simplify: "I rebuilt <persona-id> from scratch using the latest pipeline. The new version has [N more signature moves / N more citations / covers N more dilemmas] but also [dropped Move E / renamed Move B → Move B']. You choose what to keep."

Options:
- A) Accept new rebuild (Recommended if compliance jumped or citation count increased meaningfully — Completeness: 10/10)
  - Keeps: `personas/<id>.md` (new draft) + `personas/<id>.md.bak.<ts>` (backup of old)
  - Removes: `personas/<id>.md.rebuild-preserved`
- B) Keep old persona, discard rebuild (Completeness: 7/10 — you stay on the old version but learned from the comparison)
  - Restores: `mv personas/<id>.md.rebuild-preserved personas/<id>.md`
  - Keeps: `personas/<id>.md.bak.<ts>` (safety)
  - Removes: the new rebuild draft
- C) Merge manually — I'll show the side-by-side in detail and you edit (Completeness: varies)
  - Keeps both files for now
  - Enters an interactive merge mode (Step 6b)

## Step 6b — Interactive merge mode (only if user chose C)

For each difference between old and new, ask item-by-item:

```
Signature move diff (item 1 of 3):

OLD: Move E (test-probe)
  Trigger: "..."
  Description: "..."
  Sources: [list]

NEW: (not present — dropped in rebuild)

Decision:
  A) Keep old Move E (add back to the new draft)
  B) Accept removal (go with new, drop Move E)
  C) Let me write a hybrid move manually
```

After walking all diffs, produce a final merged persona. Write to `/tmp/<id>.rebuild-merged.md`. Show full diff against the new rebuild. Re-confirm (A accept merged, B go back to the A/B choice).

## Step 7 — Atomic finalization

Based on A/B/C choice:

**A (accept new)**:
```bash
# New rebuild is already in personas/<id>.md from Step 3
rm "personas/<persona-id>.md.rebuild-preserved"
# Backup at personas/<id>.md.bak.<ts> stays
```

**B (keep old, discard new)**:
```bash
mv "personas/<persona-id>.md.rebuild-preserved" "personas/<persona-id>.md"
# Backup at personas/<id>.md.bak.<ts> stays (redundant but harmless)
```

**C (merged)**:
```bash
mv "/tmp/<id>.rebuild-merged.md" "personas/<persona-id>.md"
rm "personas/<persona-id>.md.rebuild-preserved"
# Backup at personas/<id>.md.bak.<ts> stays
```

Run regression harness for this persona:

```bash
bash tests/build-regression/run.sh | grep "<persona-id>"
```

If regression FAILs, warn the user and offer to roll back (`cp personas/<id>.md.bak.<ts> personas/<id>.md`).

## Step 8 — Analytics log

Append to `~/.muse/analytics/rebuild.jsonl`:

```json
{
  "ts": "2026-04-22T11:30:00Z",
  "persona_id": "<id>",
  "old_version": "1.0.0",
  "new_version": "2.0.0",
  "decision": "A" | "B" | "C",
  "diff_summary": {
    "signature_moves_added": 2,
    "signature_moves_removed": 1,
    "signature_moves_renamed": 1,
    "cognitive_patterns_added": 2,
    "analogous_cases_added": 2,
    "taglines_added": 2,
    "sources_added": 17,
    "line_count_old": 280,
    "line_count_new": 342
  },
  "compliance_delta": {
    "old_passes": ["C1","C2","C3","C4","C5","C6","C7","C8"],
    "new_passes": ["C1","C2","C3","C4","C5","C6","C7","C8","C9","C10","C11","C12"],
    "gained": ["C9","C10","C11","C12"],
    "lost": []
  },
  "duration_s": 842,
  "pipeline_version": "v2.14"
}
```

Best-effort write; don't fail the rebuild on analytics errors.

## Step 9 — Close

Print:

```
Rebuild complete — <persona-id>

Decision: <A/B/C>
Old version: <version>
New version: <version>

Changes applied:
  + <N> signature moves added
  - <N> signature moves removed
  + <N> cognitive patterns added
  + <N> analogous cases added
  + <N> more source citations

Compliance gained: <list of C-checks that went from drift/fail to pass>

Backup: personas/<id>.md.bak.<ts>
To roll back: cp personas/<id>.md.bak.<ts> personas/<id>.md

Next steps:
  - Test the rebuilt persona: /muse:who "<a test question>"
  - Run the benchmark pack: /muse:benchmark (if <persona-id> is in the benchmark set)
  - Commit the new version if you're happy: git add personas/<id>.md && git commit
```

## Guarantees + non-guarantees

**Guarantees**:
- Original persona is always backed up before any change (Step 1)
- If the build fails or user aborts, the original file is restored
- User chooses between old / new / merged — no silent overwrite
- Backup file survives regardless of the A/B/C choice

**Non-guarantees**:
- Does not preserve hand-edits to the existing persona that aren't derivable from the corpus — those will be lost in option A unless the user picks C (merge) and explicitly keeps them
- Does not re-benchmark the persona via `/muse:benchmark` — that's a separate session
- Does not auto-sync to install path (`~/.claude/skills/muse/personas/`) — run install-sync manually after commit

## When to use `/muse:rebuild` vs alternatives

| Scenario | Use |
|---|---|
| Persona was built pre-v2.13 and missing Synthesis Plan audit / inline gates | `/muse:rebuild <id>` |
| Persona is under-mining per your audit (only 5 citations from a 50-file corpus) | `/muse:rebuild <id>` |
| Persona has a C-check failure on a v2.2 schema field | `/muse:update <id>` (lighter touch) |
| New files were added to corpus since last build | `/muse:refresh <id>` (additive only) |
| You want to try a completely different distillation angle | `/muse:rebuild <id>` + option C (merge manually) |
| You suspect the original corpus was incomplete | Add files to `.archives/personas/<id>/`, then `/muse:rebuild <id>` |

## Error handling

- **Build aborts mid-way**: original file restored from `.rebuild-preserved`. Backup remains.
- **Build succeeds but regression FAILs**: warn user, offer rollback before user decides A/B/C.
- **User picks C (merge) then aborts**: original file restored via `.rebuild-preserved`; `/tmp/<id>.rebuild-merged.md` kept for inspection.
- **Disk full during write**: atomic `mv` is used throughout; persona file is never left in a half-written state.
- **Fingerprint computation fails**: proceed with build anyway (fingerprint is a nice-to-have, not a block). Warning logged.

---

*Skill version: 2.15.0-alpha · part of muse-core · complements `/muse:build` (initial build) and `/muse:refresh` (incremental add). Use when you want a clean-slate re-mine with safety rails.*
