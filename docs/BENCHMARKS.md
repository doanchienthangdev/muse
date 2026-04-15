# Muse Benchmarks — Methodology + Usage

**Spec version**: v2.2.3-alpha
**Audience**: contributors, forkers, power users who want to understand how muse measures quality

This document explains how `/muse:benchmark` works, what it measures, how to run it, how to read its output, and how to establish/reset baselines. If you are a casual user who just wants to run the command, see `commands/muse:benchmark.md` (the skill file). This doc is the methodology explainer.

---

## What this is

Muse is an agentic thinking-tools framework. Its value proposition rests on a claim: the 8 personas (Feynman, Socrates, Seneca, Marcus Aurelius, Aristotle, Confucius, Lao Tzu, Dieter Rams) are **cognitively distinct** — they produce meaningfully different outputs on the same question. Without measurement, that claim rests on taste. With measurement, it becomes a number you can track.

`/muse:benchmark` is the measurement tool. It is inspired by Garry Tan's `gstack/benchmark` skill, which is a **performance regression detector for live websites**. The adaptation for muse follows the same architectural pattern:

1. **Baseline-as-reference** — capture a "golden" state, then compare future runs against it.
2. **Layered thresholds** — OK / WARNING / REGRESSION semantic labels instead of binary pass/fail. Different stakeholders get different signals.
3. **Explanatory annotations** — every regression includes *why* (which persona, which measure, which example triggered it).
4. **Mode variants** — `--baseline`, `--diff`, `--quick`, `--trend`, `--persona=<id>`, `--prompts=<list>` for different workflows.
5. **Dual output** — markdown report for humans, JSON file for trend analysis + CI.

**It is not a pass/fail gate.** A persona scoring a B instead of an A is not broken — it's a signal to review. The benchmark catches *drift*, not *crime*.

---

## The 4 categories

The benchmark is organized into 4 categories, each with 1-4 measures.

### Category 1 — Static compliance (B1-B4)

Deterministic checks against the persona file itself. Fast (~5 seconds). Detects schema violations, missing sections, and self-contradictions.

- **B1**: C1-C12 compliance (12 required structural checks)
- **B2**: Schema mirror (frontmatter ↔ body `## Taglines` table)
- **B3**: Voice rules self-consistency (quote-aware, v2.2.3+)
- **B4**: Mandatory section presence

### Category 2 — Static distinctiveness (B5-B7)

Deterministic measures of how different the personas are from each other at the token level. Fast (~5 seconds). Floor for distinctiveness, not ceiling.

- **B5**: 8×8 Jaccard overlap matrix (signature moves)
- **B6**: Stage lens coverage (framing / inquiry / test-probe)
- **B7**: Canonical dilemma coverage (6 canonical debate positions)

### Category 3 — Blind Turing simulation (B8-B10)

Subagent-based measurement of whether a fresh judge can identify each persona from its output. Slow (~60-120 seconds). This is the ceiling check — the real test of distinctiveness.

- **B8**: Generate ~150-word persona-flavored responses to 3 sample prompts
- **B9**: Dispatch blind judge subagent per prompt
- **B10**: Score match rate per prompt + aggregate

### Category 4 — Regression detection (B11)

Compares the current run against `baselines/baseline.json`. Only runs when a baseline exists. Surfaces drift with annotations.

- **B11**: Baseline comparison — flag regressions, warnings, improvements

---

## The 11 measures

### B1 — C1-C12 compliance per persona

12 structural checks mirroring `/muse:update` Step 3:

| Check | What it asserts |
|---|---|
| C1 | `signature_moves` count ≥ 3 |
| C2 | Each category (framing / inquiry / test-probe) has ≥ 1 move |
| C3 | `## Debate positions` non-empty |
| C4 | `canonical_mapping` + `deliberate_skips` cover ≥ 3 of 6 canonical dilemmas |
| C5 | Disclaimer in frontmatter AND body blockquote (if `living_status ∈ {living, estate_protected}`) |
| C6 | `thinking_mode` has `opening_question` + `core_tension` + `anti_pattern` |
| C7 | `## Sources` non-empty AND every source-id referenced resolves |
| C8 | `## On analogous problems` has ≥ 1 entry |
| C9 | `taglines[]` ≥ 3 entries AND schema mirror to `## Taglines` body table (v2.2.1+ stricter) |
| C10 | `## Voice rules` has Core belief + Tone + Contextual shifts + Banned patterns |
| C11 | `## Cognitive patterns` has ≥ 7 numbered thinking instincts |
| C12 | `## When to reach for me` has Triggers ≥ 4 AND Avoid-when ≥ 3 |

**Grade**: A = 12/12 PASS, B = 10-11, C = 8-9, D = 5-7, F = <5.

### B2 — Schema mirror

For each persona, extract `taglines[].text` values from frontmatter, parse the `## Taglines` body table rows, and assert each frontmatter text appears verbatim as a body row (and vice versa). Count must match.

**Why this matters**: a persona whose body table drifts from its frontmatter taglines will invoke the *wrong* tagline at runtime (SESSION.md reads the body table during Stage 0.5 tagline selection). This is load-bearing.

**Status**: binary per persona — `OK` or `DRIFT` with specific mismatches listed.

### B3 — Voice rules self-consistency (quote-aware, v2.2.3+)

This check catches cases where a persona's own documentation violates its own banned patterns. Example: Feynman's `## Voice rules > Banned patterns` list includes "defers to authority" — if his own signature_moves Example field says *"the textbook says so"*, that's a contradiction.

**v2.2.3 fix**: the earlier version (v2.2.2) used raw substring matching on banned patterns, which produced false positives when personas legitimately quoted user voice (Lao Tzu's Example: *"You said you need to push harder"*), used common word substrings (Confucius's "told" hitting the `old` pattern), or when counter-example vocabulary in parentheticals was mis-parsed as banned (Dieter Rams's `(he would say *useful*)` — `useful` is what he *would* say, not what he bans).

The v2.2.3 matcher does three things differently:

1. **LHS-of-em-dash + italics-only parsing** of the banned patterns list. Counter-examples in parenthetical `(he would say *X*)` are excluded because the parser drops everything after ` (`.
2. **Quote-stripping** before matching: italics, double quotes, single quotes, smart quotes, and user-attribution sentences (`"You said"`, `"User says"`, etc. up to next sentence terminator) are removed from the Example text before scanning.
3. **Word-boundary matching** (`\bpattern\b`) instead of substring match, so `told` no longer triggers the `old` pattern.

**Known limitation**: paraphrased user attribution without markers (e.g., "I hear you saying you need to grind") slips through the strip pass. A fix is on the v2.4+ roadmap.

### B4 — Mandatory section presence

Asserts each persona file contains all 9 required sections: `## Taglines`, `## Voice rules`, `## Cognitive patterns`, `## When to reach for me`, `## Signature moves`, `## Thinking mode`, `## Debate positions`, `## Sources`, `## On analogous problems`. Status: `9/9 OK` or `N/9 with missing: [list]`.

### B5 — Jaccard overlap matrix

For each persona, tokenize all signature_move Trigger lines + first sentence of each signature_move body. Remove stopwords. Lowercase. This produces a "distinctive vocabulary" token bag.

For each pair (A, B) where A ≠ B: `jaccard(A, B) = |tokens_A ∩ tokens_B| / |tokens_A ∪ tokens_B|`.

Output: 8×8 symmetric matrix. Diagonal is self-comparison (displayed as `-`).

**Thresholds**:
- `< 0.25` → OK (distinct)
- `0.25 – 0.40` → WARNING (review for drift)
- `> 0.40` → REGRESSION (clone risk — personas too similar at the vocabulary level)

**Interpretation**: Jaccard is a *floor* for distinctiveness, not a ceiling. Two personas can share tokens and still sound completely different (Feynman and Lao Tzu both use "simplify" but mean totally different things by it). A high Jaccard score is a warning, not a conviction. The Turing test (B10) is the ceiling check.

### B6 — Stage lens coverage

Simulates SESSION.md Stage 1 / Stage 2 / Stage 3 lens selection. For each stage:
1. Scan signature_moves for inline tag `(framing)` / `(inquiry)` / `(test-probe)` — pick first match.
2. Else keyword fallback on move name + Trigger + Example. Keywords:
   - **framing**: `simplif`, `defin`, `reframe`, `view from`, `as little`, `opening`, `four causes`
   - **inquiry**: `question`, `why`, `elench`, `rectific`, `assumpt`, `curios`, `ignorance`
   - **test-probe**: `calcul`, `probe`, `audit`, `premeditatio`, `subtract`, `invert`, `mean`, `cargo cult`, `emptiness`, `principles`, `test`

Report per persona: `{stage_1: <move-id>, stage_2: <move-id>, stage_3: <move-id>, coverage: N/3}`. Status: 3/3 OK, 2/3 SOFT-DRIFT, <2 HARD-GAP.

### B7 — Canonical dilemma coverage

Parse `canonical_mapping` values (slugs mapped to) + `deliberate_skips` entries. Union = total coverage against the 6 canonical dilemmas (`speed_vs_quality`, `consensus_vs_conviction`, `authority_vs_reason`, `direct_vs_indirect`, `action_vs_patience`, `tradition_vs_innovation`).

Status: ≥5 OK, 3-4 SOFT-DRIFT, <3 HARD-GAP.

### B8 — Sample prompt generation

Default prompt set: `u01` (architecture tradeoff, medium), `u05` (feature cull, easy), `u10` (quit vs persist, hard). These exercise different difficulty levels + categories. Override via `--prompts=<list>` (e.g., `--prompts=u03,u07` or `--prompts=f02`).

For each (persona, prompt) pair, the main agent generates a ~150-word persona-flavored response inline. **No subagents at this step** — using the current agent's loaded persona context is faster and more consistent than dispatching 24 subagents.

### B9 — Blind judge dispatch

For each prompt (3 total), dispatch ONE `Agent` subagent with:
- The prompt (original question)
- One-line cognitive summaries of the 8 personas (no names → no cheating)
- The 8 generated responses, shuffled and blind-labeled A-H
- Instruction: "Match each response to the persona that wrote it. Return a JSON list of `{label, persona_id}` pairs. Explain any low-confidence match."

Judge subagent runs in fresh context — it has no conversation history, no access to persona files, only the cognitive summaries + blind responses.

### B10 — Scoring

Match rate per prompt: `(correct matches) / 8`. Grade scale:

| Match rate | Grade | Meaning |
|---|---|---|
| 8/8 (100%) | A | Highly distinctive |
| 7/8 (87.5%) | B | Mostly distinctive |
| 6/8 (75%) | C | Acceptable |
| 4-5/8 (50-62%) | D | Weak distinctiveness — flag for improvement |
| ≤3/8 (<40%) | F | Essentially chance — critical quality issue |

**Aggregate**: `(correct across 3 prompts) / 24`. The aggregate is the headline number.

**Confusion annotation**: for each mismatch, the judge's reasoning is surfaced. Example: *"dieter-rams ↔ lao-tzu on u01 — both produced 'subtract what doesn't serve' framings."* Confusions are the actionable output: they tell you exactly which 2 personas overlap and on which question shapes.

### B11 — Baseline comparison

Only runs when `~/.muse/benchmark-reports/baselines/baseline.json` exists. Compares the current run's B1-B10 against the baseline:

| Drift type | Condition | Status |
|---|---|---|
| Schema mirror PASS → DRIFT | B2 regression | REGRESSION |
| Turing match rate drop > 10pp | Per prompt | REGRESSION |
| Jaccard pair increase > 0.1 | Per pair | WARNING |
| New B3 voice-rules inconsistency | Any persona | REGRESSION |
| Stage coverage drop 3/3 → 2/3 | Per persona | WARNING |
| Stage coverage drop 3/3 → <2 | Per persona | REGRESSION |
| C1-C12 pass → fail | Per check | REGRESSION |
| Any improvement | Any measure | IMPROVEMENT (informational) |

Each entry includes old value → new value + one-sentence reason + commit hint when available.

---

## Running the benchmark

### Default full run

```
/muse:benchmark
```

Runs all categories, all 8 personas, 3 sample prompts (u01, u05, u10). Takes ~60-120 seconds. Writes markdown + JSON report to `~/.muse/benchmark-reports/<timestamp>-benchmark.{md,json}`.

### Establish or reset baseline

```
/muse:benchmark --baseline
```

Runs the full benchmark AND writes the result to `~/.muse/benchmark-reports/baselines/baseline.json`. Use this:
- First time running on a fresh repo
- After shipping a release that should become the new reference point
- After fixing a regression, to bring the baseline back in sync

**IMPORTANT**: always run with the default 3-prompt set when baselining. Single-prompt runs (`--prompts=u01 --baseline`) produce an incomplete baseline that misses difficulty variance.

### Compare against baseline

```
/muse:benchmark --diff
```

Runs the full benchmark AND compares results to `baseline.json`. The report highlights regressions + improvements. Use this after making changes to a persona to see if distinctiveness held.

### Quick static check

```
/muse:benchmark --quick
```

Runs only B1-B7 (static compliance + static distinctiveness). Skips the ~60-120s Turing simulation. Use this during iterative persona editing when you just want fast schema + drift feedback.

### Historical trend

```
/muse:benchmark --trend
```

Reads `~/.muse/analytics/benchmark-runs.jsonl` and prints the distinctiveness / grade / regressions trend across previous runs. No new benchmark is run.

### Deep-dive on one persona

```
/muse:benchmark --persona=feynman
```

Runs all measures but only on feynman. Useful for debugging a single persona's compliance or voice-rules false positives. With v2.2.3+ quote-aware matcher, `--persona` deep-dive also reports the B3 strip ratio per move.

### Override prompts

```
/muse:benchmark --prompts=u03,u07,f02
```

Run the Turing simulation on a custom prompt set instead of the default (u01, u05, u10). Useful for debugging a specific confusion case. **Do not combine with `--baseline`** — a valid baseline must use the default 3-prompt set.

---

## Reading the output

The markdown report is organized into 4 sections matching the 4 measurement categories:

### Section: Overall grade

One-liner headline: `Overall grade: A (highly distinctive, perfect match rate)`. Followed by a bulleted summary of Static compliance / Static distinctiveness / Stage coverage / Canonical coverage / Turing rate / Regressions / Improvements.

**Read this first.** If the grade is A, the rest is verification. If it's B or lower, scroll to Categories 3 and 4 — that's where the actionable signals live.

### Section: Category 1 — Static compliance

A per-persona table with columns for each of the 12 checks (C1-C12) + schema mirror + voice consistency + grade. Look for any `✗` or non-OK cell. Those are schema violations — fix the persona file.

### Section: Category 2 — Static distinctiveness

The 8×8 Jaccard overlap matrix, followed by average + max-pair + top-3-pairs. Look at the max pair — if it's in WARNING or REGRESSION range, that pair shares too much vocabulary. Not necessarily a problem (legit overlap between stoics is fine) but worth checking.

### Section: Category 3 — Blind Turing simulation

Per-prompt tables showing blind label → judged persona → actual persona → confidence → judge reasoning. Look for mismatches. Each one is actionable — the judge's reasoning tells you exactly *why* two personas were confused.

### Section: Category 4 — Regression detection

Only present when baseline exists. Lists regressions (things that got worse) + improvements (things that got better) + the commit hint for when each change likely landed.

---

## Establishing & resetting the baseline

**When to re-baseline**:
- After shipping a major release (v2.X.0)
- After deliberately improving a persona (the old baseline would flag the improvement as a regression otherwise)
- After running the benchmark for the first time on a fresh clone

**When NOT to re-baseline**:
- After a regression that you intend to fix — keep the baseline so the fix shows up as an improvement
- Mid-experiment — the baseline is a committed reference point, not a scratchpad

**How to re-baseline**:

```
/muse:benchmark --baseline
```

This overwrites `~/.muse/benchmark-reports/baselines/baseline.json`. The old baseline is discarded. The timestamped report in `~/.muse/benchmark-reports/` is kept (it's append-only history).

**If you want to preserve the old baseline for comparison**:

```
cp ~/.muse/benchmark-reports/baselines/baseline.json ~/.muse/benchmark-reports/baselines/baseline-pre-<tag>.json
/muse:benchmark --baseline
```

Then future `--diff` runs will still only compare against `baseline.json`, but the old snapshot is preserved on disk for manual comparison.

---

## Interpreting confusions (worked example)

From the v2.2.2-alpha first run, u05 (feature cull):

| Blind | Judged | Actual | Confidence | Reasoning |
|---|---|---|---|---|
| F | lao-tzu | lao-tzu | high | "Wu wei, empty bowl metaphor, subtraction over addition" |

This is a high-confidence correct match. The judge pointed at specific signals: *wu wei*, the empty bowl metaphor, subtraction. Those are Lao Tzu's distinctive moves, and they're appearing in his output. Good.

Contrast with a hypothetical low-confidence mismatch:

| Blind | Judged | Actual | Confidence | Reasoning |
|---|---|---|---|---|
| C | marcus-aurelius | seneca | low | "Both use stoic imagery + 'next right action' — could be either" |

This is actionable. The judge saw stoic imagery + "next right action" in the blind response and couldn't distinguish Seneca from Marcus Aurelius. The fix: sharpen one of them. For Seneca, emphasize his distinctive *time accounting* and *premeditatio malorum* (rehearse shutdown). For Marcus, emphasize his *view from above* and private journal voice. The confusion tells you exactly where the vocabulary overlaps.

**Every confusion is a lesson**: it names the two personas that collide, the question shape that triggered it, and the specific text that caused it. Use it.

---

## Output locations

| File | Purpose |
|---|---|
| `~/.muse/benchmark-reports/<timestamp>-benchmark.md` | Human-readable report (one per run) |
| `~/.muse/benchmark-reports/<timestamp>-benchmark.json` | Machine-readable metrics (one per run) |
| `~/.muse/benchmark-reports/baselines/baseline.json` | The current golden reference (overwritten by `--baseline`) |
| `~/.muse/analytics/benchmark-runs.jsonl` | Append-only history (one line per run) for trend analysis |

All paths are under `~/.muse/`, not inside the repo. This keeps personal benchmark history out of git.

---

## For contributors

**When to run the benchmark**:
- After editing any persona file → `/muse:benchmark --diff` to catch drift
- Before opening a PR → include the grade in the PR description
- After adding a new persona → `/muse:benchmark --baseline` is NOT appropriate (it would hide regressions from the new addition); use `/muse:benchmark --diff` and if the aggregate Turing rate drops below 90%, investigate before landing
- After changing SESSION.md or SKILL.md → `/muse:benchmark --quick` to verify no schema impact

**CI integration** (v2.4+ roadmap): planned GitHub Actions workflow that runs `/muse:benchmark --diff` on every PR and comments the grade + regressions in the PR thread.

**Adding a new persona without breaking the baseline**: create the persona file, run `/muse:update <new-id>` to get it fully v2.2-compliant, then run `/muse:benchmark --diff`. If the aggregate Turing rate stays at or above the baseline, land the persona. If it drops, the new persona is cannibalizing an existing one's distinctiveness — sharpen its moves before landing.

---

## For forkers

**Swapping the prompt set**: edit `benchmarks/universal.md` and `benchmarks/founder-questions.md`. The benchmark skill reads them at runtime. You can add, remove, or reorder prompts — just keep the naming convention (`u01..u10` and `f01..f10`). To use different prompts by default, edit `commands/muse:benchmark.md` Step 4 / B8 where the default set `u01, u05, u10` is hardcoded.

**Customizing thresholds**: the Jaccard thresholds (0.25, 0.40), Turing grade boundaries (100%, 87.5%, 75%, etc.), and regression-drift thresholds (10pp, 0.1) are in `commands/muse:benchmark.md` Step 3 (B5) and Step 5 (B11). Edit to your taste.

**Resetting `~/.muse/`**: `rm -rf ~/.muse/benchmark-reports/` wipes all history. `rm ~/.muse/benchmark-reports/baselines/baseline.json` wipes just the baseline. Both are safe — the muse skill files in the repo are untouched.

---

## Known limitations (v2.2.3-alpha)

1. **Paraphrased user attribution without markers** — B3 still flags banned patterns that appear inside paraphrased quotes without italics or markers (e.g., "I hear you saying you need to grind"). Fix on v2.4+ roadmap.
2. **Subagent judge is not a human judge** — the Turing test uses an Agent subagent in fresh context, not real humans. For the scientific version, use `/muse:spike` (v2.3.0+, MVP gather-only). Subagent scores tend to slightly overestimate real human distinguishability because the subagent has access to the one-line cognitive summaries (which already encode distinctiveness).
3. **Single run variance** — Turing simulation is non-deterministic (subagent reasoning varies). Grade can fluctuate ±1 step between runs at the same commit. For confident baselining, run 3 times and take the median.
4. **Jaccard is tokens, not semantics** — B5 measures vocabulary overlap, not meaning overlap. Two personas can share 0 tokens and still say the same thing in different words. The Turing test (B10) is the ceiling check.
5. **Regression detection requires a baseline** — without `baselines/baseline.json`, B11 is skipped. First run on a fresh repo → run with `--baseline` to bootstrap.

---

## Cross-references

- **Implementation**: `commands/muse:benchmark.md` — the full skill source with all 11 measures
- **Persona schema**: `docs/PERSONA_SCHEMA.md` — the canonical schema that C1-C12 checks against
- **Prompts**: `benchmarks/universal.md` (10 general prompts), `benchmarks/founder-questions.md` (10 founder-specific prompts)
- **Changelog**: `docs/CHANGELOG.md` — benchmark spec version history
- **Gstack inspiration**: `~/.claude/skills/gstack/benchmark/SKILL.md` — the architectural ancestor

---

*Maintained by muse/core · last updated 2026-04-15 for v2.2.3-alpha*
