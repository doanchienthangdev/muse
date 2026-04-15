# Changelog

All notable changes to Muse will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

Nothing yet.

---

## [2.2.0-alpha] — 2026-04-15 — Adaptive sessions + multi-tagline + voice rules + cognitive patterns

### Why

User feedback on v2.1.0-beta: the persona system felt flat, and the session workflow felt rigid. Three specific pain points:

1. **Single tagline per persona**. Real thinkers have many memorable lines, each appropriate to a different context. Feynman's *"Explain it simply"* is great as a default, but his *"The first principle is you must not fool yourself"* is better when inquiry is the move, and *"If it doesn't agree with experiment, it's wrong"* is better when probing a claim. Encoding one tagline per persona = a caricature.

2. **Persona descriptions were under-specified**. v2.1 personas had `thinking_mode` with 3 fields (opening_question, core_tension, anti_pattern) — roughly 50 words of voice guidance per persona. Compared to Garry Tan's gstack skills (plan-ceo-review, plan-eng-review, etc.) which encode 200+ lines of voice discipline per persona, muse was a tenth the density. The voice wasn't flat — it was unencoded.

3. **5-stage workflow was rigid**. Every question went through Frame → Examine → Test → Decide → Commit regardless of shape. A quick gut-check on *"which font should I pick"* got the same 10-15 min ceremony as a bet-the-company decision. A request to critique an existing plan didn't need Frame or Examine at all.

v2.2.0-alpha addresses all three, by borrowing patterns from Garry Tan's gstack skill encoding: multi-tagline with context, explicit voice rules (core belief + tone + banned patterns + contextual shifts), cognitive patterns as thinking instincts (not tactical moves), and adaptive session modes (QUICK / STANDARD / DEEP / CRITIC) selected at Stage 0 based on question shape.

### Added

- **`SESSION.md` Stage 0 — Mode Detection**. At the start of every session, score the user's question on 4 axes: S (stake), T (time pressure), C (concreteness), A (artifact presence). Pick one of four modes: QUICK (3-5 min, A=0 and T≥4 and S≤3), STANDARD (10-15 min, default — the v2.1 5-stage flow unchanged), DEEP (20-30 min, S≥4 and T≤3, adds Stage 0.5 Premise Challenge + Stage 3.5 Alternative Paths + 3-year retrospective at Stage 5), CRITIC (5-10 min, A≥3, replaces Frame/Examine with Load-Artifact and Prioritize-Findings). AskUserQuestion confirms or overrides the detected mode. Each mode runs a different stage graph.

- **`SESSION.md` Stage 0.5 — Premise Challenge (DEEP only)**. Before accepting the user's question at face value, steel-man the current framing and propose 2-3 alternative framings. AskUserQuestion lets the user pick. Modeled on Garry Tan's `plan-ceo-review` Section 0A.

- **`SESSION.md` Stage 3.5 — Alternative Paths (DEEP only)**. Before committing to a decision, surface at least 2 paths the user hasn't considered (10x version, ruthless-cut version, do-nothing version). Each characterized with cost/win/lose.

- **`SESSION.md` Stages 1' and 3' — CRITIC mode specialized stages**. Stage 1' loads an existing artifact and applies the persona's critic frames to produce a structured findings inventory. Stage 3' prioritizes findings by severity + leverage + fix cost.

- **`SESSION.md` Quality bars section**. Persona distinctiveness bar, mode fit bar, voice discipline bar, concreteness bar, citation bar. Mirrors Garry Tan's Completeness Principle pattern.

- **Persona schema v2.2 (additive, backward-compatible)**:
  - `taglines[]` frontmatter — array of `{text, context, situation, source}` with contexts `default / framing / inquiry / test-probe / decide / commit`. SESSION.md picks the tagline matching the current stage.
  - `when_to_reach_for_me` frontmatter — object with `triggers[]` and `avoid_when[]` lists for persona routing.
  - `session_mode_preferences` frontmatter — `strong_at[]` and `weak_at[]` subsets of {QUICK, STANDARD, DEEP, CRITIC}. Stage 0 warns if detected mode is in `weak_at`.
  - `## Taglines` body section — human-readable table mirroring frontmatter `taglines[]`.
  - `## Voice rules` body section — Core belief (1 paragraph), Tone (adjectives + short description), Contextual voice shifts (5 situational examples), Banned patterns (6-8 phrases this persona NEVER uses).
  - `## Cognitive patterns` body section — 7-12 numbered thinking instincts. Garry's framing: "not checklist items — thinking instincts, internalize don't enumerate."
  - `## When to reach for me` body section — Triggers + Avoid-when + Session mode fit explanation.

- **`docs/PERSONA_SCHEMA.md`** — NEW canonical schema reference (~600 lines). Full v2.2 schema with required and optional fields, compliance checks C1-C12, migration notes, rationale. Single source of truth for persona file format.

### Changed

- **All 8 personas rewritten to v2.2 schema**. Each grew from ~150 lines to ~280-340 lines. New sections added: `## Taglines`, `## Voice rules`, `## Cognitive patterns`, `## When to reach for me`. Frontmatter gained `taglines[]` (3-5 entries per persona), `when_to_reach_for_me`, `session_mode_preferences`. Version footers bumped to 1.2.0. No existing signature move content was rewritten — all v2.2 additions are metadata enrichment.

- **`SKILL.md` Mode: build and Mode: update rewritten for C9-C12**. The compliance validation now runs C1-C12. C9 (multi-tagline), C10 (voice rules), C11 (cognitive patterns), C12 (when-to-reach) are SOFT-DRIFT in v2.2.0-alpha — they do not block save, but they are reported so the user sees the gap. v2.3+ will promote them to HARD-GAP.

- **`SKILL.md` single-persona mode tip** updated to reference v2.2 adaptive modes instead of v2.1 5-stage structure.

- **All 10 slash commands updated for v2.2**. Description fields bumped to mention adaptive modes (QUICK/STANDARD/DEEP/CRITIC), multi-tagline, voice rules, cognitive patterns. Step 2 (Load persona) extraction list now includes the new v2.2 fields. Step 3 header changed from "Run the 5-stage session" to "Run the adaptive session (v2.2)" with instructions to run Stage 0 Mode Detection first.

- **`SESSION.md` pre-flight** (from v2.1.0-beta) was already teaching the runtime to prefer inline category tags over keyword heuristic for Stage 1/2/3 routing. v2.2 extends pre-flight to also extract: `taglines[]`, `## Voice rules`, `## Cognitive patterns`, `when_to_reach_for_me`, `session_mode_preferences`, and apply them as output constraints throughout the session.

- **`SKILL.md` version footer** bumped to 2.2.0-alpha.

### Backward compatibility

**Additive schema only.** Existing v2.1 personas without `taglines[]`, `## Voice rules`, `## Cognitive patterns`, or `## When to reach for me` still load and run — SESSION.md v2.2 pre-flight falls back to v2.1 behavior (primary `tagline` field only, `thinking_mode` as the voice source, no cognitive-pattern extraction). Every v2.1 invocation that worked before still works identically. `/muse:feynman <q>` → STANDARD mode by default, which IS the v2.1 5-stage flow.

v2.0 free-text invocations (`muse:feynman <q>`, `muse:chain`, `muse:build`, `muse:update`, etc., no slash) unchanged. The v2.2 schema extension flows through `muse:build` (new personas get v2.2 fields) and `muse:update` (existing personas get migrated on demand). For Codex CLI and Gemini CLI users without slash support, SKILL.md Mode: build and Mode: update both teach the v2.2 fields.

### Migration

```bash
cd ~/.claude/skills/muse
git pull
./install.sh
```

To upgrade existing personas to v2.2 schema (applies to user-built personas only — the 8 shipped personas were upgraded in this release):

```
/muse:update --all
```

Interactive walk through C9-C12 gaps per persona. Idempotent on v2.2-compliant files.

### Not in scope (deferred to v2.3+)

- Promote C9-C12 from SOFT-DRIFT to HARD-GAP (v2.3 — requires a stabilization period on v2.2.0-alpha)
- `/muse:chain`, `/muse:debate`, `/muse:critic`, `/muse:all`, `/muse:spike`, `/muse:list` as slash commands (still deferred from v2.1.0-beta — these need custom workflows)
- Persona marketplace / plugin system
- Cross-persona session blending (one session using multiple personas sequentially — adjacent to but distinct from `muse:chain`)
- Auto-learning from session history + escape-hatch analytics
- Running `muse:spike` distinctiveness eval on the v2.2 persona set (requires ANTHROPIC_API_KEY + human judges)

### Known gaps / risks

- **R1 — SOFT-DRIFT warnings are advisory, not enforced**. Contributors may build personas that pass v2.1 checks but fail C9-C12 and still save. v2.2.0-alpha is intentionally lenient to allow calibration; v2.3 will enforce.
- **R2 — `canonical_mapping` interpretive decisions**. Different contributors may disagree on the best mapping (e.g., Confucius's "top-down vs bottom-up" → `authority_vs_reason` is one reading; others are possible). The escape hatch is `deliberate_skips`.
- **R3 — Mode detection is heuristic**. The S/T/C/A scoring is based on keyword/phrase signals and may misclassify. User override via AskUserQuestion at Stage 0 is the safety net. Log the override rate for future tuning.
- **R4 — Voice rules risk being too restrictive**. If a persona's banned-patterns list is too aggressive, ordinary session output may trip it. Each persona is limited to 6-8 banned patterns; the core belief is the primary voice signal, not the ban list.
- **R5 — Cognitive patterns risk feeling like a checklist**. SESSION.md explicitly instructs the runtime to "internalize, don't enumerate." If persona outputs start to read like "here are my 9 cognitive patterns numbered...", the instruction is being violated — the fix is in SESSION.md, not per-persona.
- **R6 — Persona file length**. Each file grew to ~280-340 lines. Still under Garry's gstack skill files (1000+ lines). Acceptable.

### Total diff

- **New files**: `docs/PERSONA_SCHEMA.md` (~600 lines)
- **Modified files**: `SESSION.md` (near-total rewrite, ~485 → ~730 lines), `SKILL.md` (Mode: build C1→C12, Mode: update C1→C12, ~90 lines of additions), 8 personas (each +130-190 lines = ~1200 net), 10 slash commands (~15 lines each = ~150 net), `docs/CHANGELOG.md` (this entry, ~100 lines)
- **Total**: ~2400 net LoC added. Mostly data + spec.

---

## [2.1.0-beta] — 2026-04-15 — v2.1 tooling + compliance sweep

### Why

v2.1.0-alpha shipped the session runtime but left the **authoring tools** (`muse:build`), the **fallback Mode sections in SKILL.md**, and the **8 persona files themselves** still shaped for v2.0. Sessions worked, but silently degraded: when `SESSION.md`'s Stage 3 ran a persona whose signature moves didn't include a clearly-measurable test/probe, the lens selection fell back to `opening_question`. When Stage 4 ran a persona whose `debate_positions` used non-canonical labels, the fuzzy keyword match was a coin flip. And `SKILL.md Mode: debate` directly contradicted `SESSION.md` line 455 fallback (reject vs skip-Stage-4). This release makes the v2.1 contract explicit and fixes all drifted content.

### Added

- **`commands/muse:build.md`** — NEW Claude Code slash command. Interactive persona builder that groups research candidates by SESSION.md stage category (framing / inquiry / test-probe), walks the 6 canonical debate dilemmas one at a time, and validates the output against C1-C8 compliance checks before save. A persona that would silently degrade in a structured session cannot be saved.

- **`commands/muse:update.md`** — NEW Claude Code slash command. Detects v2.1 compliance gaps in existing personas (C1-C8), proposes fixes interactively via per-gap `AskUserQuestion`, writes with backup + draft + diff + confirm. Supports `--check` (dry-run) and `--all` (batch matrix scan → per-persona walk). Idempotent: running twice on a compliant persona is a zero-write no-op.

- **`SKILL.md Mode: update`** — NEW free-text equivalent of `/muse:update` for Codex CLI / Gemini CLI users without slash command support. Same C1-C8 detection + interactive fix + validation.

- **Persona schema (additive, backward-compatible)**:
  - Frontmatter field `canonical_mapping` — maps the persona's own debate-position labels (e.g. Socrates's "certainty vs inquiry") to SESSION.md's 6 canonical dilemma slugs (`speed_vs_quality`, `consensus_vs_conviction`, `authority_vs_reason`, `direct_vs_indirect`, `action_vs_patience`, `tradition_vs_innovation`). Lossless — persona keeps its own voice in the body, the mapping gives `SESSION.md` Stage 4 lens selection a fast path.
  - Frontmatter field `deliberate_skips` — list of canonical slugs the persona intentionally has no documented view on (e.g. Lao Tzu on `speed_vs_quality` — his domain is force/flow, not speed). Prevents `/muse:update` from re-flagging the same gap on idempotent re-run.
  - Inline category tags `(framing)`, `(inquiry)`, `(test-probe)` on each `signature_move` heading. `SESSION.md` pre-flight prefers these tags for Stage 1/2/3 lens selection and falls back to keyword heuristic if absent.

### Changed

- **`SKILL.md Mode: build`** (lines 302-368 in v2.1.0-alpha) rewritten to enforce v2.1 compliance: minimum 3 signature moves covering all 3 stage categories; walk the 6 canonical debate dilemmas one at a time; mandatory disclaimer template for living/estate_protected figures; validation step (C1-C8) before save; redirect to `/muse:update` when the persona already exists instead of blind rewrite.

- **`SKILL.md Mode: debate`** (lines 190-196) aligned with `SESSION.md` Stage 4 fallback. Previously said "reject the debate if persona lacks `debate_positions`, suggest `muse:chain` instead." Now says "proceed with degraded debate: that persona has less to push back on in Round 2, and Round 3 synthesis notes the asymmetry." Matches `SESSION.md` line 455 semantics.

- **`SKILL.md Mode: single persona`** relabeled as "v2.0 FALLBACK — Free-text conversational path" with a clear "prefer slash for depth, free-text for speed" cross-reference. No behavior change.

- **`SKILL.md Mode: spike`** relabeled as "v2.2+ — NOT shipped in v2.1" with an inline deferred note. The section content is preserved as v2.2+ implementation reference.

- **`SESSION.md` pre-flight** (lines 49-57) updated to teach Stage 1/2/3 lens selection to prefer inline category tags over the keyword heuristic, and to resolve `canonical_mapping` for Stage 4 debate lookup. Keyword fallback preserved for untagged personas (backward-compatible).

- **All 8 personas** backfilled with `canonical_mapping` frontmatter, `deliberate_skips` list, and inline category tags on every signature move heading. No move content was rewritten; the changes are additive metadata only. Each persona's patch version bumped to `1.1.0` with a `last_updated` marker.

- **`personas/socrates.md`** gained two new debate positions — **Speed vs quality** ("Quality, examined — the rush to decide is often the thing to resist") and **Direct vs indirect** ("Direct, but through questions, not statements"). Previously Socrates had only 4/6 canonical coverage; now 5/6, with `tradition_vs_innovation` as a documented deliberate skip.

- **`personas/marcus-aurelius.md`** and **`personas/dieter-rams.md`** each gained one additional `## On analogous problems` entry (Marcus on the Marcomanni campaigns 166-180 CE; Rams on the Vitsoe 606 shelving system, 1960) to thicken Stage 5 citation grounding.

- **`docs/CONTRIBUTING.md`** disclaimer section expanded. Now explains that `SESSION.md` pre-flight auto-prints the disclaimer at the top of every session, and includes the mandatory template wording for living and estate_protected figures.

- **`docs/GETTING_STARTED.md`** first-session hierarchy reversed. Quick gut-check (v2.0 free-text, 2-3 min, ephemeral) is now described first and labeled as the "quick path." Deep session (v2.1 slash, 10-15 min, saves a file) is second and labeled as the "deep path." A two-path comparison table lets users pick by purpose instead of by accident.

- **`docs/ARCHITECTURE.md`** clarified on dispatcher entry points. `SKILL.md` is the v2.0 free-text dispatcher; `commands/muse:*.md` are the v2.1 slash command entry points that load `SESSION.md` directly and bypass SKILL.md routing. New contributors get the mental model in "Start here" section updated.

- **`README.md`** Commands table updated: `muse:update --person=<id>` and `muse:update --all [--check]` rows added; `muse:spike` marked as v2.2+ not yet shipped; `muse:build` description tightened to "v2.1-compliant persona builder"; Vietnamese leakage "tranh luận" replaced with "surface tensions across 3 rounds".

### Backward compatibility

**Additive schema only.** Existing personas without `canonical_mapping`, `deliberate_skips`, or inline category tags still load and run — `SESSION.md` pre-flight falls back to the keyword heuristic. v2.0 free-text invocations (`muse:<persona>`, `muse:chain`, `muse:build`, etc.) are unchanged except for the new `Mode: update` and updated guidance inside `Mode: build` (`Mode: debate` fallback behavior changed but is strictly less-rejective, so no invocation that worked before fails now).

### Not in scope (deferred to v2.2)

- `/muse:chain`, `/muse:debate`, `/muse:critic`, `/muse:all`, `/muse:spike`, `/muse:list` as slash commands (still deferred — need custom workflows that don't fit the 5-stage shape)
- Session resume / search / prune helpers (still deferred — `grep`, `cat`, `ls -lt` work today)
- Full test suite for `install.sh` (manual smoke test per CHANGELOG is sufficient for a 128-line shell script)
- Automatic `muse:spike` distinctiveness eval run on the v2.1.0-beta persona set (requires ANTHROPIC_API_KEY + judges; out of scope for a code release)

### Migration

Existing v2.1.0-alpha installs:

```bash
cd ~/.claude/skills/muse
git pull
./install.sh
```

Idempotent. `install.sh` skips the clone (already installed), refreshes slash commands in `~/.claude/commands/` (picks up the new `muse:build.md` and `muse:update.md` automatically — the wildcard loop was already generic), and re-ensures `~/.muse/sessions/` exists. Restart Claude Code for the new slash commands to appear.

Fresh installs:

```bash
curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh
```

### Known gaps / risks

- **R1** — If a user runs `/muse:update --all` on a persona whose research archive is gone, C7 (sources) and C8 (analogous problems) gaps cannot be auto-filled. The tool explicitly does NOT fabricate citations; it marks these as skipped with a warning. The persona still runs sessions correctly; only citations are thinner.
- **R2** — The keyword heuristic fallback for Stage 1/2/3 category classification in `SESSION.md` pre-flight is intentionally imperfect. The authoritative fix is to tag moves explicitly (which v2.1.0-beta does for all 8 shipped personas). Contributed personas without tags will still work but may pick sub-optimal lenses.
- **R3** — `canonical_mapping` decisions are somewhat interpretive (e.g. Confucius's "top-down vs bottom-up" → `authority_vs_reason`). Different contributors might disagree on the best mapping. The escape hatch is `deliberate_skips`: if the persona genuinely has no view on a canonical dilemma, record it there rather than forcing an uncomfortable mapping.
- **R4** — `muse:spike` still unexecuted. v2.1.0-beta's category tags and canonical mappings make the data layer more self-documenting but do not measure distinctiveness. Inherited debt from v2.1.0-alpha and v2.0.

### Total diff

- **New files**: `commands/muse:build.md` (~145 lines) + `commands/muse:update.md` (~230 lines) = ~375 lines
- **Modified files**: `SKILL.md` (+110 net, Mode: build rewrite + new Mode: update + relabels), `SESSION.md` (+10 net, pre-flight update), 8 personas (+15 avg each = +120 net, frontmatter additions + inline tags + Socrates positions + Marcus/Rams analogous cases), 4 docs (~+70 net)
- **Total**: ~685 net LoC added. Mostly data + spec, not code. No shell scripts written.

---

## [2.1.0-alpha] — 2026-04-16 — Structured sessions + slash commands

### Why

User feedback on v2.0.0-alpha: the single-persona mode was too shallow. Free-form 150-250 word replies with up to 6 rounds of Q&A felt like a lighter version of ChatGPT, not like working with a deliberate thinking tool. Users also expected `/muse:feynman` to work as a slash command the way `/workflow:refactor` and `/design:fast` do, and got "Unknown command" instead.

v2.1 ships the discipline (structured 5-stage sessions) and the packaging (slash commands), without changing any v2.0 behavior.

### Added

- **`SESSION.md`** at repo root — the load-bearing workflow specification for structured sessions. ~400 lines. Defines 5 fixed stages (Frame → Examine → Test → Decide → Commit), STOP point formats (AskUserQuestion A/B/C/D for stages 1/3/4/5, free-text follow-up for stage 2), option distinctiveness rules, escape-hatch semantics, persistence template, voice discipline, language matching, fallback behavior. Self-contained enough that an agent can execute a session reading only SESSION.md + one persona file.

- **`commands/muse:*.md`** — 8 slash command launcher files, one per persona: `muse:feynman`, `muse:socrates`, `muse:seneca`, `muse:marcus-aurelius`, `muse:aristotle`, `muse:confucius`, `muse:lao-tzu`, `muse:dieter-rams`. Each is ~30 lines. YAML frontmatter with `description` / `allowed-tools` / `argument-hint`. Body delegates to SESSION.md, hardcodes the persona file path. The Dieter Rams file includes the interpretive disclaimer (living figure).

- **`docs/SESSIONS.md`** — user-facing walkthrough: what a structured session is, how to start one, what to expect at each stage, where files are saved, how to find/read/grep/share sessions.

- **`~/.muse/sessions/`** — new per-user state directory, created by `install.sh`. All structured sessions persist here as `<YYYY-MM-DD-HHMMSS>-<persona>-<slug>.md` files. Private by default (not in repo, not gitignored because it's not in the repo), cross-project (the directory doesn't care which CWD the session started in — CWD is captured in frontmatter for later filtering).

### Changed

- **`install.sh`** — extended (~25 LoC delta) to (1) add `COMMANDS_DIR` and `SESSIONS_DIR` variables, (2) make existing-install detection idempotent (skip clone but still refresh commands + session dir), (3) copy `commands/muse:*.md` files into `~/.claude/commands/` using a loop (safe with colons in filenames, handles zero-match case), (4) `mkdir -p ~/.muse/sessions`, (5) updated welcome message showing both v2.1 slash invocations and v2.0 free-text fallback.

- **`SKILL.md`** — one 3-line pointer added at the top of `Mode: single persona` section directing users to `/muse:<persona>` slash commands for deep sessions. Version footer bumped from 2.0.0 to 2.1.0-alpha.

- **`README.md`** — hero code block now showcases slash commands first. New `Structured sessions (v2.1)` section added between the existing `Commands` table and the persona list, with the 5-stage table, slash command list, and a pointer to `docs/SESSIONS.md`.

- **`docs/GETTING_STARTED.md`** — new section added after Install walking users through their first structured session with `/muse:feynman`.

- **`docs/ARCHITECTURE.md`** — system diagram updated to show SESSION.md as a sibling of SKILL.md, with a paragraph explaining the slash command launcher pattern.

- **`adapters/codex/README.md`** and **`adapters/gemini/README.md`** — one-line note added: v2.1's slash commands are Claude Code specific. Free-text `muse:feynman` invocation continues to work in Codex/Gemini via the v2.0 SKILL.md fallback, unchanged.

### Backward compatibility

**Supplement, not replace.** v2.0 free-text invocation (`muse:feynman <q>`, no slash) still routes through `SKILL.md` Mode: single persona with the original behavior: 150-250 word reply, up to 6 rounds, ephemeral (no file saved). The new slash commands are additive — users who want a quick gut-check use free-text, users who want a deep session with an artifact use slash.

v2.0 multi-persona modes (`muse:all`, `muse:chain`, `muse:debate`, `muse:critic`, `muse:build`, `muse:spike`, `muse:list`) are unchanged. v2.1 does NOT ship slash commands for these — they don't fit the 5-stage shape and need their own workflows. Deferred to v2.2.

### Not in scope (deferred)

- `/muse:debate`, `/muse:chain`, `/muse:critic` as slash commands → v2.2 (need custom workflows)
- `/muse:all`, `/muse:build`, `/muse:spike`, `/muse:list` as slash commands → v2.2+ (lower priority)
- Session resume / search / prune helper commands → defer; `Read <path>`, `grep`, and `ls -lt` work today
- Session sharing tooling (gist upload, clipboard copy) → defer; sessions are markdown, `cat` works
- Auto-discovery adapters for Codex CLI and Gemini CLI → still on the v2.2+ roadmap, unchanged

### Known gaps / risks

- **R1 — slash command discovery**: Claude Code may require a session restart to pick up newly-installed `~/.claude/commands/muse:*.md` files. `install.sh` prints a clear restart reminder. Observation from v2.0 shipping showed skills being picked up mid-session, so rescan may work, but not verified for commands specifically.
- **R2 — option distinctiveness bar**: the whole point of Muse is cognitive distinctiveness. If the 5-stage AskUserQuestion options at Stages 1/3/4 feel generic across personas, the workflow undermines the product. SESSION.md explicitly instructs the agent to make options distinctively persona-flavored and includes a self-check. If users report "the options all feel the same," fix the persona data, not the workflow.
- **R3 — rigidity**: the 5-stage structure may feel scripted for some question types. Stage 4 ships with a mandatory `D) escape hatch` that lets the user reject the framing. Session frontmatter tracks `escape_hatches_used` so the design can be tuned after real usage data.
- **R4 — distinctiveness eval still unexecuted**: v2.0's spike phase (3-persona blind Turing test) was planned but never run. v2.1 inherits that debt. The v2.1 workflow improves the session surface but cannot make up for persona data that isn't cognitively distinct.

### Migration

- Existing v2.0 installs: run `install.sh` again (idempotent). It will skip the clone (muse is already at `~/.claude/skills/muse/`), run `git pull` is YOUR responsibility separately, copy the new commands into `~/.claude/commands/`, create `~/.muse/sessions/`. Restart Claude Code for slash commands to appear.
- Fresh installs: single `curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh` handles everything.

### Total diff

- **New files**: SESSION.md (~400 lines) + 8 commands (~240 lines) + docs/SESSIONS.md (~150 lines) = ~790 lines
- **Modified files**: install.sh (+65 net), SKILL.md (+3), README.md (+60), CHANGELOG.md (this entry ~80), ARCHITECTURE.md (+30), GETTING_STARTED.md (+50), 2 adapter READMEs (+10)
- **Total**: ~1,100 net LoC added. v2.0 was a 6,000-line removal; v2.1 is a controlled feature add.

---

## [2.0.0-alpha] — 2026-04-15 — Radical agentic refactor

### Eureka
v1 shipped Muse as a bash CLI framework that plugged into Claude Code. The user pointed out (correctly) that this required installing yq, jq, bats-core, shellcheck, and check-jsonschema before anything worked. An **agentic skill should not ship a shell tool chain**. The agent IS the runtime.

v2 is the correction: pure content + one SKILL.md dispatcher. Zero dependencies. Works on Claude Code / Codex CLI / Gemini CLI.

### Removed (v1 → v2)
- **20 shell files**: `bin/muse`, `bin/muse-lib.sh`, `bin/muse-install`, `bin/muse-update`, `bin/muse-doctor`, `bin/muse-list`, `bin/muse-eval`, `bin/muse-eval-harness`, `bin/muse-spike-prepare`, `bin/muse-spike-score`
- **4 bats test files**: `tests/muse-lib.bats`, `tests/persona-schema.bats`, `tests/spike-scripts.bats`, `tests/test_helper.bash`
- **2 CI workflows**: `.github/workflows/ci.yaml`, `.github/workflows/release.yaml` (shellcheck matrix, bats test runner)
- **2 skill files merged into unified**: `skills/muse-build/SKILL.md`, `skills/muse-critic/SKILL.md` (now handled by `SKILL.md` internally)
- **Deprecated schema**: `personas/schema.json` (markdown is self-documenting)
- **Deprecated docs**: `docs/PERSONA_SCHEMA.md` (no YAML schema to document)
- **Heavy installer**: `install.sh` (225 lines → 15 lines optional wrapper)
- **Dependencies**: yq, jq, bats-core, shellcheck, check-jsonschema — all removed

Total removed: ~6,000 lines of scaffolding.

### Converted (YAML → Markdown)
- 8 persona files: `personas/*.yaml` → `personas/*.md`
- 3 chain files: `chains/*.yaml` → `chains/*.md`
- 2 benchmark files: `eval/benchmarks/*.yaml` → `benchmarks/*.md`

Why markdown: agents parse it natively, humans read it easily, no schema tool needed, git diffs are cleaner.

### Rewritten
- `SKILL.md` — unified dispatcher (700 lines) handling ALL muse:* commands internally: single persona, all, chain, debate, critic, build, spike, list
- `README.md` — agent-first install story, agentic architecture explanation
- `docs/ARCHITECTURE.md` — v2 agentic model documented end-to-end
- `docs/GETTING_STARTED.md` — "git clone, done"
- `docs/PERSONAS.md` — updated for markdown format
- `docs/CONTRIBUTING.md` — markdown-based contribution flow

### Added
- `adapters/claude-code/README.md` — Claude Code install notes
- `adapters/codex/README.md` — Codex CLI invocation pattern (v2.0: manual, v2.1: auto-discovery)
- `adapters/gemini/README.md` — Gemini CLI invocation pattern (v2.0: manual, v2.1: auto-discovery)
- `install.sh` (new minimal version, ~15 lines) — thin git clone wrapper

### Security
Same as v1:
- Path inputs validated (reject `..`, symlink escape)
- Persona content sanitized (strip `[INST]`, `[SYSTEM]`, etc.)
- Agent refuses to run as root
- v2 ships `core + local` trust tier only
- v2.2+ adds GPG signing

### Install (v2)

```
git clone https://github.com/doanchienthangdev/muse ~/.claude/skills/muse
```

Done. 5 seconds. No deps.

### Known gaps
- Phase 0 spike has not been operator-executed yet (requires 5 human judges — operator task)
- Codex CLI and Gemini CLI adapters are currently manual-invocation (v2.1 will add proper auto-discovery)
- muse.dev domain not set up yet (using github.com direct URLs)

### Deferred to v3
- `muse:scan` web research automation
- Community persona marketplace
- Journal / memory across sessions
- `muse:mirror` user's own thinking style as persona
- Persona versioning + rollback

---

## [0.1.0-alpha] — 2026-04-15 — v1 initial (deprecated)

Initial v1 shipped with 47 files, 8,385 lines, including:
- `bin/` directory with 10 bash CLI tools
- `tests/` directory with 4 bats test files
- `.github/workflows/` with CI and release pipelines
- `personas/schema.json` for JSON Schema validation
- 8 persona YAML files
- 3 chain YAML files
- 2 benchmark YAML files
- Full gstack-inspired architecture

**Problem**: Required 5 external dependencies. User feedback: "a Claude Code skill shouldn't need a shell tool chain". Correct.

**Resolution**: v2.0.0-alpha radical refactor (same day). See above.

v1 is archived at `docs/archive/CEO-PLAN-v1.md` and `docs/archive/TODOS-v1.md` for historical reference.
