# Muse

> *"What I cannot create, I do not understand."* — Richard Feynman

When I read that line on Feynman's blackboard, I realized that's exactly what AI chatbots can't do. They can imitate Feynman's writing style. They can't run his thinking on my problem.

I'm a builder. I spend hours thinking through decisions where a distinctive thinker would have shown me the answer in five minutes, if I could just *borrow their cognitive move* — Feynman's simplification test, Socrates's definition hunting, Rams's ten principles, Lao Tzu's value of emptiness. Not their personality. Not a motivational poster of their face. The **specific mental action** they took when they saw a problem like mine.

**Muse is my answer.** Eight historical thinkers, each encoded not as a character to chat with but as a reusable cognitive tool you can point at your actual problem. Runs natively inside Claude Code, Codex CLI, and Gemini CLI. Zero dependencies. Ship markdown, and the agent handles the rest.

```
/muse:feynman why is my code slow?
  → QUICK mode detected (3-5 min). Stage 1 Frame: Feynman asks you to
    explain the bottleneck without jargon. If you can't, the jargon is
    covering for confusion. Then one hand-calculation probe. Then commit.

/muse:socrates what do I actually mean by "community"?
  → STANDARD mode (10-15 min). Stage 1: Define "community" clearly
    enough that I couldn't twist its meaning. Stage 2: What assumption
    are you making about why people join communities? Stage 3-5 follow.

/muse:dieter-rams review src/landing.tsx
  → CRITIC mode detected (5-10 min). Stage 1': loads the file, runs
    ten principles audit, produces a findings inventory sorted by
    severity. Stage 3': you pick what to fix first. Stage 4-5 commit.

/muse:marcus-aurelius should I bet the company on this pivot?
  → DEEP mode (20-30 min). Adds Stage 0.5 Premise Challenge
    (is this the right question?) and Stage 3.5 Alternative Paths
    (10x version, ruthless cut, do-nothing). Stage 5 includes a
    3-year retrospective test.
```

Each session saves a markdown file to `~/.muse/sessions/` that you can re-read, grep, share, or resume weeks later.

---

## What gets shipped

**Version 2.3.0-alpha**. ~5,000 lines of content, zero lines of shell tooling. Breakdown:

- **8 personas** — Feynman, Socrates, Seneca, Marcus Aurelius, Aristotle, Confucius, Lao Tzu, Dieter Rams. Each ~300 lines of structured markdown: multi-tagline, voice rules (core belief + banned patterns), 7-12 cognitive patterns, signature moves with inline category tags, debate positions on canonical dilemmas, documented analogous problems with citations.
- **`SESSION.md`** (~730 lines) — the load-bearing workflow spec. Defines 4 adaptive session modes (QUICK, STANDARD, DEEP, CRITIC), mode detection heuristic, stage graphs per mode, tagline selection, voice rules extraction, quality bars.
- **`SKILL.md`** (~770 lines) — the dispatcher for free-text invocations. Routes `muse:<anything>` to the right mode (single, chain, debate, critic, build, update, benchmark, spike, list).
- **17 slash commands** (`commands/muse:*.md`) — Claude Code entry points. Breakdown:
  - **8 persona commands** — `/muse:feynman`, `/muse:socrates`, `/muse:seneca`, `/muse:marcus-aurelius`, `/muse:aristotle`, `/muse:confucius`, `/muse:lao-tzu`, `/muse:dieter-rams`
  - **9 meta commands** — `/muse:build`, `/muse:update`, `/muse:benchmark`, `/muse:chain`, `/muse:all`, `/muse:debate`, `/muse:critic`, `/muse:list`, `/muse:spike`
- **`docs/PERSONA_SCHEMA.md`** (~600 lines) — canonical schema reference for anyone building new personas.
- **`docs/BENCHMARKS.md`** (~350 lines) — methodology explainer for `/muse:benchmark` (4 categories, 11 measures, 7 run modes, baseline management).
- **`docs/`** — architecture, contributing, getting started, sessions walkthrough, changelog.

**v2.3.0 completes the original v1 CEO plan** — all 7 meta commands (`muse:all`, `muse:chain`, `muse:debate`, `muse:critic`, `muse:build`, `muse:spike`, `muse:list`) ship as slash commands, joined by `muse:update` (v2.1) and `muse:benchmark` (v2.2) for a full 17-command surface. Benchmark grade A (24/24 blind Turing) as of v2.2.3-alpha, measurement-backed distinctiveness, zero regressions since baseline.

Zero dependencies. Zero shell scripts. Zero build step. The agent is the runtime.

---

## Who this is for

**Builders who think for a living**. You ship code, ship product, make calls every day about scope, priorities, architecture, copy, hiring. You already use LLMs — but the LLM is generic, and your decisions are specific. Muse gives you *named mental moves* you can apply to your own problem, not an imitation of a celebrity's vocabulary.

**Founders running into the limits of their own framing**. You're too close to the problem. You need someone who would have framed it differently. Muse lets you rent Socrates for ten minutes to ask *"what do you actually mean by growth?"* and walk away with a concrete next action.

**Anyone using Claude Code / Codex CLI / Gemini CLI who wants depth over breadth**. You don't need another productivity plugin. You need a way to slow down on the one decision that matters and think through it with a specific lens. Muse is that.

**Who this is not for**: if you want an AI that pretends to be Feynman for roleplay, use character.ai. If you want a prompt library, there are a dozen. Muse is neither. It's cognitive tools encoded as agentic skills.

---

## Install — 30 seconds

```bash
curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh
```

That's it. No dependencies. No build. No package manager. The installer clones the repo to `~/.claude/skills/muse/`, copies all 17 slash commands to `~/.claude/commands/`, and creates `~/.muse/sessions/` for your session artifacts. Restart Claude Code once and start typing `/muse:feynman`.

If you prefer git clone:

```bash
git clone https://github.com/doanchienthangdev/muse ~/.claude/skills/muse
cd ~/.claude/skills/muse
./install.sh
```

For Codex CLI or Gemini CLI users (no slash command support), Muse invokes via free-text: `muse:feynman <question>`. See `adapters/codex/README.md` and `adapters/gemini/README.md`.

---

## See it work

Here's a real session. `/muse:feynman why is my database query slow?`

```
Detected QUICK mode (3-5 min) because the question is a specific
tactical issue and implies time pressure. Run QUICK or switch?

A) Run QUICK (Recommended)
B) Force STANDARD (10-15 min, v2.1 5-stage flow)
C) Switch to DEEP — this might be architectural
D) None of these — let me describe

You: A

───

Stage 1 — Frame (Feynman)

Tagline: "Explain it simply, or you don't know it"

Forget "the query is slow." Tell me what the query is actually doing
in plain words — no ORM names, no table jargon, no "JOIN on
foreign key" phrases. What does it RETRIEVE?

Three framings:
A) You don't know what it retrieves, only what it returns. That's
   where understanding broke.
B) You know what it retrieves but not which step is slow. You need
   the number, not the vibe.
C) You know the step but not why the database is choosing that plan.
   You need the "why" underneath the "what".

You: B — I know it retrieves orders for a user but I don't know
     which step is slow.

───

Stage 5 — Commit

Recap: You know the query's purpose. You don't know the bottleneck.
The next right action is a hand-calculation reality check: run
EXPLAIN ANALYZE on the production query with a real user's data.
That will produce a number for each step. If any step takes >10x
what you'd predict from scratch (rows × 1µs for an index hit,
rows × 5µs for a seq scan), that's the cargo-cult step. Fix it.

Next action: Run `EXPLAIN ANALYZE <query>` on prod with a real user.
Compare each step's actual time to your back-of-envelope prediction.
Report back the biggest gap.

Accept and save the session?

A) Accept — write the session file and close (Recommended)
B) Refine the action first

You: A

Session saved: ~/.muse/sessions/2026-04-15-153012-feynman-why-my-db-query-slow.md
```

3 minutes. One hand-calculation probe. A saved artifact with the action, the reasoning, the cited Feynman source. This is the smallest possible muse session. A DEEP session runs 20 minutes and saves 300 lines.

---

## The 4 adaptive session modes

Muse v2.2 sessions detect the shape of your question and pick the right workflow. Stage 0 of every session scores your question on 4 axes and routes to one of four modes. You can always override.

| Mode | Duration | Stages | When to pick |
|---|---|---|---|
| **QUICK** | 3-5 min | Stage 1 (brief Frame) → Stage 5 (Commit) | T≥4 and S≤3 — fast gut-check, low stakes, time pressure |
| **STANDARD** (default) | 10-15 min | Stage 1 → 2 → 3 → 4 → 5 | Balanced depth — the v2.1 5-stage flow, unchanged |
| **DEEP** | 20-30 min | Stage 0.5 (Premise Challenge) → 1 → 2 → 3 → 3.5 (Alternative Paths) → 4 → 5 (with 3-year retrospective) | S≥4 and T≤3 — bet-the-company, not in a hurry |
| **CRITIC** | 5-10 min | Stage 1' (Load artifact + critique) → 3' (Prioritize findings) → 4 → 5 | A≥3 — review existing plan, code, doc, or design |

Stage 0 scores the question on:

- **S (stake)**: 1 = trivial preference, 5 = life/company direction
- **T (time pressure)**: 1 = reflect for weeks, 5 = decide today
- **C (concreteness)**: 1 = vague musing, 5 = specific action
- **A (artifact)**: 0 = no artifact, 5 = detailed plan/doc/code to review

Selection rule: `if A ≥ 3: CRITIC, elif S ≥ 4 and T ≤ 3: DEEP, elif T ≥ 4 and S ≤ 3: QUICK, else: STANDARD`.

The mode is surfaced to you at Stage 0 via AskUserQuestion. You pick. The session locks the mode and runs that mode's stage graph end-to-end.

---

## Which persona should I reach for?

Every persona declares `when_to_reach_for_me` with explicit Triggers and Avoid-when rules. The short version:

| Your situation | Reach for | Why |
|---|---|---|
| Jargon is covering for confusion | **Feynman** | Simplification test forces understanding |
| Vague abstract noun used without a definition | **Socrates** | Definition hunting is his primary move |
| Stuck in false urgency, running flat out | **Seneca** | Control filter + time accounting separate weather from work |
| Paralyzed by 10 competing priorities | **Marcus Aurelius** | Duty focus finds the ONE next action |
| Category error (ethics question treated as strategy) | **Aristotle** | Four causes + categorization clarify which tool applies |
| Restructuring an inherited system without understanding it | **Confucius** | Three-year test forces patience before reform |
| Pushing harder when you should do less | **Lao Tzu** | Wu wei and reversal find the path the situation wants |
| UI / design is cluttered, loud, or trend-chasing | **Dieter Rams** *(interpretive)* | Ten principles audit + "as little design as possible" |

Or invoke multiple personas:

```
muse:chain feynman→confucius→dieter-rams why is our product confusing?
muse:debate aristotle vs lao-tzu ship fast or ship polished?
muse:critic my-roadmap.md --persona=dieter-rams
muse:all should I pivot?
```

---

## What makes each persona distinctive (v2.2)

Each persona ships with:

**Multiple taglines** — 3-5 context-specific taglines, one per session stage. Feynman's *"Explain it simply, or you don't know it"* for framing, *"The first principle is you must not fool yourself"* for inquiry, *"If it doesn't agree with experiment, it's wrong"* for test-probe. A real thinker has many memorable lines, each for a different moment. Muse encodes the variety.

**Voice rules** — explicit core belief, tone description, contextual voice shifts per stage, and a list of 6-8 banned patterns (phrases the persona NEVER uses). Socrates never says *"you should..."*. Marcus Aurelius never complains about fate. Rams never defends an element with *"the user likes it"*. Inspired by Garry Tan's gstack skill encoding.

**Cognitive patterns** — 7-12 numbered thinking instincts. These are the mental habits behind the moves. A signature move is *"run the hand calculation"*; a cognitive pattern is *"self-deception is the primary enemy — you are the easiest person to fool."* The runtime internalizes them — it does not enumerate them in output.

**When to reach for me** — explicit triggers (when to invoke this persona) + avoid-when (when to reach for a different persona, usually naming it) + session mode fit (QUICK/STANDARD/DEEP/CRITIC).

**Debate positions** — stances on 6 canonical dilemmas: speed-vs-quality, consensus-vs-conviction, authority-vs-reason, direct-vs-indirect, action-vs-patience, tradition-vs-innovation. Stage 4 Decide surfaces the relevant fork based on what the session has uncovered.

**Citations** — every factual claim about what the persona said/did resolves to a source ID in the `## Sources` section. Plato, Meditations, Feynman Lectures, Tao Te Ching, Analects, Ten Principles of Good Design.

See [`docs/PERSONA_SCHEMA.md`](docs/PERSONA_SCHEMA.md) for the full schema and C1-C12 compliance checks.

---

## Commands reference (17 total — v2.3.0-alpha)

### Persona commands (8)

| Command | What it does |
|---|---|
| `/muse:feynman <question>` | First principles + simplification test + hand calculation |
| `/muse:socrates <question>` | Definition hunting + elenchus + midwife method |
| `/muse:seneca <question>` | Time accounting + control filter + premeditatio malorum |
| `/muse:marcus-aurelius <question>` | View from above + dichotomy of control + next right action |
| `/muse:aristotle <question>` | Four causes + golden mean + teleological framing |
| `/muse:confucius <question>` | Rectification of names + lead by example + three-year test |
| `/muse:lao-tzu <question>` | Wu wei + reversal principle + the empty bowl |
| `/muse:dieter-rams <question>` | Ten principles + "as little design as possible" *(interpretive)* |

Each persona runs Stage 0 mode detection and picks QUICK / STANDARD / DEEP / CRITIC before running its 5-stage session.

### Meta commands (9)

| Command | What it does |
|---|---|
| `/muse:list [--category=<tag>]` | List installed personas grouped by category |
| `/muse:build <persona-id>` | Interactive persona builder (spec review loop, C1-C12 validation) |
| `/muse:update <persona-id>` | Upgrade an existing persona to the current schema |
| `/muse:chain p1→p2→p3 <question>` | Sequential multi-persona handoff with auto-summarize |
| `/muse:all <question>` | Default 5-persona Council (Feynman → Socrates → Seneca → Aristotle → Marcus Aurelius) |
| `/muse:debate pA vs pB <question>` | 2 personas × 3 rounds + framework-voice synthesis |
| `/muse:critic <file> --persona=<id>` | Adversarial review via persona's critic_frames (also `--chain=p1,p2,p3`) |
| `/muse:benchmark [--baseline \| --diff \| --quick]` | Measure persona distinctiveness + voice + mode fit |
| `/muse:spike [--personas=<csv>]` | Scientific distinctiveness eval via real API calls (v2.3.0 MVP gather-only) |

All commands run **inside your agent session**. No separate CLI to install. No shell tooling to maintain. Free-text fallbacks (`muse:feynman <text>`, `muse:chain a→b→c <text>`, etc.) remain valid for Codex CLI / Gemini CLI users — they route through the SKILL.md Mode sections.

---

## Build your own persona

Muse ships 8 personas. If you want a 9th (say, Jane Jacobs on cities, or Claude Shannon on information theory, or Hayao Miyazaki on craft), you build it:

```
1. Gather research
   mkdir -p ~/.claude/skills/muse/.archives/personas/jane-jacobs/
   # Drop in biography excerpts, interview transcripts, primary text,
   # case studies. Files: .md, .txt, .srt, .vtt, .json

2. Run muse:build
   /muse:build jane-jacobs

3. The workflow walks you through ~15 fields interactively:
   - primary tagline + 3-5 multi-context taglines
   - signature moves (min 3, covering framing + inquiry + test-probe)
   - thinking mode (opening question, core tension, anti-pattern)
   - debate positions on 6 canonical dilemmas
   - voice rules (core belief, tone, banned patterns)
   - cognitive patterns (7-12 thinking instincts)
   - when to reach for me (triggers + avoid-when)
   - session mode preferences
   - on analogous problems with citations
   - sources, benchmark prompts
   - living_status + disclaimer if applicable

4. C1-C12 compliance validation runs before save. A persona that
   would silently degrade in a session cannot be saved.

5. File lands at personas/jane-jacobs.md (v2.2-compliant).
```

To upgrade an existing persona when the schema evolves:

```
/muse:update jane-jacobs           # interactive, per-gap fix
/muse:update --all --check          # dry-run scan across all personas
/muse:update --all                  # batch walk, fix one at a time
```

Both `/muse:build` and `/muse:update` are **idempotent**: running them on a compliant persona is a zero-write no-op.

For living figures (like Dieter Rams), the disclaimer is mandatory. SESSION.md pre-flight auto-prints it at the top of every session using that persona. See [`docs/CONTRIBUTING.md`](docs/CONTRIBUTING.md) for right-of-publicity guidance.

---

## How muse is different from "prompt X as Feynman"

1. **Cognitive moves as reusable tools, not personality imitation.** `/muse:feynman` runs Feynman's *simplification test* — the specific mental action — regardless of whether the output sounds like his speaking style. The tool is the move, not the voice.

2. **Citation-grounded claims.** Every factual claim about what the persona said/did resolves to a source ID. Plato's *Apology*, Feynman's *Lectures on Physics*, Marcus Aurelius's *Meditations*. No fabricated quotes.

3. **Multi-persona orchestration.** `muse:chain` runs personas in sequence with handoff context. `muse:debate` runs two personas in 3 rounds and surfaces where they agree (often robust) and where they disagree (often the real tension). Character.ai cannot do this. Prompt libraries cannot do this.

4. **Adaptive workflow.** Sessions detect question shape and pick mode. A quick gut-check does not get the same 15-minute ceremony as a bet-the-company decision.

5. **Persona distinctiveness is enforced by schema**. `/muse:build` refuses to save a persona whose signature moves don't cover the three session stage categories. `/muse:update` detects gaps and walks you through fixes. The framework treats *"you can tell Feynman and Socrates apart by reading a session transcript"* as a first-class quality bar.

6. **Runs anywhere the agent runs.** Claude Code, Codex CLI, Gemini CLI — all the same markdown. No per-platform shell tooling to maintain.

7. **User-extensible in minutes**. Ship your own persona in ~15 interactive questions.

---

## Philosophy

Muse is a content repository. The agent is the runtime. The framework is the discipline encoded in SESSION.md and the persona files.

This is deliberately different from most AI developer tools, which ship a CLI or a library plus content. Muse tried that (v1 had bash scripts and JSON schemas and bats tests) and it was wrong: an agentic skill does not need a shell toolchain to work, because the agent already has Read, Glob, Bash, and Write tools. The content IS the framework.

What you pay for with this architecture: no runtime validation, no caching, no type safety at the schema level. What you get: zero install friction, zero per-platform adaptation, clean code review (every change is a markdown diff), and the ability to extend with new personas in minutes without touching any code.

The quality bar comes from the content, not the infrastructure:
- Every persona must pass C1-C12 compliance before save.
- Every session stage has a named quality bar (distinctiveness, mode fit, voice discipline, concreteness, citation).
- Every SESSION.md rule has a fallback for when a persona is incomplete.

This is the agentic pattern. Ship markdown, enforce at the content layer, let the agent run the workflow.

---

## Status

**v2.3.0-alpha** — Original v1 CEO plan complete. 17 slash commands: 8 personas + 9 meta commands (build, update, benchmark, chain, all, debate, critic, list, spike). Measurement-backed distinctiveness (grade A, 24/24 blind Turing, 0 regressions).

Version history:
- **v2.3.0-alpha** (this release): 6 new slash commands (chain, all, debate, critic, list, spike MVP) + SKILL.md routing + dual README refresh. Completes the original v1 CEO plan — `/muse:spike` gather mode is the last piece. 17 commands total. ~2,000 net LoC added.
- **v2.2.3-alpha**: Quote-aware B3 matcher (kills false positives on Lao Tzu "push harder", Confucius old/told, Rams useful) + banned-pattern parser fix (LHS-of-em-dash + italics-only) + `docs/BENCHMARKS.md` contributor doc + post-fix 3-prompt baseline.
- **v2.2.2-alpha**: `/muse:benchmark` — persona distinctiveness + voice + mode-fit regression detector. Subagent-based blind Turing simulation + Jaccard matrix + C1-C12 compliance + baseline comparison.
- **v2.2.1-alpha**: `/muse:build` + `/muse:update` hardened with spec review loop (max 3 iterations), concrete synthesis recipes, distinctiveness check, dry-run + rollback.
- **v2.2.0-alpha**: Adaptive sessions (QUICK/STANDARD/DEEP/CRITIC) + v2.2 persona schema (multi-tagline, voice rules, cognitive patterns, when-to-reach).
- **v2.1.0-beta**: `/muse:build` + `/muse:update` slash commands, persona compliance backfill, inline category tags, canonical mapping.
- **v2.1.0-alpha**: Structured 5-stage sessions + per-persona slash commands + session persistence.
- **v2.0.0-alpha**: Radical agentic refactor. Dropped yq/jq/bats/shellcheck dependencies. Pure markdown.
- **v1** (historical): Shell-tool-based CLI. See `docs/archive/CEO-PLAN-v1.md`.

Full changelog: [`docs/CHANGELOG.md`](docs/CHANGELOG.md).

---

## Documentation

- [Getting Started](docs/GETTING_STARTED.md) — First-time walkthrough, QUICK vs STANDARD vs DEEP vs CRITIC
- [Sessions](docs/SESSIONS.md) — Structured session workflow, file format, grep/share/resume
- [Persona Schema](docs/PERSONA_SCHEMA.md) — v2.2 canonical reference for building or upgrading personas
- [Personas](docs/PERSONAS.md) — Index of the 8 shipped personas with distinctive moves
- [Benchmarks](docs/BENCHMARKS.md) — `/muse:benchmark` methodology, 4 categories, 11 measures, baseline management
- [Architecture](docs/ARCHITECTURE.md) — Dispatcher design, slash vs free-text paths, v2.0/v2.1/v2.2/v2.3 layering
- [Contributing](docs/CONTRIBUTING.md) — How to add a persona, legal notes for living figures
- [Changelog](docs/CHANGELOG.md) — Full version history
- [Adapter: Claude Code](adapters/claude-code/README.md)
- [Adapter: Codex CLI](adapters/codex/README.md)
- [Adapter: Gemini CLI](adapters/gemini/README.md)

---

## Contributing

Three paths:

**Add a new persona.** Gather research into `.archives/personas/<id>/`, run `/muse:build <id>`, PR the resulting `personas/<id>.md`. Legal note: historical/public-domain figures are straightforward; living figures require a disclaimer and carry right-of-publicity risk — see `docs/CONTRIBUTING.md`.

**Sharpen an existing persona.** Add a citation, tighten a signature move, improve a benchmark prompt. Each persona is a self-contained markdown file — open it, edit it, PR it. No build step to break.

**Upgrade schema compliance.** If the schema evolves (v2.2 → v2.3), run `/muse:update --all --check` to see which personas drifted and fix them interactively.

Bug reports and feature requests: GitHub issues.

---

## Legal & privacy

Muse ships primarily **historical and public-domain figures** (Feynman died 1988 but his written work on cargo cult science is cited under fair-use educational-commentary terms; Socrates, Seneca, Marcus Aurelius, Aristotle, Confucius, Lao Tzu are all ancient). Living figures (currently only Dieter Rams) ship with explicit interpretive disclaimers — the output is commentary on publicly documented principles, not quotation, not affiliation, not endorsement.

Muse does NOT store user data. All processing happens in your agent session. Session files are saved locally to `~/.muse/sessions/` and never transmitted anywhere. No telemetry. No analytics. No remote state.

If you build a living-figure persona and plan to share it, read `docs/CONTRIBUTING.md` section on right-of-publicity first. When in doubt, keep it local.

---

## License

MIT. See [`LICENSE`](LICENSE).

---

## Credits

Muse draws inspiration from Garry Tan's [gstack](https://github.com/garrytan/gstack) — his agentic skill framework for Claude Code — specifically his persona encoding patterns (voice rules with banned vocabulary, cognitive patterns as thinking instincts, adaptive workflow modes). gstack and muse serve different purposes (gstack is a development workflow toolkit; muse is a thinking toolkit) but the architecture lessons were load-bearing: *ship markdown, enforce at the content layer, let the agent be the runtime*.

Persona research draws on public-domain texts, documented interviews, and secondary sources with explicit citations. Eval framework pattern owes to the reverse Turing literature.

Built because every builder I know has had the experience of reading a passage by Feynman or Socrates or Rams and thinking *"if they were in the room right now, they'd ask me the question that dissolves this problem in 30 seconds."* Muse is the attempt to make that room accessible, one markdown file at a time.

---

*Think with the greats. Build something they would have respected.*
