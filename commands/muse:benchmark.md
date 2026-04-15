---
description: Muse persona benchmark — measures distinctiveness, voice discipline, schema compliance, and mode fit across all 8 personas. Runs static checks (C1-C12, Jaccard overlap, schema mirror) + subagent-based blind Turing simulation on sample prompts from benchmarks/universal.md. Writes markdown report + JSON to ~/.muse/benchmark-reports/. Supports --baseline, --diff, --quick, --persona, --trend modes. Regression detection against baseline.json.
allowed-tools: Read, Glob, Bash, Write, Edit, AskUserQuestion, Agent
argument-hint: [--baseline | --diff | --quick | --trend] [--persona=<id>] [--prompts=<u01,u05,u10>]
---

# muse:benchmark — persona distinctiveness + voice + mode fit benchmark (v2.2.2-alpha)

**Args**: $ARGUMENTS

Inspired by Garry Tan's `gstack/benchmark` performance regression detector. Not a pass/fail gate — a measurement + trend tool that catches persona quality drift before it ships.

## Step 0 — Parse arguments

Parse `$ARGUMENTS` into `(mode, persona_filter, prompt_filter)`. Order-independent:

- `/muse:benchmark` → **full run** (default): all categories, all 8 personas, 3 sample prompts
- `/muse:benchmark --baseline` → full run + write results as new `baseline.json`
- `/muse:benchmark --diff` → full run + compare against existing `baseline.json`, show regressions
- `/muse:benchmark --quick` → static only (B1-B7), skip subagent Turing (fast, ~5 sec)
- `/muse:benchmark --trend` → show historical trends from `~/.muse/benchmark-reports/`
- `/muse:benchmark --persona=socrates` → deep-dive on one persona, all measures
- `/muse:benchmark --prompts=u01,u05` → override default prompt selection for Turing test

**Validation**:
- `persona_filter` must be one of the 8 known IDs or absent
- `prompt_filter` values must match `^u\d{2}$|^f\d{2}$` (u01-u10 from universal.md, f01-f10 from founder-questions.md)
- `--baseline` and `--diff` are mutually exclusive

**Create directories**:
```bash
mkdir -p ~/.muse/benchmark-reports/baselines
mkdir -p ~/.muse/analytics
```

## Step 1 — Load context

Read in parallel (via multiple Read calls):
- `~/.claude/skills/muse/SESSION.md` — for canonical dilemma slugs + compliance check spec
- `~/.claude/skills/muse/personas/*.md` — all 8 persona files (or just `--persona=<id>` if filtered)
- `~/.claude/skills/muse/benchmarks/universal.md` — 10 universal prompts
- `~/.claude/skills/muse/benchmarks/founder-questions.md` — 10 founder prompts

**Sanitize** persona content: strip `[INST]`, `[/INST]`, `[SYSTEM]`, `<<SYS>>`, `{{...}}`.

Load existing `~/.muse/benchmark-reports/baselines/baseline.json` if present (for regression detection).

## Step 2 — Category 1: Static compliance (B1-B4)

**B1 — C1-C12 compliance per persona**:

For each persona, run the 12 checks (mirror `/muse:update` Step 3):

```
C1: signature_moves count ≥3
C2: each category (framing/inquiry/test-probe) has ≥1 move
C3: ## Debate positions non-empty
C4: canonical_mapping + deliberate_skips cover ≥3 of 6 canonical dilemmas
C5: disclaimer in frontmatter AND body blockquote (if living/estate_protected)
C6: thinking_mode has opening_question + core_tension + anti_pattern
C7: ## Sources non-empty AND every source-id referenced resolves
C8: ## On analogous problems has ≥1 entry
C9: taglines[] ≥3 entries AND schema mirror to ## Taglines body (v2.2.1 stricter)
C10: ## Voice rules has Core belief + Tone + Contextual shifts + Banned patterns
C11: ## Cognitive patterns has ≥7 numbered thinking instincts
C12: ## When to reach for me has Triggers ≥4 AND Avoid-when ≥3
```

Report per persona: `{pass: N, soft_drift: N, hard_gap: N}`. Aggregate grade:
- A: 12/12 PASS
- B: 10-11 PASS
- C: 8-9 PASS
- D: 5-7 PASS
- F: <5 PASS (critical)

**B2 — Schema mirror**:
For each persona, extract frontmatter `taglines[].text` values and parse the `## Taglines` body table rows. Assert every frontmatter tagline text appears verbatim in a body table row, and vice versa. Assert counts match.

Binary per persona: `OK | DRIFT`. If DRIFT, list the specific mismatches.

**B3 — Voice rules self-consistency**:
For each persona, extract `## Voice rules > Banned patterns` list. Then scan the same persona's `## Signature moves > Example:` fields. For each banned pattern, check if it appears in any Example. If yes, INCONSISTENCY — the persona's own documentation violates its own banned patterns.

Report per persona: `{inconsistencies: N, details: [...]}`. Should be 0 across the board.

**B4 — Mandatory sections presence**:
For each persona, check each required section exists (`## Taglines`, `## Voice rules`, `## Cognitive patterns`, `## When to reach for me`, `## Signature moves`, `## Thinking mode`, `## Debate positions`, `## Sources`, `## On analogous problems`).

Report per persona: `{sections_present: N/9, missing: [list]}`. Should be 9/9.

## Step 3 — Category 2: Static distinctiveness (B5-B7)

**B5 — Jaccard overlap matrix (8x8)**:

For each persona, tokenize:
- All signature_move Trigger lines
- First sentence of each signature_move body

Combine into a token bag. Remove stopwords (`the, a, an, is, are, was, were, to, of, in, on, and, or, but, for, with, by, from, at, as, that, this, which, who, what, when, where, how, why, if, then, so, not, no`). Lowercase.

For each pair (A, B) where A ≠ B:
- `jaccard(A, B) = |tokens_A ∩ tokens_B| / |tokens_A ∪ tokens_B|`

Output: 8×8 matrix (symmetric, diagonal is self=1.0, display as `-`).

**Thresholds**:
- < 0.25: OK (distinct)
- 0.25–0.40: WARNING (review for drift)
- > 0.40: REGRESSION (clone risk — personas too similar)

**Aggregate metrics**:
- Average overlap across all pairs
- Max pair overlap (which 2 personas are most similar?)
- Per persona: max overlap (which existing persona is this one closest to?)

**B6 — Stage lens coverage**:

For each persona, simulate SESSION.md Stage 1/2/3 lens selection. For each stage:
1. Scan signature_moves for inline tag `(framing)` / `(inquiry)` / `(test-probe)`. If match, pick first.
2. Else keyword fallback on move name + Trigger + Example:
   - framing: `simplif`, `defin`, `reframe`, `view from`, `as little`, `opening`, `four causes`
   - inquiry: `question`, `why`, `elench`, `rectific`, `assumpt`, `curios`, `ignorance`
   - test-probe: `calcul`, `probe`, `audit`, `premeditatio`, `subtract`, `invert`, `mean`, `cargo cult`, `emptiness`, `principles`, `test`
3. Assert a move was picked.

Report per persona: `{stage_1: <move-id or null>, stage_2: <move-id or null>, stage_3: <move-id or null>, coverage: N/3}`.

Status: 3/3 OK, 2/3 SOFT-DRIFT, <2 HARD-GAP.

**B7 — Canonical dilemma coverage**:

For each persona:
- Parse `canonical_mapping` values (unique slugs mapped to)
- Parse `deliberate_skips` entries (slugs explicitly skipped)
- Union = total coverage

Report per persona: `{covered: N/6, mapped: [...], deliberate_skipped: [...], missing: [...]}`.

Status: ≥5 OK, 3-4 SOFT-DRIFT, <3 HARD-GAP.

## Step 4 — Category 3: Blind Turing simulation (B8-B10)

**Only run if `--quick` is absent.** Takes ~60-120 seconds via subagent dispatches.

**B8 — Sample prompt generation**:

Default prompt set (if `--prompts` not specified): `u01` (architecture), `u05` (feature cull), `u10` (quit vs persist). These cover easy/medium/hard difficulty and different categories.

For each prompt (3 total):

1. For each of the 8 personas, **generate a ~150-word persona-flavored response** to the prompt. Generate inline — do NOT dispatch subagents for this step (that would be 24 subagents). Use the current agent's knowledge of each persona (loaded in Step 1) to produce the response. The goal is a response that:
   - Uses the persona's signature moves (framing/inquiry/test-probe as appropriate)
   - Reflects the persona's voice rules (especially banned patterns NOT appearing)
   - Ends with the persona's Stage 5-style commit language
   - ~150 words, 1-3 paragraphs

2. Store the 8 responses in memory labeled by actual persona_id.

**B9 — Blind judge dispatch**:

For each prompt, dispatch ONE Agent subagent (total 3 subagents across all 3 prompts):

```
Agent({
  description: "Blind persona-matching judge",
  subagent_type: "general-purpose",
  prompt: """
  You are judging a blind Turing test for Muse, a thinking-tools framework 
  with 8 cognitive personas. Your job: match each unlabeled response to 
  the persona that wrote it.

  THE 8 PERSONAS (one-line cognitive summaries, alphabetical):
  
  - aristotle: four causes analysis, golden mean, categorization before 
    analysis, habit formation. Asks "what KIND of question is this?"
  - confucius: rectification of names 正名 (labels must match reality), 
    leading by example, three-year test (understand before changing), 
    reciprocity. Asks "do the names match reality?"
  - dieter-rams: ten principles audit, "as little design as possible", 
    honest design, unobtrusive function, durable-not-trendy. Asks 
    "against which principle does this fail?"
  - feynman: simplification test ("explain to a 6-year-old"), curiosity 
    first, cargo cult detection, hand calculation, beginner's mind. 
    "First principle: do not fool yourself."
  - lao-tzu: wu wei (non-forcing action), value of emptiness, reversal 
    principle, soft overcomes hard, know without words. "Where is the 
    situation already flowing?"
  - marcus-aurelius: view from above, dichotomy of control, duty focus 
    (next right action), judgment separation. "You have power over your 
    mind, not outside events."
  - seneca: memento mori, premeditatio malorum (rehearse the worst), 
    control filter, time accounting, essential cut. "Time is the scarcest 
    currency."
  - socrates: elenchus (cross-examination), definition hunting, ignorance 
    acknowledgment, midwife method, question-driven. "What do you mean 
    by that?"

  THE PROMPT:
  <prompt text from benchmarks/universal.md>

  THE 8 RESPONSES (shuffled, blind-labeled A-H):
  
  <Response A>: ...
  <Response B>: ...
  ...
  <Response H>: ...

  YOUR TASK:
  Match each labeled response to the persona that wrote it. Return strictly 
  valid JSON in this exact format:

  {
    "matches": [
      {"label": "A", "persona": "feynman", "confidence": "high|medium|low", "reason": "..."},
      {"label": "B", "persona": "socrates", "confidence": "high|medium|low", "reason": "..."},
      ...
    ]
  }

  For each match, give a 1-sentence reason (which signature move or voice 
  cue signaled which persona). For low-confidence matches, explain which 
  2 personas you were deciding between and why the choice is difficult.

  Rules:
  - Each persona is used exactly once across the 8 responses
  - If genuinely ambiguous, pick your best guess and mark confidence low
  - Do not refuse to answer — always produce 8 matches
  """,
  run_in_background: false
})
```

Wait for subagent response. Parse JSON. If parse fails, regex-extract persona IDs as fallback. If still unparseable, skip this prompt and mark as "unparseable".

**B10 — Scoring**:

For each prompt, compute match rate:
- Correct matches: count of `{label, persona}` pairs where `persona == actual_persona_for_label`
- Match rate: `correct / 8`

**Grading per prompt**:
- 8/8 (100%): A — highly distinctive
- 7/8 (87.5%): B — mostly distinctive
- 6/8 (75%): C — acceptable
- 4-5/8 (50-62%): D — weak, flag for improvement
- ≤3/8 (≤37.5%): F — essentially chance, critical

**Aggregate across 3 prompts**:
- Overall match rate = `sum(correct) / 24`
- Overall grade: same scale applied to aggregate

**Confidence annotations**:
For each mismatch, extract the subagent's `reason` field. Format as:
> *"Prompt u01: response C was judged as lao-tzu (confidence: low, reason: 'talked about subtraction') but actually written as dieter-rams. Root cause: both personas lean on 'subtract what doesn't serve'. Consider sharpening Rams's ten-principles specificity vs Lao Tzu's emptiness metaphor."*

This is the actionable output — the user sees not just "75% match rate" but "these 2 personas are confused with each other, here's why."

## Step 5 — Category 4: Regression detection (B11)

**Only runs if baseline exists** (`~/.muse/benchmark-reports/baselines/baseline.json`).

Load baseline JSON. Compare to current run's metrics:

**Regression rules**:
1. Any persona whose C1-C12 compliance dropped (fewer PASSes) → **REGRESSION**
2. Any persona whose B5 max Jaccard overlap increased by >0.05 → **WARNING**
3. Any persona whose B6 stage coverage dropped (3/3 → 2/3) → **REGRESSION**
4. Any persona whose B7 canonical coverage dropped by ≥1 slug → **WARNING**
5. Any new B3 voice rules inconsistency that wasn't in baseline → **REGRESSION**
6. Overall distinctiveness match rate drop >10pp → **REGRESSION**
7. Overall distinctiveness match rate drop 5-10pp → **WARNING**

**Improvement rules** (positive drift worth surfacing):
1. Any new C PASS that was SOFT-DRIFT or HARD-GAP in baseline → **IMPROVEMENT**
2. Jaccard overlap decrease >0.05 → **IMPROVEMENT**
3. Turing match rate increase >5pp → **IMPROVEMENT**

**Annotations**:
For each regression, attempt to identify the likely cause via `git log --since=<baseline.timestamp> -- personas/<id>.md`. Show the commit SHA and one-line commit message. Don't auto-revert — just annotate.

## Step 6 — Generate report

Produce the markdown report with these sections:

```markdown
# Muse Benchmark Report

**Date**: <ISO 8601>
**Commit**: <git rev-parse --short HEAD>
**Muse spec**: v2.2.2-alpha
**Personas**: <N> benchmarked
**Prompts**: <list of prompt IDs used>
**Baseline**: <date of baseline, or "none — first run">

---

## Overall Grade: <A/B/C/D/F>

- **Static compliance**: <avg per-persona grade>
- **Static distinctiveness** (Jaccard): avg <0.XX>, max pair <persona_a ↔ persona_b at 0.XX>
- **Blind Turing match rate**: <N/24> (<XX%>)
- **Regressions**: <N> (from baseline)
- **Improvements**: <N> (from baseline)

---

## Category 1 — Static compliance

| Persona | C1-C12 | Schema mirror | Voice self-consistency | Sections | Grade |
|---|---|---|---|---|---|
| ... | ... |

<details for any SOFT-DRIFT or HARD-GAP>

---

## Category 2 — Static distinctiveness

### Jaccard overlap matrix (signature_moves)

```
         ari  con  ram  fey  lao  mar  sen  soc
ari       -  0.XX 0.XX 0.XX 0.XX 0.XX 0.XX 0.XX
con      0.XX  -  ...
...
```

**Average overlap**: 0.XX (target: <0.25)
**Max pair**: <A ↔ B> at 0.XX
**Per-persona max neighbor**: each persona's closest other persona

### Stage lens coverage

| Persona | Stage 1 (framing) | Stage 2 (inquiry) | Stage 3 (test-probe) | Coverage |
|---|---|---|---|---|
| ... |

### Canonical dilemma coverage

| Persona | Mapped slugs | Deliberate skips | Coverage |
|---|---|---|---|
| ... |

---

## Category 3 — Blind Turing simulation

### Sample prompts

- u01: <prompt>
- u05: <prompt>
- u10: <prompt>

### Match rates by prompt

| Prompt | Correct | Rate | Grade | Low-confidence confusions |
|---|---|---|---|---|
| u01 | N/8 | XX% | X | <persona_a ↔ persona_b>: <reason> |
| u05 | N/8 | XX% | X | ... |
| u10 | N/8 | XX% | X | ... |

**Overall**: N/24 (XX%, <grade>)

### Actionable confusions (where distinctiveness broke down)

1. **<persona_a ↔ persona_b>** on <prompt_id>: <reason from judge subagent>
   - **Root cause**: <analysis — which shared signature move or phrase caused the confusion>
   - **Recommended fix**: <specific edit to one or both personas>

2. ...

---

## Category 4 — Regression detection

<if baseline exists>

### Regressions since <baseline date>

| Measure | Persona | Baseline | Current | Likely cause |
|---|---|---|---|---|
| ... |

### Improvements since baseline

| Measure | Persona | Baseline | Current | Source |
|---|---|---|---|---|
| ... |

<else: "No baseline — run `/muse:benchmark --baseline` to establish one for the next run.">

---

## Top recommendations

1. **[HIGH]** <finding> — <action>
2. **[MED]** <finding> — <action>
3. **[LOW]** <finding> — <action>

---

## Next actions

1. <command to run, e.g., `/muse:update feynman`>
2. ...

---

## Metadata

- Run duration: <seconds>
- Subagents dispatched: <N>
- Files written:
  - `~/.muse/benchmark-reports/<date>-benchmark.md` (this report)
  - `~/.muse/benchmark-reports/<date>-benchmark.json` (metrics)

*Generated by /muse:benchmark (v2.2.2-alpha)*
```

Write the report to `~/.muse/benchmark-reports/$(date +%Y-%m-%d-%H%M%S)-benchmark.md` via the Write tool.

## Step 7 — Write JSON metrics

Produce the JSON file:

```json
{
  "timestamp": "<ISO 8601>",
  "commit": "<abbrev>",
  "spec_version": "2.2.2-alpha",
  "run_id": "<timestamp>",
  "personas": {
    "<persona_id>": {
      "c1_c12": {"pass": N, "soft_drift": N, "hard_gap": N, "per_check": {...}},
      "schema_mirror": "ok|drift",
      "voice_consistency": "ok|inconsistent",
      "sections": N,
      "grade": "A|B|C|D|F",
      "stage_coverage": "N/3",
      "canonical_coverage": "N/6",
      "max_jaccard_neighbor": {"persona": "<id>", "overlap": N}
    }
  },
  "jaccard_matrix": {
    "<persona_a>": {"<persona_b>": 0.XX, ...},
    ...
  },
  "jaccard_stats": {
    "average": 0.XX,
    "max_pair": {"a": "...", "b": "...", "overlap": 0.XX},
    "min_pair": {...}
  },
  "turing_tests": {
    "<prompt_id>": {
      "prompt_category": "...",
      "match_rate": 0.XX,
      "correct": N,
      "total": 8,
      "confusions": [
        {
          "blind_label": "C",
          "actual": "<id>",
          "judged_as": "<id>",
          "confidence": "low",
          "reason": "..."
        }
      ]
    }
  },
  "overall": {
    "grade": "A|B|C|D|F",
    "distinctiveness_score": 0.XX,
    "static_compliance_rate": 0.XX
  },
  "regressions": [
    {"measure": "...", "persona": "...", "baseline": N, "current": N, "commit": "..."}
  ],
  "improvements": [
    {"measure": "...", "persona": "...", "baseline": N, "current": N}
  ]
}
```

Write to `~/.muse/benchmark-reports/<timestamp>-benchmark.json` via Write tool.

**If `--baseline` flag was passed**: also copy the JSON to `~/.muse/benchmark-reports/baselines/baseline.json`.

## Step 8 — Append to analytics log

Log a summary to `~/.muse/analytics/benchmark-runs.jsonl` for long-term trend analysis:

```bash
mkdir -p ~/.muse/analytics
# Append one line per benchmark run
jq -n \
  --arg ts "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  --arg commit "$(git rev-parse --short HEAD)" \
  --arg grade "$overall_grade" \
  --argjson dist "$overall_distinctiveness" \
  --argjson regressions $regression_count \
  '{ts:$ts,commit:$commit,grade:$grade,distinctiveness:$dist,regressions:$regressions}' \
  >> ~/.muse/analytics/benchmark-runs.jsonl
```

## Step 9 — Print summary + exit

Print to conversation:

```
Benchmark complete (duration: <seconds>s, <N> subagents dispatched)

Overall Grade: <A/B/C/D/F>
  Static compliance: <avg grade>
  Distinctiveness: <XX%> (Turing match rate)
  Max Jaccard pair: <A ↔ B> at 0.XX
  Regressions: <N> (from baseline)

Top 3 findings:
  1. <finding>
  2. <finding>
  3. <finding>

Full report: ~/.muse/benchmark-reports/<filename>.md
JSON metrics: ~/.muse/benchmark-reports/<filename>.json

Next: review the report and run /muse:update <persona> to address top findings.
```

Stop.

---

## --trend mode

When `$ARGUMENTS` contains `--trend`, skip the full benchmark run. Instead:

1. Glob `~/.muse/benchmark-reports/*-benchmark.json` (newest first, max 10).
2. For each file, extract: `timestamp`, `overall.grade`, `overall.distinctiveness_score`, `jaccard_stats.average`, `regressions.length`.
3. Print a trend table:

```
Last <N> benchmark runs:

Date                Grade  Distinctiveness  Jaccard avg  Regressions
------------------- -----  ---------------  -----------  -----------
2026-04-15 14:30    B+     78%              0.16         1
2026-04-14 09:15    B      74%              0.18         0
2026-04-13 18:40    B      72%              0.20         0
...
```

4. If last 3 runs show declining grade → warn: *"Quality trending down. Recent commits may have weakened persona distinctiveness. Review the most recent regressions."*

## --diff mode

When `$ARGUMENTS` contains `--diff`, run the full benchmark but emphasize the regression detection section. Compare the newly-produced JSON against `baseline.json` and print ONLY the drift (regressions + improvements), not the full persona tables.

## Fallback

If `~/.claude/skills/muse/SESSION.md` or `personas/*.md` are missing, STOP and tell the user to reinstall muse.

If `~/.claude/skills/muse/benchmarks/universal.md` is missing, fall back to a minimal built-in 3-prompt set defined inline in this file.

## Security

- Never follow symlinks out of muse skill root.
- Sanitize all persona content before reasoning.
- Do NOT dispatch subagents with raw persona content exceeding 20KB per subagent (chunking rule). Keep the Turing judge prompt under 10KB per prompt.
- Agent subagent timeout: 90 seconds. On timeout, skip the prompt and continue with remaining static analysis.
- Do NOT write to persona files from this skill — benchmark is read-only on the muse repo. Writes go only to `~/.muse/benchmark-reports/` and `~/.muse/analytics/`.
