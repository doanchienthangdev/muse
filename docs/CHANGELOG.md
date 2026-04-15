# Changelog

All notable changes to Muse will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

Nothing yet.

---

## [2.0.0-alpha] — 2026-04-15 — Radical agentic refactor

### Eureka
v1 shipped Muse as a bash CLI framework that plugged into Claude Code. The user pointed out (correctly) that this required installing yq, jq, bats-core, shellcheck, and check-jsonschema before anything worked. An **agentic skill should not ship a shell tool chain**. The agent IS the runtime.

v2 is the correction: pure content + one SKILL.md dispatcher. Zero dependencies. Works on Claude Code / Codex CLI / Gemini CLI.

### Removed (v1 → v2)
- **20 shell files**: `bin/muse`, `bin/muse-lib.sh`, `bin/muse-install`, `bin/muse-update`, `bin/muse-doctor`, `bin/muse-list`, `bin/muse-eval`, `bin/muse-eval-harness`, `bin/muse-spike-prepare`, `bin/muse-spike-score`
- **4 bats test files**: `tests/muse-lib.bats`, `tests/persona-schema.bats`, `tests/spike-scripts.bats`, `tests/test_helper.bash`
- **2 CI workflows**: `.github/workflows/ci.yaml`, `.github/workflows/release.yaml` (shellcheck matrix, bats test runner)
- **2 skill files merged into unified**: `skills/muse-build/SKILL.md`, `skills/muse-critic/SKILL.md` (now handled by `skills/muse/SKILL.md` internally)
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
- `skills/muse/SKILL.md` — unified dispatcher (700 lines) handling ALL muse:* commands internally: single persona, all, chain, debate, critic, build, spike, list
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
