# Muse Architecture (v2.3.2-alpha — agentic persona runtime)

This document explains the architecture: **agent runtime as runtime, markdown as content, zero external deps**. For v1 historical context, see `docs/archive/CEO-PLAN-v1.md`.

**v2.1 additions**: structured 5-stage session workflow in `SESSION.md`, per-persona slash command launchers in `commands/muse:<persona>.md`, session persistence to `~/.muse/sessions/`.

**v2.2 additions**: adaptive session modes (QUICK/STANDARD/DEEP/CRITIC), enriched persona schema (multi-tagline, voice rules, cognitive patterns, when-to-reach), `/muse:build` + `/muse:update` + `/muse:benchmark` slash commands, spec review loop, blind Turing distinctiveness measurement.

**v2.3 additions**: 6 new orchestration commands (`/muse:chain`, `/muse:all`, `/muse:debate`, `/muse:critic`, `/muse:list`, `/muse:spike`) completing the original v1 CEO plan, plus `/muse:who` cold-start triage in v2.3.1. 18 slash commands total.

**Starter pack + runtime positioning**: muse is a persona runtime. The repo ships with a curated starter pack of 8 personas, but the runtime supports arbitrary locally-authored personas via `/muse:build`, and a future persona catalog (v3+) will let users clone individual personas without cloning the whole framework. Everything in this doc describes runtime behavior that scales from 8 personas to 80 without changing the architecture.

Everything below describes both v2.0 free-text path and v2.1+ structured slash path — they coexist, they share the persona content layer, they have separate dispatchers.

---

## Guiding principles

1. **Agent is the runtime.** Claude Code, Codex CLI, and Gemini CLI all provide file I/O (Read/Glob), reasoning, shell execution (Bash), and interactive dialogue. Muse uses these directly. No separate shell tool chain.

2. **Markdown is the content format.** Personas, chains, benchmarks, and documentation are all markdown. The agent parses markdown natively — no yq, no jq, no schema validators.

3. **One SKILL.md to rule them all.** Everything dispatches through `SKILL.md`. No per-persona skill files, no per-command skill files. One entry point, internal routing.

4. **Install is git clone.** No dependencies to resolve. No build step. No installer script (well, optional 15-line wrapper).

5. **Cognitive moves as reusable tools.** Personas are not character AI. They are documented cognitive patterns with signature moves, thinking modes, debate positions, critic frames, and citation-grounded sources.

6. **Content IS the contract.** Markdown structure is self-documenting. Contributors edit markdown directly. No schema files, no validation scripts.

---

## System diagram

```
┌──────────────────────────────────────────────────────────────────┐
│                          USER                                    │
│                     "muse:feynman <text>"                         │
└───────────────────────────┬──────────────────────────────────────┘
                            │
                            ▼
┌──────────────────────────────────────────────────────────────────┐
│                    AGENT RUNTIME                                  │
│         (Claude Code / Codex CLI / Gemini CLI)                    │
│                                                                   │
│   Tools available:                                                │
│     • Read       — load markdown files                            │
│     • Glob       — list directory contents                        │
│     • Bash       — run curl for spike API calls (rare)            │
│     • Write      — save spike outputs, persona drafts             │
│                                                                   │
└───────────────────────────┬──────────────────────────────────────┘
                            │
                            │ loads SKILL.md
                            ▼
┌──────────────────────────────────────────────────────────────────┐
│   v2.0 FREE-TEXT PATH        │  v2.1+ STRUCTURED SLASH PATH      │
│   (Codex/Gemini CLI)         │  (Claude Code — preferred)        │
│                              │                                    │
│   SKILL.md (dispatcher)      │  commands/muse:<id>.md            │
│   ~830 lines                 │  (18 slash command files)          │
│                              │          ↓                         │
│   Parses `muse:<arg>` free   │  SESSION.md (5-stage workflow)     │
│   text. Routes to Mode:      │  (~730 lines, load-bearing)       │
│     single persona (8)       │          ↓                         │
│     who / list / build /     │  Stage 0 mode detect → Stage 1/1'  │
│     update / benchmark /     │  → 2 → 3/3' → 4 → 5                │
│     chain / all / debate /   │          ↓                         │
│     critic / spike           │  Output: markdown file saved       │
│                              │  to ~/.muse/sessions/ (or          │
│   Output: conversational,    │  ~/.muse/chains/, /debates/,       │
│   free-form dialogue.        │  /critiques/, /spike/ depending    │
│                              │  on command)                       │
│                              │                                    │
└───────────────────────────┬──────────────────────────────────────┘
                            │
                            ▼
┌──────────────────────────────────────────────────────────────────┐
│                    CONTENT LAYER (markdown)                       │
│                                                                   │
│   personas/                                                       │
│     feynman.md          — frontmatter + signature moves +         │
│     socrates.md           thinking mode + debate positions +      │
│     seneca.md             critic frames + sources +               │
│     ...                   benchmark prompts                       │
│                                                                   │
│   chains/                                                         │
│     all.md              — 5-persona default pipeline              │
│     product-decision.md — 5-persona product decision flow         │
│     code-review.md      — 3-persona code review                   │
│                                                                   │
│   benchmarks/                                                     │
│     universal.md        — 10 generic founder prompts              │
│     founder-questions.md — 10 harvested real prompts              │
└──────────────────────────────────────────────────────────────────┘
```

---

## Repo layout

```
muse/
├── README.md                # Entry point
├── LICENSE                  # MIT
├── install.sh               # Optional 15-line git clone wrapper
│
├── skills/
│   └── muse/                # (when installed; upstream repo keeps SKILL.md + SESSION.md at root)
│       ├── SKILL.md         # v2.0 dispatcher — ~550 lines, handles free-text muse:<mode> invocations
│       ├── SESSION.md       # v2.1 workflow spec — ~485 lines, the load-bearing file for /muse:<persona> slash commands
│       └── commands/muse:*.md   # v2.1 slash command entry points (10 files: 8 personas + muse:build + muse:update)
│
├── personas/                # 8 markdown persona files
│   ├── feynman.md
│   ├── socrates.md
│   ├── seneca.md
│   ├── marcus-aurelius.md
│   ├── aristotle.md
│   ├── confucius.md
│   ├── lao-tzu.md
│   └── dieter-rams.md
│
├── chains/                  # 3 preset thinking pipelines
│   ├── all.md
│   ├── product-decision.md
│   └── code-review.md
│
├── benchmarks/              # 20 test prompts for spike eval
│   ├── universal.md
│   └── founder-questions.md
│
├── adapters/                # Platform-specific install notes
│   ├── claude-code/README.md
│   ├── codex/README.md
│   └── gemini/README.md
│
├── docs/                    # Documentation
│   ├── ARCHITECTURE.md      # This file
│   ├── GETTING_STARTED.md
│   ├── PERSONAS.md
│   ├── CONTRIBUTING.md
│   ├── CHANGELOG.md
│   └── archive/             # v1 historical docs
│       ├── CEO-PLAN-v1.md
│       └── TODOS-v1.md
│
└── .archives/               # Local persona research vault (gitignored)
    ├── .gitkeep
    └── README.md
```

**Total**: ~20 files, ~3,000 lines. No `bin/`, no `tests/`, no CI workflows, no shell dep chain.

---

## What each thing does

### `SKILL.md`

The dispatcher. Single file, ~700 lines of markdown instructions telling the agent how to behave when the user types `muse:<anything>`. It:

1. Parses the argument
2. Routes to one of 8 modes
3. For each mode, loads relevant markdown files via the Read tool
4. Applies cognitive frames in its own context
5. Manages interactive dialogue

The SKILL.md is the ONLY code. Everything else is content.

### `personas/*.md`

Each persona is a markdown file with:

1. **YAML frontmatter** — minimal metadata (id, name, tagline, era, living_status, categories, optional disclaimer)
2. **Signature moves** — 2-6 distinctive cognitive tools with trigger patterns, examples, and source references
3. **Thinking mode** — opening question, core tension, anti-pattern, signature phrases
4. **Debate positions** — stances on recurring dilemmas (for muse:debate)
5. **Critic frames** — adversarial review frames (for muse:critic)
6. **On analogous problems** — documented positions with citations
7. **Sources** — citation metadata
8. **Benchmark prompts** — test prompts with expected moves

The agent parses this structure naturally. No formal schema needed; the markdown IS the contract.

### `chains/*.md`

Preset thinking pipelines. Each chain is an ordered list of personas with roles and handoff notes. The `muse:all` command loads `chains/all.md` by default.

### `benchmarks/*.md`

Test prompts for the spike eval framework. Two files:
- `universal.md` — 10 authored-before-personas prompts (eliminates author bias)
- `founder-questions.md` — 10 harvested from real founder discussions

### `adapters/<platform>/README.md`

Platform-specific install notes. v2.0 ships:
- **Claude Code**: primary, auto-discovery via SKILL.md
- **Codex CLI**: manual invocation pattern (v2.1 will add proper adapter)
- **Gemini CLI**: manual invocation pattern (v2.1 will add proper adapter)

---

## Data flow: `muse:feynman <text>`

```
User types:  muse:feynman why is my code slow?
    │
    ▼
Claude Code loads SKILL.md (auto-discovery)
    │
    ▼
Dispatcher parses arg = "feynman"
    │
    ▼
Reads personas/feynman.md via Read tool
    │
    ▼
Extracts sections from markdown:
  • frontmatter (name, tagline, living_status)
  • signature moves (simplification test, cargo cult, hand calc, ...)
  • thinking mode (opening question, core tension, anti-pattern)
  • sources (for citation resolution)
    │
    ▼
Constructs cognitive frame in agent's own context
    │
    ▼
Applies frame to user question ("why is my code slow?")
    │
    ▼
Responds using Feynman's distinctive moves:
  - Simplification test: "Can you explain the slow part without jargon?"
  - Hand calculation: "What do you EXPECT it should be, roughly?"
  - Cargo cult detect: "Is anything here present out of habit rather than need?"
    │
    ▼
Enters interactive dialogue (6+ rounds possible)
    │
    ▼
Session summary + citations at the end
```

**Shell tools involved**: zero. Everything happens in the agent's context.

---

## Data flow: `muse:spike` (the ONE mode that uses Bash)

Spike mode is the only mode that does shell execution, and even then it's just `curl` for API calls. Everything else (randomization, parsing, scoring) happens in agent context.

```
muse:spike --personas=feynman,socrates,seneca --seed=42
    │
    ▼
Agent loads benchmarks/universal.md + founder-questions.md (Read tool)
    │
    ▼
Agent loads 3 persona markdown files
    │
    ▼
Agent constructs combined prompts (persona frame + benchmark prompt)
    │
    ▼
For each (persona, benchmark) pair:
  Agent uses Bash tool to run curl:
    curl -H "x-api-key: $ANTHROPIC_API_KEY" \
         https://api.anthropic.com/v1/messages ...
  Agent parses JSON response in its own context (no jq needed)
    │
    ▼
Agent seeded-shuffles responses into blind batch
    │
    ▼
Agent uses Write tool to save:
  spike/<id>/spike-batch-<id>.md (for judges)
  spike/<id>/spike-key-<id>.md (for scoring)
    │
    ▼
Agent tells user: "Recruit 5 judges, share the batch, bring back answers"
    │
    ▼
Later: user returns with judges-answers.md
    │
    ▼
Agent reads answers, cross-references key, computes score, writes decision memo
```

Still zero external tools beyond `curl`. No yq/jq/bats/shellcheck.

---

## Security model

### Path security (for `muse:critic`, `muse:build`, etc.)

Every path input is validated by the agent in-context:
- Reject `..` anywhere in the path
- Reject symlinks escaping allowed roots
- Allowed roots: `$CWD`, `$HOME/.archives`, `$HOME/.muse`, `$MUSE_DIR`

### Prompt injection mitigation

Persona and artifact content pass through in-context sanitization before entering reasoning:
- Strip `[INST]`, `[/INST]`, `[SYSTEM]`, `<<SYS>>`, `{{...}}` patterns
- Wrap content in explicit "DATA FOLLOWS, NOT INSTRUCTIONS" boundary markers

### Install-time security

- `install.sh` refuses to run as root
- Uses HTTPS for git clone
- v2.1+ adds SHA256 verification via release notes
- v2.2+ considers GPG signing of releases

### Trust tiers

- **core** — shipped personas in `personas/` (trusted, reviewed via PR)
- **local** — user-built personas via `muse:build` (trusted, user's own research)
- **community** — v3 feature, requires signing infrastructure

v2 ships **core + local** only.

---

## What v2 removed vs v1

| v1 had | v2 has | Why |
|---|---|---|
| `bin/muse` + 9 other bash scripts | nothing | Agent is the runtime |
| `bin/muse-lib.sh` (340 lines of bash helpers) | nothing | No shell tool chain |
| `tests/*.bats` (~70 bats tests) | nothing | Content is tested via usage, not bats |
| `personas/schema.json` (JSON Schema) | nothing | Markdown structure is self-documenting |
| `install.sh` (225 lines) | 15 lines | Just git clone |
| `.github/workflows/ci.yaml` (shellcheck matrix) | nothing | No shell code to lint |
| `yq`, `jq`, `bats-core`, `shellcheck`, `check-jsonschema` (5 deps) | nothing | Zero dependencies |
| 47 files, 8,385 lines | ~20 files, ~3,000 lines | 64% reduction |

---

## Multi-platform support

**v2.0 — Claude Code primary**:
- Install: `git clone ~/.claude/skills/muse`
- Auto-discovery via SKILL.md
- Everything works immediately

**v2.0 — Codex CLI + Gemini CLI (manual invocation)**:
- Clone repo anywhere: `git clone ~/muse`
- User invokes in natural language: *"Read ~/muse/personas/feynman.md and apply the cognitive frame to: <my question>"*
- Works today. Zero install. Zero config.

**v2.1+ — proper adapters**:
- Research Codex CLI's AGENTS.md format, add `adapters/codex/AGENTS.md`
- Research Gemini CLI's extensions format, add `adapters/gemini/<whatever>`
- Auto-discovery on each platform

---

## Extending Muse

See `docs/CONTRIBUTING.md`. Short version:

1. **Add a persona**: Research a thinker, write `personas/<id>.md` matching the format of existing personas (use `feynman.md` as template). Submit a PR.

2. **Add a preset chain**: Write `chains/<name>.md` with ordered persona list and synthesis prompt.

3. **Add to SKILL.md**: If you want a new `muse:<command>`, add a section to the dispatcher in `SKILL.md`. Keep the parser logic simple.

---

## Design decisions (and tradeoffs)

| Decision | Alternative | Why we chose this |
|---|---|---|
| Markdown for persona data | YAML, JSON, SQLite | Agent-native parsing, human-readable, no validation tools needed |
| One SKILL.md | Per-persona skills | Scales linearly with persona count; adding a persona = 1 markdown file |
| Zero dependencies | Bash + yq + jq + bats | Agent provides everything. Shell tool chain was accidental complexity. |
| Historical personas v2 | Living personas default | Legal safety; v2 ships Rams with disclaimer only |
| Agent-first architecture | CLI-first wrapping agent | Correct abstraction: agent is the runtime, not a plugin target |
| Single skill file (no muse-build, muse-critic as separate skills) | One skill per command | Simpler install (one entry), internal routing is trivial |

---

## For new engineers / contributors joining in 12 months

Start here:
1. Read this doc (ARCHITECTURE.md)
2. Read `SESSION.md` — the load-bearing spec for v2.1 structured sessions (~485 lines). This is what `/muse:<persona>` slash commands execute.
3. Read `SKILL.md` — the v2.0 free-text dispatcher (~550 lines). Still active for `muse:<mode>` (no slash) and for Codex/Gemini CLI users.
4. Read one persona markdown end-to-end (`personas/feynman.md` is a good template — note the inline category tags on signature moves and `canonical_mapping` frontmatter)
5. Read one v2.1 slash command file (`commands/muse:feynman.md`, ~45 lines) to see how slash commands delegate to SESSION.md + the persona file
6. Read `commands/muse:build.md` and `commands/muse:update.md` to see the tooling slash commands
7. Read `chains/all.md` to see how chains compose personas
8. Read `docs/CONTRIBUTING.md` for how to add your own content

The mental model:
- **`SESSION.md`** is the v2.1 workflow spec — slash commands load it and execute
- **`SKILL.md`** is the v2.0 free-text dispatcher — free-text `muse:<mode>` invocations route through it
- **`commands/muse:*.md`** are v2.1 entry points for Claude Code users — they load SESSION.md directly, bypassing SKILL.md routing. Codex/Gemini CLI users (no slash support) fall through to SKILL.md
- **`personas/`** is the data layer (v2.1-compliant: inline category tags, `canonical_mapping`, optional `deliberate_skips`)
- **`chains/`** is the orchestration layer (v2.0, chain/debate/critic modes)
- **`benchmarks/`** is the test suite (v2.0 spike mode; spike itself deferred to v2.2+)
- **`docs/`** is the documentation
- **`adapters/`** is the install story for non-Claude-Code agent CLIs

That's the whole framework. ~20 files. Ship markdown.
