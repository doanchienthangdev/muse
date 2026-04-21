# Muse

![Muse — Think with the greats](public/images/home.jpg)

### Everyone wishes they could ask Musk. Or Aurelius. Or Buffett. Now you can.

*Great mentors, rebuilt as cognitive-tool frames. Your decision. Their thinking.*

---

**A hard decision has shown up in your life.** Maybe it's an investment. Maybe it's a career move. Maybe it's a product cut. Maybe it's whether to quit your job, fire a friend, or ship before you're ready. Maybe it's a life decision your mother asked you about last week and you still don't know what to tell her. Not because the decision is hard — because *it deserves a frame you don't have.*

Buffett would ask *"what percentage of the value lives in year ten and beyond?"* Grove would ask *"are you in wartime or peacetime right now?"* Marcus Aurelius would ask *"what's actually in your control here?"* Munger would ask *"what are the 4-5 tendencies stacking against you?"* Feynman would ask *"can you explain this without jargon?"* Jobs would ask *"what are you saying no to?"* Horowitz would ask *"is this a silver bullet fantasy or do you need lead bullets?"* Thiel would ask *"what important truth do very few people agree with you on?"* Seth Godin would ask *"who would miss you if you disappeared?"* Dieter Rams would audit the thing against ten principles.

Each frame takes five minutes and unlocks the decision.

**But you can't call them.** And the AI chatbots you've tried can *imitate* their writing style — they can't *run their thinking* on your actual problem. Knowing the quote doesn't help. Knowing the move does.

**Muse is the runtime for the move.** Great mentors, rebuilt as cognitive-tool frames — distilled from their own letters, books, long-form interviews, and talks — so their actual thinking runs on the decision in front of you. Not biography. Not quotes. The moves that made them who they were, applied to what you have to decide.

| Mentor | The move | When you reach for it |
|---|---|---|
| **Warren Buffett** | *Four-criteria filter + Mr. Market + moat-first* | Confusing price with value; chasing growth without durability |
| **Andy Grove** | *Wartime-or-peacetime + the algorithm + Cassandras* | Mis-classified the phase; executing the wrong playbook |
| **Steve Jobs** | *Say-no + demo-driven + memento-mori* | Building too much; haven't named what to cut |
| **Charlie Munger** | *Invert, always invert + lollapalooza* | One-cause story; need to count the forces stacking |
| **Ray Dalio** | *Pattern-match to historical template + principles-as-code* | Treating this as unprecedented; need a reference class |
| **Peter Thiel** | *Contrarian diagnostic + last-mover + secrets* | Market is "competitive"; should be a monopoly |
| **Sam Altman** | *Could-this-be-huge + 10x/12mo + second-derivative* | Modeling linearly when dynamics are exponential |
| **Ben Horowitz** | *Name-the-state + wartime-vs-peacetime + lead bullets* | Founder struggle has no handle; silver bullet fantasy |
| **Naval Ravikant** | *Specific knowledge + permission-less leverage* | Selling time instead of building compounding assets |
| **Paul Graham** | *Make something people want + name the pattern* | Confusing activity with progress |
| **Seth Godin** | *Name the pattern + who'd miss you?* | Trying to reach everyone; work isn't spreading |
| **Philip Kotler** | *STP before the Ps + triple bottom line* | Jumped to tactics before defining the customer |
| **David Ogilvy** | *Headline-that-sells + reason-why* | Writing copy for yourself instead of the reader |
| **Elon Musk** | *The algorithm + physics-as-constraint* | Inherited requirements are slowing you down |
| **Dieter Rams** | *Ten-principles audit* | A design is cluttered, loud, or trend-chasing |
| **Richard Feynman** | *Simplification test* | Jargon is covering for confusion |
| **Socrates** | *Definition hunting* | A central word is undefined |
| **Aristotle** | *Four causes + categorization* | Treating an ethics question as strategy |
| **Marcus Aurelius** | *Duty focus + dichotomy of control* | Paralyzed by ten competing priorities |
| **Seneca** | *Premeditatio malorum + time accounting* | Running flat out, no time to think |
| **Confucius** | *Rectification of names* | Restructuring an inherited system |
| **Lao Tzu** | *Wu wei + value of emptiness* | Pushing harder when you should do less |

You invoke one — `/muse:warren-buffett should I buy this company?` or `/muse:marcus-aurelius should I take this job?` — and it runs a 5–15 minute structured session applying *that specific move* to *your problem*. No character roleplay. No "as Buffett would say" padding. Just the cognitive move, applied rigorously, with a saved transcript you can re-read weeks later.

**What you get:**
- ✅ Five to fifteen minutes from question → concrete next action
- ✅ The specific mental move that made the mentor famous, applied to *your* actual problem
- ✅ A saved session file you can re-read, grep, or share
- ✅ Works inside your existing tools: Claude Code, Codex CLI, Gemini CLI
- ✅ Install in 30 seconds. Zero dependencies. Zero build step. Ship markdown; the agent handles the rest.

> *"What I cannot create, I do not understand."* — Richard Feynman's blackboard at the time of his death. When I read that line, I realized it's exactly what generic LLMs can't do: they can quote Feynman, but they can't *be the frame* that made him Feynman. Muse is the attempt to turn that frame into a runtime — and to do the same for every great mentor whose thinking deserves to be runnable.

```
/muse:who should I rewrite this service in Rust?
  → Scores all 22 personas. Top 3: Elon Musk 72/80 (the algorithm +
    first-principles cost decomposition + physics-as-constraint),
    Feynman 65/80 (hand calculation + cargo cult detection),
    Andy Grove 60/80 (wartime-or-peacetime classification).
    Pick one, and the session runs inline on your question.

/muse:warren-buffett should I buy this company at 30x earnings?
  → STANDARD mode detected. Stage 1 Frame: the four-criteria filter —
    understandable, favorable long-term prospects, honest competent
    management, attractive price. Stage 2: where on the moat? Stage 3:
    owner earnings vs GAAP. Stage 4: five-year-market-closed test.

/muse:ben-horowitz our competitor just raised $500M. What do we do?
  → STANDARD mode. Stage 1: wartime-vs-peacetime classification —
    are you actually in wartime? Stage 2: name the state.
    Stage 3: silver bullet vs lead bullets. Stage 4: the specific
    lead bullets you commit to. Stage 5: the next 90 days.

/muse:feynman why is my code slow?
  → QUICK mode detected (3-5 min). Stage 1 Frame: Feynman asks
    you to explain the bottleneck without jargon. If you can't,
    the jargon is covering for confusion. Then one hand-calculation
    probe. Then commit.

/muse:dieter-rams review src/landing.tsx
  → CRITIC mode detected (5-10 min). Stage 1': loads the file,
    runs ten principles audit, produces a findings inventory
    sorted by severity. Stage 3': you pick what to fix first.
    Stage 4-5 commit.

/muse:chain feynman→socrates→dieter-rams why is our product confusing?
  → 3 personas in sequence. Feynman surfaces the confusion,
    Socrates defines what "confusing" actually means, Rams
    audits the interface. Synthesis + one action.

/muse:debate buffett vs sam-altman should I invest in AI startups now?
  → 2 personas × 3 rounds. Round 1 openings, Round 2 tension,
    Round 3 framework-voice synthesis identifying where they
    agree and where they genuinely disagree.
```

Each session saves a markdown file to `~/.muse/sessions/` (or `~/.muse/chains/`, `~/.muse/debates/`, `~/.muse/critiques/` depending on command) that you can re-read, grep, share, or resume weeks later.

---

## What gets shipped

**Version 2.26.0-alpha**. ~15,000+ lines of content, zero lines of shell tooling.

Muse is a **persona runtime**. It ships with a curated starter pack of 22 great mentors and a full set of commands to use them, compose them, build new ones, and measure them. The starter pack is not a ceiling — it is a baseline. You can add personas locally via `/muse:build` in ~15 interactive questions, or pull new personas from the community via a future persona catalog (roadmap item — see § Roadmap).

Shipped artifacts:

### 🎭 Starter pack — 22 cognitive personas

A curated baseline covering first-principles, systems, design, philosophy, strategy, execution, investing, management, culture-design, and AI-industry strategy. Each persona is ~400-550 lines of structured markdown with multi-tagline, voice rules (core belief + banned patterns), 7-12 cognitive patterns, signature moves with inline category tags (framing/inquiry/test-probe/decide/commit), debate positions on canonical dilemmas, documented analogous problems with citations, and (for living figures) a Shadow section encoding the specific honesty disciplines the persona requires.

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
| `paul-graham` *(interpretive)* | Paul Graham | 1964– | strategy, execution, first-principles | *Make something people want* |
| `philip-kotler` *(interpretive)* | Philip Kotler | 1931– | strategy, execution, marketing | *Marketing is meeting needs profitably* |
| `seth-godin` *(interpretive)* | Seth Godin | 1960– | strategy, design, contrarian | *Make something worth talking about, for someone who'd miss you* |
| `david-ogilvy` *(interpretive)* | David Ogilvy | 1911-1999 | strategy, execution, copy | *The consumer isn't a moron; she's your wife* |
| `naval-ravikant` *(interpretive)* | Naval Ravikant | 1974– | strategy, execution, philosophy | *Seek wealth, not money* |
| `steve-jobs` *(interpretive)* | Steve Jobs | 1955-2011 | strategy, design, execution | *Focus is about saying no* |
| `charlie-munger` *(interpretive)* | Charlie Munger | 1924-2023 | first-principles, strategy, philosophy | *Invert, always invert* |
| `ray-dalio` *(interpretive)* | Ray Dalio | 1949– | macro, systems, pattern-recognition | *Pain + Reflection = Progress* |
| `peter-thiel` *(interpretive)* | Peter Thiel | 1967– | contrarian, monopoly-strategy, philosophy | *Competition is for losers* |
| `andy-grove` *(interpretive)* | Andy Grove | 1936-2016 | strategy, management, engineering | *Only the paranoid survive* |
| `warren-buffett` *(interpretive)* | Warren Buffett | 1930– | value-investing, capital-allocation | *Rule No. 1: Never lose money* |
| `sam-altman` *(interpretive)* | Sam Altman | 1985– | startup, capital-allocation, AI-industry | *Compounding exponentials are magic* |
| `ben-horowitz` *(interpretive)* | Ben Horowitz | 1966– | CEO-operating, culture-design, founder-coaching | *The Struggle is where greatness comes from* |

7 historical/public-domain + 15 interpretive (Rams, Musk, Graham, Kotler, Godin, Ogilvy, Naval, Jobs, Munger, Dalio, Thiel, Grove, Buffett, Altman, Horowitz — all with mandatory disclaimers and, where applicable, load-bearing Shadow sections encoding specific honesty disciplines). All pass benchmark grade A.

**Starter pack, not a ceiling.** If the cognitive frame you need is Jane Jacobs on cities, Claude Shannon on information theory, Hayao Miyazaki on craft, Nassim Taleb on antifragility, John Maynard Keynes on economic uncertainty, or anyone else — build it locally in ~15 interactive questions. The starter pack grows every few weeks: `elon-musk` added v2.4, `paul-graham` v2.5, `philip-kotler` v2.7 (rebuilt v2.8), `seth-godin` v2.11, `david-ogilvy` v2.17, `naval-ravikant` v2.18, `steve-jobs` v2.19, `charlie-munger` v2.20, `ray-dalio` v2.21, `peter-thiel` v2.22, `andy-grove` v2.23, `warren-buffett` v2.24, `sam-altman` v2.25, `ben-horowitz` v2.26 — each one built end-to-end via the same research pipeline that's available to any contributor. See § Build your own persona below.

### ⚙️ Runtime — 35+ slash commands

13 meta/orchestration commands + 22 persona commands. All self-contained, all structured step-by-step with validation and persistence. See § Commands reference for full list with characteristics.

### 📐 Framework — load-bearing specs

- **`SESSION.md`** (~730 lines) — the load-bearing workflow spec. Defines 5 adaptive session modes (QUICK, STANDARD, DEEP, CRITIC, EXPLORE), mode detection heuristic, stage graphs per mode, tagline selection, voice rules extraction, quality bars.
- **`SKILL.md`** (~830 lines) — the free-text dispatcher for Codex/Gemini CLI users. Routes `muse:<anything>` to the right Mode section. Kept in sync with slash command behavior.
- **`docs/PERSONA_SCHEMA.md`** (~450 lines) — canonical v2.2 schema reference for building or upgrading personas. C1-C12 compliance checks documented.
- **`docs/BENCHMARKS.md`** (~400 lines) — methodology explainer for `/muse:benchmark` (4 categories, 11 measures, 7 run modes, baseline management, worked confusion examples).

**v2.3 completed the original v1 CEO plan** — all 7 meta commands from the initial spec (`muse:all`, `muse:chain`, `muse:debate`, `muse:critic`, `muse:build`, `muse:spike`, `muse:list`) ship as slash commands, joined by `muse:update`, `muse:benchmark`, `muse:who`, `muse:refresh`, `muse:rebuild`, and `muse:continue` for the full meta surface. v2.11+ added research-pipeline infrastructure (4-subagent fanout, triple-verification, ghost-citation gates). v2.21-2.26 brought Shadow-section discipline for living figures with multiple-honesty-discipline encoding. Measurement-backed distinctiveness (grade A, 24/24 blind Turing) maintained across all 22 personas.

Zero dependencies. Zero shell scripts. Zero build step. The agent is the runtime.

---

## Who this is for

**Anyone facing a hard decision who wishes they could ask the right mentor.** Muse is for everyone — not just founders, not just operators, not just tech. If you have a decision worth a good frame, muse has a mentor for it.

**Operators who think for a living.** You ship code, ship product, make calls every day about scope, priorities, architecture, copy, hiring. You already use LLMs — but the LLM is generic, and your decisions are specific. Muse gives you *named mental moves* you can apply to your own problem, not an imitation of a celebrity's vocabulary.

**Founders running into the limits of their own framing.** You're too close to the problem. You need someone who would have framed it differently. Muse lets you rent Buffett for ten minutes on the acquisition, Horowitz on the layoff you're avoiding, Grove on the wartime pivot, or Socrates on *"what do you actually mean by growth?"* — and walk away with a concrete next action.

**Investors and capital allocators.** Buffett on the valuation. Thiel on whether this is a monopoly or commodity. Munger on what could go wrong. Dalio on where we are in the cycle. Altman on whether the compounding dynamics actually hold.

**Managers, leaders, and culture-builders.** Grove on the meeting discipline. Horowitz on the hard conversation. Aurelius on what you can actually control. Confucius on rectifying the names before restructuring the system.

**Students at career inflection points.** Marcus Aurelius on the job you're avoiding. Seneca on what you're trading your time for. Naval on building leverage instead of selling hours. Paul Graham on whether to start the thing you keep thinking about.

**Teams with opinionated thinkers.** Want your engineering team thinking like Feynman and your product team thinking like Rams? Ship personas as part of your internal tooling. Anyone who clones the muse repo — or your team's fork — gets the same mental moves.

**Anyone using Claude Code / Codex CLI / Gemini CLI who wants depth over breadth.** You don't need another productivity plugin. You need a way to slow down on the one decision that matters and think through it with a specific lens. Muse is that.

**Who this is not for**: if you want an AI that pretends to be Buffett for roleplay, use character.ai. If you want a prompt library, there are a dozen. Muse is neither. It's cognitive tools encoded as agentic skills.

---

## Install — 30 seconds

```bash
curl -fsSL https://raw.githubusercontent.com/doanchienthangdev/muse/main/install.sh | sh
```

That's it. No dependencies. No build. No package manager. The installer clones the repo to `~/.claude/skills/muse/`, copies all slash commands to `~/.claude/commands/`, and creates `~/.muse/sessions/` for your session artifacts. Restart Claude Code once and start typing:

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

For Codex CLI or Gemini CLI users (no slash command support), Muse invokes via free-text: `muse:warren-buffett <question>`, `muse:chain a→b <question>`, `muse:who <question>`. See `adapters/codex/README.md` and `adapters/gemini/README.md`.

---

## Discovering the right persona

You don't need to memorize 22 personas (or 80 someday) to use muse. Three entry points, from cold-start to expert:

### 1. `/muse:who <question>` — the triage command

Type your question without knowing the map. Muse scores every installed persona against your input using a transparent 0-80 rubric and shows you the top 5 with one-sentence rationales. Pick one and the session runs inline on the same question. If two personas are close, it suggests a chain. If they take opposing positions, it suggests a debate.

```
/muse:who should I invest $50K in this AI startup at 30x revenue?

MUSE TRIAGE — scoring 22 personas against your question

  "should I invest $50K in this AI startup at 30x revenue?"

Top 5 matches (score out of 80):

  A) Warren Buffett        75/80   Four-criteria filter + margin of safety
                                    + 30x revenue fails the price criterion
                                    under any reasonable moat assumption
  B) Peter Thiel           68/80   Contrarian diagnostic + monopoly question
                                    + why-now on the specific startup
  C) Sam Altman            62/80   10x/12mo check + compounding dynamics
                                    + is-this-could-be-huge screen
  D) Charlie Munger        58/80   Invert — what kills this investment?
                                    Lollapalooza of overconfidence signals
  E) Ray Dalio             45/80   Pattern-match to 1999 dot-com vs 2020s

  F) Chain: Warren Buffett → Peter Thiel
     Reason: top 2 scores within 15 pts + complementary (valuation →
     monopoly-structure)

  G) Debate: Warren Buffett vs Sam Altman
     Reason: classical value vs exponential-capture — genuine disagreement

  H) Abort
```

This is the cold-start entry point. Use it when you don't know who to ask.

### 2. `/muse:list [--category=<tag>]` — browse the installed set

Directory view of every installed persona grouped by category. Use when you want to see what's available before picking.

### 3. `/muse:<persona-id> <question>` — direct invocation (when you know who to ask)

Once you know the map, skip triage. Type the persona slash directly:

```
/muse:warren-buffett should I hold through this 40% drawdown?
/muse:ben-horowitz should I fire my VP of Sales?
/muse:marcus-aurelius should I take the promotion?
/muse:charlie-munger what could go wrong with this bet?
/muse:peter-thiel is my startup idea actually a monopoly?
/muse:dieter-rams review src/landing.tsx
```

Stage 0 of every persona session picks a mode (QUICK/STANDARD/DEEP/CRITIC) based on your question's shape and runs the matching stage graph.

---

## See it work

Here's a real session. `/muse:feynman why is my database query slow?`

```
Detected QUICK mode (3-5 min) because the question is a specific
tactical issue and implies time pressure. Run QUICK or switch?

A) Run QUICK (Recommended)
B) Force STANDARD (10-15 min, 5-stage flow)
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

Session saved: ~/.muse/sessions/2026-04-21-153012-feynman-why-my-db-query-slow.md
```

3 minutes. One hand-calculation probe. A saved artifact with the action, the reasoning, the cited Feynman source. This is the smallest possible muse session. A DEEP session runs 20 minutes and saves 300 lines.

---

## The 5 adaptive session modes

Every persona session detects the shape of your question and picks the right workflow. Stage 0 scores your question on 4 axes and routes to one of five modes. You can always override.

| Mode | Duration | Stages | When to pick |
|---|---|---|---|
| **QUICK** | 3-5 min | Stage 1 (brief Frame) → Stage 5 (Commit) | T≥4 and S≤3 — fast gut-check, low stakes, time pressure |
| **STANDARD** (default) | 10-15 min | Stage 1 → 2 → 3 → 4 → 5 | Balanced depth — the full 5-stage flow |
| **DEEP** | 20-30 min | Stage 0.5 (Premise Challenge) → 1 → 2 → 3 → 3.5 (Alternative Paths) → 4 → 5 (with 3-year retrospective) | S≥4 and T≤3 — bet-the-company, not in a hurry |
| **CRITIC** | 5-10 min | Stage 1' (Load artifact + critique) → 3' (Prioritize findings) → 4 → 5 | A≥3 — review existing plan, code, doc, or design |
| **EXPLORE** | unbounded | loop with convergence detection (v2.16+) | Extended exploration — thinking lands when it lands, not on a timer |

Stage 0 scores the question on:

- **S (stake)**: 1 = trivial preference, 5 = life/company direction
- **T (time pressure)**: 1 = reflect for weeks, 5 = decide today
- **C (concreteness)**: 1 = vague musing, 5 = specific action
- **A (artifact)**: 0 = no artifact, 5 = detailed plan/doc/code to review

Selection rule: `if A ≥ 3: CRITIC, elif S ≥ 4 and T ≤ 3: DEEP, elif T ≥ 4 and S ≤ 3: QUICK, else: STANDARD`. EXPLORE is user-invoked.

The mode is surfaced to you at Stage 0 via AskUserQuestion. You pick. The session locks the mode and runs that mode's stage graph end-to-end.

---

## Commands reference (35+ total — v2.26.0-alpha)

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

### 🎭 Persona sessions — the starter pack (22)

Each runs a 5-stage session (Stage 0 mode detection + Stages 1-5) and persists to `~/.muse/sessions/`. Listed roughly in order of addition to the starter pack.

- `/muse:feynman` — First principles + simplification + cargo cult detection + hand calculation
- `/muse:socrates` — Definition hunting + elenchus + ignorance acknowledgment + midwife method
- `/muse:seneca` — Time accounting + control filter + premeditatio malorum + memento mori
- `/muse:marcus-aurelius` — Dichotomy of control + duty focus + next right action + view from above
- `/muse:aristotle` — Four causes + golden mean + categorization + habit formation
- `/muse:confucius` — Rectification of names + lead by example + three-year test + reciprocity
- `/muse:lao-tzu` — Wu wei + value of emptiness + reversal + soft overcomes hard
- `/muse:dieter-rams` *(interpretive)* — Ten principles audit + "as little design as possible" + honest design
- `/muse:elon-musk` *(interpretive)* — First-principles cost decomposition + the algorithm + physics-as-only-constraint
- `/muse:paul-graham` *(interpretive)* — Make something people want + talk to your users + default alive or dead
- `/muse:philip-kotler` *(interpretive)* — STP before the Ps + broadening + layer don't replace + triple bottom line
- `/muse:seth-godin` *(interpretive)* — Name the pattern + who'd miss you + ship don't perfect
- `/muse:david-ogilvy` *(interpretive)* — Headline-that-sells + reason-why + research before concepts
- `/muse:naval-ravikant` *(interpretive)* — Specific knowledge + permission-less leverage + wealth not money
- `/muse:steve-jobs` *(interpretive)* — Name the no + end-to-end ownership + demo or off + memento mori filter
- `/muse:charlie-munger` *(interpretive)* — Invert always invert + lollapalooza + iron prescription on opinions
- `/muse:ray-dalio` *(interpretive)* — Pattern-match to historical template + principles-as-code + believability-weighting
- `/muse:peter-thiel` *(interpretive)* — Contrarian diagnostic + 2×2 civilizational map + last-mover + secrets
- `/muse:andy-grove` *(interpretive)* — New-CEO thought experiment + wartime/peacetime + 10x force + Cassandras
- `/muse:warren-buffett` *(interpretive)* — Four-criteria filter + Mr. Market + moat-first + owner earnings
- `/muse:sam-altman` *(interpretive)* — Could-this-be-huge + why-now + compounding as master frame + 10x/12mo
- `/muse:ben-horowitz` *(interpretive)* — Name-the-state + wartime-vs-peacetime + lead bullets + sharpen contradictions

### 🎭 Multi-persona orchestration (4)

| Command | Attrs | What it does |
|---|---|---|
| `/muse:all <question>` | 💬 💾 🎭 | Default 5-persona Council preset in sequence, each handing off a 2-3 sentence summary to the next. Final framework-voice synthesis. |
| `/muse:chain p1→p2→p3 <question>` | 💬 💾 🎭 | Arbitrary sequential chain. Inline orchestration with auto-summarize when N>5 personas or 30 KB context. |
| `/muse:debate pA vs pB <question>` | 💬 💾 🎭 | 2 personas × 3 rounds (opening, tension, framework-voice synthesis). Graceful degradation when one persona lacks `debate_positions`. |
| `/muse:critic <file> --persona=<id>` | 💬 💾 🎭 | Apply a persona's `critic_frames` to an existing artifact (file). Supports `--chain=p1,p2,p3` for parallel multi-persona critique. |

### 🛠️ Persona lifecycle (4)

| Command | Attrs | What it does |
|---|---|---|
| `/muse:build <persona-id>` | 💬 💾 | Interactive persona builder. Reads research from `.archives/personas/<id>/`, uses 4-subagent research pipeline (articles/transcripts/books/root), runs Synthesis Plan audit + inline gates during drafting + C1-C12 compliance + distinctiveness check + save-gate, then atomic mv to `personas/<id>.md`. |
| `/muse:update <persona-id>` | 💬 💾 | Upgrade an existing persona to the current schema version. Detects gaps, walks you through fixes per field. Supports `--all --check` for batch dry-run scan. |
| `/muse:refresh <persona-id>` | 💬 💾 | Incremental re-mine for living figures — only processes files newer than last build. |
| `/muse:rebuild <persona-id>` | 💬 💾 | Full rebuild with backup + diff + A/B comparison. |

### 📊 Evaluation (2)

| Command | Attrs | What it does |
|---|---|---|
| `/muse:benchmark [--baseline \| --diff \| --quick \| --persona=<id>]` | 💾 | Measure persona distinctiveness + voice discipline + schema compliance + mode fit. 4 categories, 11 measures. Grade A maintained across all 22 personas. |
| `/muse:spike [--personas=<csv>] [--seed=<n>] [--mode=gather\|dry\|score]` | 💾 🔑 | Scientific distinctiveness eval via real Claude API calls. |

### 🔁 Continuity (1)

| Command | Attrs | What it does |
|---|---|---|
| `/muse:continue <session-ref>` | 💬 💾 | Resume a saved session — load the file, restore state, continue from where you left off. |

### Free-text fallback

All commands have free-text equivalents (e.g., `muse:warren-buffett <text>`, `muse:chain a→b <text>`, `muse:who <text>`) that route through the `SKILL.md` `Mode:` sections. This is for Codex CLI and Gemini CLI users, and as a fallback. Claude Code users should always prefer slash commands — they have structured step-by-step orchestration, validation, and persistence.

All commands run **inside your agent session**. No separate CLI to install. No shell tooling to maintain.

---

## Build your own persona

The 22 personas in the starter pack are a baseline, not a ceiling. Muse is designed from day one for local persona authoring. If you want to add, say, Jane Jacobs on cities, Claude Shannon on information theory, Hayao Miyazaki on craft, Nassim Taleb on antifragility, John Maynard Keynes, Simone Weil, or anyone else — build it in ~15 interactive questions:

```
1. Gather research
   mkdir -p ~/.claude/skills/muse/.archives/personas/jane-jacobs/
   # Drop in biography excerpts, interview transcripts, primary text,
   # case studies. Files: .md, .txt, .srt, .vtt, .json, .pdf, .epub

2. Run /muse:build
   /muse:build jane-jacobs

3. The workflow walks you through research mining + spec authoring:
   - 4-subagent research pipeline (articles/transcripts/books/root)
   - ~15 persona fields interactively (taglines, signature moves,
     voice rules, cognitive patterns, debate positions, when-to-reach,
     session mode preferences, analogous problems, sources, benchmark
     prompts, living_status + disclaimer if applicable)
   - Synthesis Plan audit before drafting
   - Inline gates during Step 4 drafting (prevents ghost citations)
   - Spec review loop (max 3 iterations) with adversarial reviewer
   - C1-C12 compliance validation + distinctiveness check
   - Save-gate benchmark + balanced-provenance check

4. File lands at personas/jane-jacobs.md (v2.2-compliant).

5. Immediately usable as /muse:jane-jacobs <question> and appears
   in /muse:list, /muse:who, /muse:all chains, /muse:debate, /muse:critic.
```

The new persona is fully equal to starter-pack personas — no special treatment, no second-class status. `/muse:who` will score it in triage, `/muse:benchmark` will include it in the distinctiveness grid, `/muse:update` and `/muse:refresh` will keep it current as the schema evolves and new source material becomes available.

### Legal note for living figures

For historical/public-domain figures (deceased before ~1950 or out of copyright), set `living_status: historical`, no mandatory disclaimer, proceed normally.

For living figures or estate-protected names (Jobs estate, Musk, Bezos, Buffett, etc.), set `living_status: living` or `estate_protected` and include a disclaimer in BOTH the frontmatter AND a body blockquote immediately after the tagline (see any v2.20+ persona for the format). SESSION.md auto-prints the disclaimer at the top of every session using that persona. `/muse:build` refuses to save a living-figure persona without the disclaimer. v2.21+ personas (Dalio, Thiel, Grove, Buffett, Altman, Horowitz) additionally include a **Shadow section** encoding specific honesty disciplines — political-scope boundary, vested-interest flag, critical-counter-perspective acknowledgment, forecast-refusal honesty, etc. See [`docs/CONTRIBUTING.md`](docs/CONTRIBUTING.md) for right-of-publicity guidance.

When in doubt: **keep living-figure personas local**. Don't share them until you've thought through the legal implications.

---

## How muse is different from "prompt X as Feynman"

1. **Cognitive moves as reusable tools, not personality imitation.** `/muse:feynman` runs Feynman's *simplification test* — the specific mental action — regardless of whether the output sounds like his speaking style. The tool is the move, not the voice.

2. **Citation-grounded claims with ghost-citation gates.** Every factual claim about what the persona said/did resolves to a source ID. Plato's *Apology*, Feynman's *Lectures on Physics*, Marcus Aurelius's *Meditations*, Buffett's Berkshire letters, Horowitz's *Hard Thing About Hard Things*. The v2.11+ research pipeline has explicit ghost-citation gates — if a quote can't be verified against a primary source file, the persona won't save.

3. **Multi-persona orchestration.** `/muse:chain` runs personas in sequence. `/muse:debate` runs two personas in 3 rounds and surfaces where they agree (often robust) and where they disagree (often the real tension). `/muse:critic --chain=p1,p2,p3` runs parallel per-persona critiques with consensus/unique/disagreement synthesis. Character.ai cannot do this. Prompt libraries cannot do this.

4. **Adaptive workflow.** Sessions detect question shape and pick mode. A quick gut-check does not get the same 15-minute ceremony as a bet-the-company decision.

5. **Persona distinctiveness is enforced by schema and measurement.** `/muse:build` refuses to save a persona whose signature moves don't cover the three session stage categories. `/muse:update` detects gaps. `/muse:benchmark` measures distinctiveness via blind Turing simulation and flags regressions.

6. **Living-figure Shadow discipline.** v2.21+ living-figure personas (Dalio, Thiel, Grove, Buffett, Altman, Horowitz) encode specific honesty disciplines in their Shadow sections: political-scope boundaries, vested-interest flags, critical-counter-perspective acknowledgment, forecast-refusal, Munger-influence-honesty, etc. When users ask the persona to validate or ventriloquize outside its documented scope, the persona declines and routes back. This is what honest interpretive use of a living public figure looks like.

7. **Runs anywhere the agent runs.** Claude Code, Codex CLI, Gemini CLI — all the same markdown. No per-platform shell tooling to maintain.

8. **Extensible by design.** The starter pack is 22 personas (growing). The runtime supports arbitrary local personas via `/muse:build`. A future persona catalog (§ Roadmap) will let users browse and clone individual personas without cloning the whole framework.

---

## Philosophy

Muse is a content repository. The agent is the runtime. The framework is the discipline encoded in SESSION.md and the persona files.

This is deliberately different from most AI developer tools, which ship a CLI or a library plus content. Muse tried that (v1 had bash scripts and JSON schemas and bats tests) and it was wrong: an agentic skill does not need a shell toolchain to work, because the agent already has Read, Glob, Bash, and Write tools. The content IS the framework.

What you pay for with this architecture: no runtime validation, no caching, no type safety at the schema level. What you get: zero install friction, zero per-platform adaptation, clean code review (every change is a markdown diff), and the ability to extend with new personas in minutes without touching any code.

The quality bar comes from the content, not the infrastructure:
- Every persona must pass C1-C12 compliance before save.
- Every session stage has a named quality bar (distinctiveness, mode fit, voice discipline, concreteness, citation).
- Every SESSION.md rule has a fallback for when a persona is incomplete.
- `/muse:benchmark` measures distinctiveness empirically, not just by taste. Grade A across all 22 personas.
- Living-figure personas have Shadow sections that encode specific honesty disciplines — the persona declines its own misuse.

This is the agentic pattern. Ship markdown, enforce at the content layer, let the agent run the workflow.

---

## Roadmap

Muse's long-term direction: **a persona runtime + an extensible persona catalog**.

**Shipping today** (v2.26.0-alpha):
- 22 starter-pack personas across 8+ categories (philosophy, first-principles, design, systems, strategy, execution, investing, management/culture, AI-industry)
- 35+ slash commands (13 meta + 22 persona), 5 adaptive session modes (QUICK, STANDARD, DEEP, CRITIC, EXPLORE)
- `/muse:who` for cold-start triage, `/muse:build` + `/muse:refresh` + `/muse:rebuild` for local authoring and maintenance
- `/muse:benchmark` with measurement-backed distinctiveness (grade A maintained)
- Full multi-persona orchestration (chain, debate, critic, all)
- Research pipeline v2.14 (4-subagent fanout, triple-verification, ghost-citation gates, envelope persistence, semantic similarity, adaptive book budgets)
- Living-figure Shadow discipline v2.21+ (political-scope boundary, vested-interest flag, critical-counter-perspective acknowledgment, forecast-refusal, circle-of-competence honesty)

**Near-term**:
- **More starter personas** — candidates include Jane Jacobs, Claude Shannon, Nassim Taleb, John Maynard Keynes, Simone Weil, Hayao Miyazaki, Taleb, Kahneman, and others.
- **Routing accuracy benchmark** — `/muse:benchmark` extended with routing-accuracy measure to evaluate `/muse:who` picks.
- **`/muse:spike --mode=score`** — automated cross-reference of human judge answers.
- **CI integration** — GitHub Actions workflow that runs `/muse:benchmark --diff` on every PR.

**v3+ vision** — **the persona catalog**:

Muse's longest-term direction is a public catalog of community-authored personas, similar to how Claude Code skills work in [agentskills](https://github.com/anthropics/agentskills). A user will be able to:

1. **Browse** personas by category, era, domain, popularity, or specific signature moves
2. **Preview** a persona's cognitive frame + sample sessions before installing
3. **Clone** an individual persona to their local muse install — not the whole framework, just the `.md` file
4. **Update** cloned personas with a single command when authors ship improvements
5. **Contribute** by publishing their own locally-built persona via PR, with an automated distinctiveness check gate

v2.26 is the mature foundation; v3.0 is when the catalog becomes real.

In the meantime, **share via PR**. If you build a good persona, open a PR to add it to the starter pack, and if the distinctiveness check passes, it ships.

---

## Status

**v2.26.0-alpha** — `ben-horowitz` persona joins the starter pack (22 personas). CEO-operating system + named CEO states + culture-as-action design. 7 signature moves (name-and-define-the-thing, wartime-vs-peacetime, silver-vs-lead-bullets, did-you-already-know, culture-as-action, good-X/bad-X, sharpen-contradictions), 12 cognitive patterns, 8 analogous cases, 8 benchmark prompts. Built from 2 books (*The Hard Thing About Hard Things* 2014, *What You Do Is Who You Are* 2019) + 11 articles + 8 verbatim transcripts totaling ~99,500 words. **Seven load-bearing honesty disciplines encoded**: living-subject honesty (early-a16z vs 2020s a16z voice), political/a16z-joint-position scope discipline (DeSantis/Trump endorsement + crypto advocacy + 2023 Techno-Optimist Manifesto OUT-OF-SCOPE), vested-interest flag (a16z GP $45B+ AUM), "The Struggle" romanticization risk (state-not-identity discipline), "Wartime CEO" misapplication (cruelty/laziness cover), hip-hop literacy (Paid in Full Foundation documented substance vs performative citation), founder-CEO-advantage vs founder-CEO-incompetence tension. Grade A maintained. 110 regression pairs green (22 personas × 5 modes).

**v2.25.0-alpha** — `sam-altman` persona (21 personas). Compounding as master frame + exponential-capture + 10x/12mo check. Seven load-bearing disciplines including political/drama-scope (Nov 2023 firing via Altman's own Reflections only), Hao/Hagey critical-counter-perspective, vested-interest (OpenAI + Helion + Worldcoin), forecast-refusal, reframe-vs-deflection distinction.

**v2.24.0-alpha** — `warren-buffett` persona (20 personas). Four-criteria filter + Mr. Market + moat-first + owner earnings. Six load-bearing disciplines including Munger-influence honesty, concentration-vs-diversification scale-appropriate asymmetry, circle-of-competence honesty on the persona itself.

**v2.23.0-alpha** — `andy-grove` persona (19 personas). New-CEO thought experiment + wartime/peacetime + 10x force + Cassandras + constructive confrontation (Grove's original). Three load-bearing disciplines: constructive-confrontation-distortion honesty, paranoia-as-method-vs-aesthetic, OKR-discipline-vs-OKR-theater.

**v2.22.0-alpha** — `peter-thiel` persona (18 personas). Contrarian diagnostic + 2×2 civilizational map + last-mover + secrets. Three load-bearing disciplines: political-scope boundary, Cato 2009 retraction honesty, contrarian-as-method-vs-posture.

**v2.21.0-alpha** — `ray-dalio` persona (17 personas). Pattern-match to historical template + principles-as-code + believability-weighting + the five-step process + where-are-we-in-the-cycle. Three load-bearing disciplines: Copeland critical-perspective honesty, probabilistic humility on macro calls, regime-detection on pattern-matching.

**v2.20.0-alpha** — `charlie-munger` persona (16 personas). Invert-always-invert + multidisciplinary latticework + lollapalooza + iron prescription on opinions.

**v2.19.0-alpha** — `steve-jobs` persona (15 personas). Name the no + end-to-end accountability trace + demo-driven + memento-mori decision filter.

**v2.18.0-alpha** — `naval-ravikant` persona (14 personas). Specific knowledge + permission-less leverage + wealth not money.

**v2.17.0-alpha** — `david-ogilvy` persona (13 personas). Headline-that-sells + reason-why + research before concepts.

**v2.16.0-alpha** — Adaptive session runtime. EXPLORE mode, convergence loop, threads, handoff, council, artifacts.

**v2.14.0-alpha** — Research pipeline "Phase 2 — Pipeline brains": envelope persistence, semantic similarity for exclusive filter, context-budget awareness, book-length adaptive budgets, rejected-candidates visibility to spec reviewer, auto-retry on subagent timeout.

**v2.13.0-alpha** — Persona-quality overhaul Phase 1: Synthesis Plan audit + inline gates + year-archive granularity + save-time benchmark + balanced-provenance gate.

Version history (earlier): v2.11 seth-godin; v2.7-8 philip-kotler + rebuild; v2.5 paul-graham; v2.4 elon-musk; v2.3 meta-commands + /muse:who triage; v2.2 adaptive sessions + v2.2 schema; v2.1 structured 5-stage sessions; v2.0 radical agentic refactor (dropped all shell tooling); v1 shell-tool-based CLI (archived).

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

**Legal note for living figures**: historical/public-domain figures are straightforward; living figures require a disclaimer, a Shadow section (v2.21+), and carry right-of-publicity risk. See [`docs/CONTRIBUTING.md`](docs/CONTRIBUTING.md).

Bug reports and feature requests: GitHub issues.

---

## Legal & privacy

Muse's starter pack ships a mix of **historical/public-domain figures** and **living/estate-protected interpretive figures**. Historical figures (Feynman d.1988, Socrates, Seneca, Marcus Aurelius, Aristotle, Confucius, Lao Tzu, Steve Jobs d.2011, Charlie Munger d.2023, David Ogilvy d.1999, Andy Grove d.2016) are cited under fair-use educational-commentary terms.

Living figures and estate-protected interpretive personas currently include **Dieter Rams, Elon Musk, Paul Graham, Philip Kotler, Seth Godin, Naval Ravikant, Ray Dalio, Peter Thiel, Warren Buffett, Sam Altman, and Ben Horowitz** — each ships with explicit, mandatory interpretive disclaimers. Outputs are commentary on publicly documented principles, **NOT quotation, NOT affiliation, NOT endorsement**, and **NOT predictions of what the person would actually say** on any specific matter.

**v2.21+ living-figure personas carry additional Shadow sections** that encode specific honesty disciplines — political-scope boundaries, vested-interest flags, critical-counter-perspective acknowledgment, forecast-refusal honesty, circle-of-competence honesty on the persona itself. These disciplines are not optional — they're load-bearing for honest interpretive use. When a user asks the persona to opine outside its documented scope, the persona declines and routes back. Examples:
- **Ray Dalio**'s Copeland-gap honesty (*The Fund* 2023 critical counter-perspective encoded in Shadow)
- **Peter Thiel**'s political-scope boundary (Trump/Vance backing, Gawker, out-of-scope)
- **Warren Buffett**'s Munger-influence honesty + retail-vs-Berkshire-scale asymmetry
- **Sam Altman**'s seven disciplines incl. Hao/Hagey critical-counter-perspective + Nov 2023 firing via Altman's own Reflections only
- **Ben Horowitz**'s political/a16z-joint-position scope discipline + vested-interest flag + hip-hop-literacy-substance-not-performative

Every `/muse:<living-figure>` session prints the full disclaimer at the top of the saved session file, and `SESSION.md` pre-flight auto-prints it before Stage 1.

If you build a persona for a living figure and plan to share it, read `docs/CONTRIBUTING.md` on right-of-publicity first. When in doubt, keep it local-only.

Muse does NOT store user data. All processing happens in your agent session. Session files are saved locally to `~/.muse/` and never transmitted anywhere. No telemetry. No analytics. No remote state.

---

## License

MIT. See [`LICENSE`](LICENSE).

---

## Credits

Muse draws inspiration from Garry Tan's [gstack](https://github.com/garrytan/gstack) — his agentic skill framework for Claude Code — specifically his persona encoding patterns (voice rules with banned vocabulary, cognitive patterns as thinking instincts, adaptive workflow modes) and his `gstack/benchmark` skill (baseline-as-reference + layered thresholds + explanatory annotations, which became `/muse:benchmark`). gstack and muse serve different purposes (gstack is a development workflow toolkit; muse is a thinking toolkit) but the architecture lessons were load-bearing: *ship markdown, enforce at the content layer, let the agent be the runtime*.

The v3 persona catalog vision is modeled on [agentskills](https://github.com/anthropics/agentskills), the Claude Code skills catalog — browse, preview, clone individual skills without cloning the whole framework.

Persona research draws on primary-source texts — letters, books, long-form interviews, talks — with explicit citations and ghost-citation gates. Eval framework pattern owes to the reverse Turing literature.

Built because everyone I know has had the experience of reading a letter by Buffett or a passage by Aurelius or Feynman — or watching a talk by someone alive today cutting through a problem in a way nobody else does — and thinking *"if they were in the room right now, they'd ask me the question that dissolves this problem in 30 seconds."* Muse is the attempt to make that room accessible, one markdown file at a time — whether the room has 22 great mentors in the starter pack, or 90 in a future catalog, or the single mentor you built yourself yesterday from the books on your shelf.

---

*Great mentors, on demand. Think with them. Build something they would have respected.*
