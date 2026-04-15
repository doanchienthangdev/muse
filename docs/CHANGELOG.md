# Changelog

All notable changes to Muse will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

Nothing yet.

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
