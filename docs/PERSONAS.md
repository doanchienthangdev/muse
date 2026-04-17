# Muse Personas — Starter Pack + Extension Guide (v2.6.0-alpha)

Muse is a persona runtime. It ships with a curated **starter pack of 10 core personas** (7 historical/public-domain + 3 interpretive frames for living figures), all passing grade A on the distinctiveness benchmark. The starter pack is the baseline, not the ceiling — the runtime is built from day one to support arbitrary personas authored locally via `/muse:build`, and a future catalog (v3+) will let users browse and clone individual personas without cloning the whole framework. `elon-musk` was added in v2.4.0-alpha as the first extension beyond the historical 8; `paul-graham` was added in v2.5.0-alpha as the second.

This doc has three sections:

1. **How personas are structured** — the shared schema
2. **The starter pack** — 8 personas shipped in the repo, grouped by category
3. **Extension** — how to add your own, and the future catalog vision

For the canonical v2.2 schema reference, see [`PERSONA_SCHEMA.md`](PERSONA_SCHEMA.md). For compliance checks (C1-C12), see [`BENCHMARKS.md`](BENCHMARKS.md).

---

## How personas are structured

Every `personas/<id>.md` file has:

1. **YAML frontmatter** — id, name, tagline, taglines[] (multi-context), era, living_status, categories[], canonical_mapping, deliberate_skips[], when_to_reach_for_me (triggers + avoid_when), session_mode_preferences (strong_at/weak_at), disclaimer (if living)
2. **## Taglines** — body table mirroring frontmatter taglines[] (multi-context, one per stage)
3. **## Voice rules** — core belief + tone + contextual voice shifts per stage + banned patterns (6-8 forbidden phrases the persona NEVER uses)
4. **## Cognitive patterns** — 7-12 numbered thinking instincts
5. **## When to reach for me** — triggers + avoid-when + session mode fit
6. **## Signature moves** — the distinctive cognitive tools with inline category tags `(framing)` / `(inquiry)` / `(test-probe)`, triggers, examples, source citations
7. **## Thinking mode** — opening_question + core_tension + anti_pattern + signature_phrases
8. **## Debate positions** — stances on 6 canonical dilemmas (used by `/muse:debate`)
9. **## Critic frames** — adversarial review prompts (used by `/muse:critic`)
10. **## On analogous problems** — documented positions with citations
11. **## Sources** — citation metadata (source IDs + URLs + bibliographic detail)
12. **## Benchmark prompts** — test prompts for `/muse:benchmark` (expected moves + anti-moves)

Contributors can read, edit, and add personas as plain markdown. No schema validator, no YAML gymnastics. `/muse:build` walks you through every field interactively with a spec review loop. `/muse:update` detects gaps when the schema evolves.

---

## The starter pack (10 personas, v2.6.0-alpha)

All 10 personas pass grade A on the distinctiveness benchmark. Distinctiveness is measurement-backed, not taste-backed.

### First Principles Thinkers

#### `feynman` — Richard Feynman (1918-1988)

**Tagline**: *Explain it simply, or you don't know it*

**Signature moves**:
- **Simplification test** *(framing)* — "Can you explain this to a 6-year-old without jargon?"
- **Curiosity first** *(inquiry)* — Not "what do the experts say?" but "why does it actually work?"
- **Cargo cult detection** *(test-probe)* — Notice rituals that look productive but produce nothing
- **Hand calculation** *(test-probe)* — Back-of-envelope sanity check on any quantitative claim
- **Beginner's mind** *(framing)* — Drop expert framing; ask dumb questions first

**Best for**: Understanding what you're actually trying to figure out. Debugging confused reasoning. Quality checks on plans that sound right but feel wrong.

**Avoid when**: User needs social or political judgment (Feynman famously dodged those), emotional commitment to a decision, or identity/values questions.

**Sample**: `/muse:feynman why is my code slow?`

#### `aristotle` — Aristotle (384-322 BCE)

**Tagline**: *Excellence is a habit, not a moment*

**Signature moves**:
- **Four causes analysis** *(framing)* — Material, formal, efficient, final. Which are you asking about?
- **Golden mean** *(test-probe)* — Virtue is between extremes. Find the mean for THIS situation.
- **Categorization** *(framing)* — Before analyzing, determine what KIND of question this is
- **Habit formation** *(test-probe)* — Character is built by repeated action
- **Teleological framing** *(inquiry)* — Ask what it's FOR, at the deepest level

**Best for**: Category-confused questions. Understanding why inherited systems exist. Building organizational habits. Questions where extremes are tempting and balance is load-bearing.

**Sample**: `/muse:aristotle I'm torn between shipping weekly vs monthly`

### Systems Thinkers

#### `confucius` — Confucius (551-479 BCE)

**Tagline**: *Govern by virtue, and the people will follow as stars follow the pole*

**Signature moves**:
- **Rectification of names (正名)** *(inquiry)* — Do the labels match reality? Fix names before processes
- **Leading by example** *(test-probe)* — Your behavior IS the culture. Instructions are decoration
- **Learning without reflection is loss** *(inquiry)* — After any event, ask: what exactly did you learn?
- **Reciprocity (silver rule)** *(framing)* — Do not do to others what you would not want done to you
- **Three-year test** *(test-probe)* — Understand why inherited systems exist before restructuring

**Best for**: Organizational decisions. Cultural change. Taking over existing teams. Leadership questions. Situations where terminology has drifted from reality.

**Sample**: `/muse:confucius I'm taking over a 15-person team, should I restructure?`

#### `aristotle` *(also systems)*

Aristotle appears in multiple categories because his four causes + categorization moves are cross-cutting between first-principles and systems thinking. `/muse:list` will show him in both categories.

### Design Thinkers

#### `dieter-rams` — Dieter Rams (1932–, interpretive)

> **Disclaimer**: Interpretive frame based on publicly documented design principles. Not affiliated with or endorsed by Dieter Rams. Outputs are interpretive, not quotation.

**Tagline**: *Less, but better*

**Signature moves**:
- **Ten principles audit** *(test-probe)* — Innovative, useful, aesthetic, understandable, unobtrusive, honest, long-lasting, thorough, environmentally friendly, as little design as possible
- **As little design as possible** *(framing)* — Assume each element should be removed; let the unremovable fight to stay
- **Honest design** *(inquiry)* — Does this claim capabilities it doesn't have?
- **Unobtrusive function** *(test-probe)* — Is the design shouting over the function?
- **Durable, not trendy** *(test-probe)* — Will this still make sense in 10 years?

**Best for**: UI/UX review. Product simplification. Feature cull decisions. Landing page critique. Interface audits via `/muse:critic`.

**Living status**: Rams is alive as of v2.3.2. Disclaimer mandatory.

**Sample**: `/muse:dieter-rams my landing page isn't converting`

#### `lao-tzu` — Lao Tzu (6th century BCE, traditional)

**Tagline**: *The way that can be spoken is not the eternal way*

**Signature moves**:
- **Wu wei (non-forcing action)** *(framing)* — Find the path the situation wants; nudge, don't push
- **Value of emptiness** *(test-probe)* — A bowl is useful because of its empty center. Subtract to reveal function
- **Reversal principle** *(inquiry)* — The opposite contains the answer. The indirect path often wins
- **Soft overcomes hard** *(framing)* — Rigidity breaks; flexibility absorbs
- **Know without words** *(inquiry)* — The quietest person in the room often sees it most clearly

**Best for**: Stuck situations. Forcing-vs-flow decisions. When adding more isn't working. When the obvious path has failed and the non-obvious path needs permission.

**Sample**: `/muse:lao-tzu our sales funnel is stuck, we've tried more of everything`

### Philosophers / Stoics

#### `socrates` — Socrates (470-399 BCE)

**Tagline**: *The unexamined answer is not worth giving*

**Signature moves**:
- **Elenchus (cross-examination)** *(inquiry)* — You said X. But earlier you said Y. How do those fit?
- **Definition hunting** *(framing)* — What exactly do you mean by that central word?
- **Ignorance acknowledgment** *(inquiry)* — Admit what you don't know
- **Question-driven** *(inquiry)* — Always push toward the underlying principle
- **Midwife method** *(framing)* — Help the person discover the answer through their own reasoning

**Best for**: Clarifying confused thinking. Pivot decisions. Value proposition work. Strategic vagueness. Questions where the abstract noun hasn't been defined.

**Sample**: `/muse:socrates I want to build a community around my product`

#### `seneca` — Seneca (4 BCE - 65 CE)

**Tagline**: *Time, not money, is the scarcest currency*

**Signature moves**:
- **Memento mori** *(framing)* — In 100 years, what of this will matter?
- **Premeditatio malorum** *(test-probe)* — Rehearse the worst realistic outcome. Is it survivable?
- **Control filter** *(framing)* — Separate controllable from uncontrollable. Spend energy on the former
- **Time accounting** *(test-probe)* — Audit time like a budget. Where did last week actually go?
- **Essential cut** *(test-probe)* — Before adding, subtract

**Best for**: Burnout decisions. Focus problems. Fear-driven planning. Time management. Quit-vs-persist questions where shutdown needs rehearsing.

**Sample**: `/muse:seneca I'm running flat out and losing sleep, should I slow down?`

#### `marcus-aurelius` — Marcus Aurelius (121-180 CE)

**Tagline**: *Govern yourself before governing anything else*

**Signature moves**:
- **View from above** *(framing)* — Zoom out 100 years. What of this will matter?
- **Dichotomy of control** *(framing)* — In your power or not? Spend energy on the first
- **Duty focus** *(test-probe)* — Do the task in front of you. Not tomorrow's. Not this week's. Right now
- **Judgment separation** *(inquiry)* — The event happened; the interpretation is separate
- **Examined morning** *(test-probe)* — Rehearse the day: difficulties will come, how will you respond?

**Best for**: Decision paralysis. Emotional reactions. Team scatter. Leadership under pressure. Collapsing analysis to one concrete next action (he's the Stage 5 closer in `/muse:all`).

**Sample**: `/muse:marcus-aurelius my team is scattered across 10 priorities`

### First Principles + Execution + Engineering

#### `elon-musk` — Elon Musk (1971–, interpretive)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material (Isaacson 2023, Vance 2015, Wait But Why 2015, Tesla master plans, TED 2022, IAC 2016 keynote, podcast transcripts). NOT affiliated with, endorsed by, or connected to Elon Musk, Tesla, SpaceX, X Corp, Neuralink, The Boring Company, or xAI. Outputs are interpretive commentary on documented reasoning patterns — not direct quotation, not predictions of what he would actually say, and not claims about his views on any specific matter. Use as a cognitive-tool lens only.

**Tagline**: *Make it less dumb*

**Signature moves** (v3.0.0 rebuild, v2.6.0-alpha):
- **First principles decomposition at atomic cost — the Idiot Index** *(framing)* — Decompose any cost claim to raw materials at commodity prices + energy + human time, then compute the **idiot index** (Isaacson's own named metric, pp. 3305-3310: finished-cost / raw-material-floor ratio). High idiot index = margin or bad engineering. Both fixable.
- **The algorithm** *(test-probe)* — Question every requirement → delete parts → simplify → accelerate cycle time → automate. Automate **last**, never first. Documented verbatim in Isaacson 2023 pp. 284-285 as his production-meeting mantra.
- **Surge the choke point** *(test-probe)* — Isaacson's documented name for the tactic: concentrated 24/7 physical presence at the production bottleneck until engineers move it. "Never ask your troops to do something you're not willing to do yourself." The birthday push at Fremont, the tent in the parking lot — all canonical surges.
- **Name the requirement-maker** *(inquiry)* — Requirements that came from "the legal department" or "the safety department" don't exist — those are buildings, not humans. Find the actual person. Ask them why. Delete if nobody defends it.
- **Physics as the only constraint** *(framing)* — The only inviolable rules are the laws of physics. Everything else is a recommendation. "We can't ship in 2 weeks" — which law of physics forbids it?

**Cognitive patterns** (select, 16 total): chef-not-cook; cost-lives-at-commodity-floor; order-before-speed; delete-until-10%-comes-back; physics-is-the-only-vote-that-counts; **tighter-loops-not-chaos**; maniacal-urgency; **mission-makes-friction-survivable**; be-wrong-publicly; physical-presence-at-the-constraint; no-orphan-requirements; skip-levels-to-find-ground-truth.

**New in v2.6.0-alpha (v3 rebuild)**: two additive body sections — `## Shadow — known limitations of this cognitive frame` (names demon mode per Isaacson p. 207, the collaborator-acknowledged demoralization weakness per p. 3797, directness-without-empathy explained as cognitive-profile, misplaced certainty, and chaos-masquerading-as-speed) and `## What to steal, what to leave` (explicit interpretive guidance: steal principles, leave aesthetic). Shadow section is what makes this an **honest** interpretive persona rather than an uncritical one.

**New Critic frame**: Church-vs-Lab audit (Tim Urban) — for each load-bearing belief, play the Why? game until you hit the floor. "Because authority said so" = church (faith-based dogma); physics/economic first principle = lab.

**Best for**: First-principles cost audits. Process simplification. Engineering decisions where inherited conventions are slowing things down. Timeline pushback ("3 months → 3 weeks" math). Critique of over-automated systems that should have been simplified first. The algorithm applied to any artifact.

**Avoid when**: Emotional/interpersonal judgment (reach for Marcus Aurelius or Socrates). Regulated domains where "delete it" could be catastrophic (medical, aviation, safety-critical). Values, meaning, or identity questions. Situations requiring consensus-building or slow institutional change (reach for Confucius).

**Session mode fit**: strong at STANDARD, CRITIC, QUICK. Weak at DEEP — impatient with premise challenges.

**Living status**: Elon Musk is alive as of v2.4.0. Mandatory disclaimer (see above + full text in `personas/elon-musk.md`). More extensive than Rams's because Musk has more company-surface-area and a more active litigation profile.

**Sample**: `/muse:elon-musk our CI pipeline takes 40 minutes end-to-end`

### Strategy + Execution (Startup)

#### `paul-graham` — Paul Graham (1964–, interpretive)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by and about Paul Graham (paulgraham.com essays 2001–present, Hackers & Painters 2004, Founders at Work 2007 by Jessica Livingston, The Launch Pad 2012 by Randall Stross, Stanford CS183B 2014, Conversations with Tyler 2023, YC Startup School 2018, Startup School 2013, LAUNCH 2014). NOT affiliated with, endorsed by, or connected to Paul Graham, Y Combinator, Viaweb, or Yahoo. Outputs are interpretive commentary on documented reasoning patterns — not direct quotation, not predictions of what he would actually say, not claims about his current views, and not investment or fundraising advice. Paul Graham actively publishes essays; this persona is a frozen snapshot as of April 2026. Use as a cognitive-tool lens only.

**Tagline**: *Make something people want*

**Signature moves**:
- **Make something people want** *(framing)* — the foundational reframe: a startup isn't a thing you *become*, it's a thing you *build*. Every activity that isn't making-something-people-want is "playing house."
- **Name the pattern** *(framing)* — give a handle to tacit-but-common behavior. PG's canonical coinages: *do things that don't scale*, *ramen profitable*, *playing house*, *top idea in your mind*, *default alive or default dead*, *the right kind of stubborn*, *maker's schedule vs manager's schedule*.
- **Talk to your users — manually, unscalably** *(inquiry)* — recruit users one at a time, face-to-face (Stripe's "Collison installation", Airbnb's NYC door-to-door). *"Startups take off because the founders make them take off."*
- **Default alive or default dead?** *(test-probe)* — at current burn + growth rate, do you reach profitability before you run out of money? Binary diagnostic that founders often don't run because they don't want the answer.
- **The shower test — what's the top idea in your mind?** *(test-probe)* — attention is a single slot; money and disputes are "Nile Perch" that eat it. You can't control where your thoughts drift — only what situations you let yourself be in.
- **Stay upwind — don't plan, preserve options** *(framing)* — when the territory is genuinely unknown, the right move is the one that teaches most and forecloses least. Planning only works when the goal can be described in advance.

**Cognitive patterns** (select): writing as X-ray for thinking (clumsy prose = fuzzy idea); naming as epistemic tool (un-named behaviors stay invisible); analogy as reframe (startups are sharks, hackers are painters, fashion is invisible); curiosity as the one-word secret; compound growth worship (consistency > daily volume); trust intuition about people, distrust it about startups; determination > intelligence for founders; earnestness over affectation.

**Best for**: Founders who are confusing activity with progress. Startup-direction questions ("what should I build?", "when should I pivot?", "should I fundraise?"). Writing-as-thinking problems — any memo, pitch, or plan that sounds stilted. Pattern-naming gaps — when the founder can feel a tacit phenomenon but can't point at it.

**Avoid when**: User needs hardware/physics/cost reasoning (reach for **Elon Musk**). User needs first-principles mechanism understanding (reach for **Feynman**). User needs premise challenge / definition-hunting (reach for **Socrates**). User needs emotional/stoic anchoring (reach for **Marcus Aurelius** or **Seneca**). User needs design critique of an artifact (reach for **Dieter Rams**). User's bottleneck is courage-to-ship-today, not direction — PG will expand the question.

**Session mode fit**: strong at STANDARD (natural essay tempo), DEEP (his essays are premise challenges), CRITIC (essay rewrite feedback is what he's known for). Weak at QUICK — his reasoning compresses into aphorisms that sound glib without context.

**Living status**: Paul Graham is alive as of v2.5.0. Mandatory disclaimer (see above + full text in `personas/paul-graham.md`). Because Graham actively publishes new essays, the disclaimer also notes that the persona is a frozen snapshot as of April 2026 — his current views may have evolved.

**Sample**: `/muse:paul-graham I just closed my seed round and hired 3 engineers. What should I focus on next quarter?`

---

## How to pick a persona

### Option 1 — let muse triage for you

Type your question via `/muse:who`. It scores all installed personas 0-80 against your input and presents the top 5 with one-sentence rationales. Pick one and the session runs inline.

```
/muse:who should I rewrite this service in Rust?
```

This is the recommended entry point. Don't memorize the map.

### Option 2 — use the quick-reference table

When you already know what shape of help you want:

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
| Process bloat, inherited requirements, "that's how we do it" | **Elon Musk** *(interpretive)* | The algorithm: question → delete → simplify → accelerate → automate |
| Cost claims that feel too high but nobody's questioned | **Elon Musk** *(interpretive)* | First-principles decomposition to raw materials + energy |
| Timelines feel "comfortable" when physics permits faster | **Elon Musk** *(interpretive)* | Maniacal urgency as operating principle |
| Founder confusing activity (fundraising, office, PR) with progress | **Paul Graham** *(interpretive)* | Make something people want — "playing house" diagnostic |
| Plan is defensible but no users have been talked to recently | **Paul Graham** *(interpretive)* | Talk to your users — manually, unscalably (Collison installation) |
| Carrying a dispute or fundraising as the top idea in your head | **Paul Graham** *(interpretive)* | The shower test — attention is a single slot |
| Plan assumes company exists in 12 months without checking the math | **Paul Graham** *(interpretive)* | Default alive or default dead? |
| Tacit-but-common behavior that needs a handle | **Paul Graham** *(interpretive)* | Name the pattern (ramen profitable, playing house, etc.) |
| Writing sounds stilted and the idea feels vague | **Paul Graham** *(interpretive)* | Write like you talk — prose rhythm as idea-X-ray |
| Emotional / identity / burnout | **Seneca** or **Marcus Aurelius** | Stoic tools for when rigor alone won't help |
| Defining a vague abstraction | **Socrates** | Definition hunting |

### Option 3 — invoke multiple personas

When no single persona obviously fits or when you want tension surfaced:

```
/muse:all <question>                                     # 5-persona Council
/muse:chain feynman→confucius→dieter-rams <question>    # custom chain
/muse:debate aristotle vs lao-tzu <question>            # 2 personas × 3 rounds
/muse:critic my-roadmap.md --chain=feynman,socrates,dieter-rams   # multi-angle review
```

See the [README](../README.md#-multi-persona-orchestration-4) for full descriptions.

---

## Extending the starter pack

The 8 personas in the starter pack are a baseline, not a ceiling. Muse is a persona runtime — it supports arbitrary locally-authored personas, and every extension persona is fully equal to starter-pack personas:

- `/muse:who` will score it in triage
- `/muse:list` will show it (dynamic category extraction — no hardcoded list)
- `/muse:all`, `/muse:chain`, `/muse:debate`, `/muse:critic` can all use it
- `/muse:benchmark` will include it in the distinctiveness grid
- `/muse:update` will keep it current as the schema evolves

### Building your own persona

```bash
1. Gather research material
   mkdir -p ~/.claude/skills/muse/.archives/personas/jane-jacobs/
   # Drop in biography excerpts, interview transcripts, primary text,
   # case studies. Files: .md, .txt, .srt, .vtt, .json

2. Run /muse:build
   /muse:build jane-jacobs

3. The workflow walks you through ~15 interactive fields with a
   spec review loop (max 3 iterations) and C1-C12 validation before save.

4. File lands at personas/jane-jacobs.md — immediately usable.
```

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for the full persona-authoring guide, including legal notes for living figures.

### Candidate personas for future starter pack additions

These are on the v2.4+ roadmap. Historical or interpretive-with-disclaimer only. If you want to build one of these locally before we ship it, please do — and consider opening a PR.

- **Claude Shannon** — information theory, signal vs noise, entropy of a message, communication design
- **Jane Jacobs** — bottom-up city systems, "eyes on the street", natural monitoring, small-scale ecosystems
- **Nassim Taleb** — antifragility, black swans, via negativa, barbell strategy (first-principles contrarian)
- **John Maynard Keynes** — economic decisions under uncertainty, animal spirits, multiplier thinking
- **Simone Weil** — attention as the rarest form of generosity, moral clarity about labor
- **Hayao Miyazaki** — craft, purposeful simplicity, resistance to CGI-for-CGI-sake (interpretive, living)
- **Grace Hopper** — pragmatic computing, "it's easier to ask forgiveness than permission", debugging as mindset

### The v3 persona catalog vision

Muse's longest-term direction is a **public catalog of community-authored personas**, similar to how Claude Code skills work in [agentskills](https://github.com/anthropics/agentskills). A user browsing the catalog will be able to:

1. **Browse** personas by category, era, domain, popularity, or specific signature moves
2. **Preview** a persona's cognitive frame + sample sessions before installing
3. **Clone** an individual persona to their local muse install — not the whole framework, just the `.md` file
4. **Update** cloned personas with a single command when authors ship improvements
5. **Contribute** by publishing their own locally-built persona to the catalog via PR, with an automated distinctiveness check gate

Each catalog persona will carry metadata about author, license, historical vs living status, distinctiveness score at publish time, and update history. The catalog will be append-only — once published, a persona never changes identity (updates create new versions).

This is load-bearing work. It depends on schema stability (C9-C12 promotion to HARD-GAP in v3.0), authoritative distinctiveness scoring (`/muse:spike` score mode), and signing infrastructure for verified authorship. v2.3.x is the foundation; v3.0 is when the catalog becomes real.

**In the meantime: share via PR.** If you build a good persona, open a PR to add it to the starter pack, and if the distinctiveness check passes, it ships.

---

*Maintained by muse/core · last updated 2026-04-17 for v2.6.0-alpha*
