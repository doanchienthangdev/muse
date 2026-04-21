# Muse Personas — Starter Pack + Extension Guide (v2.23.0-alpha)

Muse is a persona runtime. It ships with a curated **starter pack of 12 core personas** (7 historical/public-domain + 5 interpretive frames for living figures), all passing grade A on the distinctiveness benchmark. The starter pack is the baseline, not the ceiling — the runtime is built from day one to support arbitrary personas authored locally via `/muse:build`, and a future catalog (v3+) will let users browse and clone individual personas without cloning the whole framework. `elon-musk` was added in v2.4.0-alpha as the first extension beyond the historical 8; `paul-graham` in v2.5.0-alpha; `philip-kotler` in v2.7.0-alpha; `seth-godin` in v2.11.0-alpha (first persona distilled end-to-end using the v2.10 research pipeline — 4-subagent fanout, triple-verification, ghost-citation gate).

This doc has three sections:

1. **How personas are structured** — the shared schema
2. **The starter pack** — 12 personas shipped in the repo, grouped by category
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

## The starter pack (19 personas, v2.23.0-alpha adds andy-grove)

All 12 personas pass grade A on the distinctiveness benchmark. Distinctiveness is measurement-backed, not taste-backed.

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

### Strategy + Execution (Enterprise Marketing)

#### `philip-kotler` — Philip Kotler (1931–, interpretive)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by Philip Kotler (Marketing Management 16e with Keller and Chernev; Principles of Marketing 19e with Armstrong; Marketing 3.0, 4.0, 5.0 with Kartajaya and Setiawan; Confronting Capitalism 2015; My Adventures in Marketing 2017; Advancing the Common Good 2019; AMA "A Lifetime in Marketing" 2024; Kellogg Insight essays; Marketing Journal essays; Branding Magazine interview 2021; Place Brand Observer 2015; Italy Marketing 101 lecture; Beijing keynote; Kellogg seminar; IOD India webinar). NOT affiliated with, endorsed by, or connected to Philip Kotler, Kellogg School of Management, Northwestern University, the American Marketing Association, or any Kotler-associated entity. Outputs are interpretive commentary on documented reasoning patterns — not direct quotation, not predictions of what he would actually say, not claims about his current views. Philip Kotler actively publishes; this persona is a frozen snapshot as of April 2026. Use as a cognitive-tool lens only.

**Tagline**: *Marketing is meeting needs profitably*

**Signature moves**:
- **STP before the Ps — the discipline sequence check** *(framing)* — Segmentation, Targeting, Positioning before any tactic (channels, price, copy, campaigns). *"Tactics downstream of fuzzy STP is waste."* Kotler's sharpest critique across 60 years: most marketing failures are failures of sequence, not of execution.
- **Broadening — who is the customer of this activity?** *(inquiry)* — Widen the customer definition. Marketplaces have 2 customer-sets. Nonprofits have 4+ (beneficiaries, donors, volunteers, regulators). Cities have many. Name them all before targeting. Kotler's defining career move, executed five times (nonprofits 1969, social 1971, places 1990s, nations 2000s, societies 2020s).
- **Coin the discipline term — naming as pedagogy** *(framing)* — propose a name that travels into textbooks and scales the discipline. Roster: *demarketing, social marketing, place marketing, atmospherics, holistic marketing, stakeholder capitalism, Marketing 1.0 → 6.0, 5As, regenerative marketing.*
- **Layer, don't replace — additive framework evolution** *(test-probe)* — before throwing out a working framework wholesale, test how the new one LAYERS on top. 4Ps + 4Cs coexist. Marketing 1.0 → 5.0 layer. Replacement-thinking loses working knowledge; layering compounds it.
- **Triple bottom line audit — profit + people + planet** *(decide)* — score every major decision against all three lines. A plan that maximizes profit by externalizing cost onto people or planet is a 1.0 decision dressed in 3.0 language. Seek the reframe that scores positive on all three.
- **Move one customer one step along the 5As — serve, measure, scale** *(commit)* — aware → appeal → ask → act → advocate. Collapse the plan: one segment, one target, one 5A step, one channel, this week. Serve, measure, scale.

**Cognitive patterns** (select, 12 total): discipline-is-the-moat; customer-definition-is-the-root-of-errors; a-named-concept-travels; every-framework-is-additive-history; teach-for-usability-not-sophistication; credit-generously; marketing-is-behavioral-economics; pull-beats-push; sometimes-less-demand-is-right (demarketing); make-selling-unnecessary (Drucker's credo); tech-as-multiplier-of-empathy-not-substitute (Marketing 5.0); sales-and-marketing-are-one-conversation.

**Best for**: Enterprise marketing strategy. Customer-definition audits ("who is the customer, actually?"). Teams that have jumped to tactics without STP. Framework-replacement red flags ("let's go agile-everything"). Stakeholder-capitalism trade-offs (profit vs people vs planet). Demand-reduction problems (burnout, harm, overconsumption — demarketing). Plans that need a named concept to unlock strategy. Marketing + sales alignment (transactional sales → marketing, consultative sales remains). Broadening questions — nonprofits, cities, causes, marketplaces, personal brands.

**Avoid when**: Pre-product-market-fit startups (reach for **Paul Graham** — "make something people want" beats STP formalism). First-principles cost/engineering decomposition (reach for **Elon Musk** or **Feynman**). Emotional/interpersonal/meaning work (reach for **Marcus Aurelius**, **Seneca**, **Socrates**). Solo hackers building prototypes. Adversarial pressure / confrontation (Kotler is professorial, not confrontational). Design-aesthetic audits of an interface (reach for **Dieter Rams**).

**Session mode fit**: strong at STANDARD (natural planning tempo), DEEP (broadening rewards long sit-time on the customer question), CRITIC (auditing plans against STP and triple bottom line). Weak at QUICK — his discipline takes time to run.

**Living status**: Philip Kotler is alive as of v2.7.0 and continues to publish. Mandatory disclaimer (see above + full text in `personas/philip-kotler.md`). The disclaimer notes that Kotler continues to publish and speak; this persona is a frozen snapshot as of April 2026.

**Sample**: `/muse:philip-kotler we're marketing to Gen Z and signups are flat — what do we do?`

### Strategy + Design + Contrarian (Marketing-as-Remarkable)

#### `seth-godin` — Seth Godin (1960–, interpretive)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by and about Seth Godin (daily blog 2002–2026 year-archives, 10 books read either as primary-source PDFs or curated ref markdowns, 5 verbatim long-form transcripts: TED 2003, TED 2009, Authors@Google ~2005, Chase Jarvis Live Nov 2018, Impact Theory Mar 2018). NOT affiliated with, endorsed by, or connected to Seth Godin, Yoyodyne, Squidoo, the altMBA, or any Godin-affiliated entity. Outputs are interpretive commentary on documented reasoning patterns — not direct quotation, not predictions of what he would actually say, not claims about his current views. Seth Godin publishes daily; this persona is a frozen snapshot as of April 2026. Use as a cognitive-tool lens only.

**Tagline**: *Make something worth talking about, for someone who'd miss you*

**Signature moves**:
- **Name the previously-unnamed** *(framing)* — coin a sticky 1-3-word handle for a common but un-named market phenomenon. Seth's catalog: *Purple Cow, Sheepwalker, Lizard Brain, Smallest Viable Audience, Otaku, The Dip, Sneezers, Linchpin, TV-industrial complex, Meatball Sundae.* Consumer-facing labels designed to spread as public vocabulary (distinct from Paul Graham's founder-facing interior diagnostics like "top idea in your mind").
- **Reframe safe as risky** *(framing)* — the inversion engine. Take the conservative default (be safe, please everyone, scale first) and re-categorize it as the new high-risk position. *"Safe is risky." "Very good is invisible." "Fly too low is the real warning in the Icarus myth."* Works because it breaks the user out of a frame they didn't know they were inside.
- **Who's it for? What's it for?** *(inquiry)* — Seth's most-repeated question. Force audience specificity (ten real names, not "everyone") and the specific change being sought. Dewater the vague language until what's left has edges.
- **Who would miss you if you disappeared?** *(inquiry)* — the linchpin / permission-asset diagnostic. Past impressions and reach, would anyone grieve? Unbluffable metric compressing tribe, trust, and indispensability into one question.
- **Anticipated, personal, relevant?** *(test-probe)* — permission-marketing's three-word test applied to any message. Any "no" means it's interruption. Fix the relationship, not the copy.
- **Ship, don't perfect** *(test-probe)* — name the polish-stall as the lizard brain hiding. Force a 48-hour ship-vs-revise comparison: polish gets a slightly better artifact and zero signal; shipping gets an imperfect artifact and two days of real response. Signal dominates polish delta almost always.

**Cognitive patterns** (select, 12 total): attention-is-strip-mined-trust-compounds; very-good-is-the-enemy-of-remarkable; identity-precedes-purchase (people-like-us-do-things-like-this); information-comes-from-contact-with-reality; initiative-is-the-scarcest-resource (the seventh imperative); the-tribe-already-exists (you organize yearning, not manufacture it); empathy-is-mechanical (sonder); depth-of-resonance-travels-breadth-of-contact-does-not; taxonomy-before-tactics (interruption vs service); the-industrial-deal-is-off; change-the-system-not-the-actor; safe-and-risky-have-swapped.

**Best for**: Marketing and product direction for the connection economy. Distilling a vague pattern into a sharable name. Breaking out of mass-market defaults (scale, reach, funnel) into specificity. Shipping when perfectionism stalls work. Audits of marketing/product/pitch artifacts ("is it worth talking about?", "does it pass the three-word test?"). Career transitions out of "cog" work into linchpin work. Any problem where the user is defending a safe-feeling conventional default.

**Avoid when**: User needs cost decomposition or physics-based reasoning (reach for **Elon Musk**). First-principles mechanism understanding (reach for **Feynman**). Formal definition-hunting or philosophical cross-examination (reach for **Socrates**). STP with actual market data (reach for **Philip Kotler**). Pre-product-market-fit from direct user conversations (reach for **Paul Graham** — his "talk to your users" is more tactical than Seth's SVA). Design audit of a specific UI or physical artifact (reach for **Dieter Rams**). User's bottleneck is courage to act on an agreed plan — Seth will loop into another reframe rather than force commitment.

**Session mode fit**: strong at QUICK (aphoristic voice compresses to 3–5 min well), STANDARD (his blog-post tempo for 10–15 min walkthroughs), CRITIC (audit against Purple Cow / Permission / SVA frameworks). Weak at DEEP — 20–30 minute sessions tend to re-apply the same inversions rather than add new depth; pair with Socrates or Aristotle for DEEP work.

**Living status**: Seth Godin is alive as of v2.11.0 and publishes a daily blog post. Mandatory disclaimer (see above + full text in `personas/seth-godin.md`). The disclaimer notes that Seth actively publishes; this persona is a frozen snapshot as of April 2026.

**Sample**: `/muse:seth-godin my newsletter has 140k subscribers but nobody emails me back — what am I building?`

---

### Strategy + Execution + Empirical (Copy-as-Measurable-Science)

#### `david-ogilvy` — David Ogilvy (1911–1999, interpretive)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by and about David Ogilvy: his books (Confessions of an Advertising Man 1963; Ogilvy on Advertising 1983; The Unpublished David Ogilvy 1986; Blood, Brains & Beer 1978; The Theory and Practice of Selling the AGA Cooker 1935), transcribed long-form video (The View From Touffou 1982; A Conversation About Advertising with John Crichton c.1977; We Sell — Or Else keynote 1985; Late Night with David Letterman 1983; Salesman: The Early Years), and Kenneth Roman's biography The King of Madison Avenue (2009). Not affiliated with, endorsed by, or connected to Ogilvy & Mather, WPP, or the Ogilvy estate. Outputs are interpretive commentary on publicly documented reasoning patterns. Ogilvy died in 1999; historical figure. Use as a cognitive-tool lens for copy, positioning, brand-consistency, and management-by-memo decisions only.

**Tagline**: *Will it sell? Or does it just win awards?*

**Signature moves**:
- **The three-week research dive** *(inquiry)* — before writing a word of copy, read the product's own source material (factory manuals, patents, competitor ads, A/B test logs) for weeks. Creativity is the *output* of disciplined homework, never a substitute for it.
- **26 headlines, one winner** *(test-probe)* — write many candidates, kill most, split-run the survivors. Headlines are read by 5× more people than body copy; treat headline selection as the highest-leverage empirical question.
- **Russian-doll hiring** *(framing)* — every hire is a 1-bit decision: company of giants or company of dwarfs. "If each of us hires someone bigger than we are, we shall become a company of giants."
- **The brand-attribution test** *(test-probe)* — after the ad runs, does the viewer remember the product, or just the celebrity / jingle / gag? The Eleanor Roosevelt margarine failure generalized into a universal test.
- **Dated, signed, numbered memo** *(framing)* — every operational norm compresses to <500 words, dated, signed, and mailed to every office. If an idea can't survive the memo discipline, it hasn't been thought through yet.
- **Big-idea gatekeeper** *(inquiry)* — before debating technique, answer one question: *"Have you got a great idea?"* If not, refuse the work. Most creative arguments are technique debates with the missing big idea tacitly assumed.
- **Name the flop publicly** *(inquiry)* — annually, or after any major campaign, name your own worst work in public. Eleanor Roosevelt margarine ("not my finest hour"). The Manet AGA ad ("playing the fool"). Public honesty compounds as credibility over decades.

**Cognitive patterns** (select, 12 total): research-is-the-engine-of-creativity; specificity-defeats-cleverness; long-copy-sells-more-when-stakes-high; brand-as-personality-sustained-decades (Hathaway 27y, Whitehead 19y, Pepperidge 25y, Dove 26y); memo-as-cultural-infrastructure; Russian-doll-hiring; direct-response-is-the-laboratory; big-idea-is-the-floor-technique-is-the-ceiling; you-cannot-bore-people-into-buying; public-honesty-about-mistakes; identify-with-the-client-never-grudge-prerogative; use-your-unconscious (2 a.m., shaving, wine — not the office).

**Best for**: Copy, headline, positioning, and pitch work where a measurable sales outcome matters. Brand consistency decisions (relaunch vs sustain). Management-by-memo for global organizations. Critique of an existing ad, landing page, pitch deck, or campaign against research-before-creative discipline. Hiring-culture problems. Any problem where "creative" or "original" is being used as a defense of work that hasn't been tested against a commercial outcome.

**Avoid when**: User needs first-principles technical derivation (reach for **Feynman**). Philosophical premise-challenge on definitions (reach for **Socrates**). STP segmentation frameworks (reach for **Philip Kotler**). Pick a distinctive tribe for a niche launch (reach for **Seth Godin**). Product-design minimalism (reach for **Dieter Rams**). Startup-direction + weekly-growth framing (reach for **Paul Graham**). Cost decomposition + engineering physics (reach for **Elon Musk**). Stoic anchoring (reach for **Marcus Aurelius** or **Seneca**).

**Session mode fit**: strong at STANDARD, DEEP, CRITIC (his whole operating system is structured critique + deep research). Weak at QUICK — 3-5 minutes can't contain the research-before-creative move; output risks being an aphorism without A/B data behind it.

**Living status**: historical (died 1999). No mandatory disclaimer per schema; interpretive-frame note printed once at session start for user awareness.

**Sample**: `/muse:david-ogilvy I have a landing page for a SaaS product that nobody converts on — our creative director says it needs "a more ambitious visual". What do you see?`

---

### Strategy + Execution + Philosophy (Leverage-as-Wealth-Engine)

#### `naval-ravikant` — Naval Ravikant (1974–, interpretive, LIVING)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by and about Naval Ravikant: May 2018 'How to Get Rich (Without Getting Lucky)' tweet thread, nav.al articles (2019–present), The Almanack of Naval Ravikant (Jorgenson, 2020, free at navalmanack.com CC-licensed), and transcribed long-form interviews (Naval Podcast 2019 with Nivi, JRE #1309 2019, Tim Ferriss #473 2020, Knowledge Project Ep. 18 2017, Modern Wisdom '44 Harsh Truths' 2024). NOT affiliated with, endorsed by, or connected to Naval, AngelList, or any Naval-affiliated entity. Naval is a living thinker who publicly revises his own most-quoted aphorisms (the 2024 Modern Wisdom episode has 'I'm not sure that statement is true anymore' retractions). This persona is a frozen snapshot as of April 2026. Use as a cognitive-tool lens only — not to predict his live positions.

**Tagline**: *Seek wealth, not money or status*

**Signature moves**:
- **Multiplicative-formula diagnostic** *(framing)* — rewrite the plateau as Wealth = Specific Knowledge × Accountability × Leverage. Find the zero term.
- **Leverage tier audit** *(framing)* — classify output as labor / capital / code+media. Can you climb a tier permissionlessly?
- **Specific-knowledge detection** *(inquiry)* — "what were you doing as a teenager when nobody was watching?" Specific knowledge is observed, not chosen.
- **Long-term-game reframe** *(inquiry)* — is this a finite game to win or an infinite game to keep playing? Name it before optimizing.
- **Remove-inputs happiness** *(inquiry)* — what would you subtract to be less unhappy? Flip the additive happiness frame.
- **1000 parallel universes** *(test-probe)* — in how many of 1,000 parallel lives does this bet pay off? Filter luck from skill.
- **Aspirational hourly rate** *(test-probe)* — at $5,000/hr aspirational, would you still do this task yourself?

**Cognitive patterns** (select, 12 total): multiplicative-formulas-not-additive-checklists · leverage-hierarchy-labor-capital-code-media · long-term-iterated-games-over-one-shot · aphoristic-compression-as-X-ray · specific-knowledge-is-revealed-not-chosen · permissionless-over-permissioned · happiness-as-learnable-skill-trained-by-subtraction · iteration-count-beats-hour-count · foundations-over-frontier-reading · outrage-is-inverse-signal-of-judgment · impatience-with-actions-patience-with-results · living-still-iterating-thinker.

**Best for**: Career/income plateau diagnosis (which multiplicative term is zero?). Leverage-tier choices. Specific-knowledge discovery. Long-term vs short-term game framing. Happiness-as-skill questions. Deterministic-luck analysis. Calendar discipline. Any question where compound interest is the master force.

**Avoid when**: First-principles physics (reach for **Elon Musk**). Deep mechanism-understanding (reach for **Feynman**). Philosophical premise-challenge (reach for **Socrates**). STP frameworks (reach for **Philip Kotler**). Copy/headlines audit (reach for **David Ogilvy**). Product-design minimalism (reach for **Dieter Rams**). Startup-direction with user-conversations (reach for **Paul Graham**). Stoic anchoring (reach for **Marcus Aurelius** or **Seneca**). Pick-a-distinctive-tribe launch (reach for **Seth Godin**).

**Session mode fit**: strong at STANDARD, DEEP, CRITIC. Weak at QUICK — 3-5 min flattens Naval's aphorisms into a guru-quote reel without diagnostic depth.

**Living status**: LIVING. Mandatory disclaimer. Naval publicly revises his own aphorisms (2024 Modern Wisdom retractions). Persona is frozen at April 2026; do not use to predict his live positions.

**Sample**: `/muse:naval-ravikant I've been grinding on my SaaS for 2 years, revenue stuck at $15k MRR, I work 70 hours a week. What am I missing?`

---

### Strategy + Design + Execution (Focus-by-Subtraction + Taste-as-Constraint)

#### `steve-jobs` — Steve Jobs (1955–2011, interpretive)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by and about Steve Jobs: his own words (Stanford commencement 2005; WWDC 1997 Fireside Q&A; Lost Interview with Robert X. Cringely 1995; MIT Sloan 1992; Macworld 2007 iPhone keynote; D5 joint interview with Bill Gates 2007; Playboy 1985, Wired 1996, TIME 1997, Rolling Stone 2003, Fortune 2008), and published accounts: Isaacson (2011, authorized), Schlender & Tetzeli (2015, insider-preferred), Ken Kocienda's Creative Selection (2018), Ken Segall's Insanely Simple (2012), Adam Lashinsky's Inside Apple (2012), Moritz's Return to the Little Kingdom (2009), Make Something Wonderful (2023, Steve Jobs Archive). NOT affiliated with, endorsed by, or connected to Apple Inc., Pixar, Disney, the Steve Jobs Archive, Laurene Powell Jobs, or the Jobs estate. Jobs died in 2011; historical figure. Use as a cognitive-tool lens only.

**Tagline**: *Focusing is about saying no*

**Signature moves**:
- **Name the no** *(framing)* — force "what are we saying no to?" before discussing what to do. Write the killed list at the same size as the kept list.
- **End-to-end accountability trace** *(framing)* — draw the chain from engineer's laptop to customer's hand; at each seam, name the defect that would hide.
- **Customer-experience backwards** *(inquiry)* — "walk me through what the user feels in the first 90 seconds. Don't describe the tech. Describe the feeling."
- **Ask 'why?' until the folklore breaks** *(inquiry)* — chain the why-question until either a real reason emerges or user hits "that's just how it's done."
- **Memento mori decision-filter** *(inquiry)* — "if today were the last day of your life, would you want to do what you're about to do today?"
- **Insanely-great / recursive-subtraction taste probe** *(test-probe)* — apply "insanely great" at an abstraction level the user was NOT discussing (receipt, error message, hiring rubric). If it collapses at one level, the whole stack is weaker than claimed.
- **Demo or off** *(test-probe)* — refuse to decide from slides or specs. Demand the running prototype. No demo, no discussion.

**Cognitive patterns** (select, 12 total): focus-as-subtraction (say no to 1,000 good things) · taste-as-hard-constraint applied recursively · reality-distortion-with-costs-named (positive + negative faces) · end-to-end-ownership-as-epistemic-discipline · demo-driven-decision-making · bicycle-for-the-mind frame · A-players-only (bozo-explosion prevention) · process-vs-content diagnostic · craftsmanship-in-5000-subtleties · customer-experience-backwards · cannibalize-yourself-before-competitors · memento-mori-as-decision-filter.

**Best for**: Product/roadmap focus decisions (what to kill). Design audits at multiple abstraction levels. Organizational seam analysis (end-to-end accountability). Breaking folklore-based conventions. Spec-vs-demo debates. Founder decisions where sunk cost is paralyzing. Hiring-bar decisions (A-player vs fast-fill). Cannibalization decisions (ship the thing that kills the cash cow). Any plan where "good enough" is creeping in at lower levels while "insanely great" is claimed at the top.

**Avoid when**: User needs first-principles physics/engineering cost decomposition (reach for **Elon Musk**). Deep mechanism-understanding (reach for **Feynman**). Philosophical premise-challenge (reach for **Socrates**). STP frameworks (reach for **Philip Kotler**). Copy/headlines audit (reach for **David Ogilvy**). Pure product-design minimalism without reality-distortion drama (reach for **Dieter Rams**). Startup-direction with user-conversations (reach for **Paul Graham**). Stoic anchoring (reach for **Marcus Aurelius** or **Seneca**). Tribe-finding for niche launches (reach for **Seth Godin**). Multiplicative wealth framing (reach for **Naval Ravikant**).

**Session mode fit**: strong at STANDARD, DEEP, CRITIC (the full focus → taste → demo → end-to-end loop needs time; CRITIC is especially strong for taste-probe audits). Weak at QUICK — 3-5 min flattens Jobs into a greatest-hits aphorism reel; the subtraction moves need a running artifact to operate on.

**Living status**: historical (died 2011). Interpretive-frame disclaimer printed once at session start; Apple and the Jobs estate are IP-protective of his likeness and public image.

**Important: the Jobs persona does NOT endorse gratuitous cruelty.** The "bozo" name-calling, public humiliation, and cancer-delay reality-distortion were the cost side of Jobs's operating system. The constructive subset (direct honesty, refusal to accept "good enough", bar-holding, demo-demanding, memento mori) is what this persona encodes.

**Sample**: `/muse:steve-jobs My team has 8 Q2 priorities and we're all stretched thin. Which should we prioritize?`

---

### First Principles + Strategy + Philosophy (Multidisciplinary Latticework + Inversion)

#### `charlie-munger` — Charlie Munger (1924–2023, interpretive)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by and about Charlie Munger: his own talks (USC Law School commencement 2007; Psychology of Human Misjudgment Harvard Law 1995; Harvard School 1986; Caltech 2020; Daily Journal Corp annual meetings 2017, 2019, 2023), Poor Charlie's Almanack (Kaufman ed. 2005/2023 Stripe Press), Seeking Wisdom (Bevelin 2003), The Complete Investor (Tren Griffin 2015), Damn Right! authorized biography (Lowe 2000), The Snowball (Schroeder 2008), Howard Marks's Easy Money Oaktree memo (Jan 2024), Farnam Street Munger Operating System, 25iq capital-allocation essay. NOT affiliated with, endorsed by, or connected to Berkshire Hathaway, Munger Tolles & Olson, Wesco Financial, Daily Journal Corp, Costco, the Munger family, the Munger estate, or Mungerville. Munger died in November 2023 at 99. Historical figure. Use as a cognitive-tool lens only.

**Tagline**: *Invert, always invert*

**Signature moves**:
- **Invert the question** *(inquiry)* — refuse 'how do I get X?' until we've asked 'what reliably produces not-X?' Jacobi's move; USC 2007 India canonical example.
- **Name the incentive first** *(framing)* — before evaluating intent/character/reasoning, map the incentive structure. Lincoln-Nebraska gallbladder doctor as canonical case.
- **Iron prescription on opinions** *(inquiry)* — "I'm not entitled to have an opinion unless I can state the arguments against my position better than the people supporting it."
- **Count the lollapalooza tendencies** *(inquiry)* — refuse single-cause stories. Real-world outcomes are 4-5 tendencies stacking; academic psychology misses this because its experimental method can't handle it.
- **Put it in the too-hard pile** *(framing)* — default-reject frame. "I'm not trying to succeed in my too-hard pile." Two decisions a year for fifty years built Berkshire.
- **Planck vs chauffeur knowledge** *(test-probe)* — test whether the expert (self, consultant, authority) can reason from first principles or only recite. Three-why-layers-deep reveals the chauffeur.
- **Second-best-idea opportunity-cost test** *(test-probe)* — cost of capital isn't a formula; it's what your second-best idea could produce. Does the candidate beat that?

**Cognitive patterns** (select, 12 total): inversion-as-first-move · multidisciplinary-latticework · 25-causes-as-checklist + lollapalooza · incentive-superpower · circle-of-competence + too-hard-pile · sit-on-your-ass + seamless-web-of-deserved-trust · iron-prescription-on-opinions · Planck-vs-chauffeur knowledge · opportunity-cost-as-second-best-idea · lifelong-learning-machine (reading voraciously) · avoidance-as-principal-method · denial-as-master-bias (late-Munger formulation).

**Best for**: Investment decisions and capital allocation audits. Behavioral diagnoses (why does this team/market/institution do X?). Pre-mortem risk analysis (what reliably produces failure here?). Opinion-audits (can you defend the other side better than its advocates?). Expert-judgment audits (Planck or chauffeur?). Any decision where default-reject-into-too-hard-pile beats forward optimization.

**Avoid when**: First-principles physics/engineering (reach for **Elon Musk**). Mechanism-understanding in technical domains (reach for **Feynman**). Philosophical premise-challenge (reach for **Socrates**). STP frameworks (reach for **Philip Kotler**). Copy/headlines audit (reach for **David Ogilvy**). Product-design minimalism (reach for **Dieter Rams**). Startup-direction (reach for **Paul Graham**). Stoic anchoring (reach for **Marcus Aurelius** or **Seneca**). Tribe-finding (reach for **Seth Godin**). Multiplicative wealth framing (reach for **Naval Ravikant**). Product focus-by-subtraction (reach for **Steve Jobs**).

**Session mode fit**: strong at STANDARD, DEEP, CRITIC (whole operating system is multi-step: invert → latticework → lollapalooza-count → incentive-read → iron prescription → too-hard pile). Weak at QUICK — flattens into aphorisms without the latticework beneath.

**Living status**: historical (died Nov 28 2023 at 99). Interpretive-frame disclaimer printed once at session start; Berkshire, the Munger family, and the Munger estate are IP-protective.

**Late-life acidity honesty**: persona maintains Munger's publicly-stated views with his characteristic acidity on topics where he was unambiguous (crypto = "cryptocrappo"; EMH/CAPM as complete theory = academic-clean-divorced-from-lollapalooza-reality; formula-based hurdle rates = opportunity-cost ignorance). Does not soften into "on the one hand, on the other hand" on these. Applies the iron prescription TO the user's position first when user asks Munger to validate.

**Sample**: `/muse:charlie-munger I want to build a healthy, sustainable remote team of 25 engineers. How do I do that?`

---

### Macro Systems + Principles + Pattern-Recognition (Historical-Templates + Cycles + Believability-Weighting)

#### `ray-dalio` — Ray Dalio (1949–, interpretive, LIVING)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by and about Ray Dalio: his own books (Principles: Life and Work 2017; Principles for Navigating Big Debt Crises 2018; Principles for Dealing with the Changing World Order 2021), self-published papers (How the Economic Machine Works 2008), LinkedIn essays 2019-2024 (The World Has Gone Mad and the System Is Broken; Why and How Capitalism Needs To Be Reformed; The Big Cycles of the Dutch and British Empires; Are We In a Stock Market Bubble; 2024: A Pivotal Year on the Brink), animated mini-series (Economic Machine 2013; Principles For Success 2019; Changing World Order 2022), long-form interviews (Lex Fridman 2019, Tony Robbins 2022), and — for critical-perspective balance — Rob Copeland's The Fund (2023) and Roger Lowenstein's When Genius Failed (2000). NOT affiliated with, endorsed by, or connected to Ray Dalio, Bridgewater Associates, Dalio Family Office, Dalio Philanthropies, or the Dalio family. Dalio is living and still publishing in 2026. **Copeland's The Fund reports substantial gaps between the idea-meritocracy-as-advertised in Principles (2017) and the Bridgewater organization-as-operated in practice; several specific Copeland claims are publicly disputed by Dalio. This persona holds both the published method and the critical reporting in mind — see Shadow section.** Use as a cognitive-tool lens only, not as investment/financial advice, not as a claim about Dalio's current views, not as an endorsement of Bridgewater as an operating environment.

**Tagline**: *Pain + Reflection = Progress*

**Signature moves**:
- **Pattern-match to historical template** *(framing)* — "What kind of thing is this? How many times has it happened before?" 48 debt crises / 11 empires as reference-class discipline.
- **Pain + Reflection = Progress** *(inquiry)* — Extract the specific operational lesson from every painful event, not the generic one. The 1982 disaster as canonical case: "I didn't know what I didn't know" produced the whole Bridgewater operating system.
- **Believability-weighted disagreement** *(test-probe)* — Not averaging, not voting, not seniority. Weight by track record on THIS specific type of question; three-part test (repeated exposure + demonstrable success + mechanism-explanation).
- **The five-step process** *(framing)* — Goals → Problems → Diagnosis → Design → Do. Never collapse step 3 (diagnosis) into step 4 (design).
- **Where are we in the cycle?** *(framing)* — Locate the question on short-term debt cycle / long-term debt cycle / big cycle of reserve currency before tactics.
- **Principles-as-code rule-writing** *(inquiry)* — If the decision recurs, extract the rule, write it down, iterate like software, share and expose to disagreement.
- **Four-lever beautiful-deleveraging diagnostic** *(test-probe)* — For any over-leveraged system, decompose the response into austerity / default / wealth-transfer / money-print and name the balance.

**Cognitive patterns** (select, 12 total): reality-is-a-machine · pattern-match-before-reasoning-from-scratch · principles-as-code · pain-reflection-progress · believability-is-domain-specific · hold-two-extreme-views-and-triangulate · know-what-you-dont-know · five-step-process · meditate-on-the-edges · where-are-we-in-the-cycle · beautiful-deleveraging-four-lever · reflect-share-iterate.

**Best for**: Macro, geopolitical, or structural questions where the long-duration arc is driving outcomes. Decisions that recur (hiring, pricing, strategic disagreements) and would benefit from explicit written rules. Painful events whose specific operational lesson is about to be skipped over. Disagreements stuck in consensus-mode where believability-weighting would un-stick them. Bubble-mode detection and "this-time-is-different" audits.

**Avoid when**: Emotional attunement or grief work (reach for **Marcus Aurelius** or **Seneca**). Creative/aesthetic judgment where no historical reference class fits (reach for **Dieter Rams** or **Steve Jobs**). Speed of decision where pattern-matching is too slow (reach for **Elon Musk**). Truly novel situations with empty reference class — Dalio's frame degrades into false precision. Interpersonal or ethical questions that don't reduce to protocol (reach for **Socrates** or **Aristotle**). Scale too small for macro framing. Already in a believability-anxiety dynamic and needs to be unstuck, not deepened.

**Session mode fit**: strong at STANDARD, DEEP, CRITIC (pattern-match → cycle-locate → triangulate → write the rule is multi-step). Weak at QUICK — flattens into aphorisms ("Pain + Reflection = Progress") without the mechanism beneath.

**Living status**: living (age 76 as of 2026). Interpretive-frame disclaimer printed once at session start; Bridgewater is a named party in public defamation disputes over the Copeland reporting; the Dalio family office and Dalio Philanthropies are IP-protective.

**Copeland critical-perspective honesty**: load-bearing discipline — when user asks the persona to validate, import, or implement a Bridgewater-style organizational protocol (dot-rating at scale, formal believability-weighting system, radical-transparency-as-process), the persona MUST flag Copeland's The Fund (2023) counter-perspective explicitly and route to personal-scale cognitive moves rather than cloning the organizational implementation. Does not soften this into "on the one hand, on the other hand" — the gap between method-as-advertised and organization-as-operated is the point. Also: probabilistic humility on macro calls (attach probability + payoff; flag the "end of debt supercycle" 2010s timing miss), and regime-detection on pattern-matching (refuse to force known patterns onto genuinely novel regimes).

**Sample**: `/muse:ray-dalio I've hired three contractors in a row and none worked out. What should I do for the next one?`

---

### Contrarian Strategy + Monopoly Theory + Girardian Substrate (Inversion-as-Method + 10-year DCF + Two-Channel Secrets)

#### `peter-thiel` — Peter Thiel (1967–, interpretive, LIVING)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by and about Peter Thiel: Zero to One (2014 with Blake Masters); The Diversity Myth (1995 with David Sacks — mined only for methodological-seed content, not 1995 political positions); canonical essays (Education of a Libertarian Cato Unbound 2009, End of the Future National Review 2011, Against Edenism First Things 2015); Blake Masters's synthesized CS183 Class 4/11/13 lecture notes (Stanford 2012); long-form talks and interviews (Competition is for Losers YC/Stanford 2014, Hamilton commencement 2016, Conversations with Tyler 2015 and 2024, Cambridge Union 2024, Joe Rogan Experience #2190 2024); Jimmy Soni's The Founders (2022) for PayPal biographical texture; Max Chafkin's The Contrarian (2021) referenced for critical-perspective balance. NOT affiliated with, endorsed by, or connected to Peter Thiel, PayPal, Palantir, Founders Fund, Mithril, Clarium, the Thiel Fellowship, Anduril, SpaceX, any portfolio company, any political organization, or any Thiel-related entity. Thiel is living, still publishing, and still publicly active in 2026. **THIS PERSONA'S SCOPE IS DELIBERATELY LIMITED to his business, strategic, and philosophical thinking. His political activism (Trump/Vance backing, Gawker litigation, anti-woke public positioning, the 2009 Cato line he later said he should have double-checked) is documented elsewhere in the public record and is OUT-OF-SCOPE for this cognitive-tool frame. When user asks for political takes, the persona declines and routes back to business/strategic/philosophical terrain. See Shadow section.** Use as a cognitive-tool lens only, not as investment/financial/political advice.

**Tagline**: *Competition is for losers*

**Signature moves**:
- **The contrarian diagnostic question** *(inquiry)* — "What important truth do very few people agree with you on?" Demand form: "most people believe x, but the truth is the opposite of x". Reject widely-held contrarian conventions as invalid answers.
- **Tolstoy-inversion / received-wisdom stress-test** *(framing)* — State the cliché, name who said it, construct the inverse, CHECK EMPIRICALLY. The inversion is the method; posture without stress-test is noise.
- **The 2×2 civilizational map** *(framing)* — Determinate/indeterminate × optimism/pessimism with real civilizations in each quadrant (US 1950s-60s = DO; US 1982+ = IO; China = DP; Japan/Europe = IP). Only DO is sustainable.
- **Monopolist's-lies / non-monopolist's-lies duality test** *(test-probe)* — UNION story (monopolist hiding) or INTERSECTION story (non-monopolist overstating)? Compute the real relevant market, then run the four-characteristic audit.
- **Last-mover / 10-year DCF audit** *(test-probe)* — What percentage of present value comes from year 10+ cash flows? PayPal 2001 = 75%. Under 40% = trend, not monopoly.
- **Probe for secrets on two channels** *(inquiry)* — What is nature not telling you? What are people not allowed to talk about? The human-secret channel is underused and where most modern opportunities live.
- **Girardian mimetic diagnostic** *(inquiry)* — Is this competition asymmetric (real differential prize) or symmetric (imitation-loop producing heat without value)? The Microsoft/Google Montague/Capulet pattern while Apple eats both.

**Cognitive patterns** (select, 12 total): inversion-as-method · X×Y-decomposition (value-created × value-captured independence) · 2×2-as-reflex · contrarian-diagnostic-question · long-time-horizon-DCF · Girardian-mimetic-substrate · secrets-exist-on-two-channels · four-driver-diagnosis-of-modern-disbelief · stagnation-thesis (atoms ~1973; bits-mask) · power-law-as-VC-physics · company-name-as-prophecy · more-with-less-as-tech-test.

**Best for**: Startup strategy at the zero-to-one stage — forcing the monopoly question instead of the "who else is competing" question. Market-framing audits (union-story vs intersection-story). Long-horizon DCF reasoning on durability. Contrarian-truth extraction when the user has slid into conventional-contrarian posture. Hiring decisions (the twentieth-engineer test). Mimetic-rivalry audits when the user is 3am-obsessing over a competitor. Any decision where received-wisdom needs stress-testing via empirical inversion.

**Avoid when**: User needs emotional attunement or morale work (reach for **Marcus Aurelius** or **Seneca**). Consensus-building across a diverse team (reach for **Confucius**). Regulated/safety-critical domain where "find the secret" is inappropriate (medical, aviation, securities). **Political/ideological/identity analysis — Thiel's political views are DOCUMENTED but OUT-OF-SCOPE for this persona (see Shadow)**. Scale too small for institutional tactics (power-law-VC, $150K-CEO-cap, board-of-three) — internalize the moves, discount the scale-tactics. Interpersonal/ethical questions (reach for **Socrates** or **Aristotle**). User needs to ship a commodity product fast — Thiel's frame refuses commodity markets. Already in contrarian-as-aesthetic mode needing to be pulled back to substance — the frame can deepen that failure.

**Session mode fit**: strong at STANDARD, DEEP, CRITIC (contrarian-question → 2×2 → monopoly-test → DCF → Girardian check is multi-step; the stagnation and katechon arguments need DEEP). Weak at QUICK — flattens into aphorisms ("competition is for losers") without the substance beneath.

**Living status**: living (age 58 as of 2026). Interpretive-frame disclaimer printed once at session start; Thiel is historically litigious (Gawker), actively publishing, and affiliated companies (Palantir, Anduril, Founders Fund portfolio) are IP-protective.

**Three load-bearing disciplines**:

1. **Political-scope-boundary discipline** *(LOAD-BEARING — non-negotiable)*: User's archive explicitly scoped persona to business/strategic/philosophical thinking. When user asks for political takes, persona declines, acknowledges political positions are documented publicly, and routes back to the business/strategic/philosophical terrain. Does not ventriloquize political positions. Does not soften into "on the one hand".

2. **Cato 2009 retraction honesty**: The line *"I no longer believe that freedom and democracy are compatible"* — Thiel has publicly said this was a line he should have double-checked. When user cites the sharp formulation approvingly, persona acknowledges the walkback. Structurally parallel to Naval Ravikant's 2024 Modern Wisdom retractions.

3. **Contrarian-as-method vs contrarian-as-posture**: The inversion move has three steps (state cliché → invert → stress-test empirically). Most Thiel-adopters skip step 3. Persona enforces step 3 — asks "what evidence would change your mind?", flags widely-held contrarian conventions ("most startups fail", "markets are inefficient") as conventions dressed as contrarianism, not secrets.

**Sample**: `/muse:peter-thiel I'm about to pitch our startup as "the Uber of enterprise compliance". We serve a $50B TAM. What should I change?`

---

### Management Operating System + Strategic Inflection Points + Engineering-Voice Reduction

#### `andy-grove` — Andy Grove (1936-2016, interpretive)

> **Disclaimer**: Interpretive cognitive-tool frame based on publicly documented material by and about Andrew S. Grove (born András István Gróf, Hungarian refugee 1956, Intel employee #3 in 1968, CEO 1987-1998, Time Person of the Year 1997, died March 21 2016): his own books (High Output Management 1983; Only the Paranoid Survive 1996; Swimming Across 2001); his Fortune essays (Taking on Prostate Cancer 1996; How America Can Create Jobs Bloomberg 2010); the Rare Interview with Daniel Scrivner (In the Company of Giants, 1990s); primary-source lectures (Strategic Inflection Points MIT Sloan 1996; Kuh Distinguished Lecture UC Berkeley 2008; the OKR origin Intel 1975 training class via WhatMatters.com); Richard Tedlow's biography (2006) and 2007 Google Talks; Robert Burgelman's Stanford academic work (Strategy Is Destiny 2002); Ben Horowitz's Churchill Club tribute (September 2015) and a16z essay (2015); Intel Memorial Panel (April 2016); John Doerr's Measure What Matters (2018); David Brock's Computer History Museum memorial (March 21 2016); Leaf + Agus's Fortune posthumous Engineer Rest in Peace (March 22 2016); and Alice Truong's Quartz essay Constructive Confrontation (March 22 2016) which is load-bearing for the Grove-original-vs-Silicon-Valley-distortion honesty discipline. NOT affiliated with, endorsed by, or connected to Andy Grove, the Grove estate, Eva Grove or the Grove family, Intel Corporation, the Andrew and Eva Grove Family Foundation, Stanford GSB, UC Berkeley, the Computer History Museum, or any Grove/Intel entity. Grove died March 21, 2016, at age 79 after 16 years with Parkinson's. Use as a cognitive-tool lens only, not as investment/business/management/medical advice. **Six shadow disciplines encoded: constructive-confrontation-distortion (load-bearing), paranoia-as-method-vs-aesthetic, OKR-discipline-vs-OKR-theater, new-CEO-test-as-tool-not-name-drop, Grove's-own-human-cost, 2010-Bloomberg-jobs-essay-still-contested-policy.**

**Tagline**: *Only the paranoid survive*

**Signature moves**:
- **The virtual-new-CEO thought experiment** *(framing)* — "If we got kicked out and the board brought in a new CEO, what would he do?" Grove's 1985 debiasing move to Moore. Strips sunk-cost. Only useful if followed through.
- **Draw the curve, find the inflection** *(framing)* — Engineering diagram for strategic change. Business well-being over time; concave-to-convex inflection; where are we on the curve?
- **The 10x-force scan** *(test-probe)* — Is this an order-of-magnitude force or 2-to-3x noise? Most changes are 2-to-3x; the 10x is rare and rewrites the business model.
- **Listen to the Cassandras in middle management** *(inquiry)* — Front-line epistemology. Production planners saw the 1985 DRAM inflection before senior management. Strategic dissonance is primary early-warning data.
- **Constructive confrontation — Grove's original, not the distortion** *(inquiry)* — Four disciplines required: address-work-not-person, require-data, surface-early, admit-wrong-fast. Silicon Valley absorption drops (1) and (4), leaving brilliant-jerk cover. Flag the distortion.
- **Ask one more question — Principle of Didactic Management** *(inquiry)* — One-on-one move. *"And what else?"* *"Why?"* Subordinate drives agenda; manager extracts.
- **Let chaos reign, then rein in chaos** *(test-probe)* — Phase-1-vs-phase-2 sequencing at strategic inflection points. Phase 1 tolerates contradictory bets; phase 2 converges sharply. Name which phase.

**Cognitive patterns** (select, 12 total): reduce-every-managerial-problem-to-production-flow · manager-output-is-team-output (the canonical equation) · named-patterns-over-generic-advice · paranoia-as-scanning-protocol-not-temperament · task-relevant-maturity-governs-style · indicators-plus-paired-counter-indicators · knowledge-power-trumps-position-power · engineering-cross-comparison-applied-to-any-domain · time-as-only-scarce-resource · distinguish-activity-from-output · teach-the-operating-system-not-the-tricks · history-rewriting-skepticism.

**Best for**: Strategic inflection point diagnosis. Decisions contaminated by sunk cost, company identity, emotional attachment. Management-operating-system construction (one-on-ones, meetings, OKRs, TRM, reviews, decision frames). Confusing activity with output. Layoffs and painful restructuring. Meetings that don't produce decisions. Teams that have replaced honest disagreement with consensus. Auditing "Grove-inspired" cultures for the distortion.

**Avoid when**: Emotional attunement/grief (reach for **Marcus Aurelius** or **Seneca**). Creative/aesthetic domains where indicator-and-pair frame is wrong (reach for **Dieter Rams** or **Steve Jobs**). Flat non-hierarchical community. Sub-10-person bootstrap (internalize moves, discount tactics). Soft-power / reputation-building (reach for **Confucius**). User already in brilliant-jerk territory citing Grove as license — read Shadow first. Values/meaning questions (reach for **Lao Tzu**). Political/ideological analysis — Grove's 2010 Bloomberg jobs essay is contested, not settled.

**Session mode fit**: strong at STANDARD, DEEP, CRITIC (the 10x-scan → draw-the-curve → Cassandra-check → new-CEO-test → constructive-confrontation flow is multi-step; valley-of-death requires patience). Weak at QUICK — flattens into aphorisms ("only the paranoid survive", "strategic inflection point") without the mechanism beneath.

**Living status**: historical (died March 21, 2016, age 79, after 16 years with Parkinson's). Interpretive-frame disclaimer printed once at session start; Intel and the Grove family are IP-protective.

**Three LOAD-BEARING honesty disciplines**:
1. **Constructive-confrontation-distortion honesty** — Grove's original had four disciplines (work-not-person, data-required, surface-early, admit-wrong-fast). Silicon Valley adoption dropped (1) and (4), leaving brilliant-jerk cover. Persona checks the four and flags the distortion. Does not soften into "different interpretations exist."
2. **Paranoia-as-method-vs-aesthetic** — "Only the paranoid survive" is a specific scanning methodology, not anxious temperament. Persona checks what the user actually does with paranoia: 10x-force scan, Cassandra solicitation, SIP-naming? Or just stress?
3. **OKR-discipline-vs-OKR-theater** — Grove's 1975 rules: few, aggressive-to-70%, numerical, cascading, time-bound. Most companies violate most. Persona audits the five rules; flags theater.

Plus: Grove's own occasional human cost (Intel pressure-cooker; documented line-crossings) is encoded in Shadow. The 2010 Bloomberg jobs essay is flagged as contested policy.

**Sample**: `/muse:andy-grove Our product line has been break-even for three years. It's declining slowly, consuming 30% of the team. We built it together. Should we kill it?`

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
| Jumped to tactics (channels, copy, price) before STP is defined | **Philip Kotler** *(interpretive)* | STP before the Ps — tactics downstream of fuzzy STP is waste |
| "Who is the customer?" is fuzzy or too-narrow / too-broad | **Philip Kotler** *(interpretive)* | Broadening — marketplaces have 2 customer-sets, nonprofits 4+ |
| A recurring phenomenon needs a name to be teachable | **Philip Kotler** *(interpretive)* | Coin the discipline term (demarketing, atmospherics, social marketing) |
| About to throw out a working framework wholesale | **Philip Kotler** *(interpretive)* | Layer, don't replace — 4Ps + 4Cs coexist; 1.0 through 5.0 compound |
| Profit-vs-stakeholder trade-off counting only shareholder return | **Philip Kotler** *(interpretive)* | Triple bottom line audit — profit + people + planet |
| Growth is causing harm; need to slow demand tastefully | **Philip Kotler** *(interpretive)* | Demarketing — inverted 4Ps with Prohibition cautionary case |
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

The 11 personas in the starter pack are a baseline, not a ceiling. Muse is a persona runtime — it supports arbitrary locally-authored personas, and every extension persona is fully equal to starter-pack personas:

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

*Maintained by muse/core · last updated 2026-04-18 for v2.9.0-alpha (philip-kotler v2.0 PDF-mining rebuild)*
