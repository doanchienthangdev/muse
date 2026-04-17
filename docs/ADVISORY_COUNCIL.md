# Muse Advisory Council — Persona Candidates for Ritsu

**Created**: 2026-04-16
**Purpose**: Curated list of cognitive-tool personas to build as a world-class startup advisory council. Each entry includes: distinctive moves, why they matter for a startup, living status, research sources, and differentiation from existing muse personas.
**How to use**: Pick a persona from this list → gather research into `.archives/personas/<id>/` → run `/muse:build <id>` → the persona joins your muse install immediately.

---

## Existing muse personas (10 — already built)

| ID | Name | Domain | Use for Ritsu |
|---|---|---|---|
| `feynman` | Richard Feynman | first-principles, science | Understanding problems deeply, debugging confused reasoning |
| `socrates` | Socrates | philosophy, strategy | Defining vague concepts, clarifying thinking |
| `seneca` | Seneca | philosophy, strategy | Burnout, focus, time management, quit-vs-persist |
| `marcus-aurelius` | Marcus Aurelius | philosophy, strategy | Decision paralysis, emotional reactions, leadership under pressure |
| `aristotle` | Aristotle | first-principles, systems | Categorization, understanding inherited systems |
| `confucius` | Confucius | systems, philosophy | Organizational change, culture, team leadership |
| `lao-tzu` | Lao Tzu | philosophy, design | Stuck situations, forcing vs flow, doing less |
| `dieter-rams` | Dieter Rams *(interpretive)* | design, systems | UI/UX review, product simplification, feature cull |
| `elon-musk` | Elon Musk *(interpretive)* | first-principles, execution | Process optimization, cost decomposition, timeline compression |
| `paul-graham` | Paul Graham *(interpretive)* | strategy, execution, first-principles, philosophy | Startup direction, 0→1 decisions, playing-house diagnostic, user-conversation inquiry, writing-as-thinking |

---

## Tier 1 — Build first (highest impact for startup founder)

> **Status note**: `paul-graham` was **built and shipped** in v2.5.0-alpha (2026-04-17). It was formerly #1 in this tier; the remaining Tier 1 entries have been renumbered. See `personas/paul-graham.md` for the full spec and the "Existing muse personas" table above.

### 1. `steve-jobs` — Product vision + taste + simplicity

**Tagline candidate**: "People don't know what they want until you show it to them"

**Distinctive cognitive moves**:
- **"Focus is saying no"** *(framing)* — focus is not about saying yes to the thing you focus on. It's about saying no to the hundred other good ideas. "I'm as proud of the things we haven't done as the things we have done."
- **"Taste"** *(test-probe)* — taste is not a design skill. It's a product skill: the ability to distinguish "good enough" from "great" from "magical". Can't be taught by process. Comes from exposure to great work across domains — calligraphy, music, architecture, typography.
- **"Intersection of technology and liberal arts"** *(framing)* — the best products are not purely technical or purely artistic. They live at the intersection. This is why Apple's designers and engineers sit together, not in separate buildings.
- **"1000 no's for every yes"** *(inquiry)* — when someone proposes a feature, the default answer is no. The feature must fight its way in by being essential, not nice-to-have. Most products die from feature bloat, not feature poverty.
- **"End-to-end experience ownership"** *(test-probe)* — control the entire stack from hardware to software to retail to packaging. Every touchpoint is a chance to delight or disappoint. Outsourcing a touchpoint outsources your quality bar.
- **"Simplicity is the ultimate sophistication"** *(framing)* — simplicity is not removing features. It's finding the essence of what the product should do and removing everything that isn't that essence. Harder than adding complexity.

**Why for Ritsu**: Every product decision where you're choosing between "what users ask for" and "what users actually need" — Jobs resolves that tension better than anyone. His frame is specifically about saying no to good ideas to make room for great ones.

**Differentiation from existing personas**:
- vs **Dieter Rams**: Both value simplicity. Rams audits against 10 design principles (understandable, honest, unobtrusive, long-lasting). Jobs audits against taste (does it feel magical?). Rams is principled; Jobs is intuitive. Both would remove the same feature but for different reasons.
- vs **Elon Musk**: Musk deletes to optimize cost/speed. Jobs deletes to achieve essence/taste. Musk says "the requirement is dumb, delete it." Jobs says "the feature is good, but it dilutes the product, delete it." Different deletion criteria.
- vs **Lao Tzu**: Both favor subtraction. Lao Tzu's wu wei is about yielding to the natural flow. Jobs's subtraction is aggressive curation driven by taste. Lao Tzu lets go; Jobs cuts.

**Living status**: Deceased (2011). **Historical** — zero legal risk.

**Research sources**:
- Walter Isaacson, *Steve Jobs* (Simon & Schuster, 2011) — authorized biography
- Brent Schlender & Rick Tetzeli, *Becoming Steve Jobs* (Crown, 2015) — the "better" biography per Apple insiders
- Apple keynote presentations (1997-2011, YouTube/Apple archive)
- Stanford commencement address (2005) — "Stay hungry, stay foolish"
- Internal Apple University case studies (documented in *Inside Apple* by Adam Lashinsky)
- *Creative Selection* by Ken Kocienda (2018) — insider account of the product development process

**Session mode fit**: Strong at CRITIC (product review is his strongest move), STANDARD, DEEP. Weak at QUICK — taste-based reasoning requires deliberation.

---

### 2. `charlie-munger` — Decision-making + mental models + inversion

**Tagline candidate**: "Invert, always invert"

**Distinctive cognitive moves**:
- **Inversion** *(framing)* — instead of asking "how do I succeed?", ask "what would guarantee failure?" and avoid those things. Jacobi's method applied to business: "man muss immer umkehren" (one must always invert). Most of the time, avoiding stupidity is more reliable than seeking brilliance.
- **Latticework of mental models** *(inquiry)* — don't think from one discipline. Build a lattice of models from psychology, physics, biology, economics, history, math. Cross-disciplinary thinking catches what single-discipline thinking misses. "To a man with a hammer, everything looks like a nail."
- **Circle of competence** *(test-probe)* — know the boundary of what you actually understand. Inside the circle, you can make good decisions. Outside, you're guessing. The discipline is staying inside — or acknowledging when you're outside and deferring.
- **Incentive superpower** *(inquiry)* — "Show me the incentive and I'll show you the outcome." Never ask what someone says they'll do. Ask what their incentives reward. Incentive structures predict behavior better than intentions, promises, or character.
- **25 cognitive biases checklist** *(test-probe)* — a systematic checklist of human misjudgment: social proof, availability bias, consistency bias, reciprocation tendency, etc. Run the checklist on any important decision to catch where your brain is lying to you.
- **"Sit on your ass" discipline** *(decide)* — the best investment returns come from doing nothing 95% of the time and acting decisively 5% of the time. Patience is not laziness — it's discipline. Most people over-trade, over-decide, over-react.

**Why for Ritsu**: Every hard startup decision (pivot, fundraise, hire/fire, shut down) benefits from Munger's inversion: "what would guarantee this decision fails?" is more useful than "what's the upside?" His mental-models lattice catches blind spots that domain-specific thinking misses.

**Differentiation from existing personas**:
- vs **Socrates**: Both ask probing questions. Socrates hunts for definitions ("what do you mean by X?"). Munger hunts for failure modes ("what would guarantee X fails?"). Socrates clarifies; Munger eliminates.
- vs **Aristotle**: Both categorize. Aristotle uses four causes (material/formal/efficient/final). Munger uses multi-disciplinary mental models (psychology/physics/biology/economics). Aristotle asks "what kind of question is this?"; Munger asks "which mental model from which discipline applies here?"
- vs **Seneca**: Both practice negative visualization. Seneca's premeditatio malorum rehearses the worst to shrink fear. Munger's inversion maps the failure modes to avoid them. Seneca makes you brave; Munger makes you smart.

**Living status**: Deceased (November 2023). **Historical** — zero legal risk.

**Research sources**:
- *Poor Charlie's Almanack* (edited by Peter Kaufman, 2005, expanded 2023) — the canonical collection
- Berkshire Hathaway annual meeting transcripts (1986-2023) — decades of public Q&A
- USC Law School commencement address (2007) — "The Psychology of Human Misjudgment"
- Tren Griffin, *Charlie Munger: The Complete Investor* (Columbia Business School, 2015)
- *Seeking Wisdom: From Darwin to Munger* by Peter Bevelin (2007)
- Wesco Financial annual meeting transcripts
- Daily Journal Corporation annual meeting transcripts (2014-2023)

**Session mode fit**: Strong at DEEP (his natural tempo — premise challenges are his specialty), STANDARD, CRITIC. Weak at QUICK — mental-model reasoning requires space to cross-reference disciplines.

---

### 3. `andy-grove` — Operations + management + strategic inflection points

**Tagline candidate**: "Only the paranoid survive"

**Distinctive cognitive moves**:
- **OKRs (Objectives and Key Results)** *(test-probe)* — the management framework he created at Intel that Google, Spotify, and thousands of companies adopted. Objective = what you want to achieve (qualitative, inspiring). Key Results = how you measure whether you're getting there (quantitative, time-bound). The discipline: if you can't measure it, it's not a Key Result.
- **Strategic inflection points** *(framing)* — a 10x change in one of the forces affecting your business (technology, competitors, customers, suppliers, regulation). Most companies die at inflection points because they respond too slowly. The paranoid survive because they detect the shift early and act before the data is conclusive.
- **Constructive confrontation** *(inquiry)* — Intel's culture of direct, data-driven disagreement. Anyone can challenge anyone, regardless of rank, as long as they bring data. "In the different phases of a business, different management styles work. Debate early, commit once decided."
- **High output management** *(test-probe)* — a manager's output = the output of their team + the output of teams they influence. Your job is not to do the work — it's to maximize the leverage of your time on the team's output. Meeting leverage, 1:1 leverage, decision leverage.
- **Let chaos reign, then rein in chaos** *(decide)* — in times of strategic uncertainty, let teams experiment freely (chaos). Once the direction becomes clear, impose discipline and focus (rein in). The mistake is doing either at the wrong time: discipline during exploration kills innovation; chaos during execution kills delivery.
- **"Is the company 'default dead'?"** *(framing)* — Grove asked this at Intel during the memory-to-microprocessor pivot: "If we got kicked out and the board brought in a new CEO, what would they do?" They would exit the memory business. So he did. Removing emotional attachment from strategic decisions.

**Why for Ritsu**: When Ritsu grows from 2 → 10 → 50 people, operations become the bottleneck. Grove literally wrote the textbook on managing through hypergrowth (Intel went from startup to $20B during his tenure). OKRs, 1:1s, constructive confrontation — he codified all of it.

**Differentiation from existing personas**:
- vs **Elon Musk**: Both manage at intensity. Musk manages through surge mode + physical presence at the factory floor. Grove manages through systems — OKRs, structured 1:1s, meeting cadence. Musk is founder-mode operator; Grove is professional-CEO systematizer. Complementary for different growth stages.
- vs **Confucius**: Both care about organizational culture. Confucius builds culture through example + naming + patience (three-year test). Grove builds culture through structured confrontation + measurement + paranoid scanning. Confucius = gradual, Grove = systematic.
- vs **Marcus Aurelius**: Both face existential organizational threats. Marcus uses Stoic self-governance (dichotomy of control, duty focus). Grove uses strategic analysis (10x forces, inflection points). Marcus governs self; Grove governs the org.

**Living status**: Deceased (2016). **Historical** — zero legal risk.

**Research sources**:
- *High Output Management* (Vintage, 1983, updated 1995) — the canonical management textbook
- *Only the Paranoid Survive* (Currency/Doubleday, 1996) — strategic inflection points
- Stanford GSB lectures and case studies
- Richard Tedlow, *Andy Grove: The Life and Times of an American Business Icon* (Portfolio, 2006)
- Intel annual reports and internal memos (many published posthumously)
- John Doerr, *Measure What Matters* (2018) — OKRs traced back to Grove

**Session mode fit**: Strong at STANDARD (systematic analysis), CRITIC (OKR audit, management review), DEEP (strategic inflection point analysis). Weak at QUICK — his frameworks require setup context.

---

### 4. `chris-voss` — Negotiation + sales + tactical empathy

**Tagline candidate**: "He who has learned to disagree without being disagreeable has discovered the most valuable secret of negotiation"

**Distinctive cognitive moves**:
- **Tactical empathy** *(framing)* — understand the other side's feelings and mindset. Not agree with them — understand them. "Empathy is not about being nice. It's about understanding." This is the foundation: every negotiation technique builds on it.
- **Mirroring** *(inquiry)* — repeat the last 1-3 words of what someone said, with an upward inflection. Forces them to expand, reveal more, and feel heard. The simplest and most underused negotiation tool. Works in every conversation, not just negotiations.
- **Labeling emotions** *(inquiry)* — "It seems like you're frustrated with the timeline." Naming the emotion out loud defuses it. The other side feels understood and becomes more cooperative. Prefixed with "It seems like..." or "It sounds like..." — never "I think you feel..."
- **Calibrated questions** *(test-probe)* — open-ended questions that start with "How" or "What" that force the other side to solve your problem for you. "How am I supposed to do that?" makes them lower their own demands. "What's the biggest challenge you face?" makes them reveal their real constraint.
- **"No" as the start** *(decide)* — most people are trained to get to "yes" fast. Voss: let the other side say "no" first. "No" makes people feel safe and in control. Once they feel safe, they open up. "Is it a bad idea to...?" (invites "no", which actually means "yes, it's fine").
- **"That's right" vs "You're right"** *(test-probe)* — "That's right" means the other side feels genuinely understood — breakthrough moment. "You're right" means they want you to shut up — no progress. The goal of every negotiation is to hear "that's right."

**Why for Ritsu**: Every founder negotiation — fundraising with VCs, closing enterprise sales, negotiating with partners, hiring key talent, retaining customers threatening to churn — uses these exact moves. FBI-tested methodology applied to business. The mirroring + labeling + calibrated questions sequence is the single most practical sales framework available.

**Differentiation from existing personas**:
- vs **Socrates**: Both ask probing questions. Socrates asks to find truth ("what do you mean by X?"). Voss asks to influence outcomes ("how am I supposed to do that?"). Socrates reveals; Voss moves.
- vs **Confucius**: Both value understanding the other side. Confucius through rectification of names (make labels honest). Voss through tactical empathy (make the other side feel heard). Confucius reforms the system; Voss navigates the negotiation.
- No existing persona covers sales/negotiation — Voss fills a gap.

**Living status**: Living. **Interpretive** persona with disclaimer.

**Research sources**:
- *Never Split the Difference* (Harper Business, 2016) — the canonical text
- Black Swan Group training materials and blog (blackswanltd.com)
- MasterClass on negotiation (transcribable)
- 100+ podcast appearances (Tim Ferriss, Joe Rogan, Lex Fridman, etc.) — well-documented
- Chris Voss & Tahl Raz, public lectures and workshops (YouTube)

**Session mode fit**: Strong at STANDARD (negotiation prep requires walkthrough), QUICK (mirroring + labeling are fast techniques), CRITIC (reviewing a pitch deck or sales email for negotiation effectiveness). Weak at DEEP — his tools are tactical, not philosophical.

---

### 5. `steve-blank` — Customer development + lean startup methodology

**Tagline candidate**: "There are no facts inside the building. Get out of the building."

**Distinctive cognitive moves**:
- **Customer Development** *(framing)* — customer discovery deserves the same rigor as product development. Run them as two parallel tracks. Four canonical stages: Customer Discovery → Customer Validation → Customer Creation → Company Building. Most startups skip 1 and 2, then die in 3. The entire methodology rests on treating "do customers actually want this?" as an engineering problem with testable hypotheses, not a marketing-team guess.
- **"Get out of the building"** *(inquiry)* — the signature phrase. Inside the building there are only opinions; outside there are facts. No amount of whiteboarding, strategy offsites, or investor pitches substitutes for talking to 100 potential customers face-to-face. Every slide you make before the first 20 customer interviews is probably wrong.
- **Search vs Execute mode** *(test-probe)* — startups SEARCH for a repeatable, scalable business model. Established companies EXECUTE a known one. Treating a search-stage startup like an execute-stage company (formal plans, hierarchical roles, quarterly targets on unvalidated assumptions) is the #1 cause of premature startup death. "A startup is a temporary organization designed to search for a repeatable and scalable business model."
- **Falsifiable hypotheses on every assumption** *(test-probe)* — every business-plan assumption (price, channel, customer segment, problem urgency, willingness to pay) must be stated as a hypothesis you can falsify. If you can't design a test that would disprove it, you can't learn from testing it. "Hypothesis: small-business owners will pay $X/month for Y because they currently spend $Z on Z-substitute." Testable. Falsifiable. A real hypothesis.
- **MVP as learning instrument, not product** *(framing)* — the Minimum Viable Product is not a cheap version of your product. It's the smallest experiment that answers your most dangerous hypothesis. Sometimes it's a landing page + ad spend, not code. The goal is *validated learning*, not shipping.
- **Problem/solution fit before product/market fit** *(decide)* — two distinct milestones. Problem/solution fit = you've confirmed a real, urgent, worth-paying-for problem exists and your proposed solution addresses it. Product/market fit = you've built a product that a market will pull out of your hands. Skipping problem/solution fit means building something beautiful that nobody wants.
- **"No business plan survives first contact with customers"** *(framing)* — the Clausewitz-echoing aphorism that governs the whole methodology. Planning is not useless — it's a starting hypothesis. But the plan's job is to be falsified and updated, not defended.

**Why for Ritsu**: If Paul Graham gives you the *judgment* ("talk to users", "make something people want"), Steve Blank gives you the *system* — Customer Development as a parallel track to Product Development, with defined stages, hypothesis-driven experiments, and decision rules for when to pivot vs persevere. Blank is foundational for the 0→1 discipline of any startup. The "Lean Startup" that Eric Ries popularized was built on Blank's Four Steps.

**Differentiation from existing personas**:
- vs **Paul Graham**: PG is intuitive essays about startup judgment; Blank is a systematic playbook with diagrams, interview scripts, and defined stages. PG says "talk to your users"; Blank says "here is the 4-step customer discovery methodology, these are the questions to ask, and this is how you know when to move to validation." Complementary: PG for direction, Blank for method.
- vs **Clayton Christensen**: Christensen's jobs-to-be-done is a *framework* for understanding why customers hire products. Blank's customer development is a *methodology* for finding those customers and validating the hypothesis. Christensen = analytical framework; Blank = process methodology. You use Christensen to *think*; you use Blank to *act*.
- vs **Chris Voss**: Voss uses tactical empathy to close/negotiate; Blank uses structured interviewing to learn. Voss's endgame is a deal; Blank's endgame is validated learning. Both are "conversational technologies" for different purposes.
- vs **McKinsey**: McKinsey's hypothesis-driven analysis is for mature-company strategic problems ("why is revenue declining?"). Blank's hypothesis-driven customer development is for startup-stage existential problems ("does a market for this actually exist?"). Same epistemics (hypothesis-first), different contexts.

**Living status**: Living (born 1953). **Interpretive** persona with disclaimer.

**Research sources**:
- *The Four Steps to the Epiphany* (2005, revised 2013) — the foundational book, pre-dates and underpins Lean Startup
- *The Startup Owner's Manual* (with Bob Dorf, 2012) — the comprehensive 600-page playbook
- Stanford / Berkeley / Columbia course: **Lean LaunchPad** (video lectures freely available on Udacity)
- **I-Corps** curriculum (National Science Foundation program built on Blank's methodology; 50+ universities)
- [steveblank.com](https://steveblank.com/) — 15+ years of blog posts
- "Secret History of Silicon Valley" lectures (YouTube, 2008–)
- HBR article "Why the Lean Start-Up Changes Everything" (May 2013)
- Interviews with Eric Ries, Brad Feld, Tim O'Reilly
- Lean Startup conference keynotes

**Session mode fit**: Strong at STANDARD (Customer Development has structured stages that walk through naturally), CRITIC (auditing a startup's discovery process — "have you talked to 20 customers this week?"), DEEP (diagnosing whether a startup is in search or execute mode and what follows from that). OK at QUICK — his "get out of the building" test is a fast gut-check.

---

## Tier 2 — Build after Tier 1

### 6. `peter-thiel` — Contrarian strategy + monopoly thinking

**Tagline candidate**: "What important truth do very few people agree with you on?"

**Distinctive moves**: zero-to-one (create new) vs one-to-n (copy existing), monopoly > competition (competition is for losers), definite optimism vs indefinite optimism, "last mover advantage", secrets hiding in plain sight, power law distribution (a few things matter enormously, most don't matter at all).

**Why for Ritsu**: Forces you to ask whether your startup is creating something genuinely new (zero-to-one) or copying with a twist (one-to-n). The monopoly framing changes how you think about competitive strategy entirely.

**Living**: yes, interpretive.

**Research**: *Zero to One* (2014), Stanford CS183 lecture notes (Blake Masters), interviews, *The Diversity Myth* (controversial), Founders Fund letters.

---

### 7. `seth-godin` — Marketing + tribes + earning attention

**Tagline candidate**: "People like us do things like this"

**Distinctive cognitive moves**:
- **Permission marketing** *(framing)* — earn the right to send the next message. Anticipated, personal, relevant. Interruption marketing is dying (ad blockers, banner blindness, DVR-skipping, inbox fatigue); permission is scaling. "The tragedy of the commons, applied to attention."
- **Smallest viable audience** *(test-probe)* — don't optimize for mass reach. Find the 100 (or 1,000) people who desperately need what you're making, serve them unreasonably well, let them tell others. The paradox: targeting the smallest audience produces faster growth than targeting the largest, because only the smallest-audience strategy produces *word of mouth worth spreading*.
- **Purple Cow** *(framing)* — in a pasture of brown cows, a purple cow is remarkable and gets attention. In a market of average products for average people, being average is invisible. The only options: be remarkable, or be ignored. "Very good" is the worst place to be — indistinguishable from "pretty good" and too expensive to compete with it.
- **Tribes** *(inquiry)* — people want to belong. Give them a banner to rally under, a worldview to share, a way to find each other, and they'll propagate your story for you. The internet didn't kill marketing — it made tribes scalable. "Leaders don't ask for followers. They give people something to follow."
- **"People like us do things like this"** *(decide)* — identity-based persuasion. Change behavior by changing the story people tell themselves about who they are. "Drinking Coke" → "I'm a Coke person." "Running a marathon" → "I'm a runner." Every durable marketing move hooks into identity.
- **The Dip** *(test-probe)* — most projects have a curve: easy start → hard middle (the Dip) → breakthrough or failure. Two decisions are crucial and people get both wrong: knowing when to quit early (cul-de-sacs that will never resolve), and knowing when to push through (strategic dips where the pain IS the moat). Winners quit the right things fast and push through the right things hard.
- **Drip strategy** *(framing)* — generous, consistent, small acts of value delivered over time. Better than one big campaign. Your daily blog post, your weekly email, your monthly community call — they compound. Marketing is not an event, it's a practice.
- **Ship** *(decide)* — most projects die from not shipping. "The Resistance" (Godin borrows the term from Steven Pressfield) keeps you polishing. Shipping imperfect at 80% and iterating beats polishing at 100% and never launching.

**Why for Ritsu**: Modern startup marketing isn't advertising. It's finding the smallest group of people who desperately need your thing, serving them so well they tell others, and building a tribe around an identity story. Godin codified all of this before the SaaS/creator-economy era and his frameworks aged exceptionally well.

**Differentiation from existing personas**:
- vs **Paul Graham**: PG says "make something people want." Godin says "find the smallest group of people who desperately need what you made, and serve them so well they evangelize it." PG = product-market fit; Godin = positioning + tribe-building.
- vs **Steve Jobs**: Jobs makes products people didn't know they wanted (vision-push). Godin finds the tribe that will evangelize a remarkable product (audience-pull). Jobs's instrument is taste; Godin's is empathy for the specific-someone-you-serve.
- vs **David Ogilvy**: Ogilvy = research-first direct-response copywriting (test, test, test, long copy sells). Godin = permission + tribes + remarkability (don't ad-interrupt, earn attention, build a world). Ogilvy is pre-internet, Godin is post-internet. Complementary.
- vs **Philip Kotler**: Kotler = academic framework (4Ps, STP, marketing mix). Godin = practitioner heuristics (permission, tribes, purple cow). Kotler's frame is about classifying and understanding; Godin's is about activating and shipping. Use Kotler to *diagnose*, use Godin to *do*.

**Living status**: Living. **Interpretive** persona with disclaimer.

**Research sources**:
- 20+ books: *Purple Cow* (2003), *Permission Marketing* (1999), *Tribes* (2008), *The Dip* (2007), *Linchpin* (2010), *This Is Marketing* (2018), *The Practice* (2020), *Poke the Box* (2011), *All Marketers Are Liars* (2005)
- [seths.blog](https://seths.blog) — daily posts since 2002, 8,000+ posts (largest marketing-essay archive online)
- **altMBA** course materials and alumni case studies
- **Akimbo** podcast (200+ episodes, ongoing)
- TED talks (2003 "How to Get Your Ideas to Spread", 2009 "The Tribes We Lead")
- Long-form interviews: Tim Ferriss, Debbie Millman (Design Matters), Kara Swisher

**Session mode fit**: Strong at STANDARD (building a positioning frame), CRITIC (reviewing marketing copy and positioning for remarkability + permission compliance), QUICK (his heuristics compress beautifully — "Who's the smallest viable audience? Is this a purple cow or a brown cow?"). Weak at DEEP — his reasoning is pragmatic and punchy, not philosophical.

---

### 8. `philip-kotler` — Strategic marketing architecture + 4Ps + STP

**Tagline candidate**: "Marketing is not about selling what you make; it's about making what will sell."

**Distinctive cognitive moves**:
- **The 4Ps (marketing mix)** *(framing)* — **Product, Price, Place, Promotion**. Every marketing decision decomposes into these four levers. Kotler's contribution: making the 4Ps the default skeleton of every marketing plan, globally, since the 1960s. Extended to **7Ps** for services (adding People, Process, Physical evidence). If a marketing conversation skips any P, the plan has a hole.
- **STP: Segmentation → Targeting → Positioning** *(decide)* — the three-step discipline *before* any marketing tactic. (1) Segment the market into homogeneous groups. (2) Pick target segments strategically (where you can win, where value is highest, where you can be different). (3) Position the offering distinctly in the target's mind ("we are X for Y, because Z"). Skipping STP is how companies end up with tactics that don't cohere into a strategy.
- **Marketing orientation vs sales orientation** *(test-probe)* — sales orientation = "sell what we make." Marketing orientation = "make what customers want." Every organization drifts toward sales orientation (it's easier and the quota-math is clearer) and must be actively pushed back toward marketing orientation. The diagnostic: does your company decide what to build by asking customers, or by asking the sales team what's hard to sell?
- **Customer value and lifetime value as the true unit** *(framing)* — profit does not come from transactions; it comes from satisfied customers who return and refer. Short-term sales metrics lie; CLV, satisfaction, and retention tell the truth. Kotler was advocating for CLV-based decision-making before the SaaS era made it fashionable.
- **Marketing 1.0 → 5.0** *(inquiry)* — the era-by-era evolution: product-centric (1.0, post-industrial) → consumer-centric (2.0) → values-driven (3.0) → digital transformation (4.0) → human-machine integration (5.0, ~2021). Each stage changed what marketing fundamentally *is*. A diagnostic: which era does your current marketing belong to? Is that aligned with your customer's expectations?
- **Demarketing** *(decide)* — sometimes the goal is to *reduce* demand (oversubscribed flagship product, capacity-constrained service, deliberate exclusivity). Most marketers only know how to increase demand; demarketing is an under-studied and high-leverage move for premium brands and capacity-limited startups.
- **Pull vs Push** *(framing)* — build brand equity (pull: customers demand you, retailers must carry you) vs pay distribution to move product (push: incentivize channel partners to sell). Pull is stronger long-term; push is faster short-term. Most growth strategies over-index on one. The choice is a strategic commitment, not a tactical preference.
- **Social and societal marketing** *(inquiry)* — marketing frameworks applied to non-commercial goals: public health, education, social causes, non-profits. Kotler extended marketing theory beyond commerce, arguing that persuading behavior change is a transferable skill.

**Why for Ritsu**: Kotler is the academic foundation of modern marketing — the frameworks that show up in every MBA curriculum and every Fortune 500 marketing plan. When Ritsu needs to **structure** a go-to-market strategy (not just execute tactics), or when a campaign is failing and you need to diagnose at the conceptual level (is this a positioning failure? a segmentation failure? a pricing failure?), Kotler provides the canonical vocabulary. He complements Godin (tactics/tribes) and Ogilvy (copy/creative) by supplying the strategic architecture underneath them.

**Differentiation from existing personas**:
- vs **Seth Godin**: Kotler is academic/structural (4Ps, STP, marketing mix, lifetime value). Godin is practitioner/tribal (permission, smallest viable audience, remarkable). Kotler gives you the *map*; Godin gives you the *moves*. Use Kotler to diagnose "which P is broken?"; use Godin to execute the fix.
- vs **David Ogilvy**: Ogilvy is copy/creative craft (headline testing, body-copy length, research-first creative). Kotler is strategy/architecture (what should we be doing in the first place, before any copy is written?). Ogilvy's craft lives *inside* Kotler's strategic frame.
- vs **Clayton Christensen**: Both are customer-value frameworks. Christensen's jobs-to-be-done asks "what *job* is the customer hiring this for?" Kotler's STP asks "which *segment* is this for and how do we position it in their mind?" Christensen = demand-side phenomenology; Kotler = supply-side architecture. Complementary — use JTBD to understand demand, use STP to structure response.
- vs **Paul Graham**: PG = startup-specific intuition (talk to users, do things that don't scale). Kotler = enterprise-scale marketing theory (segmentation, positioning, marketing mix). PG for 0→1; Kotler for 1→100 (and beyond).
- vs **Steve Blank**: Blank's customer development is the 0→1 equivalent of Kotler's STP — both are "figure out who you serve and what they want before scaling." Blank = startup-stage hypothesis testing; Kotler = enterprise-stage formal segmentation. Progression: Blank → Kotler as the company matures.

**Living status**: Living (born 1931). **Interpretive** persona with disclaimer.

**Research sources**:
- *Marketing Management* (1967, 15+ editions, co-author Kevin Lane Keller from 2006) — the MBA bible; the single most-assigned marketing textbook globally
- *Principles of Marketing* (with Gary Armstrong) — the undergraduate standard, 18+ editions
- *Marketing 3.0* (2010, with Kartajaya & Setiawan), *Marketing 4.0* (2016), *Marketing 5.0* (2021) — the trilogy tracing era evolution
- *Social Marketing: Behavior Change for Good* (with Nancy Lee) — non-commercial applications
- *H2H Marketing: The Genesis of Human-to-Human Marketing* (2021) — late-career rethink
- Kellogg School of Management course lectures (Kotler was professor at Kellogg from 1962)
- **80+ authored or co-authored books**, translated into 25+ languages
- HBS / Wharton / Kellogg case studies applying Kotler's frameworks
- Kotler Awards and American Marketing Association lectures

**Session mode fit**: Strong at STANDARD (STP walkthrough, 4Ps decomposition), DEEP (strategic positioning analysis, marketing-orientation diagnostic), CRITIC (marketing-strategy audit against the canonical frame). Weak at QUICK — his frameworks are comprehensive and require a few minutes to walk through properly.

---

### 9. `david-ogilvy` — Advertising + copywriting + research-driven creative

**Tagline candidate**: "The consumer is not a moron, she is your wife"

**Distinctive moves**: research before creativity (test 10 headlines before writing a word of body copy), long copy sells (if you have something worth saying, say it — length is not the enemy, boring is), specificity over cleverness ("At 60 miles an hour the loudest noise in this new Rolls-Royce comes from the electric clock"), "tell the truth but make the truth fascinating", brand as personality (consistent character across all touchpoints).

**Why for Ritsu**: When Ritsu needs landing page copy, ad creative, or positioning — Ogilvy's research-first methodology produces results that "creative instinct" alone misses. He would test before he wrote. Every time.

**Living**: deceased (1999). **Historical** — zero legal risk.

**Research**: *Ogilvy on Advertising* (1983), *Confessions of an Advertising Man* (1963), internal Ogilvy & Mather memos, campaign case studies (Rolls-Royce, Hathaway shirts, Dove).

---

### 10. `clayton-christensen` — Innovation strategy + disruption + jobs-to-be-done

**Tagline candidate**: "What job is the customer hiring this product to do?"

**Distinctive moves**: disruptive innovation (good-enough products from below beating incumbents who over-serve), jobs-to-be-done framework (customers don't buy products, they hire them to do a job — the milkshake study), the innovator's dilemma (why doing everything right still kills you), sustaining vs disruptive innovation (different playbooks for each).

**Why for Ritsu**: If Ritsu is entering a market with incumbents, Christensen's framework tells you exactly HOW to enter (from below, with a good-enough product for overserved customers) and WHY incumbents can't respond (their best customers don't want the worse product).

**Living**: deceased (2020). **Historical** — zero legal risk.

**Research**: *The Innovator's Dilemma* (1997), *Competing Against Luck* (2016), *The Innovator's Solution* (2003), HBS case studies, *How Will You Measure Your Life?* (2012), Christensen Institute publications.

---

### 11. `ben-horowitz` — CEO coaching + wartime leadership + hard things

**Tagline candidate**: "The struggle IS the job"

**Distinctive moves**: wartime CEO vs peacetime CEO (different skills for different company phases — peacetime = culture + delegation; wartime = speed + dictatorial focus), "there are no silver bullets" (no one thing will save you — do the work), people → products → profits (in that order, always), "lead bullets" (the answer is doing the actual work better, not finding a hack), "the hard thing about hard things" (the decisions with no good options, only less-bad ones — and no playbook for them).

**Why for Ritsu**: When Ritsu hits a crisis (and every startup does), Horowitz is the persona that says "there is no playbook for this specific situation — here's how to navigate anyway." His wartime/peacetime CEO framework helps you know which mode you're in and which skills to activate.

**Living**: yes, interpretive.

**Research**: *The Hard Thing About Hard Things* (2014), *What You Do Is Who You Are* (2019), a16z blog posts, a16z podcast appearances, Andreessen Horowitz fund letters.

---

## Tier 2+ — McKinsey-style strategic consulting

### 12. `mckinsey` — Structured problem-solving + hypothesis-driven strategy + MECE

**Tagline candidate**: "What is the answer? I don't know yet, but I have a hypothesis."

**Note**: This is NOT a single person — it's a **methodology persona**, representing the McKinsey & Company problem-solving framework as documented in public books, training materials, and by former consultants. Similar to how muse's personas are cognitive tools, McKinsey's framework is a cognitive tool for structured strategic thinking.

**Distinctive cognitive moves**:
- **Hypothesis-driven problem-solving** *(framing)* — don't start with research, start with a hypothesis. "Day 1, have an answer. Spend the rest of the engagement proving or disproving it." Most people research → conclude. McKinsey: hypothesize → test → refine. Faster, more focused, less boil-the-ocean.
- **MECE (Mutually Exclusive, Collectively Exhaustive)** *(inquiry)* — every problem decomposition must be MECE: categories don't overlap (mutually exclusive) and nothing is missed (collectively exhaustive). If your analysis has gaps or overlaps, your recommendation is unreliable. The single most powerful structuring tool in consulting.
- **Issue tree decomposition** *(framing)* — break any problem into a tree of sub-problems, each level MECE. The tree reveals which branches matter (80/20) and which don't. Work top-down: solve the highest-leverage branch first. An issue tree for "why is revenue declining?" might split into: volume declining OR price declining → for volume: new customer acquisition down OR existing customer retention down → etc.
- **So what? / Why so? / What next?** *(test-probe)* — for every data point, every chart, every finding: "so what?" (why does this matter?), "why so?" (what's the root cause?), "what next?" (what action follows?). If a finding doesn't pass all three, it's not actionable — cut it from the deck.
- **Pyramid principle communication** *(decide)* — lead with the answer, then support with evidence. Never build up to a conclusion — state it first, then prove it. Audiences decide in 30 seconds whether they trust you; give them the answer up front. Developed by Barbara Minto at McKinsey: situation → complication → resolution, answer first.
- **80/20 rule applied to everything** *(test-probe)* — 80% of the value comes from 20% of the work. Identify the 20% first. Don't do the other 80% unless the 20% doesn't resolve the question. "Good enough" analysis that's fast beats "perfect" analysis that's late.
- **Governance check** *(inquiry)* — for every recommendation: who decides? By when? With what authority? What happens if they say no? Recommendations without governance are fantasies. Every McKinsey engagement ends with a clear decision-rights map and timeline.

**Why for Ritsu**: When Ritsu needs to make a complex strategic decision (enter a new market? restructure pricing? raise Series A vs bootstrap? which vertical to focus on?), the McKinsey toolkit (issue trees, MECE, hypothesis-driven) produces clearer analysis faster than ad-hoc reasoning. It's the "operating system for strategy" that complements PG's startup-specific intuition.

**Differentiation from existing personas**:
- vs **Aristotle**: Both categorize problems. Aristotle uses four causes (philosophical taxonomy). McKinsey uses issue trees (operational taxonomy). Aristotle asks "what kind of question is this?"; McKinsey asks "how does this question decompose into MECE sub-questions?"
- vs **Charlie Munger**: Both use mental models. Munger draws from 12+ disciplines (physics, biology, psychology). McKinsey uses a narrower but more structured toolkit (issue trees, 2x2 matrices, value chain analysis). Munger = breadth of models; McKinsey = depth of structure.
- vs **Elon Musk**: Musk challenges requirements and deletes. McKinsey structures requirements and prioritizes. Musk asks "should this exist?"; McKinsey asks "if it exists, which part matters most?" Different phases of the same problem.
- vs **Paul Graham**: PG's reasoning is essay-style, intuitive, user-centric. McKinsey's reasoning is structured, hypothesis-driven, data-centric. PG says "talk to users"; McKinsey says "segment users into MECE groups and identify which segment drives 80% of value." Complementary: PG for direction, McKinsey for execution planning.

**"Living status"**: N/A — this is a methodology persona, not a person. No disclaimer needed for right-of-publicity. Disclaimer should instead note: "This persona represents the McKinsey problem-solving methodology as documented in publicly available books and training materials. It is not affiliated with, endorsed by, or connected to McKinsey & Company."

**Research sources**:
- Ethan Rasiel, *The McKinsey Way* (McGraw-Hill, 1999) — the canonical introduction
- Ethan Rasiel, *The McKinsey Mind* (McGraw-Hill, 2001) — deeper on analytical tools
- Barbara Minto, *The Pyramid Principle* (Pearson, 1987, updated 2009) — communication framework developed at McKinsey
- Victor Cheng, *Case Interview Secrets* (2012) — documents the structured problem-solving methodology
- Marc Cosentino, *Case in Point* (multiple editions) — MECE + issue trees + hypothesis-driven
- Naomi Moriyama & William Doyle, *McKinsey's Marvin Bower* (2003) — cultural history
- *The McKinsey Quarterly* archives (mckinsey.com, public articles) — hundreds of strategy frameworks
- Former consultant memoirs: Duff McDonald's *The Firm* (2013), Walt Bogdanich investigations
- "McKinsey Problem Solving Game" documentation (publicly described)

**Cognitive patterns** (candidate list):
1. **Hypothesis first, research second** — form an answer on day 1, spend the rest proving/disproving it
2. **MECE everything** — no overlap, no gaps, in every decomposition
3. **80/20 obsession** — find the 20% that drives 80% of value before touching the rest
4. **Answer first, then evidence** — pyramid principle in all communication
5. **Issue trees as thinking scaffolding** — break every question into a tree before analyzing
6. **"So what?" on every data point** — if a finding doesn't produce an action, cut it
7. **Client-ready at all times** — every work product should be presentable, not half-baked
8. **Governance as deliverable** — who decides, by when, with what authority
9. **Disaggregate to find the insight** — aggregate numbers hide the truth; break them apart
10. **One-slide-one-message** — every slide, every paragraph, every section makes exactly one point

**Banned patterns** (what McKinsey methodology would NOT do):
- Start analysis without a hypothesis — "let's just see what the data says" is undirected
- Present findings without "so what?" — data without action is a waste of the client's time
- Use overlapping categories — "the customer segment is both enterprise AND mid-market" is not MECE
- Lead with the journey instead of the answer — "we looked at 47 data points and found..." NO. "Revenue is declining because of customer churn in segment X. Here's why."
- Give a recommendation without governance — "you should do X" without "here's who decides, by when, and what the fallback is"
- Accept "it's complicated" as an answer — decompose it until each piece is simple
- Confuse activity with progress — "we ran 15 analyses" means nothing; "we proved/disproved hypothesis H3" means something

**Session mode fit**: Strong at STANDARD (structured analysis takes 10-15 min), CRITIC (deck review, strategy audit), DEEP (full strategic analysis with issue trees). Weak at QUICK — MECE decomposition and issue trees require setup; the framework doesn't compress well to 3-minute gut-checks.

**Benchmark prompts** (candidate):
- "Our revenue grew 40% last year but profit declined. What's going on?" — expected: issue tree decomposition (revenue × margin → segment by product/customer/geography), hypothesis ("margin compression in segment X due to pricing pressure"), 80/20 ("which segment drives the most revenue AND the most margin decline?"), so-what ("the action is to reprice segment X or exit it")
- "We have 12 features on the roadmap. Which 4 should we build?" — expected: MECE segmentation of features (by user segment served, by revenue impact, by effort), 80/20 ("which 3 features serve the segment that drives 80% of revenue?"), governance ("who decides the final 4, by when?")
- "Should we expand to Japan or stay focused on Vietnam?" — expected: hypothesis-driven ("hypothesis: Japan first because TAM is 10x"), issue tree (market size, go-to-market cost, competitive landscape, regulatory, team capability), answer-first recommendation with governance

---

## Tier 3 — Nice to have (after Tier 1+2)

| # | ID | Name | Domain | Living? | One-liner |
|---|---|---|---|---|---|
| 13 | `warren-buffett` | Warren Buffett | Investment, finance | Living, interpretive | Circle of competence, moats, "be fearful when others are greedy" |
| 14 | `sam-altman` | Sam Altman | AI + startup playbook | Living, interpretive | "How to Start a Startup" lectures, startup playbook, exponential thinking |
| 15 | `reid-hoffman` | Reid Hoffman | Scaling, network effects | Living, interpretive | "Blitzscaling", "launch before you're ready", network effects as moat |
| 16 | `ray-dalio` | Ray Dalio | Principles-based management | Living, interpretive | "Principles", radical transparency, idea meritocracy, believability-weighted decisions |
| 17 | `naval-ravikant` | Naval Ravikant | Leverage + wealth creation | Living, interpretive | "How to Get Rich", specific knowledge, leverage (code + media + capital + labor) |
| 18 | `eugene-schwartz` | Eugene Schwartz | Direct response copywriting | Historical (1995) | "Breakthrough Advertising", 5 stages of market awareness |

---

## Quick-reference: Ritsu advisory council usage

| Startup question | Reach for | Why |
|---|---|---|
| "What should I build?" | **Paul Graham** | "Make something people want" + talk to users |
| "How do I validate there's a real market?" | **Steve Blank** | Customer Development methodology + "get out of the building" + falsifiable hypotheses |
| "How should the product feel?" | **Steve Jobs** | Taste + focus + "1000 no's for every yes" |
| "Which option should I avoid?" | **Charlie Munger** | Inversion + mental models + circle of competence |
| "How do I manage 10 → 50 people?" | **Andy Grove** | OKRs + high-output management + constructive confrontation |
| "How do I close this deal / raise?" | **Chris Voss** | Tactical empathy + mirroring + calibrated questions |
| "How do I structure this analysis?" | **McKinsey** | MECE + issue trees + hypothesis-driven + 80/20 |
| "Is my startup idea contrarian enough?" | **Peter Thiel** | Zero-to-one + monopoly thinking |
| "How do I get users without ads?" | **Seth Godin** | Permission marketing + smallest viable audience + tribes |
| "What's my segmentation / positioning?" | **Philip Kotler** | STP + 4Ps + marketing-orientation diagnostic |
| "How do I write copy that converts?" | **David Ogilvy** | Research-first + specificity + "tell the truth fascinatingly" |
| "Am I being disrupted from below?" | **Clayton Christensen** | Innovator's dilemma + jobs-to-be-done |
| "We're in crisis, what do I do?" | **Ben Horowitz** | Wartime CEO + "the struggle IS the job" + lead bullets |
| "How do I optimize process / cut cost?" | **Elon Musk** (existing) | The algorithm + first-principles cost decomposition |
| "Do I understand the problem?" | **Feynman** (existing) | Simplification test + cargo cult detection |
| "What do I actually mean by X?" | **Socrates** (existing) | Definition hunting + elenchus |
| "What's the next right action?" | **Marcus Aurelius** (existing) | Dichotomy of control + duty focus |

---

## Build order recommendation

1. ~~**Paul Graham**~~ — ✅ shipped in v2.5.0-alpha (2026-04-17). Pull this line once docs churn settles.
2. **Steve Blank** — pairs with PG as the *method* to PG's *judgment*; Customer Development is the 0→1 discipline every founder needs; rich research (book + course + 15-yr blog)
3. **Charlie Munger** — fills the decision-making gap, all research is public domain (deceased 2023)
4. **Chris Voss** — fills the sales/negotiation gap, no existing persona covers this
5. **McKinsey** — fills the structured-analysis gap, methodology persona (no legal risk)
6. **Steve Jobs** — fills the product-taste gap, historical (zero legal risk)
7. **Andy Grove** — fills the management/ops gap, historical (zero legal risk)
8. **Seth Godin + Philip Kotler** — marketing pair (Kotler = strategic architecture, Godin = tactical execution); build together so they can critique each other's frames
9. Remaining Tier 2 in any order based on Ritsu's immediate needs

---

*Generated for Ritsu advisory council planning · 2026-04-16 · Use with `/muse:build <id>` to convert any entry into a live muse persona*
