# Muse

![Muse — Think with the greats](public/images/home.jpg)

### ChatGPT can quote Feynman. Muse runs his thinking on your problem.

*Eleven great mentors. Five minutes each. One decision closer.*

---

**You're stuck on a decision.** Not because it's hard — because it deserves a frame you don't have. Feynman would ask *"can you explain this without jargon?"* Paul Graham would ask *"how many users have you talked to this week?"* Elon Musk would ask *"which law of physics forbids this?"* Socrates would ask *"what do you mean by that word?"* Dieter Rams would audit the thing against ten principles. Each frame takes five minutes and unlocks the decision.

**But you can't call them.** And the AI chatbots you've tried can *imitate* their writing style — they can't *run their thinking* on your actual problem. Knowing the quote doesn't help. Knowing the move does.

**Muse is the runtime for the move.** Eleven great mentors, encoded not as characters to chat with but as reusable cognitive tools you can point at your actual problem:

| Mentor | The move | When you reach for it |
|---|---|---|
| **Feynman** | *Simplification test* | Jargon is covering for confusion |
| **Socrates** | *Definition hunting* | A central word is undefined |
| **Paul Graham** | *Make something people want* | Confusing activity with progress |
| **Philip Kotler** | *STP before the Ps + triple bottom line* | Jumped to tactics before defining the customer |
| **Elon Musk** | *The algorithm + physics-as-constraint* | Inherited requirements are slowing you down |
| **Dieter Rams** | *Ten-principles audit* | A design is cluttered, loud, or trend-chasing |
| **Marcus Aurelius** | *Duty focus* | Paralyzed by ten competing priorities |
| **Seneca** | *Premeditatio malorum* | Running flat out, no time to think |
| **Aristotle** | *Four causes + categorization* | Treating an ethics question as strategy |
| **Confucius** | *Rectification of names* | Restructuring an inherited system |
| **Lao Tzu** | *Wu wei + value of emptiness* | Pushing harder when you should do less |

You invoke one — `/muse:feynman why is my code slow?` — and it runs a 5–15 minute structured session applying *that specific move* to *your problem*. No character roleplay. No "as Feynman would say" padding. Just the cognitive move, applied rigorously, with a saved transcript you can re-read weeks later.

**What you get:**
- ✅ Five to fifteen minutes from question → concrete next action
- ✅ The specific mental move that made the mentor famous, applied to *your* actual problem
- ✅ A saved session file you can re-read, grep, or share
- ✅ Works inside your existing tools: Claude Code, Codex CLI, Gemini CLI
- ✅ Install in 30 seconds. Zero dependencies. Zero build step. Ship markdown; the agent handles the rest.

> *"What I cannot create, I do not understand."* — Richard Feynman's blackboard at the time of his death. When I read that line, I realized it's exactly what generic LLMs can't do: they can quote Feynman, but they can't *be the frame* that made him Feynman. Muse is the attempt to turn that frame into a runtime.

```
/muse:who should I rewrite this service in Rust?
  → Scores 11 personas. Top 3: Elon Musk 72/80 (the algorithm +
    first-principles cost decomposition + physics-as-constraint),
    Feynman 65/80 (hand calculation + cargo cult detection),
    Socrates 55/80 (define "rewrite"). Pick one, and the
    session runs inline on your question.

/muse:feynman why is my code slow?
  → QUICK mode detected (3-5 min). Stage 1 Frame: Feynman asks
    you to explain the bottleneck without jargon. If you can't,
    the jargon is covering for confusion. Then one hand-calculation
    probe. Then commit.

/muse:socrates what do I actually mean by "community"?
  → STANDARD mode (10-15 min). Stage 1: Define "community" clearly
    enough that I couldn't twist its meaning. Stage 2: What
    assumption are you making about why people join communities?
    Stage 3-5 follow.

/muse:dieter-rams review src/landing.tsx
  → CRITIC mode detected (5-10 min). Stage 1': loads the file,
    runs ten principles audit, produces a findings inventory
    sorted by severity. Stage 3': you pick what to fix first.
    Stage 4-5 commit.

/muse:chain feynman→socrates→dieter-rams why is our product confusing?
  → 3 personas in sequence. Feynman surfaces the confusion,
    Socrates defines what "confusing" actually means, Rams
    audits the interface. Synthesis + one action.

/muse:debate aristotle vs lao-tzu ship fast or ship polished?
  → 2 personas × 3 rounds. Round 1 openings, Round 2 tension,
    Round 3 framework-voice synthesis identifying where they
    agree and where they genuinely disagree.
```

Each session saves a markdown file to `~/.muse/sessions/` (or `~/.muse/chains/`, `~/.muse/debates/`, `~/.muse/critiques/` depending on command) that you can re-read, grep, share, or resume weeks later.

---

## What gets shipped

**Version 2.7.0-alpha**. ~6,850 lines of content, zero lines of shell tooling.

Muse is a **persona runtime**. It ships with a curated starter pack of personas and a full set of commands to use them, compose them, build new ones, and measure them. The starter pack is not a ceiling — it is a baseline. You can add personas locally via `/muse:build` in ~15 interactive questions, or pull new personas from the community via a future persona catalog (roadmap item — see § Roadmap).

Shipped artifacts:

### 🎭 Starter pack — 11 cognitive personas

A curated baseline covering first-principles, systems, design, philosophy, strategy, and execution/engineering. Each persona is ~300-450 lines of structured markdown with multi-tagline, voice rules (core belief + banned patterns), 7-12 cognitive patterns, signature moves with inline category tags (framing/inquiry/test-probe/decide/commit), debate positions on canonical dilemmas, and documented analogous problems with citations.

| ID | Name | Era | Domain | Tagline |
|---|---|---|---|---|
| `feynman` | Richard Feynman | 1918-1988 | first-principles, science | *Explain it simply, or you don't know it* |
| `socrates` | Socrates | 470-399 BCE | philosophy, strategy | *The unexamined answer is not worth giving* |
| `seneca` | Seneca | 4 BCE - 65 CE | philosophy, strategy | *Time, not money, is the scarcest currency* |
| `marcus-aurelius` | Marcus Aurelius | 121-180 CE | philosophy, strategy | *Govern yourself before governing anything else* |
| `aristotle` | Aristotle | 384-322 BCE | first-principles, systems, philosophy | *Excellence is a habit, not a moment* |
| `confucius` | Confucius | 551-479 BCE | systems, philosophy | *Govern by virtue* |
| `lao-tzu` | Lao Tzu | 6th c. BCE | philosophy, design | *The way that can be spoken is not the eternal way* |
| `dieter-rams` *(interpretive)* | Dieter Rams | 1932– | design, systems | *Less, but better* |
| `elon-musk` *(interpretive)* | Elon Musk | 1971– | first-principles, execution, engineering | *Make it less dumb* |
| `paul-graham` *(interpretive)* | Paul Graham | 1964– | strategy, execution, first-principles, philosophy | *Make something people want* |
| `philip-kotler` *(interpretive)* | Philip Kotler | 1931– | strategy, execution, first-principles, philosophy | *Marketing is meeting needs profitably* |

7 historical/public-domain + 4 interpretive living figures (Rams, Musk, Graham, and Kotler — all with mandatory disclaimers). All pass benchmark grade A.

**Starter pack, not a ceiling.** If the cognitive frame you need is Jane Jacobs on cities, Claude Shannon on information theory, Hayao Miyazaki on craft, Nassim Taleb on antifragility, John Maynard Keynes on economic uncertainty, or anyone else — build it locally in ~15 interactive questions. The starter pack grows too: `elon-musk` was added in v2.4.0-alpha, `paul-graham` in v2.5.0-alpha, `philip-kotler` in v2.7.0-alpha, and future releases will add more historical and interpretive frames. See § Build your own persona below.

### ⚙️ Runtime — 21 slash commands

10 meta commands + 11 persona commands. All self-contained, all structured step-by-step with validation and persistence. See § Commands reference for full list with characteristics.

### 📐 Framework — load-bearing specs

- **`SESSION.md`** (~730 lines) — the load-bearing workflow spec. Defines 4 adaptive session modes (QUICK, STANDARD, DEEP, CRITIC), mode detection heuristic, stage graphs per mode, tagline selection, voice rules extraction, quality bars.
- **`SKILL.md`** (~830 lines) — the free-text dispatcher for Codex/Gemini CLI users. Routes `muse:<anything>` to the right Mode section. Kept in sync with slash command behavior.
- **`docs/PERSONA_SCHEMA.md`** (~450 lines) — canonical v2.2 schema reference for building or upgrading personas. C1-C12 compliance checks documented.
- **`docs/BENCHMARKS.md`** (~400 lines) — methodology explainer for `/muse:benchmark` (4 categories, 11 measures, 7 run modes, baseline management, worked confusion examples).

**v2.3.0 completed the original v1 CEO plan** — all 7 meta commands from the initial spec (`muse:all`, `muse:chain`, `muse:debate`, `muse:critic`, `muse:build`, `muse:spike`, `muse:list`) ship as slash commands, joined by `muse:update` (v2.1), `muse:benchmark` (v2.2), and `muse:who` (v2.3.1) for a full 18-command surface. Measurement-backed distinctiveness (grade A, 24/24 blind Turing). Zero regressions since baseline.

Zero dependencies. Zero shell scripts. Zero build step. The agent is the runtime.

---

## Who this is for

**Builders who think for a living**. You ship code, ship product, make calls every day about scope, priorities, architecture, copy, hiring. You already use LLMs — but the LLM is generic, and your decisions are specific. Muse gives you *named mental moves* you can apply to your own problem, not an imitation of a celebrity's vocabulary.

**Founders running into the limits of their own framing**. You're too close to the problem. You need someone who would have framed it differently. Muse lets you rent Socrates for ten minutes to ask *"what do you actually mean by growth?"* and walk away with a concrete next action.

**Teams with opinionated thinkers**. Want your engineering team thinking like Feynman and your product team thinking like Rams? Ship personas as part of your internal tooling. Anyone who clones the muse repo — or your team's fork — gets the same mental moves.

**Anyone using Claude Code / Codex CLI / Gemini CLI who wants depth over breadth**. You don't need another productivity plugin. You need a way to slow down on the one decision that matters and think through it with a specific lens. Muse is that.

**Who this is not for**: if you want an AI that pretends to be Feynman for roleplay, use character.ai. If you want a prompt library, there are a dozen. Muse is neither. It's cognitive tools encoded as agentic skills.

---

## Install — 30 seconds

```bash
curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh
```

That's it. No dependencies. No build. No package manager. The installer clones the repo to `~/.claude/skills/muse/`, copies all 20 slash commands to `~/.claude/commands/`, and creates `~/.muse/sessions/` for your session artifacts. Restart Claude Code once and start typing:

```
/muse:who what's on your mind?
```

`/muse:who` is the recommended first command. It scores the installed personas against your question and routes you to the best-fit session. No need to know the persona map first.

If you prefer git clone:

```bash
git clone https://github.com/doanchienthangdev/muse ~/.claude/skills/muse
cd ~/.claude/skills/muse
./install.sh
```

For Codex CLI or Gemini CLI users (no slash command support), Muse invokes via free-text: `muse:feynman <question>`, `muse:chain a→b <question>`, `muse:who <question>`. See `adapters/codex/README.md` and `adapters/gemini/README.md`.

---

## Discovering the right persona

You don't need to memorize 11 personas (or 80 someday) to use muse. Three entry points, from cold-start to expert:

### 1. `/muse:who <question>` — the triage command (new in v2.3.1)

Type your question without knowing the map. Muse scores every installed persona against your input using a transparent 0-80 rubric and shows you the top 5 with one-sentence rationales. Pick one and the session runs inline on the same question. If two personas are close, it suggests a chain. If they take opposing positions, it suggests a debate.

```
/muse:who should I rewrite this service in Rust?

MUSE TRIAGE — scoring 11 personas against your question

  "should I rewrite this service in Rust?"

Top 5 matches (score out of 80):

  A) Richard Feynman       68/80   Direct trigger match on "rewrite"
                                    + question benefits from hand calculation
                                    + first principles
  B) Socrates              55/80   Definition hunting — what do you
                                    mean by "rewrite"? Preserve what?
  C) Marcus Aurelius       40/80   Dichotomy of control + next right
                                    action framing
  D) Seneca                35/80   Time accounting — is the rewrite a
                                    budget decision?
  E) Lao Tzu               30/80   Reversal — maybe the answer is
                                    "don't rewrite"

  F) Chain: Feynman → Socrates
     Reason: top 2 scores within 15 pts AND complementary categories
     (test-probe → inquiry)

  H) Council: run all 5 Council personas (/muse:all)
  I) See full table for all 11 personas
  J) Abort
```

This is the cold-start entry point. Use it when you don't know who to ask.

### 2. `/muse:list [--category=<tag>]` — browse the installed set

Directory view of every installed persona grouped by category. Use when you want to see what's available before picking.

```
/muse:list

MUSE :: INSTALLED PERSONAS

FIRST PRINCIPLES THINKERS
  feynman      Richard Feynman — Explain it simply, or you don't know it
  aristotle    Aristotle — Excellence is a habit, not a moment

PHILOSOPHY
  socrates     Socrates — The unexamined answer is not worth giving
  lao-tzu      Lao Tzu — The way that can be spoken is not the eternal way

...

11 personas across 8 categories. Use /muse:list --category=<tag> to filter.
```

### 3. `/muse:<persona-id> <question>` — direct invocation (when you know who to ask)

Once you know the map, skip triage. Type the persona slash directly:

```
/muse:feynman why is my database query slow?
/muse:socrates what do I actually mean by community?
/muse:dieter-rams review src/landing.tsx
/muse:marcus-aurelius should I bet the company on this pivot?
```

Stage 0 of every persona session picks a mode (QUICK/STANDARD/DEEP/CRITIC) based on your question's shape and runs the matching stage graph.

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

Every persona session detects the shape of your question and picks the right workflow. Stage 0 scores your question on 4 axes and routes to one of four modes. You can always override.

| Mode | Duration | Stages | When to pick |
|---|---|---|---|
| **QUICK** | 3-5 min | Stage 1 (brief Frame) → Stage 5 (Commit) | T≥4 and S≤3 — fast gut-check, low stakes, time pressure |
| **STANDARD** (default) | 10-15 min | Stage 1 → 2 → 3 → 4 → 5 | Balanced depth — the full 5-stage flow |
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

## Commands reference (21 total — v2.7.0-alpha)

Legend for attributes:
- 💬 **Interactive** — uses AskUserQuestion to stop at decision points
- 💾 **Persistent** — writes a session/critique/report file to `~/.muse/`
- 🎭 **Multi-persona** — loads 2+ personas
- 🔑 **Requires API key** — needs `ANTHROPIC_API_KEY`
- ⚡ **Quick** — typically <30 seconds, no session loop

### 🧭 Triage & navigation (2)

| Command | Attrs | What it does |
|---|---|---|
| `/muse:who <user_text>` | 💬 💾 | **Persona triage** — score all installed personas 0-80 against your question, present top 5 with rationales, optionally suggest a chain or debate, then run the chosen session inline. The cold-start entry point. |
| `/muse:list [--category=<tag>]` | ⚡ | List installed personas grouped by category with one-line taglines. Dynamic — new personas appear automatically. |

### 🎭 Persona sessions — the starter pack (11)

Each runs a 5-stage session (Stage 0 mode detection + Stages 1-5) and persists to `~/.muse/sessions/`.

| Command | Attrs | Distinctive moves |
|---|---|---|
| `/muse:feynman <question>` | 💬 💾 | First principles + simplification test + cargo cult detector + hand calculation + beginner's mind |
| `/muse:socrates <question>` | 💬 💾 | Definition hunting + elenchus (cross-examination) + ignorance acknowledgment + midwife method |
| `/muse:seneca <question>` | 💬 💾 | Time accounting + control filter + premeditatio malorum + essential cut + memento mori |
| `/muse:marcus-aurelius <question>` | 💬 💾 | View from above + dichotomy of control + duty focus + next right action + judgment separation |
| `/muse:aristotle <question>` | 💬 💾 | Four causes + golden mean + categorization + teleological framing + habit formation |
| `/muse:confucius <question>` | 💬 💾 | Rectification of names + lead by example + three-year test + reciprocity |
| `/muse:lao-tzu <question>` | 💬 💾 | Wu wei + value of emptiness + reversal principle + soft overcomes hard |
| `/muse:dieter-rams <question>` *(interpretive)* | 💬 💾 | Ten principles audit + "as little design as possible" + honest design + unobtrusive function + durable-not-trendy |
| `/muse:elon-musk <question>` *(interpretive)* | 💬 💾 | First-principles cost decomposition + the algorithm (question → delete → simplify → accelerate → automate) + manufacturing reality check + name-the-requirement-maker + physics-as-only-constraint |
| `/muse:paul-graham <question>` *(interpretive)* | 💬 💾 | Make something people want + name the pattern + talk to your users (manually, unscalably) + default alive or dead + shower test (top idea in your mind) + stay upwind |
| `/muse:philip-kotler <question>` *(interpretive)* | 💬 💾 | STP before the Ps + broadening (who is the customer?) + coin the discipline term + layer don't replace + triple bottom line audit + move one customer along the 5As |

### 🎭 Multi-persona orchestration (4)

| Command | Attrs | What it does |
|---|---|---|
| `/muse:all <question>` | 💬 💾 🎭 | Default 5-persona Council preset. Feynman → Socrates → Seneca → Aristotle → Marcus Aurelius in sequence, each handing off a 2-3 sentence summary to the next. Final framework-voice synthesis. |
| `/muse:chain p1→p2→p3 <question>` | 💬 💾 🎭 | Arbitrary sequential chain. Inline orchestration with auto-summarize when N>5 personas or 30 KB context. Accepts preset names from `chains/` or inline syntax. |
| `/muse:debate pA vs pB <question>` | 💬 💾 🎭 | 2 personas × 3 rounds (opening, tension, framework-voice synthesis). Graceful degradation when one persona lacks `debate_positions`. Rejects self-debate. |
| `/muse:critic <file> --persona=<id>` | 💬 💾 🎭 | Apply a persona's `critic_frames` to an existing artifact (file). Supports `--chain=p1,p2,p3` for parallel multi-persona critique with consensus/unique/disagreement synthesis. Strict path validation + prompt-injection boundary marker. |

### 🛠️ Persona lifecycle (2)

| Command | Attrs | What it does |
|---|---|---|
| `/muse:build <persona-id>` | 💬 💾 | Interactive persona builder. Reads research material from `.archives/personas/<id>/`, walks you through ~15 fields (taglines, voice rules, cognitive patterns, signature moves, debate positions, when-to-reach, session modes, sources), runs spec review loop (max 3 iterations) + C1-C12 compliance validation + distinctiveness check + dry-run, then atomic mv to `personas/<id>.md`. |
| `/muse:update <persona-id>` | 💬 💾 | Upgrade an existing persona to the current schema version. Detects v2.1/v2.2 gaps, walks you through fixes per field. Idempotent — running on a compliant persona is a no-op. Supports `--all --check` for batch dry-run scan. |

### 📊 Evaluation (2)

| Command | Attrs | What it does |
|---|---|---|
| `/muse:benchmark [--baseline \| --diff \| --quick \| --persona=<id> \| --prompts=<list>]` | 💾 | Measure persona distinctiveness + voice discipline + schema compliance + mode fit. 4 categories, 11 measures (C1-C12 compliance + Jaccard overlap matrix + blind Turing simulation via subagent + regression detection vs baseline). Writes markdown + JSON reports to `~/.muse/benchmark-reports/`. Grade A maintained since v2.2.3. |
| `/muse:spike [--personas=<csv>] [--seed=<n>] [--mode=gather\|dry\|score]` | 💾 🔑 | Scientific distinctiveness eval via real Claude API calls. v2.3.0-alpha ships `gather` subcommand (blind batch + dekey for human judges). Score subcommand (automated cross-reference + GO/PIVOT/NO-GO verdict) is v2.3.1+ deferred. Lightweight alternative with no API key: use `/muse:benchmark`. |

### Free-text fallback

All 18 commands have free-text equivalents (e.g., `muse:feynman <text>`, `muse:chain a→b <text>`, `muse:who <text>`) that route through the `SKILL.md` `Mode:` sections. This is for Codex CLI and Gemini CLI users, and as a fallback. Claude Code users should always prefer slash commands — they have structured step-by-step orchestration, validation, and persistence.

All commands run **inside your agent session**. No separate CLI to install. No shell tooling to maintain.

---

## Build your own persona

The 11 personas in the starter pack are a baseline, not a ceiling. Muse is designed from day one for local persona authoring. If you want a 12th (say, Jane Jacobs on cities, Claude Shannon on information theory, Hayao Miyazaki on craft, Nassim Taleb on antifragility, or anyone else), build it in ~15 interactive questions:

```
1. Gather research
   mkdir -p ~/.claude/skills/muse/.archives/personas/jane-jacobs/
   # Drop in biography excerpts, interview transcripts, primary text,
   # case studies. Files: .md, .txt, .srt, .vtt, .json

2. Run /muse:build
   /muse:build jane-jacobs

3. The workflow walks you through ~15 fields interactively:
   - primary tagline + 3-5 multi-context taglines
   - signature moves (min 3, covering framing + inquiry + test-probe)
   - thinking mode (opening question, core tension, anti-pattern)
   - debate positions on 6 canonical dilemmas
   - voice rules (core belief, tone, banned patterns)
   - cognitive patterns (7-12 thinking instincts)
   - when to reach for me (triggers + avoid-when)
   - session mode preferences (strong_at / weak_at)
   - on analogous problems with citations
   - sources, benchmark prompts
   - living_status + disclaimer if applicable

4. Spec review loop runs up to 3 iterations with an adversarial
   reviewer subagent, then C1-C12 compliance validation + distinctiveness
   check. A persona that would silently degrade in a session cannot
   be saved.

5. File lands at personas/jane-jacobs.md (v2.2-compliant).

6. Immediately usable as /muse:jane-jacobs <question> and appears
   in /muse:list, /muse:who, /muse:all chains, /muse:debate, /muse:critic.
```

The new persona is fully equal to starter-pack personas — no special treatment, no second-class status. `/muse:who` will score it in triage, `/muse:benchmark` will include it in the distinctiveness grid, `/muse:update` will keep it current as the schema evolves.

### Upgrade when the schema evolves

```
/muse:update jane-jacobs            # interactive, per-gap fix
/muse:update --all --check          # dry-run scan across all personas
/muse:update --all                  # batch walk, fix one at a time
```

Both `/muse:build` and `/muse:update` are **idempotent**: running them on a compliant persona is a zero-write no-op.

### Legal note for living figures

For historical/public-domain figures (deceased before ~1950 or out of copyright), set `living_status: historical`, no disclaimer needed, proceed normally.

For living figures or estate-protected names (Jobs estate, Musk, Bezos, etc.), set `living_status: living` or `estate_protected` and include a disclaimer in BOTH the frontmatter AND a body blockquote immediately after the tagline (see `personas/dieter-rams.md` for the format). SESSION.md auto-prints the disclaimer at the top of every session using that persona. `/muse:build` refuses to save a living-figure persona without the disclaimer. See [`docs/CONTRIBUTING.md`](docs/CONTRIBUTING.md) for right-of-publicity guidance.

When in doubt: **keep living-figure personas local**. Don't share them until you've thought through the legal implications.

---

## How muse is different from "prompt X as Feynman"

1. **Cognitive moves as reusable tools, not personality imitation.** `/muse:feynman` runs Feynman's *simplification test* — the specific mental action — regardless of whether the output sounds like his speaking style. The tool is the move, not the voice.

2. **Citation-grounded claims.** Every factual claim about what the persona said/did resolves to a source ID. Plato's *Apology*, Feynman's *Lectures on Physics*, Marcus Aurelius's *Meditations*. No fabricated quotes.

3. **Multi-persona orchestration.** `/muse:chain` runs personas in sequence with handoff context. `/muse:debate` runs two personas in 3 rounds and surfaces where they agree (often robust) and where they disagree (often the real tension). `/muse:critic --chain=p1,p2,p3` runs parallel per-persona critiques with consensus/unique/disagreement synthesis. Character.ai cannot do this. Prompt libraries cannot do this.

4. **Adaptive workflow.** Sessions detect question shape and pick mode. A quick gut-check does not get the same 15-minute ceremony as a bet-the-company decision.

5. **Persona distinctiveness is enforced by schema and measurement.** `/muse:build` refuses to save a persona whose signature moves don't cover the three session stage categories. `/muse:update` detects gaps and walks you through fixes. `/muse:benchmark` measures distinctiveness via blind Turing simulation and flags regressions against a baseline. The framework treats *"you can tell Feynman and Socrates apart by reading a session transcript"* as a first-class quality bar.

6. **Runs anywhere the agent runs.** Claude Code, Codex CLI, Gemini CLI — all the same markdown. No per-platform shell tooling to maintain.

7. **Extensible by design.** The starter pack is 11 personas (growing). The runtime supports arbitrary local personas via `/muse:build`. A future persona catalog (§ Roadmap) will let users browse and clone individual personas without cloning the whole framework.

---

## Philosophy

Muse is a content repository. The agent is the runtime. The framework is the discipline encoded in SESSION.md and the persona files.

This is deliberately different from most AI developer tools, which ship a CLI or a library plus content. Muse tried that (v1 had bash scripts and JSON schemas and bats tests) and it was wrong: an agentic skill does not need a shell toolchain to work, because the agent already has Read, Glob, Bash, and Write tools. The content IS the framework.

What you pay for with this architecture: no runtime validation, no caching, no type safety at the schema level. What you get: zero install friction, zero per-platform adaptation, clean code review (every change is a markdown diff), and the ability to extend with new personas in minutes without touching any code.

The quality bar comes from the content, not the infrastructure:
- Every persona must pass C1-C12 compliance before save.
- Every session stage has a named quality bar (distinctiveness, mode fit, voice discipline, concreteness, citation).
- Every SESSION.md rule has a fallback for when a persona is incomplete.
- `/muse:benchmark` measures distinctiveness empirically, not just by taste. Grade A means 24/24 blind Turing identifications across 3 difficulty tiers.

This is the agentic pattern. Ship markdown, enforce at the content layer, let the agent run the workflow.

---

## Roadmap

Muse's long-term direction: **a persona runtime + an extensible persona catalog**.

**Shipping today** (v2.7.0-alpha):
- 21 slash commands, 4 adaptive session modes, 11 starter pack personas (philip-kotler added as 3rd living-figure extension)
- `/muse:who` for cold-start triage, `/muse:build` for local authoring
- `/muse:benchmark` with measurement-backed distinctiveness (grade A)
- Full multi-persona orchestration (chain, debate, critic, all)
- Three extensions of the starter pack beyond the historical 8: `/muse:elon-musk`, `/muse:paul-graham`, and `/muse:philip-kotler` (all interpretive, each with mandatory disclaimers)

**Near-term** (v2.4+):
- **More starter personas** — Claude Shannon (information theory), Jane Jacobs (systems/cities), Nassim Taleb (antifragility), John Maynard Keynes (uncertainty), Simone Weil (attention as generosity), Hayao Miyazaki (craft). All historical or interpretive with disclaimers.
- **Routing accuracy benchmark** — `/muse:benchmark` extended with a routing-accuracy measure to evaluate `/muse:who` picks against ground-truth labels.
- **`/muse:spike --mode=score`** — automated cross-reference of human judge answers against the dekey + GO/PIVOT/NO-GO verdict (currently v2.3.0 ships gather-only).
- **CI integration** — GitHub Actions workflow that runs `/muse:benchmark --diff` on every PR and comments results.
- **Continuous benchmarking dashboards** — trend HTML generated from `~/.muse/analytics/benchmark-runs.jsonl`.

**v3+ vision** — **the persona catalog**:

Muse's longest-term direction is a public catalog of community-authored personas, similar to how Claude Code skills work in [agentskills](https://github.com/anthropics/agentskills). A user browsing the catalog will be able to:

1. **Browse** personas by category, era, domain, popularity, or specific signature moves
2. **Preview** a persona's cognitive frame + sample sessions before installing
3. **Clone** an individual persona to their local muse install — not the whole framework, just the `.md` file
4. **Update** cloned personas with a single command when authors ship improvements
5. **Contribute** by publishing their own locally-built persona to the catalog via PR, with an automated distinctiveness check gate

Each catalog persona will carry metadata about author, license, historical vs living status, distinctiveness score at publish time, and update history. The catalog will be append-only — once published, a persona never changes identity (updates create new versions).

This is load-bearing work — not a ship-next-week feature. It depends on schema stability (C9-C12 promotion to HARD-GAP in v3.0), authoritative distinctiveness scoring (`/muse:spike` score mode), and signing infrastructure for verified authorship. v2.3.x is the foundation; v3.0 is when the catalog becomes real.

In the meantime, **share via PR**. If you build a good persona, open a PR to add it to the starter pack, and if the distinctiveness check passes, it ships.

---

## Status

**v2.7.0-alpha** — Third starter-pack extension. `philip-kotler` joins the roster as the 11th persona — an interpretive cognitive-tool frame for enterprise-scale marketing strategy. Six signature moves: **STP before the Ps** (segmentation → targeting → positioning before any tactic — Kotler's defense against 60 years of tactics-first failures), **broadening** ("who is the customer of this activity?" — applied to nonprofits 1969, social causes 1971, places 1990s, nations 2000s, societies 2020s), **coin the discipline term** (demarketing, atmospherics, social marketing, place marketing, holistic marketing, stakeholder capitalism — naming as pedagogy at textbook scale), **layer don't replace** (4Ps + 4Cs coexist; Marketing 1.0 → 5.0 layer; additive evolution over replacement), **triple bottom line audit** (profit + people + planet; Kotler's 2015 *Confronting Capitalism* predated the 2019 Business Roundtable stakeholder statement by four years), and **move one customer along the 5As** (aware → appeal → ask → act → advocate — the commit-discipline closure). Distilled from 7 textbooks/trade-books (*Marketing Management* 16e, Marketing 3.0/4.0/5.0 trilogy, *Confronting Capitalism*, *My Adventures in Marketing*, *Principles of Marketing*), 7 essays/interviews (AMA 2024, Kellogg Insight, Marketing Journal 2006 + 2021, Branding Magazine, Place Brand Observer), and 5 long-form transcripts (Italy Marketing 101 lecture, Beijing keynote, Kellogg seminar, IOD India, Marketing 5.0 conversation). Grade A maintained on 11-persona benchmark. Adversarial spec review caught C7 source-id typo + paul-graham title collision + STP-vs-Broadening example overlap + missing decide/commit category tags; all 4 MUST-FIX issues applied. 21 slash commands total.

**v2.6.0-alpha** — `elon-musk` persona full rebuild (gap-analysis-driven). A user-requested audit vs the archive surfaced 6 unused source files and ~12 missing cognitive-move concepts (Idiot Index as Isaacson's named metric, "surge" as Musk's tactical term, the layered Urban software framework, documented "demon mode" shadow, collaborator-acknowledged demoralization weakness, MuskSpeak, Asperger's-style-directness explainer). v3 rebuild integrates all of these, adds two new body sections (`## Shadow — known limitations of this cognitive frame` and `## What to steal, what to leave`), and expands sources 13 → 18. Spec review caught 5 pattern-move title collisions (same C11 issue as paul-graham) + commit-tagline weakness + Core-belief over-length; all 4 issues fixed. Benchmark retains grade A with 10/10 blind Turing match rate — judge specifically noted the "idiot index" terminology as the single sharpest voice fingerprint in the 10-persona pack. README hero tagline changed to *"ChatGPT can quote Feynman. Muse runs his thinking on your problem."* — differentiates muse from generic LLM alternatives via the single load-bearing verb "runs" (runtime, not imitation). 20 slash commands total.

**v2.5.0-alpha** — Second starter-pack extension. `paul-graham` joins the roster as the 10th persona — an interpretive cognitive-tool frame focused on **make something people want** as the foundational reframe, **naming previously-unnamed patterns** (do things that don't scale, ramen profitable, playing house, top idea in your mind, default alive/dead, the right kind of stubborn), **manual user recruitment** (Collison-installation style), the **shower test** for attention-slot diagnostics, and **staying upwind** over planning when the territory is unknown. Grade A maintained on 10-persona benchmark. 20 slash commands total. Distilled from paulgraham.com (12 verbatim essays), Stanford CS183B 2014, Conversations with Tyler 2023, three more long-form transcripts, and three reference books.

**v2.4.0-alpha** — First extension of the starter pack beyond the historical 8. `elon-musk` joins the roster as the 9th persona — an interpretive cognitive-tool frame focused on first-principles cost decomposition, the 5-step algorithm (question → delete → simplify → accelerate → automate, in that order), manufacturing reality checks, and physics-as-the-only-constraint reasoning. Grade A maintained on 9-persona benchmark. The Elon Musk persona carries the most extensive interpretive disclaimer in the repo — use as a cognitive-tool lens only, not as a representation of Elon Musk himself. 19 slash commands total.

Version history:
- **v2.7.0-alpha** (this release): Third starter-pack extension. `personas/philip-kotler.md` + `commands/muse:philip-kotler.md`. Benchmark grade A maintained with 11 personas. Docs refresh across README, PERSONAS.md, GETTING_STARTED.md, SKILL.md, ADVISORY_COUNCIL.md, CHANGELOG.md. Third repo-shipped interpretive persona for a living public figure — mandatory disclaimer + interpretive framing + right-of-publicity safeguards enforced by `/muse:build` C5 check. Adversarial spec review score 8.8 → PASS after 4 MUST-FIX iterations.
- **v2.6.0-alpha**: `elon-musk` persona full rebuild (v3.0.0). Gap-analysis-driven — 6 unused archive sources pulled in, ~12 missing concepts integrated, 2 new body sections (Shadow + What-to-steal-what-to-leave). Spec-review 6/10 → PASS after 4 fixes. Benchmark grade A maintained (10/10 blind Turing). README hero tagline refreshed.
- **v2.5.0-alpha**: Second starter-pack extension. `personas/paul-graham.md` + `commands/muse:paul-graham.md`. Benchmark grade A maintained with 10 personas. Docs refresh across README, PERSONAS.md, GETTING_STARTED.md, SKILL.md, ADVISORY_COUNCIL.md. Second repo-shipped interpretive persona for a still-active public figure — mandatory disclaimer + interpretive framing + right-of-publicity safeguards enforced by `/muse:build` C5 check.
- **v2.4.0-alpha**: First starter-pack extension. `personas/elon-musk.md` + `commands/muse:elon-musk.md`. Benchmark grade A maintained with 9 personas. `install.sh` persona count made dynamic. Docs refresh across README, PERSONAS.md, GETTING_STARTED.md, SKILL.md. First repo-ship of an interpretive persona for a still-active public figure — mandatory disclaimer + interpretive framing + right-of-publicity safeguards all enforced by `/muse:build` C5 check.
- **v2.3.2-alpha**: Docs-only refresh. README + PERSONAS.md + GETTING_STARTED.md + CONTRIBUTING.md + ARCHITECTURE.md + SESSIONS.md. Reframes muse as persona runtime + extensible catalog.
- **v2.3.1-alpha**: `/muse:who` triage command with 0-80 scoring rubric, top 5 pick list, chain/debate/council suggestions, inline handoff. 1 new command, ~400 lines. Zero persona edits.
- **v2.3.0-alpha**: 6 new slash commands (chain, all, debate, critic, list, spike MVP) + SKILL.md routing + README refresh. Completes the original v1 CEO plan. 17 commands total. ~2,000 net LoC.
- **v2.2.3-alpha**: Quote-aware B3 matcher + banned-pattern parser fix + `docs/BENCHMARKS.md` contributor doc + post-fix 3-prompt baseline.
- **v2.2.2-alpha**: `/muse:benchmark` — persona distinctiveness + voice + mode-fit regression detector. Subagent-based blind Turing simulation + Jaccard matrix + C1-C12 compliance + baseline comparison.
- **v2.2.1-alpha**: `/muse:build` + `/muse:update` hardened with spec review loop, concrete synthesis recipes, distinctiveness check, dry-run + rollback.
- **v2.2.0-alpha**: Adaptive sessions (QUICK/STANDARD/DEEP/CRITIC) + v2.2 persona schema (multi-tagline, voice rules, cognitive patterns, when-to-reach).
- **v2.1.0-beta**: `/muse:build` + `/muse:update` slash commands, persona compliance backfill, inline category tags, canonical mapping.
- **v2.1.0-alpha**: Structured 5-stage sessions + per-persona slash commands + session persistence.
- **v2.0.0-alpha**: Radical agentic refactor. Dropped yq/jq/bats/shellcheck dependencies. Pure markdown.
- **v1** (historical): Shell-tool-based CLI. See `docs/archive/CEO-PLAN-v1.md`.

Full changelog: [`docs/CHANGELOG.md`](docs/CHANGELOG.md).

---

## Documentation

- [Getting Started](docs/GETTING_STARTED.md) — First-time walkthrough, 5-minute tour of slash commands, discovering personas
- [Personas](docs/PERSONAS.md) — The starter pack with distinctive moves, extension guide, future catalog vision
- [Sessions](docs/SESSIONS.md) — Structured 5-stage session workflow, file format, grep/share/resume
- [Persona Schema](docs/PERSONA_SCHEMA.md) — v2.2 canonical reference for building or upgrading personas
- [Benchmarks](docs/BENCHMARKS.md) — `/muse:benchmark` methodology, 4 categories, 11 measures, baseline management
- [Architecture](docs/ARCHITECTURE.md) — Runtime design, slash vs free-text paths, content layer, v2.0/v2.1/v2.2/v2.3 layering
- [Contributing](docs/CONTRIBUTING.md) — How to add a persona, sharpen existing ones, legal notes for living figures
- [Changelog](docs/CHANGELOG.md) — Full version history
- [Adapter: Claude Code](adapters/claude-code/README.md)
- [Adapter: Codex CLI](adapters/codex/README.md)
- [Adapter: Gemini CLI](adapters/gemini/README.md)

---

## Contributing

Three paths:

**Add a new persona.** Gather research into `.archives/personas/<id>/`, run `/muse:build <id>`, PR the resulting `personas/<id>.md`. The distinctiveness check runs as part of `/muse:build` — a persona that would hurt the grade A benchmark won't land.

**Sharpen an existing persona.** Add a citation, tighten a signature move, improve a benchmark prompt. Each persona is a self-contained markdown file — open it, edit it, run `/muse:benchmark --diff`, PR it. No build step to break.

**Upgrade schema compliance.** If the schema evolves (v2.2 → v2.3 → v3.0), run `/muse:update --all --check` to see which personas drifted and fix them interactively.

**Legal note for living figures**: historical/public-domain figures are straightforward; living figures require a disclaimer and carry right-of-publicity risk. See [`docs/CONTRIBUTING.md`](docs/CONTRIBUTING.md).

Bug reports and feature requests: GitHub issues.

---

## Legal & privacy

Muse's starter pack ships primarily **historical and public-domain figures**. Feynman died 1988 but his written work is cited under fair-use educational-commentary terms; Socrates, Seneca, Marcus Aurelius, Aristotle, Confucius, Lao Tzu are all ancient. Living figures in the starter pack (currently **Dieter Rams**, **Elon Musk**, **Paul Graham**, and **Philip Kotler**) ship with explicit, mandatory interpretive disclaimers — outputs are commentary on publicly documented principles, **NOT quotation, NOT affiliation, NOT endorsement**, and **NOT predictions of what the person would actually say** on any specific matter.

The Elon Musk persona in particular carries a more extensive disclaimer (see `personas/elon-musk.md`) because Musk has a larger company-surface-area (Tesla, SpaceX, X Corp, Neuralink, The Boring Company, xAI) and a more active litigation profile than Rams. Every `/muse:elon-musk` session prints the full disclaimer at the top of the saved session file, and `SESSION.md` pre-flight auto-prints it before Stage 1.

If you build a persona for a living figure and plan to share it, read `docs/CONTRIBUTING.md` on right-of-publicity first. When in doubt, keep it local-only.

Muse does NOT store user data. All processing happens in your agent session. Session files are saved locally to `~/.muse/` and never transmitted anywhere. No telemetry. No analytics. No remote state.

If you build a living-figure persona and plan to share it, read `docs/CONTRIBUTING.md` section on right-of-publicity first. When in doubt, keep it local.

---

## License

MIT. See [`LICENSE`](LICENSE).

---

## Credits

Muse draws inspiration from Garry Tan's [gstack](https://github.com/garrytan/gstack) — his agentic skill framework for Claude Code — specifically his persona encoding patterns (voice rules with banned vocabulary, cognitive patterns as thinking instincts, adaptive workflow modes) and his `gstack/benchmark` skill (baseline-as-reference + layered thresholds + explanatory annotations, which became `/muse:benchmark`). gstack and muse serve different purposes (gstack is a development workflow toolkit; muse is a thinking toolkit) but the architecture lessons were load-bearing: *ship markdown, enforce at the content layer, let the agent be the runtime*.

The v3 persona catalog vision is modeled on [agentskills](https://github.com/anthropics/agentskills), the Claude Code skills catalog — browse, preview, clone individual skills without cloning the whole framework.

Persona research draws on public-domain texts, documented interviews, and secondary sources with explicit citations. Eval framework pattern owes to the reverse Turing literature.

Built because every builder I know has had the experience of reading a passage by Feynman or Socrates or Rams — or watching a keynote by someone alive today applying first-principles to rockets and cars — and thinking *"if they were in the room right now, they'd ask me the question that dissolves this problem in 30 seconds."* Muse is the attempt to make that room accessible, one markdown file at a time — whether the room is the 11 thinkers in the starter pack, or the 90 thinkers in a future catalog, or the single thinker you built yourself yesterday.

---

*Think with the greats. Build something they would have respected.*
