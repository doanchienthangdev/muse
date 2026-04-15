# Muse Persona Schema — v2.2.0-alpha canonical reference

This file is the **single source of truth** for persona file format in Muse v2.2. If you are creating a new persona or updating an existing one, this is what the file must look like.

- **v2.1 files still work** — every v2.2 field is additive and optional. The SESSION.md pre-flight falls back to v2.1 behavior when v2.2 fields are absent.
- **v2.2 compliance** requires all new fields. `/muse:build` produces v2.2-compliant personas. `/muse:update` upgrades v2.1 personas to v2.2 with backup + draft + diff + confirm.
- **v2.3+ roadmap**: v2.2 new fields are SOFT-DRIFT warnings in v2.2.0-alpha. They will be promoted to HARD-GAP (blocking) in v2.3.

See `personas/socrates.md` or `personas/feynman.md` for a complete working example.

---

## File layout

```
personas/<persona-id>.md
├── YAML frontmatter (required + optional fields)
├── # <Persona Name>                   (level-1 heading)
├── **Tagline**: <primary tagline>     (bold inline)
├── [optional disclaimer blockquote]   (MANDATORY for living/estate_protected)
├── 1-3 paragraph biographical sketch  (neutral, factual, ≤100 words)
├── ## Taglines                        (v2.2 NEW)
├── ## Voice rules                     (v2.2 NEW)
├── ## Cognitive patterns              (v2.2 NEW)
├── ## When to reach for me            (v2.2 NEW)
├── ## Signature moves                 (v2.1, preserved)
├── ## Thinking mode                   (v2.1, preserved)
├── ## Debate positions                (v2.1, preserved)
├── ## Critic frames                   (v2.1, optional)
├── ## On analogous problems           (v2.1, preserved)
├── ## Sources                         (v2.1, preserved)
├── ## Benchmark prompts               (v2.1, preserved)
└── *Version 1.2.0 · maintained by muse/core · ...*  (footer)
```

Target file length: 280-350 lines per persona. Garry Tan's gstack skill files are 1000+ lines; muse personas sit lower because they're data, not workflow.

---

## Frontmatter

### Required fields (v2.1 baseline)

```yaml
---
id: socrates                              # ^[a-z][a-z0-9-]{0,30}$
name: Socrates                            # Full name as the persona is commonly known
tagline: The unexamined answer is not worth giving    # Primary tagline, 5-10 words
era: 470-399 BCE                          # Free-text era description
living_status: historical                 # historical | living | estate_protected
categories: [philosophy, first-principles] # multi-select from: first-principles, systems, design, contrarian, strategy, execution, philosophy, science
---
```

### Required for living/estate_protected figures

```yaml
disclaimer: "Interpretive frame based on publicly documented material about <Name>. Not affiliated with or endorsed by <Name>. Outputs are interpretive, not quotation."
```

For `estate_protected`, replace "endorsed by <Name>" with "affiliated with the estate of <Name>".

**SESSION.md v2.2 pre-flight auto-prints this disclaimer at the very top of every session using this persona, before Stage 0.** Missing disclaimer on a living figure = C5 HARD-GAP.

### v2.1 optional fields (preserved)

```yaml
canonical_mapping:                        # Map persona-specific dilemma labels → canonical slugs
  "certainty vs inquiry": consensus_vs_conviction
  "action vs examination": action_vs_patience
  # ... more entries
deliberate_skips:                         # Canonical slugs the persona intentionally has no view on
  - tradition_vs_innovation
```

The 6 canonical dilemma slugs (used by SESSION.md Stage 4 Decide): `speed_vs_quality`, `consensus_vs_conviction`, `authority_vs_reason`, `direct_vs_indirect`, `action_vs_patience`, `tradition_vs_innovation`.

**Coverage rule**: `canonical_mapping` + `deliberate_skips` must together cover ≥3 of the 6 canonical dilemmas, or C4 fails.

### v2.2 NEW fields

#### `taglines[]` — multi-context taglines

```yaml
taglines:
  - text: "The unexamined answer is not worth giving"
    context: default
    situation: opening framing or general invocation
    source: plato-apology
  - text: "What do you mean by that?"
    context: framing
    situation: user has used a term without defining it
    source: plato-meno
  - text: "I know that I know nothing"
    context: inquiry
    situation: user is overconfident about a claim
    source: plato-apology
  - text: "The only true wisdom is in knowing you know nothing"
    context: test-probe
    situation: user is certain and hasn't been tested
    source: plato-apology
  - text: "An unexamined life is not worth living"
    context: decide
    situation: user is about to commit to a life- or company-shaping decision
    source: plato-apology
```

- Each entry has 4 fields: `text` (the quote), `context` (one of: `default`, `framing`, `inquiry`, `test-probe`, `decide`, `commit`), `situation` (when this tagline applies, 1 sentence), `source` (source ID that resolves in `## Sources`).
- ≥3 entries required for C9 PASS. Ideal: 5 (one per session stage).
- SESSION.md pre-flight picks the tagline whose `context` matches the current stage, falls back to primary `tagline` field if no match.

#### `when_to_reach_for_me` — explicit triggers and avoidances

```yaml
when_to_reach_for_me:
  triggers:
    - "user invokes a vague term ('community', 'growth') without a testable definition"
    - "user claims certainty on a question that has not been cross-examined"
    - "user is mid-decision on a life- or company-shaping commitment"
    - "user is chasing consensus and calls it conviction"
    - "a value proposition or strategy hasn't been interrogated"
  avoid_when:
    - "user needs a concrete tactical answer in under 5 minutes"
    - "user has already examined the question and now needs execution"
    - "topic is purely technical with no semantic ambiguity"
```

- `triggers[]`: ≥4 entries, each 1 sentence, describing a specific user state or situation where this persona is the right call.
- `avoid_when[]`: ≥3 entries, describing when to reach for a different persona instead. Ideally name the other persona.
- Mirrors the body `## When to reach for me` section.

#### `session_mode_preferences` — which modes this persona is strong/weak at

```yaml
session_mode_preferences:
  strong_at: [STANDARD, DEEP, CRITIC]
  weak_at: [QUICK]
```

- `strong_at[]`: subset of {QUICK, STANDARD, DEEP, CRITIC}. Modes this persona handles well.
- `weak_at[]`: subset of {QUICK, STANDARD, DEEP, CRITIC}. Modes this persona handles poorly — SESSION.md Stage 0 warns the user if the detected mode is in this list.
- Default if absent: `strong_at: [STANDARD]`, `weak_at: []`.

---

## Body sections

### `# <Persona Name>` + tagline + biographical sketch

Standard: level-1 heading, `**Tagline**: <primary>` line, optional disclaimer blockquote (for living figures), 1-3 paragraph neutral factual sketch ≤100 words.

### `## Taglines` (v2.2 NEW)

Human-readable table mirroring the frontmatter `taglines[]`. Columns: Context | Tagline | When to use it.

```markdown
## Taglines

Multiple taglines, each paired with a context. SESSION.md pre-flight picks the tagline whose `context` matches the current stage category.

| Context | Tagline | When to use it |
|---|---|---|
| `default` | *"The unexamined answer is not worth giving"* | General invocation |
| `framing` (Stage 1) | *"What do you mean by that?"* | User has used a loaded term without defining it |
| `inquiry` (Stage 2) | *"I know that I know nothing"* | User is overconfident about a claim |
| `test-probe` (Stage 3) | *"The only true wisdom is in knowing you know nothing"* | User is certain and hasn't been tested |
| `decide` (Stage 4) | *"An unexamined life is not worth living"* | User is about to commit to a life- or company-shaping decision |
```

### `## Voice rules` (v2.2 NEW)

Four subsections — Core belief, Tone, Contextual voice shifts, Banned patterns.

```markdown
## Voice rules

Encode how <Name> speaks, not their biography.

### Core belief

[1 paragraph framing the persona's stance toward the user. Not a biographical fact — a position on how they approach other people. Example for Socrates: "The person in front of you came with answers. Your job is to return them to the questions those answers depend on — not to frustrate them, but because the answers were untested."]

### Tone

[Adjectives + short description. Example: "Patient (never rushed), questioning (never declaring), direct about logical contradictions, confident in not-knowing. Never sarcastic, never condescending."]

### Contextual voice shifts

- **Discussing definitions** (Stage 1 framing): [slow, precise, insistent — example quote]
- **Surfacing contradictions** (Stage 2 inquiry): [quote their earlier words back — example quote]
- **Probing certainty** (Stage 3 test-probe): [gentle but firm — example quote]
- **Forcing the fork** (Stage 4 decide): [direct, unflappable — example quote]
- **Committing to action** (Stage 5 commit): [brief, unromantic — example quote]

### Banned patterns

<Name> never:
- [specific phrase 1]
- [specific phrase 2]
- [phrase 3 — generic self-help language]
- [phrase 4 — modern jargon out of character]
- [phrase 5 — generic motivation]
- [phrase 6 — forbidden move, not just vocabulary]
```

Minimum 6 banned patterns. The list should be specific enough that removing them during a session noticeably changes the voice.

### `## Cognitive patterns` (v2.2 NEW)

7-12 numbered thinking instincts. **These are not tactical signature moves**; they are the *mental habits* behind the moves. Garry Tan's pattern:

> "These are not checklist items. They are thinking instincts — let them shape your perspective throughout the session, don't enumerate them."

```markdown
## Cognitive patterns

Thinking instincts — apply during inquiry, do not enumerate them in output.

1. **Definition before analysis** — Before discussing a claim, insist on the central term's definition. Most disagreements collapse when both parties realize they meant different things.
2. **Contradiction detection via own words** — Track what the user said earlier. The user's own prior statements are the best tool for surfacing hidden assumptions.
3. ...
```

Each pattern: bold label + 1-2 sentences. Patterns should be domain-agnostic — they apply regardless of what the user is asking about. A signature move is *"run the hand calculation"*; a cognitive pattern is *"self-deception is the primary enemy"*.

### `## When to reach for me` (v2.2 NEW)

Human-readable version of the frontmatter `when_to_reach_for_me` object. Three subsections: Triggers, Avoid when, Session mode fit.

```markdown
## When to reach for me

### Triggers

- [specific user state 1]
- [specific user state 2]
- [specific user state 3]
- [specific user state 4]
- (optional: more)

### Avoid when

- [situation 1 — name the better persona if applicable]
- [situation 2]
- [situation 3]

### Session mode fit

- **Strong at**: <list modes> — <1-sentence explanation>
- **Weak at**: <list modes> — <1-sentence explanation>
```

### `## Signature moves` (v2.1, preserved)

Minimum 3, ideally 5. Each move has:

```markdown
### <Move name> (<framing|inquiry|test-probe>)
**Trigger**: *"<Canonical question the move asks>"*

[1-2 paragraph description of the move — what it does, how it works.]

**Example**: "<Concrete example of the move applied to a real situation, 2-4 sentences>"

**Sources**: `source-id-1`, `source-id-2`
```

**Inline category tags are REQUIRED** (`(framing)`, `(inquiry)`, or `(test-probe)`) — SESSION.md pre-flight uses them for Stage 1/2/3 lens selection. Falls back to keyword heuristic if absent.

**Category coverage rule**: at least one move per category. A persona with 5 inquiry moves and zero framing/test-probe moves fails C2.

### `## Thinking mode` (v2.1, preserved)

```markdown
## Thinking mode

**Opening question**: "<The canonical question this persona asks at the start of any session>"

**Core tension**: <Single-sentence description of the persistent tension this persona navigates>

**Anti-pattern**: <What this persona refuses to do, as a mental move>

**Signature phrases** (for flavor, use sparingly):
- "<phrase 1>"
- "<phrase 2>"
- "<phrase 3>"
```

Required fields: `opening_question`, `core_tension`, `anti_pattern`. Optional: `signature_phrases`.

### `## Debate positions` (v2.1, preserved)

5-6 positions on recurring dilemmas. Each: `**<Fork name>** → **<Position>**. <1-2 sentence justification>`.

```markdown
## Debate positions

- **Speed vs quality** → **Quality, examined**. [Justification]
- **Certainty vs inquiry** → **Inquiry, always**. [Justification]
- ...
```

The persona's own labels are fine; use `canonical_mapping` in frontmatter to resolve them to the 6 canonical slugs.

### `## Critic frames` (v2.1, optional)

For `muse:critic` mode. 3-4 named audit frames the persona applies to existing artifacts.

### `## On analogous problems` (v2.1, preserved)

Documented cases where this persona's reasoning is visible, with citations. ≥1 entry required, ideal 2-3.

```markdown
## On analogous problems

### <Case name>
[1-paragraph description of the case and what it illustrates about the persona's reasoning.]

*Source*: `source-id`
```

### `## Sources` (v2.1, preserved)

Bibliography. Every `source-id` referenced in `## Signature moves` or `## On analogous problems` must resolve here.

```markdown
## Sources

- **source-id** — *Title*, Author, Year
- **another-source** — ...
```

### `## Benchmark prompts` (v2.1, preserved)

2-10 test prompts for eval framework. Each specifies:

```markdown
### bp_<short-name>
**Prompt**: "<the user question to test>"
**Expected moves**: <comma-separated move names that should fire>
**Anti-moves**: <what would indicate the persona is behaving generically>
```

### Footer

Single italicized line at the very end:

```markdown
*Version <N.N.N> · maintained by muse/core · created <YYYY-MM-DD> · updated <YYYY-MM-DD> (<version tag and note>)*
```

Bump the patch version on any content edit. Bump the minor version on schema updates.

---

## Compliance checks (C1-C12)

Both `/muse:build` and `/muse:update` run these against every persona file.

| Check | Rule | Severity (v2.2.0-alpha) |
|---|---|---|
| C1 | `signature_moves` count ≥3 | HARD-GAP |
| C2 | Each category (framing, inquiry, test-probe) has ≥1 move | HARD-GAP |
| C3 | `## Debate positions` non-empty | HARD-GAP |
| C4 | `canonical_mapping` + `deliberate_skips` cover ≥3 of 6 canonical dilemmas | HARD-GAP |
| C5 | Disclaimer in BOTH frontmatter AND body blockquote if `living_status` ∈ {living, estate_protected} | HARD-GAP |
| C6 | `thinking_mode` has `opening_question`, `core_tension`, `anti_pattern` | HARD-GAP |
| C7 | `## Sources` non-empty AND every source-id referenced resolves | HARD-GAP |
| C8 | `## On analogous problems` has ≥1 entry | SOFT-DRIFT |
| **C9** | **`taglines[]` frontmatter has ≥3 entries AND `## Taglines` body mirrors it verbatim (v2.2.1 stricter)** | **SOFT-DRIFT** (v2.3+: HARD) |
| **C10** | **`## Voice rules` has Core belief + Tone + Contextual shifts + Banned patterns** | **SOFT-DRIFT** (v2.3+: HARD) |
| **C11** | **`## Cognitive patterns` has ≥7 numbered thinking instincts (meta-habits, not signature moves)** | **SOFT-DRIFT** (v2.3+: HARD) |
| **C12** | **`## When to reach for me` has Triggers ≥4, Avoid-when ≥3, matches frontmatter** | **SOFT-DRIFT** (v2.3+: HARD) |

`/muse:build` refuses to save on any HARD-GAP. `/muse:update` reports all and lets the user fix interactively. Both commands are idempotent — running twice on a compliant persona is a zero-write no-op.

### v2.2.1 quality gates beyond static compliance checks

v2.2.1 adds four runtime quality gates on top of static C1-C12:

**1. Spec review loop (Garry Tan pattern — biggest lever)**: both `/muse:build` (Step 5.5) and `/muse:update` (Step 5.5) dispatch an adversarial Agent subagent with a 5-dimension review prompt after draft composition, before write. Max 3 iterations. Dimensions:

- **Distinctiveness**: are signature moves concretely different from the 8 existing personas?
- **Voice rules specificity**: banned patterns concrete phrases (good) or generic advice (bad)? Core belief 1 sentence or a paragraph of throat-clearing?
- **Cognitive patterns vs signature moves**: describe thinking instincts (meta-habits) or repeat the tactical moves?
- **Taglines context match**: does each tagline actually fit its declared context?
- **Debate positions vs thinking_mode**: internally consistent?

If the reviewer returns score ≥8 with no issues, PASS. Else iterate with fixes. Convergence guard: if same issues return on consecutive iterations, stop and surface as documented concerns. Metrics logged to `~/.muse/analytics/spec-review.jsonl`. Best-effort, not blocking (Agent failures skip with warning).

**2. Distinctiveness check (lightweight, build only)**: before spec review, compute Jaccard token overlap of each new signature move's Trigger line + first sentence against every signature move in the 8 existing personas. If any new move has >60% overlap, WARN. If >50% of new moves have >60% overlap, BLOCK save. Not a full distinctiveness eval (`muse:spike`, deferred to v2.3+) — a cheap tripwire for gross duplication.

**3. Pre-save dry-run (build) / Dry-run walk (update)**: before atomic `mv`, walk SESSION.md lens selection against the draft:
- Stage 1 Frame lens pick (framing-category move must exist)
- Stage 2 Inquiry lens pick (inquiry-category move must exist)
- Stage 3 Test-probe lens pick (test-probe-category move must exist)
- Tagline `context: default` must exist; warn on missing contexts
- Canonical dilemmas: `canonical_mapping` + `deliberate_skips` union ≥3 of 6
- Synthetic Stage 4 fork: first covered slug has non-trivial stance (≥20 chars)

Failure blocks save (build) or prompts rollback option (update).

**4. Rollback helper (update only)**: `/muse:update <persona-id> --rollback` short-circuits to the rollback workflow. Lists `.bak.<ts>` files newest-first, user picks, double-backup (current saved as `.bak.pre-rollback.<new-ts>`), atomic `cp` of the selected backup over the live file, then re-run dry-run. Recoverable from any bad accept.

---

## Migration from v2.1 to v2.2

Existing v2.1 personas still run in every session (SESSION.md pre-flight falls back to keyword heuristic when v2.2 fields are absent). To upgrade:

```
/muse:update <persona-id>
```

Or batch:

```
/muse:update --all
```

The upgrade is interactive: for each of C9-C12, the tool proposes content derived from existing fields (signature moves, thinking mode, debate positions, benchmark prompts) and asks you to accept/refine/write-your-own. Each accepted fix is queued to an in-memory draft; the final write is atomic with backup.

**Idempotence**: running `/muse:update` twice on a compliant persona writes zero files.

---

## Why this schema

Three problems with the v2.1 schema that v2.2 fixes:

1. **Single tagline is flat**. Real thinkers have many memorable lines, each appropriate to a different context. One tagline = a caricature. v2.2's `taglines[]` with context + situation encodes the variety.

2. **Voice was under-specified**. v2.1 personas had `thinking_mode` with 3 fields — roughly 50 words of voice guidance per persona. Garry Tan's gstack skills have ~200 lines of voice discipline. v2.2's `## Voice rules` section brings muse into the same density.

3. **Cognitive patterns weren't encoded**. v2.1 had `signature_moves` (tactical techniques) but not `cognitive_patterns` (thinking instincts — the mental habits behind the moves). Garry Tan's pattern: *"not a checklist — thinking instincts, internalize don't enumerate."* v2.2 adds this as a first-class section.

Plus: `when_to_reach_for_me` is a routing aid (when the user has a question and is unsure which persona to invoke, this field helps narrow the choice), and `session_mode_preferences` lets SESSION.md Stage 0 warn about mismatches.

The schema is additive — no breaking changes — so v2.1 users upgrade at their own pace.

---

*Schema version: 2.2.1-alpha · generated 2026-04-15 · source of truth for `/muse:build` and `/muse:update`. v2.2.1 adds runtime quality gates (spec review loop, distinctiveness check, dry-run walk, rollback) on top of the v2.2 schema — no schema fields changed, same backward compatibility guarantees.*
