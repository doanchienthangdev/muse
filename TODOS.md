# Muse TODOs

Work deferred from planning reviews. Each entry explains the why, not just the what.

---

## P1 — Pipeline fix prerequisites

### [BACKFILL-1] Regression test harness for `/muse:build` pipeline rewrite

**What:** Lightweight script that re-runs the new subfolder-map-reduce pipeline against the 11 existing persona source folders in `.archives/personas/` and diffs the resulting signature-move names against the current `personas/<id>.md`. Flags if new pipeline drops or renames moves that shipped.

**Why:** Approach C rewrites Step 2 of `commands/muse:build.md`. Without a regression test, semantic drift in the new pipeline could silently degrade quality on re-runs. Blind spot: subagent fanout might find *more* or *different* patterns than single-pass; we need to know which before promoting the new skill to default.

**Pros:**
- Catches semantic drift before contributors hit it
- Reusable for any future Step 2 refactor
- Costs ~30 min CC to build once

**Cons:**
- Doesn't test downstream behavior (session quality), only extraction stability

**Context:** 11 personas already shipped. Source folders in `.archives/personas/<id>/{articles,books,transcripts,notes}/`. The test output is a diff table: `persona → moves_dropped[], moves_added[], moves_renamed[]`. Manual review of the diff gates merge.

**Effort:** S (human ~2 hr / CC ~30 min)
**Priority:** P1
**Depends on:** Approach C pipeline rewrite landing first.

---

### [PIPELINE-DOC-1] EPUB handling convention in CONTRIBUTING.md

**What:** One-paragraph addition to `docs/CONTRIBUTING.md` documenting: "EPUB files are not read natively by `/muse:build`. Convert to `.txt` with `ebook-convert input.epub output.txt` (part of Calibre) before placing in a persona folder. Rationale: zero-dependency architecture — we don't ship EPUB parsers. Native PDF support (via Claude's Read tool) covers 25 of 26 book files across current `.archives/personas/`."

**Why:** Contributors will hit the EPUB gap. Documenting the convention avoids silent skips. Avoids adding EPUB parsing to the skill, which would violate the zero-deps architecture rule.

**Pros:**
- 5-minute fix
- Preserves architecture purity
- Contributors get a clear path forward

**Cons:**
- Manual step for users with EPUB sources
- If `ebook-convert` isn't installed, user has a second dep to chase

**Context:** 1 EPUB file exists in `.archives/personas/` today (`libgen.li.epub`). Not load-bearing.

**Effort:** S (human ~5 min / CC ~2 min)
**Priority:** P2
**Depends on:** None.

---

## P2 — Ecosystem research

### [NUWA-INTEROP-1] Spike: measure schema gap between muse v2.2 and nuwa-skill output

**What:** 1-hour research spike. Clone `alchaincyf/nuwa-skill` and 2-3 of its generated persona skills (e.g., steve-jobs-skill, paul-graham-skill). Compare their output schema against muse's v2.2 `PERSONA_SCHEMA.md`. Produce a mapping table: `nuwa_field → muse_field (direct / derived / unmappable)`. Decide: is a `/muse:import-nuwa` command cheap (<2 hr) or expensive (>1 day)?

**Why:** Nuwa ecosystem has 50+ distilled personas already (via `xixu-me/awesome-persona-distill-skills`). If import is cheap, muse's starter pack could grow from 11 → 60+ overnight, massively amplifying the "runtime, not characters" positioning. If expensive, skip the interop question and keep building the native way.

**Pros:**
- Decision-grade data instead of speculation
- Unlocks ecosystem leverage if the gap is small
- Cheap to run once — just research, no code

**Cons:**
- Outcome might be "schemas too different, skip it" — that's fine, spike still had value

**Context:** Flagged during `/plan-ceo-review` on 2026-04-19. Nuwa's output: 3-7 mental models + 5-10 decision heuristics + expression DNA + values + limitations, in a single SKILL.md. Muse's v2.2: taglines[], voice rules, cognitive patterns, when-to-reach, signature moves (3 categories), debate positions (6 canonical), thinking mode, on analogous problems, sources. Structural overlap exists but field shapes differ.

**Effort:** M (human ~3 hr / CC ~1 hr)
**Priority:** P2
**Depends on:** None, but most valuable after the Approach C pipeline ships.

---

*Generated 2026-04-19 from `/plan-ceo-review` on the `/muse:build` coverage problem.*

---

## P2 — Persona-quality overhaul deferred items (2026-04-21 review)

From `/plan-ceo-review` "Persona Quality Overhaul" — Approach C tiered 3-phase plan committed. These 10 items deferred to post-Phase-3 opportunistic work. Full CEO plan at `~/.gstack/projects/muse/ceo-plans/2026-04-21-persona-quality-overhaul.md`.

### [QOVER-1] Disclaimer entity completeness check
**What:** C5 currently verifies disclaimer exists in frontmatter + body. Extend to verify disclaimer text mentions the persona's affiliated entities (persona's company, estate, associated orgs). Silent pass today if an entity is missing. **Effort:** S (CC ~15 min). **Priority:** P2.

### [QOVER-2] `/muse:explore <id>` corpus-preview skill
**What:** Before building, show bucket breakdown, file counts, format breakdown, estimated pipeline duration, missing suggested buckets. Currently build is blind-flight — user must inspect folder manually. **Effort:** M (CC ~30 min). **Priority:** P2.

### [QOVER-3] Multi-persona batch build
**What:** `/muse:build --batch=a,b,c` runs interactive build for 3 personas back-to-back with shared context. Currently 3 separate skill invocations. **Effort:** M (CC ~30 min). **Priority:** P2.

### [QOVER-4] `/muse:update --all --snapshot` before bulk changes
**What:** When running update on all personas, snapshot the set to `personas-snapshot-{date}/` before applying any fixes so rollback is straightforward. **Effort:** S (CC ~15 min). **Priority:** P2.

### [QOVER-5] Fingerprint-based "which personas need update" detector
**What:** After Phase 3 ships corpus fingerprints, add `/muse:update --stale` that reports which personas have corpus-mtime newer than last-mined-at and warrant re-mine. **Effort:** S (CC ~15 min). **Priority:** P2. **Depends on:** Phase 3 fingerprint work.

### [QOVER-6] Session-quality feedback loop
**What:** Users run sessions with personas. No signal back to persona quality. Add: session file captures a post-session rating (1-5) from the user. Aggregate across sessions. Flag personas with consistent low ratings for rebuild. **Effort:** L (CC ~1 hr). **Priority:** P2. Own future CEO plan.

### [QOVER-7] Specialized adversarial reviewers
**What:** Current spec review dispatches `general-purpose` Agent. Quality is context-dependent. Could use multiple reviewers with different specializations (voice-discipline reviewer, distinctiveness reviewer, citation-honesty reviewer) + consensus synthesis. **Effort:** M (CC ~45 min). **Priority:** P2.

### [QOVER-8] EPUB native support (bundle converter)
**What:** 1 EPUB in archive today, documented workaround is `ebook-convert` (Calibre). Hidden dependency. Could bundle a tiny Python/bash converter in `tools/`. **Effort:** M (CC ~30 min). **Priority:** P2.

### [QOVER-9] Per-era / per-bucket weighting in merge
**What:** Stage 3 merge unions findings equally across buckets. Could weight by bucket file count / bucket corpus size. A pattern appearing in 5 article posts + 1 book chapter is stronger than 1 article + 1 book. **Effort:** M (CC ~30 min). **Priority:** P2. Note: semantic-similarity (Phase 2 #10) is a bigger lever.

### [QOVER-10] Mid-build interactive redirect
**What:** If pipeline returns 48 candidates and user wants only moves relating to "shipping discipline," no way to filter mid-run. Add a pre-brainstorm filter-by-keyword step. **Effort:** M (CC ~30 min). **Priority:** P2. Low-demand edge case.

*All 10 above deferred from `/plan-ceo-review` 2026-04-21. Phases 1-3 (20 accepted items) have their own release cadence per CEO plan.*
