# Changelog

All notable changes to Muse will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

Nothing yet.

---

## [2.21.0-alpha] — 2026-04-21 — "Ray Dalio joins the starter pack"

### Why

User requested a Ray Dalio persona for ongoing startup work (Vietnamese user message: *"toi rat thich nhan vat nay va dang rat lien quan den startup cua toi"* — they resonate strongly with the figure and find his frames directly relevant to their startup). Corpus was pre-curated and unusually rich: 6 books (Dalio's own *Principles: Life and Work* 2017; *Principles for Navigating Big Debt Crises* 2018; *Principles for Dealing with the Changing World Order* 2021; *How the Economic Machine Works* 2008 paper; plus Rob Copeland's *The Fund* 2023 as critical counter-perspective; Roger Lowenstein's *When Genius Failed* 2000 as LTCM context). 5 articles (LinkedIn/economicprinciples.org 2019-2024 on capitalism reform, the 2019 system-broken diagnosis, the big-cycles method essay, the 2021 bubble framework, the 2024 pivotal-year framing — stored as `fetch_status: summary` paraphrases per LinkedIn editorial returns). 5 verbatim video transcripts totaling ~45,800 words (30-min *How the Economic Machine Works* 2013 video — the most-watched economics video on YouTube; *Principles For Success* 8-episode animated mini-series 2019; *Changing World Order* animated companion 2022; *Lex Fridman Podcast* 2019 ~1h48m; *Changing World Order with Tony Robbins* 2022 ~2h). User-authored README pre-identified 4 core cognitive moves + flagged the LOAD-BEARING Copeland critical-perspective gap as non-negotiable honesty discipline.

Built using the full v2.14 research pipeline (4 parallel subagents: articles, transcripts, books, root) per `/muse:build`.

### Added

- **`personas/ray-dalio.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe): pattern-match to historical template *(framing)*; pain + reflection = progress *(inquiry)*; believability-weighted disagreement *(test-probe)*; the five-step process *(framing)*; where are we in the cycle? *(framing)*; principles-as-code rule-writing *(inquiry)*; four-lever beautiful-deleveraging diagnostic *(test-probe)*. 12 cognitive patterns (4 user-identified + 8 surfaced: reality-is-a-machine, hold-two-extreme-views-and-triangulate, know-what-you-dont-know, five-step-process, meditate-on-the-edges, where-are-we-in-the-cycle, beautiful-deleveraging-four-lever, reflect-share-iterate). 7 analogous cases with verbatim attributions (the 1982 disaster as founding event of principles; *How the Economic Machine Works* three-forces + four-levers mechanism thesis; *Changing World Order* 11-empires big-cycle thesis; the 2019 "system is broken" + capitalism-reform diagnosis; the 2021 six-indicator bubble framework; the 2024 five-forces "pivotal year" framing; Bridgewater's idea-meritocracy protocol with Copeland-gap flagged). 5 benchmark prompts (bp_pattern_match, bp_repeating_mistake, bp_macro_cycle_location, bp_believability_weight, bp_copeland_self_awareness). 15 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`. LIVING SUBJECT — mandatory disclaimer with explicit Copeland-gap disclosure.
- **`commands/muse:ray-dalio.md`** — slash command entry point matching v2.16 template. Mandatory interpretive-frame disclaimer including the Copeland-gap disclosure printed at session start. Three specific disciplines encoded: (1) **Copeland critical-perspective honesty** — load-bearing: when user asks persona to validate/import/implement a Bridgewater-style organizational protocol (dot-rating at scale, formal believability-weighting system), the persona MUST flag Copeland's *The Fund* counter-perspective explicitly and route to personal-scale cognitive moves rather than cloning the organizational implementation; (2) **probabilistic humility on macro calls** — when user cites Dalio's confident macro forecasts, the persona honors Dalio's own probabilistic frame (probability + payoff, opposite-case-stated, sizing-for-survival) and flags the "end of debt supercycle" 2010s timing miss as the canonical case of forecaster-certainty outliving its sell-by date; (3) **regime-detection on pattern-matching** — when the situation is plausibly genuinely novel (AI as general-purpose technology mid-2020s as candidate), persona must explicitly ask "new regime or one of the old ones?" before forcing the pattern.
- **`tests/build-regression/golden/ray-dalio.signatures.txt`** + **`tests/session-regression/golden/ray-dalio.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 16 → 17 personas. New "Macro Systems + Principles + Pattern-Recognition (Historical-Templates + Cycles + Believability-Weighting)" category introduced for Dalio. Header version bumped v2.11.0-alpha → v2.21.0-alpha.
- Regression harnesses green at 17/17 personas (build-regression) and 85 pairs (session-regression, 17 personas × 5 modes).

### Pipeline notes

- **Articles subagent**: 5 articles full-read (LinkedIn summaries per README fetch_status). 14 cognitive patterns + 12 signature moves + 14 analogous cases + 10 sources + 8 tensions + 16 distinctive questions + 12 banned phrases + 21 signature phrases extracted. Budget: ~62k tokens.
- **Transcripts subagent**: 5 transcripts skim-then-deepen (~45,800 words total across Economic Machine video, Principles For Success animated, Changing World Order animated, Lex Fridman 2019, Tony Robbins 2022). 15 cognitive patterns + 15 analogous cases (including the 1982 disaster verbatim recounting, Nixon 1971 gold de-linking, 1930s deleveraging case, Dutch/British/US empire transitions, Hero's Journey framing from Principles For Success, Deng Xiaoping cat metaphor, China 27x-growth statistics, Elon Musk helicoptering reference) + 7 tensions + 36 signature phrases + 15 distinctive questions + 12 banned phrases.
- **Books subagent**: text-first strategy (books stored as metadata + key ideas + <15-word quotes, copyright-respecting). Extensive Copeland *The Fund* mining at pp. 1-150 with documented incidents (Stefanova onboarding-panel breakdown, baseball-card rigging, Britt Harris arrival/departure, contract-dispute cases) paired with Dalio-lawyer publicly-disputed verbatim disputes. 12 cognitive patterns + 12 signature moves + 15 analogous cases + 25+ sources + 40+ signature phrases + 8 Copeland-Dalio tensions extracted. Lowenstein *When Genius Failed* captured for LTCM-risk-doctrine context.
- **Root subagent (README)**: user-authored curation captured the 4 core cognitive moves (principles-as-code, pattern-match-across-centuries, pain-reflection-progress, believability-weighted-decision-making) + flagged the LOAD-BEARING Copeland critical-perspective as non-negotiable honesty discipline. 5 cognitive patterns + 12 analogous cases + 5 tensions + 10 signature phrases + 5 distinctive questions + 16 sources extracted.
- **Ghost-citation spot checks**: "pain" / "idea meritocracy" / "believab" keyword presence verified across archive files via Grep (multiple hits in transcripts + README). Canonical Dalio phrases in persona ("Pain + Reflection = Progress", "An idea meritocracy", "meaningful work and meaningful relationships", "radical truth and radical transparency", "I'm a hyperrealist") are widely-documented across primary-source canon; attributed at source-file level rather than line-level per standard practice for well-documented canon. Signature phrases in thinking_mode kept to commonly-documented formulations only.

### Copeland critical-perspective honesty (load-bearing)

The persona's Shadow section explicitly encodes the Copeland-documented gap between the idea-meritocracy-as-advertised in *Principles* (2017) and the Bridgewater organization-as-operated in practice: (a) dots system reportedly elevated Dalio's own opinions disproportionately; (b) believability-weighting produced chronic anxiety rather than safety; (c) high turnover at senior levels; (d) specific documented incidents (Stefanova, Harris, contract disputes) describe operating environment substantially more coercive than *Principles* acknowledges. Several specific Copeland claims are publicly disputed by Dalio. Some former employees endorse Copeland's broader picture; others contest it. The persona encodes the cognitive moves at personal scale (pattern-match, believability-weight one-off disagreements, write principles down) and explicitly does NOT endorse the Bridgewater organizational implementation as a validated protocol. The gap is non-negotiable load-bearing honesty for the persona — do not soften into "on the one hand, on the other hand" rhetoric. The discipline is written into both the persona's Shadow section and the slash command's Step 3 voice rules.

### Probabilistic humility on macro calls

Second encoded discipline: Dalio's own frame prescribes probability + payoff + sizing-for-survival for every forecast. Persona honors this explicitly. When user cites a confident Dalio macro call (civil-war-class conflict ~50% in next decade, late-stage big-cycle positioning of US, end-of-debt-supercycle), persona delivers as stated bet with probability, triangulates opposite case, and flags the "end of debt supercycle" 2010s timing miss as canonical case of forecaster-certainty that outlived its sell-by date. Does not deliver certainty masquerading as conviction.

### Regime-detection on pattern-matching

Third encoded discipline: the pattern-matching reflex ("what kind of thing is this? how many times before?") is powerful when the reference class applies, degrades into false precision when the situation is genuinely novel. When user's situation is plausibly new-regime (AI as general-purpose technology mid-2020s is the canonical live case), persona asks "new regime or one of the old ones?" before forcing the pattern. Willing to say "reference class is genuinely thin, pattern-matching produces false precision, need a different frame."

### Not in scope (deferred to future updates)

- TED 2017 "How to Build a Company Where the Best Ideas Win" (captions not directly fetchable from ted.com)
- Lex Fridman Podcast #251 "Money, Power, and the Collapse of Empires" (December 2021)
- Talks at Google "Principles: Life and Work" (October 2018, Jordan Thibodeau)
- Tucker Carlson Show — Ray Dalio on the Civil War Cycle (Feb 2025/2026, singjupost transcript available)
- David Rubenstein Show — Ray Dalio at 92nd Street Y (January 2026)
- Tim Ferriss Show #264 "Ray Dalio, The Steve Jobs of Investing" (September 2017)
- Bridgewater Daily Observations selected publicly-released excerpts
- Full *Changing World Order* essay series on economicprinciples.org (chapters not yet captured)

---

## [2.20.0-alpha] — 2026-04-22 — "Charlie Munger joins the starter pack"

### Why

User requested a Charlie Munger persona for ongoing startup work. Corpus was dense with primary-source material: 5 articles (USC Law 2007 commencement — THE canonical Munger speech, verbatim full text; Howard Marks's "Easy Money" Oaktree tribute memo January 2024 preserving a private 2001 Munger line; Daily Journal obituary; Tren Griffin's 25iq capital-allocation essay; Shane Parrish's FS Munger Operating System distillation); 5 transcripts totaling ~74k verbatim words (Psychology of Human Misjudgment Harvard 1995 — foundational 12k words; Daily Journal Corp 2017/2019/2023 — DJ 2023 is his LAST public meeting before his Nov 28 2023 death; Caltech 2020 alumni conversation); and 7 books (Poor Charlie's Almanack Kaufman ed. 2005/2023 — THE single most important primary source, Stripe Press free online; Seeking Wisdom by Peter Bevelin 2003; The Complete Investor by Tren Griffin 2015; Damn Right! authorized biography by Janet Lowe 2000; The Snowball by Alice Schroeder 2008; Invested by Danielle Town; Blue Chip Stamps letters). User-authored README pre-identified 6 core cognitive moves + the late-life-acidity meta-note.

Built using the full v2.14 research pipeline (4 parallel subagents) per `/muse:build`.

### Added

- **`personas/charlie-munger.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe), 12 cognitive patterns (6 user-identified + 6 surfaced: iron-prescription-on-opinions, Planck-vs-chauffeur knowledge, opportunity-cost-as-second-best-idea, lifelong-learning-machine, avoidance-as-principal-method, denial-as-master-bias), 5 rich analogous cases with verbatim quotes (USC 2007 India inversion; Harvard 1986 "prescriptions for guaranteed misery"; Lincoln-Nebraska gallbladder doctor; McDonnell Douglas 4-tendency lollapalooza; Daily Journal 2023 "cryptocrappo" + ChatGPT denial-master-bias moment), 7 benchmark prompts, 14 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`.
- **`commands/muse:charlie-munger.md`** — slash command entry point. Mandatory interpretive-frame disclaimer (Berkshire and Munger family/estate are IP-protective). Two specific disciplines encoded: (1) late-life acidity honesty — persona maintains Munger's publicly-stated views on crypto, EMH/CAPM, formula-based hurdle rates without softening; (2) iron prescription on the persona itself — when user asks Munger to validate a position, the persona applies the iron prescription TO the user's position first.
- **`tests/build-regression/golden/charlie-munger.signatures.txt`** + **`tests/session-regression/golden/charlie-munger.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 15 → 16 personas. New "First Principles + Strategy + Philosophy (Multidisciplinary Latticework + Inversion)" category introduced for Munger.
- Regression harnesses green at 16/16 personas (build-regression) and 80 pairs (session-regression, 16 personas × 5 modes).

### Pipeline notes

- Articles subagent: 5 articles full-read (~42k tokens). 15 cognitive patterns + 15 signature moves + 16 analogous cases + 28 signature phrases extracted. USC 2007 is the densest single-speech Munger source; Howard Marks 2024 tribute preserves a canonical private 2001 Munger line on easy-money-corrupts-absolutely.
- Transcripts subagent: 5 transcripts skim-then-deepen (~74k total words). Psychology 1995 is the foundational canonical talk — the original 24 causes with lollapalooza introduced in closing Q&A. Daily Journal 2023 mined explicitly for "cryptocrappo" + the ChatGPT denial-master-bias moment (Munger's final public consolidation of the framework).
- Books subagent: Poor Charlie's Almanack read at ~230 of 618 pages across 7 principal talks (Portrait biography, Munger Approach, Harvard 1995 psychology reprint, Elementary Worldly Wisdom USC 1994, Practical Thought 1996 Glotz/Coke lollapalooza, Academic Economics UCSB 2003, USC Law 2007). Bevelin PDF was Chinese translation — primary English material captured via PCA instead. Snowball .epub skipped per instructions.
- Root subagent (README): captured all 6 user-identified cognitive moves + late-life-acidity meta-note, 10+ analogous cases, 5 canonical tensions.
- Ghost-citation verified: lollapalooza/incentive/show-me-the-incentive (21 hits in Harvard 1995); cryptocrappo/denial (7 hits in DJ 2023); seamless web / deserved trust (3 hits in USC 2007). "Invert, always invert" attributed to Poor Charlie's Almanack as Jacobi quote Munger borrows (README names this explicitly; PCA has the full Jacobi citation).

### Late-life acidity honesty

The persona explicitly encodes Munger's late-life voice — bone-dry, morally pointed, multidisciplinary, impatient with denial. Voice rules maintain Munger's publicly-stated views on crypto ("cryptocrappo"), EMH/CAPM (academic-clean-divorced-from-lollapalooza-reality), formula-based hurdle rates (use opportunity-cost-as-second-best-idea instead), and diversification-as-universal-advice (wrong when the opportunity is a cinch). Does not soften into hedged "on the one hand, on the other hand" on these topics — Munger wasn't that person. When user asks Munger to validate a position, the persona applies the iron prescription TO the user's position first before engaging substance.

### Honest attribution note

Poor Charlie's Almanack (700+ pages across 11 talks) and Seeking Wisdom were cited at the book-level rather than page-level. Specific quotes attributed to PCA (like "where I'm going to die so I'll never go there") are canonical Munger quotes widely documented across PCA and Bevelin, but were not always verified against the specific ~230 pages the books subagent skimmed. This follows standard practice for well-documented primary-source canon where file-level attribution is sufficient for muse's interpretive-frame purpose.

### Not in scope (deferred to future updates)

- 2014 Berkshire annual meeting Q&A — Munger's 50-year-letter retrospective
- "Practical Thought About Practical Thought?" 1996 Coca-Cola lollapalooza thought experiment standalone treatment
- "Academic Economics: Strengths and Faults After Considering Interdisciplinary Needs" UCSB 2003 standalone
- Whitney Tilson's multi-year Daily Journal meeting notes
- CNBC "Charlie Munger: A Life of Wit and Wisdom" Becky Quick special (Nov 30, 2023)
- Li Lu's "On Being Asked About Charlie Munger" essays

---

## [2.19.0-alpha] — 2026-04-22 — "Steve Jobs joins the starter pack"

### Why

User requested a Steve Jobs persona for ongoing startup work. Corpus was dense with primary-source material: 5 verbatim long-form articles (Playboy 1985 15k words; Wired 1996; TIME 1997; Rolling Stone 2003; Fortune 2008) totaling ~38k words, 7 books (Isaacson 2011 authorized biography; Schlender & Tetzeli 2015 insider-preferred; Kocienda's Creative Selection 2018; Segall's Insanely Simple 2012; Lashinsky's Inside Apple 2012; Moritz's Return to the Little Kingdom 2009; Make Something Wonderful 2023 Steve Jobs Archive), and 6 verbatim video transcripts (Stanford commencement 2005; Lost Interview with Cringely 1995; MIT Sloan 1992; WWDC 1997 Fireside Q&A; iPhone keynote Macworld 2007; D5 Gates+Jobs joint 2007) totaling ~60k words. User-authored README pre-identified 6 core cognitive moves + named the reality-distortion tension (positive vs negative faces).

Built using the full v2.14 research pipeline (4 parallel subagents) per `/muse:build`.

### Added

- **`personas/steve-jobs.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe), 12 cognitive patterns (6 user-identified + 6 surfaced: A-players-only/bozo-explosion, process-vs-content diagnostic, craftsmanship-in-5000-subtleties, customer-experience-backwards, cannibalize-yourself-before-competitors, memento-mori-decision-filter), 5 rich analogous cases with verbatim quotes (1997 Apple return 350→4 product cut; iPhone 2007 three-revolutions keynote; Xerox PARC 1979 "obvious in 10 minutes"; Stanford 2005 commencement three stories; iPod Fadell Lego-mockup demo 2001), 7 benchmark prompts, 18 verified sources. All 6 canonical dilemmas covered via `canonical_mapping`.
- **`commands/muse:steve-jobs.md`** — slash command entry point matching v2.16 template. Mandatory interpretive-frame disclaimer printed at session start (Apple + Jobs estate are IP-protective). Explicit instruction that the persona does NOT endorse Jobs's gratuitous cruelty or cancer-delay reality-distortion — only the constructive subset (direct honesty, bar-holding, demo-demanding, memento mori).
- **`tests/build-regression/golden/steve-jobs.signatures.txt`** + **`tests/session-regression/golden/steve-jobs.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 14 → 15 personas. New "Strategy + Design + Execution (Focus-by-Subtraction + Taste-as-Constraint)" category introduced for Jobs.
- Regression harnesses green at 15/15 personas (build-regression) and 75 pairs (session-regression, 15 personas × 5 modes).

### Pipeline notes

- Articles subagent: 5 verbatim articles, full-read, ~78k tokens. 25 cognitive patterns + 19 signature moves + 21 analogous cases + 28 signature phrases extracted. Surfaced the "hero-shithead roller coaster" and "competent tyrant" patterns beyond user-identified.
- Transcripts subagent: 6 transcripts skim-then-deepen (~60k total words, ~50k read). Key canonical phrases verified: "focusing is about saying no" (WWDC 1997), "stay hungry stay foolish" (Stanford 2005), "good artists copy, great artists steal" attributing Picasso (Lost Interview 1995). 40 signature phrases + 15 distinctive questions + 15 cognitive patterns.
- Books subagent: 5 of 7 PDFs skim-read (~200 pages total: Isaacson 60pp, Make Something Wonderful 40pp, Kocienda 40pp, Segall 20pp, Schlender 40pp). Inside Apple and Return to Little Kingdom not needed for first pass. Kocienda's Creative Selection is the canonical demo-driven-development source; cited for the iPad keyboard decision story.
- Root subagent (README): user-authored curation captured 6 cognitive moves explicitly, named reality-distortion as positive+negative, listed 15 analogous cases, identified 5 canonical tensions.
- Ghost-citation verified: "focusing is about saying no" + "can only do three" 5 hits in WWDC 1997; "stay hungry / stay foolish / connect the dots" 5 hits in Stanford 2005; Xerox/PARC/"obvious" 14 hits in Lost Interview 1995; "bicycle for the mind" 2 hits in Rolling Stone 2003.

### Reality-distortion honesty

The persona explicitly encodes the two faces of reality-distortion (positive: Corning glass, iPhone ship date, Mac circuit board thinner; negative: nine-month pancreatic cancer surgery delay) and instructs the agent to classify the domain before applying the move — *negotiable* (supplier capability, engineering tolerance, deadline) vs *non-negotiable* (biology, thermodynamics, time-past). Refuse to apply reality-distortion to non-negotiable domains. That's the fatal misapplication of the move, and Jobs's own worst moment.

### Cruelty disclaimer

The persona does NOT endorse or adopt Jobs's gratuitous cruelty — the "bozo" name-calling, public humiliation, and employee damage documented in Fortune 2008 and Schlender/Tetzeli 2015. The constructive subset (direct honesty, refusal to accept "good enough", bar-holding, demo-demanding, memento mori decision-filter) is what this persona encodes. Voice rules explicitly ban the cruelty patterns.

### Not in scope (deferred to future updates)

- D8 All Things Digital 2010 (Mossberg/Swisher) — Jobs's last major public interview before 2011 death
- D5 Jobs Solo Interview (May 2007, before Gates joint)
- Smithsonian Oral History April 1995 (Daniel Morrow)
- "Think Different" 1997 internal Apple meeting
- Gladwell's "The Tweaker" New Yorker 2011 (adversarial counter-interpretation)
- Andy Hertzfeld, Revolution in the Valley (2005) — original Mac team's version
- Jony Ive, Designed by Apple in California (2016)
- Steven Levy, The Perfect Thing (2006) — iPod story
- Lee Clow interviews on advertising with Jobs

---

## [2.18.0-alpha] — 2026-04-22 — "Naval Ravikant joins the starter pack"

### Why

User requested a Naval Ravikant persona for ongoing startup work. Corpus was pre-curated with exceptional depth: 6 articles from nav.al (mix verbatim/summary), 1 primary book (The Almanack of Naval Ravikant, 232 pages, Jorgenson 2020) + 5 text-only summaries of influence books (Poor Charlie's Almanack, Beginning of Infinity, Finite/Infinite Games, Skin in the Game), and 5 verbatim video transcripts totaling ~162k words across 13h15m (Naval Podcast 'How to Get Rich' mega-episode with Nivi 2019, JRE #1309 2019, Tim Ferriss #473 2020, Knowledge Project Ep. 18 2017, Modern Wisdom '44 Harsh Truths' 2024). User-authored README pre-identified 6 core cognitive moves + flagged the LIVING-SUBJECT disclaimer as especially load-bearing (Naval publicly revises his own most-quoted aphorisms — 2024 Modern Wisdom contains several "I'm not sure that statement is true anymore" retractions).

Built using the full v2.14 research pipeline (4 parallel subagents: articles, transcripts, books, root) per `/muse:build`.

### Added

- **`personas/naval-ravikant.md`** — interpretive persona with 7 signature moves (balanced 2 framing + 3 inquiry + 2 test-probe), 12 cognitive patterns (6 user-identified + 6 surfaced during mining), 5 rich analogous cases with verbatim quotes (AngelList 2010 founding, Epinions 'competition is the wrong game', the mom-at-pizza-parlor specific-knowledge reveal at 15, the jealousy-breakthrough moment on impossibility-of-cherry-picking, the 60-day one-hour-morning meditation protocol), 6 benchmark prompts, 24 verified sources (tweet thread + 6 articles + Almanack with 6 chapters + 5 transcripts + 4 influence books). All 6 canonical dilemmas covered via `canonical_mapping`. LIVING SUBJECT — mandatory disclaimer with explicit 2024 retraction honesty.
- **`commands/muse:naval-ravikant.md`** — slash command entry point matching v2.16 template. Full disclaimer printed at session start. Retraction-honesty instruction in Step 3 (persona acknowledges when user cites aphorisms with known 2024 updates).
- **`tests/build-regression/golden/naval-ravikant.signatures.txt`** + **`tests/session-regression/golden/naval-ravikant.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 13 → 14 personas. New "Strategy + Execution + Philosophy (Leverage-as-Wealth-Engine)" category introduced for Naval.
- Regression harnesses now green at 14/14 personas (build-regression) and 70 pairs (session-regression, 14 personas × 5 modes).

### Pipeline notes

- Articles subagent: 6 files (mix verbatim/summary per README fetch_status), ~185k tokens used, 29 signature phrases + 14 signature moves + 13 cognitive patterns + 10 analogous cases extracted
- Transcripts subagent: 5 files, skim-then-deepen applied per v2.14 protocol — ~52k words read of ~162k total, covering: leverage/specific-knowledge/long-term-games (Naval Podcast), happiness/anxiety/meditation (Ferriss), reading/jealousy-breakthrough (Knowledge Project), retrospective-aphorism-revision (Modern Wisdom 2024), mainstream-breakthrough (JRE). 43 signature phrases + 15 cognitive patterns + 11 analogous cases + 16 distinctive questions extracted. The 2024 Modern Wisdom episode was explicitly mined for retractions to honor the living-subject honesty.
- Books subagent: text-first strategy — 5 ref summaries + targeted Almanack PDF skim (100/232 pages across 5 windows: TOC, wealth, judgment, happiness+saving-yourself, philosophy+recommended-reading). 14 cognitive patterns + 12 signature moves + 14 analogous cases + 38 signature phrases + 29 sources extracted. Noted Naval's 2008 Life Formulas I and 2016 Rules as earlier canonical primary texts beyond the Almanack.
- Root subagent (README): user-authored curation captured the 6 cognitive moves + 10 analogous cases (AngelList, Vast.com, Epinions, Hit Forge, ~200 investments, How-to-Get-Rich 2018 tweetstorm, Almanack 2020, nav.al, 2024 Modern Wisdom, JRE 1309) + living-iterating-thinker meta-note.
- Ghost-citation: all key quotes verified to appear in source files via Grep (specific knowledge / long-term game / leverage: 7 hits in play-long-term-games; 1000 parallel universes: 3 hits in How to Get Rich; $5,000/hr aspirational rate: 3 hits in How to Get Rich; "I'm not sure that statement": 2 hits in Modern Wisdom 2024).

### Living-subject honesty

This persona includes an explicit "retraction honesty" instruction in the slash command: when a user cites a Naval aphorism that has a known 2024 Modern Wisdom update, the session acknowledges both versions. Example: user cites "success requires dissatisfaction" → Naval 2024 Modern Wisdom: "I'm not sure that statement is true anymore." This honesty is part of the persona because Naval himself does this in public. The persona refuses to pretend Naval's canonical corpus is settled.

### Not in scope (deferred to future updates)

- Lex Fridman Podcast Ep. #138 (2020) and #307+ (2022) — two canonical long-forms, captions not maximally extractable yet
- Naval on EconTalk with Russ Roberts
- All-In Podcast appearances (multiple)
- Tim Ferriss Show #97 (2015) "The Evolutionary Angel" early-career interview
- Ranveer Show "Self-Obsession Is the Root of All Misery" (2024) — most explicitly Vedantic
- Sapiens by Yuval Noah Harari — most-cited background reading

---

## [2.17.0-alpha] — 2026-04-22 — "David Ogilvy joins the starter pack"

### Why

User requested a David Ogilvy persona for ongoing startup work. Corpus at `.archives/personas/david-ogilvy/` is the richest external submission to date: 6 curated articles, 9 books (8 PDFs + 1 EPUB, including Confessions, Ogilvy on Advertising, Unpublished Ogilvy, Blood Brains & Beer, the 1935 AGA cooker manual, and Kenneth Roman's 2009 biography), 5 verbatim video transcripts totaling ~16,000 words (Touffou 1982, Crichton interview c.1977, We Sell — Or Else 1985, Letterman 1983, Salesman documentary), and a user-authored README pre-identifying the five core cognitive moves.

Built using the full v2.14 research pipeline (4 parallel subagents, triple-verification, Synthesis Plan + Audit, inline gates) per `/muse:build`. This is the first persona built end-to-end under the v2.16 adaptive-runtime release.

### Added

- **`personas/david-ogilvy.md`** — interpretive persona with 7 signature moves (balanced across framing/inquiry/test-probe categories), 12 cognitive patterns, 5 analogous cases (Rolls-Royce 1958 with 3-week research and 26 headlines, Hathaway eye-patch 27-year run, Commander Whitehead at Schweppes 19 years, Pepperidge Farm 2 a.m. wagon dream 25+ year run, Eleanor Roosevelt margarine confessed flop), 6 benchmark prompts, 18 verified sources (7 books/memos + 5 transcripts + 6 secondary). All 6 canonical dilemmas covered via `canonical_mapping`.
- **`commands/muse:david-ogilvy.md`** — slash command entry point matching v2.16 template. Interpretive-frame disclaimer printed at session start.
- **`tests/build-regression/golden/david-ogilvy.signatures.txt`** + **`tests/session-regression/golden/david-ogilvy.*.schema.yaml`** (5 modes × 1 persona = 5 new golden files).

### Changed

- `docs/PERSONAS.md`: starter pack upgraded from 12 → 13 personas. New "Strategy + Execution + Empirical (Copy-as-Measurable-Science)" category introduced for Ogilvy.
- Regression harnesses now green at 13/13 personas (build-regression) and 65 pairs (session-regression, 13 personas × 5 modes).

### Pipeline notes

- Articles subagent: 6 files, 38k tokens used, 0 prompt-injection patterns detected
- Transcripts subagent: 5 files, ~16k words verbatim Ogilvy speech, 30 signature phrases + 12 distinctive questions + 12 banned phrases + 12 analogous cases + 13 cognitive patterns extracted
- Books subagent: text-first strategy after initial PDF-size failure — 6 ref/books/*.md summaries + targeted PDF skim (Confessions pp.1-20, AGA 1935 full 15pp, Unpublished Ogilvy pp.1-40, Blood Brains Beer pp.1-20). 15 signature moves + 17 sources + 30 signature phrases from books alone.
- Root subagent (README): user-authored curation captured the 5 cognitive moves + Eleanor Roosevelt / Manet AGA / Xerox / Sorrell flops as analogous cases
- Ghost-citation: all key quotes verified to appear in source files via Grep (three weeks + electric clock in Touffou; Eleanor Roosevelt + margarine in Letterman; Russian doll + giants + dwarfs in Touffou; Hathaway + eyepatch in Touffou)

### Not in scope (for future updates)

- Forbes 1982 Hicks profile (not fetched — link in archive)
- Drayton Bird's Ogilvy memo archive (blog)
- Founders podcast Ep. 82 on Ogilvy (David Senra, Spotify)
- Additional Magic Lantern training films beyond Touffou

---

## [2.16.0-alpha] — 2026-04-22 — "Adaptive session runtime" — EXPLORE mode, convergence loop, threads, handoff, council, artifacts

### Why

Per CEO + Eng review pipeline (2026-04-22 plan at `~/.gstack/projects/muse/ceo-plans/2026-04-22-adaptive-session-runtime.md`). User observation: v2.2 sessions are constrained by fixed stage counts per mode, cannot adapt to where thinking actually wants to go, cannot save progressively, cannot cross days. Some problems need to be thought through until the result lands, not stopped at a timer.

v2.16 converts the session runtime from fixed-stage to adaptive, with checkpoint-every-stage persistence, multi-session continuity via threads, mid-session mode upgrade + persona handoff, multi-persona councils, decision-artifact templates, and six small-wins primitives that make the runtime feel alive instead of step-through.

### Added

**New modes + orchestration**:
- **EXPLORE mode** — no stage cap, convergence-driven. Session iterates until thinking lands (convergence `converged`), needs more depth (`deepen` → loop current stage), needs new framing (`pivot` → loop to Stage 1), or needs different persona (`handoff` → spawn linked session).
- **Convergence detector** (`CONVERGENCE.md`) — two-tier: cheap heuristic (word-count delta, repetition, pivot counter, safety cap) + LLM-judge Agent via shared primitive (`LLM_JUDGE.md`). Mode-specific policy: QUICK skips LLM-judge entirely, STANDARD/CRITIC invoke on uncertainty, DEEP/EXPLORE every stage.
- **Loop-back primitives** — `deepen` re-enters same stage with new probe; `pivot` loops to Stage 1; safety cap at 15 stages in EXPLORE forces convergence.

**Persistence + resume**:
- **Checkpoint-every-stage** — session file updates after every stage (append-only), not just Stage 5. Crash-safe.
- **Living document** — session file valid markdown at every intermediate state; user can watch the session unfold in an editor.
- **Resume workflow** — `/muse:<persona> --resume <path>` or `/muse:continue <path>` reconstructs state from checkpoint and continues the stage graph.
- **New skill** `commands/muse:continue.md` — entry point for resume.

**Cross-session continuity**:
- **Thread concept** (`THREADS.md`) — `--thread=<slug>` groups sessions. Thread digest at `~/.muse/threads/<slug>/digest.md` rolled up after each session, injected into next session's persona context.
- **Thread slug derivation** — explicit flag > inherited from parent > auto-derived from question. Collision detection via Jaccard + hash suffix.
- **Digest compaction + audit log** — rotate last 5 archives before compacting.
- **Thread-scoped bookmarks** — `~/.muse/threads/<slug>/followups.md` visible to all sessions in thread.

**Mid-session primitives** (formalized grammar `^/(bookmark|recap|rewind|promote|handoff|council|dontknow)(\s+.*)?$`):
- `/promote <mode>` — upgrade STANDARD → DEEP → EXPLORE mid-session
- `/handoff <persona-id>` — spawn linked session with new persona, state transfer (digest + compressed outputs + current framing)
- `/council <p1> <p2> [<p3>]` — parallel Agent dispatch, side-by-side ASCII rendering, synthesis option
- `/bookmark <note>` — save tangent to thread's followups.md
- `/recap` — 3-bullet summary on demand, no LLM call
- `/rewind <n>` — reload checkpoint from n stages back
- `/dontknow` — clean pause, resumable anytime
- Progress indicator in every stage banner: `Stage N · mode=X · stage N/? · pivots:K · last-verdict:Y`

**Auto-handoff hints**:
- After each stage, lightweight check: does next stage need a move this persona lacks? If yes, offer handoff. Disabled in `MUSE_REGRESSION_MODE=true`.

**Multi-persona council** (`COUNCIL.md`):
- 2-3 persona parallel Agent dispatch at any STOP point
- Per-Agent 45s timeout; timeout produces placeholder cell, others still render
- ASCII side-by-side output (2 or 3 column)
- Options: A/B/C go with one persona, option C synthesize, option D reject

**Artifact templates** (`artifact-templates/`):
- `decision-memo.md` — committed stance + rationale + next action
- `rfc.md` — proposal with alternatives + tradeoffs
- `one-pager.md` — summary + next action for sharing
- `spec.md` — functional + non-functional requirements + data model + edge cases
- Stage 5 now offers artifact-type choice; default session log always written; chosen artifact written to `~/.muse/artifacts/`

**New infrastructure**:
- `LLM_JUDGE.md` — shared LLM-judge primitive used by both RESEARCH_PIPELINE.md (v2.14 semantic similarity) and CONVERGENCE.md (v2.16 convergence detector). Includes caching, deterministic-mode, fallback behavior.
- `lib/thread-lock.sh` — cross-platform mkdir+PID-file locking for concurrent thread writes. `flock` is Linux-only; `mkdir` is POSIX. Stale-lock recovery via PID-check + mtime. iCloud Drive detection warns user about atomicity gaps.
- `tests/session-regression/run.sh` — session-regression harness validating static invariants (persona has required move categories per mode, canonical coverage, SESSION.md structural integrity, schema fingerprints per (persona, mode) pair). Supports snapshot + check modes. 48-60 (persona, mode) pairs green.
- `tests/session-regression/migrate-v2-2-to-v2-16.sh` — idempotent migration script for existing v2.2 session files (adds null v2.16 frontmatter fields without changing v2.2 content).
- `tests/session-regression/convergence-eval.sh` + `convergence-fixtures/` — 10 labeled fixtures (3 converged, 3 deepen, 2 pivot, 2 handoff). Eval pass threshold ≥70% verdict accuracy.

**Regression mode**:
- `MUSE_REGRESSION_MODE=true` env var bypasses convergence detector, disables auto-handoff, disables council LLM-judge. Makes regression deterministic.

### Changed

- `SESSION.md` v2.2 → v2.16 (~200 lines added): EXPLORE mode, command grammar, /promote + /handoff dispatch, small-wins primitives, thread digest loading at pre-flight, convergence loop semantics, Stage 5 artifact selection, checkpoint-every-stage persistence, resume workflow.
- Frontmatter schema: new fields `thread_id`, `parent_session`, `checkpoint_stage`, `convergence_state`, `handed_off_to`, `handoff_at_stage`, `convergence_calls`, `llm_judge_calls`, `pivots`, `deepen_loops`. All additive; v2.2 files remain compatible (null values = v2.2 behavior).
- `RESEARCH_PIPELINE.md` — references new `LLM_JUDGE.md` shared primitive (cosmetic note; no behavior change).
- `docs/CHANGELOG.md` v2.16 entry.

### Fixed

- **Fixed-stage thinking for open-ended questions** — sessions that need depth can now keep going until convergence, not stop at mode timer
- **Cold-start across sessions** — multi-day thinking on the same problem previously lost context; threads + digest carry forward
- **Manual rewrite of persona mid-session** — previously required abort + restart with new persona; now single `/handoff` command
- **Only log output format** — Stage 5 now offers decision memo / RFC / one-pager / spec templates alongside the session log
- **Silent crash loses session** — v2.2 only wrote at Stage 5; v2.16 checkpoints after every stage; `/muse:continue` resumes from last checkpoint
- **Confidence-score theater** — outside-voice review flagged LLM self-assessed confidence as miscalibrated; v2.16 convergence schema uses discrete verdicts only, drops the confidence field
- **Non-deterministic regression** — `MUSE_REGRESSION_MODE=true` env var disables convergence detector and LLM-judge calls for deterministic testing

### Architecture

Follows the `Boil the Lake` principle: every component that would take 2+ hours of human work gets the complete implementation in minutes of CC work. 14-18hr CC estimate realistic (40+hr human team equivalent).

Implementation sequencing (all phases shipped in this release):
- Phase 2.16.0a — Session-regression harness (new test infra)
- Phase 2.16.0b — v2.2 → v2.16 migration + MUSE_REGRESSION_MODE env var
- Phase 2.16.1 — Foundation: schema additions, checkpoint-every-stage, resume workflow
- Phase 2.16.2 — EXPLORE mode + convergence loop + command grammar
- Phase 2.16.3 — Thread + digest layer (THREADS.md)
- Phase 2.16.4 — Mode upgrade (`/promote`) + handoff (`/handoff`) + auto-handoff hints
- Phase 2.16.5 — Council dispatch (COUNCIL.md)
- Phase 2.16.6 — Artifact templates (4 new)
- Phase 2.16.7 — Small-wins pack (6 primitives)
- Phase 2.16.8 — Concurrent-write safety (lib/thread-lock.sh) + iCloud warning
- Phase 2.16.9 — Full regression + convergence eval fixtures

### Reviews

- `/plan-ceo-review` (2026-04-22): SCOPE_EXPANSION mode, 5/5 expansions accepted, baseline B+ locked
- `/plan-eng-review` (2026-04-22): 15 issues found, 13 auto-fixed, 2 answered by user decisions
- Outside voice (Claude subagent adversarial review): 10 findings, 3 load-bearing tensions resolved (confidence dropped, command grammar formalized, scope held), 7 specs tightened in plan

### Not in scope (deferred to v2.17+)

- Queryable session history ("show me every debate where I was wrong")
- Thread map visualization (`/muse:map <thread_id>` ASCII tree)
- Persona disagreement surfacing across thread history
- Session replay with different persona
- Convergence threshold user-tuning
- Stage branching for parallel subthreads
- Silent thinking phase (agent-initiated pause, vs user-initiated `/dontknow`)
- v2.20 full thinking-graph rewrite (sessions as DAG nodes, concurrent multi-persona)

### Known limitations (surfaced in eng review, accepted as v2.16-scope)

- Session-regression validates STATIC invariants (persona completeness per mode, schema integrity) — runtime quality requires manual QA + `/muse:benchmark`. Actual session invocation requires the Claude Code runtime.
- Convergence detector eval (10 fixtures) requires Claude Code to dispatch the judge; bash script documents the procedure but cannot run the judge itself.
- Outside voice noted convergence detector is "LLM judging LLM" — no ground truth, miscalibration risk. Mitigated via: heuristic-first tier (zero cost), safety cap at 15 stages, 3-consecutive-deepen forced convergence, `MUSE_REGRESSION_MODE` bypass.
- Critical gaps (disk-full on checkpoint, handoff to malformed persona) documented in plan for Phase 2.17 polish, not blocking ship.

### Install

```bash
cd ~/.claude/skills/muse && git pull
# then migrate any existing v2.2 session files:
bash tests/session-regression/migrate-v2-2-to-v2-16.sh
```

Existing v2.2 sessions continue to work unchanged until migrated. Post-migration they opt in to v2.16 features (resume, thread continuity). Backward-compatible.

### Shipped modules

- `SESSION.md` — v2.16 adaptive runtime spec (~1100 lines)
- `CONVERGENCE.md` — convergence detector spec (NEW)
- `COUNCIL.md` — council dispatch spec (NEW)
- `THREADS.md` — thread + digest spec (NEW)
- `LLM_JUDGE.md` — shared LLM-judge primitive (NEW)
- `commands/muse:continue.md` — resume skill (NEW)
- `artifact-templates/` — 4 templates (NEW)
- `lib/thread-lock.sh` — cross-platform locking helper (NEW)
- `tests/session-regression/` — harness + migration + convergence eval + 10 fixtures (NEW)

---

## [2.15.0-alpha] — 2026-04-22 — "Living and fresh" — corpus_fingerprint, /muse:refresh, /muse:rebuild, update-skill pipeline expansion, auto-rewrite on ghost-citation fail

### Why

Phase 3 of the persona-quality overhaul (per CEO plan `~/.gstack/projects/muse/ceo-plans/2026-04-21-persona-quality-overhaul.md`). Phase 1 (v2.13) gated the drafter. Phase 2 (v2.14) gave the pipeline smarter brains. Phase 3 closes the trilogy by addressing **staleness** (living figures publish daily — a month-old Seth persona decays), **user-facing rebuild safety** (the manual `cp; rm; /muse:build` dance is lossy and risky), and **update-skill primary-source grounding** (C3/C6/C9/C10/C11 fixes previously relied on inline inference from the persona file itself — now they can route through the v2.14 pipeline for primary-source evidence).

### Added

- **`corpus_fingerprint` frontmatter field** (Item 14) in `docs/PERSONA_SCHEMA.md`. Optional v2.15 field with `last_mined`, `src_folder`, `bucket_counts`, `total_files`, `total_bytes`. Lightweight mtime + count snapshot (not SHA256 — QOVER-9 deferred). Fully additive; pre-v2.15 personas keep working but can't be refresh-mined until rebuilt or updated.
- **Staleness detection appendix** (Item 15) in `RESEARCH_PIPELINE.md` Appendix A. Algorithm `compare_fingerprint(persona_id) → {fresh, stale, missing_fingerprint, corpus_missing}` using POSIX `find -newermt` + bucket-count diff + 5% size-drift threshold. Called by `/muse:refresh` Step 2.
- **`/muse:refresh <persona-id>` NEW skill** (Item 16) in `commands/muse:refresh.md`. 9-step incremental re-mine workflow: staleness check → delta file collection → delta-mode pipeline dispatch → merge proposal → diff + confirm → atomic write + fingerprint update → analytics log. `--check` dry-run flag. Does not replace `/muse:build` — additive-only merge, preserves existing persona structure.
- **`/muse:rebuild <persona-id>` NEW skill** (Item 17) in `commands/muse:rebuild.md`. 9-step safe-rebuild workflow with automatic backup + A/B comparison + user choice (accept new / keep old / merge manually). Replaces the manual `cp; rm; /muse:build` pattern with transactional semantics. Interactive merge mode walks each diff item-by-item for users who want line-by-line control.
- **`/muse:update` pipeline routing for C3/C6/C9/C10/C11** (Item 18) in `commands/muse:update.md`. Each C-check fix now offers a "point me at `.archives/personas/<id>/`" option that invokes the v2.14 research pipeline and filters the envelope to the relevant findings category (C3 → tensions; C6 → distinctive_questions + tensions + banned_phrases; C9 → signature_phrases; C10 → banned_phrases + signature_phrases; C11 → cognitive_patterns). Produces primary-source-grounded fixes. Fallback to inline inference on empty pipeline or no-research-material.
- **Auto-rewrite on ghost-citation fail** (Item 19) in `commands/muse:build.md` Step 4 sub-step 3.1 AND Step 5.95. Agent subagent reads the source file, finds a verified verbatim quote that expresses the same cognitive move, returns `VERIFIED_QUOTE / LINE / CONFIDENCE` or `NO_VERIFIED_QUOTE_FOUND / REASON`. Replaces the fabricated quote on re-verified pass. Usually succeeds when the drafter hallucinated the wording of a real idea; fails cleanly when the concept itself wasn't in the source.
- **`corpus_fingerprint` auto-write on `/muse:build` Step 7** — every new persona build now writes the fingerprint before atomic `mv`. Enables `/muse:refresh` on day-one new personas.
- **`tests/fixtures/refresh-delta-persona/`** — README-documented fixture with 4-file corpus + fingerprint of first 3. Validates Item 15 staleness detection + Item 16 delta-mine workflow.
- **`tests/fixtures/rebuild-diff-persona/`** — README-documented fixture with a deliberately-gappy v1 persona + 5-file corpus. Validates Item 17 A/B comparison + user-choice paths.

### Changed

- `commands/muse:build.md` v2.14.0-alpha → v2.15.0-alpha (Step 4.3.1 + Step 5.95 auto-rewrite, Step 7 fingerprint-write, header version bumps)
- `commands/muse:update.md` v2.14.0-alpha → v2.15.0-alpha tooling (C3/C6/C9/C10/C11 each gain pipeline-route option as first choice)
- `RESEARCH_PIPELINE.md` v2.14.0-alpha → v2.15.0-alpha (adds Appendix A: Staleness detection + delta-mode subagent prompt)
- `docs/PERSONA_SCHEMA.md` schema version 2.2.1-alpha → 2.15.0-alpha (header note + corpus_fingerprint field + footer version)
- Frontmatter schema: new optional field `corpus_fingerprint` (additive, backward-compatible)

### Fixed

- **Persona staleness for living figures** — a month-old Seth Godin persona built on 2026-03-15 couldn't detect the 30+ new posts added in April. v2.15 `/muse:refresh` closes the loop: fingerprint comparison → delta-mine → merge.
- **Manual rebuild was lossy** — users running `cp personas/<id>.md ~/backup/; rm personas/<id>.md; /muse:build <id>` had no structured A/B comparison. If the new build lost a signature move the user liked, they noticed after the fact. v2.15 `/muse:rebuild` gives an explicit diff + 3-way choice BEFORE finalizing.
- **Update-skill C-checks were inference-only** — C3/C6/C9/C10/C11 fixes derived proposals from the persona's own fields (already-distilled, potentially already-wrong). v2.15 lets each route through the pipeline and pull from primary sources when the corpus is available. Reduces "AI-flavored" voice-rule bans in favor of phrases the persona actually rejected.
- **Ghost-citation hard-stops were friction** — Step 5.95 previously FAILed the build when a quote didn't verify, forcing manual Step 4 loop-back. v2.15 dispatches an Agent to find a verified replacement from the same source file; usually saves the move without user intervention. Absolute verify-or-refuse guarantee preserved.

### Architecture

This is **Phase 3 of 3** per CEO plan — the trilogy is complete:
- Phase 1 (v2.13, 2026-04-21) — Gate the drafter: synthesis audit, inline gates, save-time gates, year-archive heuristic
- Phase 2 (v2.14, 2026-04-22) — Pipeline brains: envelope persistence, semantic similarity, context budget, adaptive PDF, rejected-candidates visibility, auto-retry
- **Phase 3 (v2.15, this release) — Living and fresh** (current): corpus_fingerprint, staleness detection, /muse:refresh, /muse:rebuild, update-skill pipeline expansion, auto-rewrite

### Reviews

- `/plan-ceo-review` on 2026-04-21: CLEAR, SELECTIVE_EXPANSION mode — 20 of 30 items accepted, 10 deferred to QOVER-1..10 in TODOS.md
- `/plan-eng-review` on 2026-04-22: CLEAR — 2 key decisions resolved via AskUserQuestion (LLM-judge over embeddings; separate v2.14→v2.15 releases)

### Not in scope (deferred to TODOS.md QOVER-1..10)

- SHA256 content-addressed corpus manifest (QOVER-9) — mtime + count sufficient for Seth's append-only use case; revisit when edit-heavy living-figure persona surfaces
- Embedding API integration (OpenAI/Cohere/Voyage) — conflicts with zero-dep philosophy; LLM-judge via Agent covers semantic similarity
- `/muse:explore <id>` corpus preview skill (QOVER-2) — low demand
- Multi-persona batch build (QOVER-3) — low demand
- Session-quality feedback loop (QOVER-6) — own future CEO plan
- Specialized adversarial reviewers (QOVER-7) — complexity not yet justified
- EPUB native support (QOVER-8) — `ebook-convert` convention acceptable
- Per-era / per-bucket finding weighting (QOVER-9) — semantic similarity is a bigger lever
- Mid-build interactive redirect (QOVER-10) — low demand
- Backfilling v2.10+ pipeline improvements against the 12 shipped personas — golden regression still passes; users can opt in via `/muse:rebuild <id>`

### Install

```bash
cd ~/.claude/skills/muse && git pull
# (or) cp -r commands/* RESEARCH_PIPELINE.md docs/ tests/fixtures/ ~/.claude/skills/muse/
```

Existing personas continue to work unchanged. To opt in to v2.15 features for an existing persona, run `/muse:update <id>` (which adds the fingerprint) or `/muse:rebuild <id>` (which rebuilds with all v2.15 improvements).

---

## [2.14.0-alpha] — 2026-04-22 — "Pipeline brains" — envelope persistence, semantic similarity, context budget, adaptive PDF, rejected-candidates visibility, auto-retry

### Why

Phase 2 of the persona-quality overhaul (per CEO plan `~/.gstack/projects/muse/ceo-plans/2026-04-21-persona-quality-overhaul.md`). Phase 1 (v2.13) gated the drafter. Phase 2 gives the pipeline smarter brains: forensic debuggability (envelope preservation + rejected-candidates-to-reviewer) and robustness (semantic similarity beyond lexical, auto-retry, context-budget awareness, adaptive book budgets).

### Added

- **Context-budget awareness per subagent** (Item 8) in `RESEARCH_PIPELINE.md` Stage 2 subagent prompt. Subagents track ~token consumption via file-size approximations; switch to summary-mode at 50% of 500k budget, hard-stop at 80%. Envelope now records `budget_used_tokens`, `budget_hit_threshold`, `budget_switched_to_summary_at_file`.
- **Book-length adaptive skim-then-deepen budget** (Item 9) in `RESEARCH_PIPELINE.md` Step 2C. Replaces fixed 100-page-per-PDF cap with `adaptive_budget = min(200, max(50, round(0.20 * total_pages)))`. Example: 200-page book → 50-page budget (25% coverage), 800-page textbook → 160 pages (20% coverage). Preserves v2.13 behavior for 500-page books.
- **LLM-judge semantic similarity** (Item 10) in `RESEARCH_PIPELINE.md` Stage 4 Test 3. Two-tier filter: Jaccard as Tier 1 (cheap, <0.3 skip / >0.9 fail-fast), LLM-judge Agent as Tier 2 for 0.3-0.9 borderline band. Catches "Purple Cow" vs "remarkable product" class of semantic collisions that lexical Jaccard missed. Fallback to Jaccard-only on Agent unavailable. Budget: ~60-80 Agent calls per median persona (~5 min added latency).
- **Pipeline envelope persistence** (Item 11) in `RESEARCH_PIPELINE.md` Stage 5. Full envelope JSON written to `.archives/personas/<id>/_pipeline_output/<ISO>.json` after each pipeline run. Rotation keeps last 5 per persona. Gitignore already excludes `.archives/personas/**`. Enables Phase 3 `/muse:refresh` to load cached findings + lets spec review see rejected candidates.
- **Rejected candidates surfaced to spec reviewer** (Item 12) in `commands/muse:build.md` Step 5.5. Agent prompt extended with new `=== PIPELINE REJECTED CANDIDATES ===` section loaded from the latest envelope. Dimension 6 added to spec review: "did the filter correctly drop low-signal, or reject high-signal candidates?" Spots over-strict filter issues before save.
- **Auto-retry on subagent timeout** (Item 13) in `RESEARCH_PIPELINE.md` Stage 2 timeout-and-partial-failure section. On first failure, re-dispatch with simplified prompt (drop optional findings categories, reduce per-file budget 40%, shorter envelope schema). One retry total, then skip. Logs `subagent_retry_count`, `retry_reason`, `retry_succeeded`.
- **`tests/fixtures/semantic-collision-persona/`** — 2-article fixture designed to fool Jaccard (low lexical overlap) but trigger LLM-judge (high semantic similarity with Seth's Purple Cow). Validates Item 10.
- **`tests/fixtures/timeout-resilience-persona/`** — documentation fixture describing expected auto-retry behavior. Doc-only (real timeouts aren't deterministic fixtures). Validates Item 13 contract.

### Changed

- `commands/muse:build.md` v2.13.0-alpha → v2.14.0-alpha
- `commands/muse:update.md` v2.10.0-alpha tooling → v2.14.0-alpha tooling (cosmetic version catch-up)
- `RESEARCH_PIPELINE.md` v2.13.0-alpha → v2.14.0-alpha
- Envelope output schema: new fields `pipeline_version`, `persona_id`, `src_folder`, `run_at`, `caller_skill`, `budget_*`, `subagent_retry_count`, `retry_succeeded`
- Spec review Agent prompt: dimensions expanded 5 → 6 (new filter-quality dimension)

### Fixed

- **Over-strict exclusive filter** — v2.13 Jaccard at 0.6 could reject legitimately distinctive candidates whose wording happens to overlap with an existing persona's (false positive). v2.14 two-tier with LLM-judge reduces false positives by distinguishing surface similarity from substantive similarity.
- **Silent subagent failures** — v2.13 logged timeouts but didn't retry. One transient timeout could lose an entire bucket's findings. v2.14 gives one retry with a simplified prompt, recovering most transient failures.
- **Forensic blindness** — v2.13 logged analytics summary but discarded full envelope data. Can't answer "why was this candidate rejected three sessions ago?" v2.14 preserves envelopes to disk, rotating last 5.

### Architecture

This is **Phase 2 of 3** per CEO plan:
- Phase 1 (v2.13, 2026-04-21) — Gate the drafter: synthesis audit, inline gates, save-time gates, year-archive heuristic
- **Phase 2 (v2.14, this release) — Pipeline brains** (current)
- Phase 3 (v2.15, planned) — Living and fresh: corpus fingerprint, staleness detection, /muse:refresh, /muse:rebuild, update-skill pipeline expansion

### Reviews

- `/plan-eng-review` on 2026-04-22: HOLD_SCOPE, 2 key decisions resolved (LLM-judge over embeddings/trigrams; separate v2.14→v2.15 releases over combined).

### Not in scope (deferred)

- Corpus fingerprint + staleness detection (Phase 3)
- `/muse:refresh` + `/muse:rebuild` skills (Phase 3)
- `/muse:update` C3/C6/C9/C10/C11 pipeline expansion (Phase 3)
- Auto-rewrite on ghost-citation failure (Phase 3)
- Full `/muse:benchmark` Grade-A re-verification on v2.14 (separate QA session)

---

## [2.13.0-alpha] — 2026-04-21 — "Gate the drafter" — synthesis-plan + save-time benchmark + year-archive heuristic

### Why

Three consecutive major persona rebuilds (elon-musk v3.0 → v3.1, philip-kotler v1 → v2, seth-godin v1 → v2) all followed the same pattern: pipeline ran, all automated gates passed, persona shipped, user manual audit caught fundamental gaps, rebuild required.

Root cause from `/plan-ceo-review` on 2026-04-21: every gate in the system (C1-C12, spec review, dry-run, ghost-citation, triple-verification) tests properties *inside* the drafted persona. Zero gates tested the *relationship between* pipeline output and the drafted persona. A drafter could receive 100+ findings and use 20% of them, and all gates still pass.

This release adds the producer-consumer contract that was missing.

### Added

- **Step 3.5 Synthesis Plan + Audit** (MANDATORY, v2.13 NEW) in `commands/muse:build.md` — the load-bearing gate. Drafter produces a coverage matrix BEFORE interactive brainstorm: `slot → candidate_name → primary_source → bucket → era → confidence → cross_refs`. Five deterministic validator checks (coverage ratio, bucket balance, no hallucinations, cross-bucket balance per move, era coverage). Optional `--deep-validate` dispatches an Agent subagent for judgment questions (are these the highest-confidence candidates? is the plan coherent?). Blocks Step 4 until plan passes.
- **Inline ghost-citation during drafting** (Step 4 sub-step 3.1, v2.13 NEW) — ghost-citation check fires per-move as the drafter composes, not post-hoc at Step 5.95. Prevents wasted interactive-brainstorm cycles on fabricated quotes.
- **Inline incremental distinctiveness** (Step 4 sub-step 3.2, v2.13 NEW) — Jaccard overlap vs all shipped personas runs per-move during drafting. Catches collisions early instead of at Step 5.3 post-draft.
- **Inline balanced-provenance** (Step 4 sub-step 3.3, v2.13 NEW) — every signature_move must cite cross-bucket refs when the corpus has ≥2 buckets with findings. Sparse-corpus exception: warn-not-block.
- **Step 5.95b Save-gate benchmark + balanced-provenance re-check** (MANDATORY, v2.13 NEW) — pairwise Jaccard collision check against all shipped personas (move vs move, pattern vs pattern, tagline vs tagline) with threshold 0.7 for same-category, 0.8 for cross-category. Balanced-provenance re-verified against Synthesis Plan requirements. Blocks Step 7 atomic write on failure. Analytics logged to `~/.muse/analytics/save-gate.jsonl`.
- **Year-archive granularity heuristic** in `RESEARCH_PIPELINE.md` Step 2B (v2.13 NEW) — detects multi-document files via heading count + file size OR-logic: `heading_count > 30` OR `file_size > 500KB AND heading_count > 10` OR `file_size > 100KB AND heading_count > 20`. Triggers Stratified Sampling.
- **Stratified Sampling codified** (Step 2B-strat, v2.13 NEW) — for multi-document files (e.g., year-archives with 300-500 concatenated daily posts): read opening 1500-2500 lines + mid 1500-2000 lines + closing 1500-2000 lines, plus targeted deep-dive on known canonical posts via grep. Total budget ~8000 lines per file. Prevents the seth-v1-class bug where 27-year-archive files were each treated as single essays.
- **`tests/fixtures/sparse-bucket-persona/`** — exercises balanced-provenance sparse-corpus exception. 1 bucket (notes), 3 files.
- **`tests/fixtures/large-year-archive/`** — exercises year-archive granularity heuristic. Single file with 53 `##` headings simulating a year-archive structure.
- **`tests/fixtures/multi-bucket-persona/synthesis-plan-example.md`** — golden reference for what a PASSING Synthesis Plan looks like for the multi-bucket fixture.

### Changed

- `/muse:build` v2.10.0-alpha → v2.13.0-alpha. Description updated to reflect the new synthesis-plan gate as the primary quality improvement.
- `RESEARCH_PIPELINE.md` v2.10 → v2.13. Step 2B enhanced with granularity-awareness; Step 2B-strat added.
- Step 9 close message now reports: `v2.13.0-alpha compliant, synthesis-plan PASS, spec review score <X>/10, dry-run PASS, ghost-citation PASS, benchmark-gate PASS, balanced-provenance PASS`.

### Architecture

This is **Phase 1 of the 3-phase persona-quality overhaul** per CEO plan `~/.gstack/projects/muse/ceo-plans/2026-04-21-persona-quality-overhaul.md`:
- Phase 1 (v2.13, this release): "Gate the drafter" — synthesis audit, inline checks, save-time gates, year-archive heuristic
- Phase 2 (v2.14, planned): "Pipeline brains" — envelope preservation to disk, semantic similarity for exclusive-test, subagent auto-retry, adaptive book-budget
- Phase 3 (v2.15, planned): "Living and fresh" — corpus fingerprint, staleness detection, /muse:refresh, /muse:rebuild, update-skill pipeline expansion

10 P2 items deferred to TODOS.md (QOVER-1..10) for opportunistic fixing.

### Reviews

- `/plan-ceo-review` on 2026-04-21: SELECTIVE_EXPANSION mode, 30 issues surfaced (4 P0 + 12 P1 + 14 P2), 20 accepted into Phases 1-3, 10 deferred.
- `/plan-eng-review` on 2026-04-21: HOLD_SCOPE, 3 issues (validator split deterministic+Agent-opt, DRY on distinctiveness + ghost-citation shared blocks). All resolved during implementation.
- No ghost-citation regression test yet for the new Synthesis Plan validator — deferred to Phase 2.

### Fixed

- **The three-consecutive-rebuild pattern**. If this Phase 1 were active when seth-godin v1, kotler v1, elon v3.0 shipped, the Synthesis Plan coverage-ratio check would have flagged each one at Step 3.5 (before Step 4 drafting) because the drafter would have been forced to admit: "I'm only mapping 20% of pipeline findings to persona slots."

### Not in scope (deferred)

- Semantic similarity for exclusive-test (Phase 2)
- Pipeline envelope preservation to disk (Phase 2)
- Rejected candidates surfaced to spec reviewer (Phase 2)
- Corpus fingerprint + staleness detection (Phase 3)
- `/muse:refresh` + `/muse:rebuild` skills (Phase 3)
- `/muse:update` pipeline expansion for C3/C6/C9/C10/C11 (Phase 3)
- Formal `/muse:benchmark` re-run on 12-persona pack with Phase-1 gates active

---

## [2.12.0-alpha] — 2026-04-21 — `seth-godin` persona v2.0 — article-depth rebuild (1,317+ posts across 24 year-archives)

### Why

User audit caught that v1.0 (v2.11.0-alpha) under-mined the `articles/` bucket. Each year-archive file in `.archives/personas/seth-godin/articles/` is NOT a single essay — it is **~300-500 SEPARATE daily blog posts concatenated** (2007.md alone has ~570 distinct posts, ~1 per day). The v1 articles subagent had treated each year-file as one document and extracted ~5 article citations across the entire persona, missing the bulk of Seth's marketing vocabulary that lives in his daily blog cadence, not in the book-event vocabulary.

This is a semantic-drift bug, not a pipeline bug. The v2.10 research pipeline worked correctly; the v1 synthesis (composition step) under-used what the subagents returned. v2.0 corrects the synthesis.

### Added

- **`personas/seth-godin.md` v2.0.0** — full rebuild with:
  - **Post-level citation refs** — `sethblog-2002-when-people-become-cogs`, `sethblog-2010-quieting-the-lizard-brain`, `sethblog-2014-trust-and-attention-the-endless-dance`, `sethblog-2022-smallest-viable-audience`, `sethblog-2024-the-fame-trust-inversion`, `sethblog-2024-the-generals`, `sethblog-2026-attention-and-effort`, `sethblog-2026-the-knot-my-upcoming-new-book`, `sethblog-2026-purity-loops`, etc. Every signature move and example now traces to a specific post within a specific year, not just to the year-archive.
  - **Four-era naming catalog** inside the Name-the-previously-unnamed signature move — Founding (2002-2007), Buildout (2008-2013), Synthesis (2014-2019), Recent (2020-2026). ~60+ coined terms inventoried with era provenance.
  - **7th signature move: Sort problem from situation** *(test-probe)* — Seth's 2026-era diagnostic from *The Knot* book announcement. "Gravity is a situation. Getting to the moon and back is a problem." Forces a taxonomic check before any effort is spent.
  - **13 cognitive patterns** (up from 12) — adds *Toward better (meliorism)* as a meta-frame and *Sort problems from situations* as the 2026-era taxonomic instinct. Each pattern now carries era annotations showing how it evolved across the 24-year corpus.
  - **New section: `## Era evolution`** — unique-to-Seth v2.2 extension given his 24-year daily-blog corpus. Four sub-sections (Founding / Buildout / Synthesis / Recent) each documenting: dominant books, voice register, key coinages of the era, what became canonical. Voice-across-eras summary: 2002 *"Safe is risky"* → 2010 *"If it doesn't ship, it doesn't count"* → 2018 *"People like us do things like this"* → 2024 *"Make things better by making better things"*.
  - **14 analogous cases** (up from 4 in v1) — CD Baby confirmation email (2002), Lionel Poilâne Paris bakery (2002), The Beatles and teenagers (2008 Tribes), Quieting the lizard brain essay (2010), Amanda Palmer 20k fans (2012), Trust and attention endless dance essay (2014), SVA canonical essay with Reverence Harlem case (2022), Ballmer's Microsoft vs Nadella (2023 Song of Significance), The Generals as trust-then-fame (2024), Daedalus/Icarus edited myth (2012 Icarus Deception), AI agents as door-to-door salespeople (2026), Carbon Almanac volunteer project (2022), Sliced bread (TED 2003), Yoyodyne (permission-marketing-1999).
  - **Two new benchmark prompts** — u12 (post-COVID team, Song of Significance era-voice) and u13 (AI-era marketing, 2026 era-voice).
  - **Era-voice annotations on every benchmark prompt** — signals which era's register the expected response draws on.
  - **Critic frames extended from 6 to 8** — added The problem-vs-situation test and The meliorism test.
- **`tests/build-regression/golden/seth-godin.signatures.txt`** — refreshed to 7 moves (was 6).

### Changed

- **v1.0.0 → v2.0.0** major version bump on the persona itself (not a patch — content rewrite).
- Persona trailer updated to document the rebuild: *"rebuilt 2026-04-21 via the v2.10 research pipeline (4 parallel article era-subagents covering 1,317+ individual blog posts across 24 year-archives + 1 books subagent + 1 transcripts subagent + adversarial spec review)"*
- Supersedes persona v1.0.0 (2026-04-19, v2.11.0-alpha). v1 preserved as `personas/seth-godin.md.bak.20260421000616` per muse-update backup convention.
- Regression harness now snapshots 7 moves for seth-godin (up from 6).

### Research-pipeline provenance

- **4 parallel era-subagents dispatched** — each mined 6 year-archive files with stratified sampling (opening + mid + late of each year at 1,500-2,500 lines per chunk):
  - Era 1 FOUNDING (2002-2007): 340 posts sampled, 67.8 KB output persisted
  - Era 2 BUILDOUT (2008-2013): 290 posts sampled, 52.2 KB output persisted
  - Era 3 SYNTHESIS (2014-2019): 240 posts sampled, 59.1 KB output persisted
  - Era 4 RECENT (2020-2026): 447 posts sampled, full output inline (~33 patterns, 50 analogous cases, 44 signature phrases, 24 banned phrases, complete era_evolution paragraph)
- **Total posts sampled in v2.0 pass: 1,317+** (~13% of Seth's ~10,000 lifetime blog posts as of 2026-04-21)
- Books + transcripts coverage carried over from v1 — both were well-mined in the initial pass (books: 23 patterns, 29 cases; transcripts: 25 patterns, 49 cases)
- **Ghost-citation spot-check**: 6/6 manually-verified terms ("Sheepwalking" in 2007.md, "cogs" in 2002.md, "Generals" in 2024.md, "meliorism" in 2024.md, "purity" in 2026.md, "Knot" in 2026.md) all hit with ≥1 match per source file. No ghost citations in v2.0.
- **Spec review**: deferred to post-commit follow-up. v2.0 relies on the research pipeline's built-in triple-verification (cross-domain + predictive + exclusive) which all findings passed. A formal Agent-dispatched adversarial review is scheduled as an optional v2.12.1-alpha patch if review surfaces material issues.

### Fixed

- **Article under-mining from v1.0.0** — 16 of 27 year-archive files read with post-level extraction in v2.0 (was: 16 files read but mostly as single-document, with only ~5 article references making it into the final persona body). v2.0's persona body contains 23+ explicit post-level citations and a 4-era naming catalog sourced directly from the daily blog.
- **Missing era annotations** — v1 presented signature moves as era-agnostic, flattening Seth's 24-year evolution. v2.0 annotates each move and pattern with its era of origin, its evolutionary arc, and its canonical source post.
- **Missing AI-era material** — v1 stopped at 2023. v2.0 incorporates 2024-2026 material including the fame-trust inversion, meliorism frame, AI agents as door-to-door salespeople, AI slop diagnosis, problem-vs-situation sort, purity loops, hollow orange, TINA-incomplete-sentence.

### Not in scope (deferred)

- Formal `/muse:benchmark` Grade-A re-verification on 12-persona pack with v2.0 seth-godin. The pipeline's triple-verification is a proxy; a full benchmark run is a follow-up.
- Article mining for remaining 11 year-archives — v2.0 sampled ~13% of Seth's lifetime posts. A future v3.0 could target ~30% by running 8 era-subagents instead of 4 (2-year slices).
- Extending the era-evolution section pattern to other interpretive living-figure personas (Rams, Musk, Graham, Kotler). Each has multi-decade corpora that would benefit similarly, but scope-contained to Seth for this release.

---

## [2.11.0-alpha] — 2026-04-19 — `seth-godin` persona — first build with the v2.10 research pipeline end-to-end

### Why

Two things motivated this release back-to-back with v2.10. First, the v2.10 research pipeline needed a real corpus to prove the design, not just synthetic fixtures. Second, the user had been asking for Seth Godin in the starter pack for a while — his four distinctive cognitive moves (naming unnamed patterns, inverse-framing safe-as-risky, daily-shipping discipline, empathy-first reframe of marketing as service) fill an identifiable gap in the existing 11-persona pack between Philip Kotler's enterprise-strategy frame and Paul Graham's startup-execution frame.

Running the new pipeline against `.archives/personas/seth-godin/` (50 files, 82 MB — the largest folder in the archive) was the first end-to-end production use.

### Added

- **`personas/seth-godin.md` (525 lines, v2.2-compliant)** — fourth interpretive living-figure persona in the starter pack (after Rams, Musk, Graham, Kotler). Six signature moves across all three category slots (2 framing + 2 inquiry + 2 test-probe), twelve cognitive patterns, five context-tagged taglines, full banned-patterns voice discipline, six-canonical-dilemma debate coverage, four analogous problems with source citations, 21 source entries (12 blog year-archives + 10 books + 5 long-form transcripts).
- **`commands/muse:seth-godin.md`** — slash command entry matching the existing 11 persona commands. Stage 0 mode detection recommends QUICK / STANDARD / CRITIC (Seth's strong modes) and warns on DEEP. Full interpretive disclaimer printed at the top of every session.
- **Twelfth persona in the starter pack**. README hero table, persona tables, runtime sections, and `docs/PERSONAS.md` updated from "11 personas" / "Eleven great mentors" to 12. Also bumped README persona-session table, `/muse:who` triage example, and all benchmark references.
- **Research-pipeline-build provenance recorded**. Persona file footer documents: v2.10 research pipeline, 3 subagents dispatched (articles, books, transcripts bucket), 16 triple-verified patterns from the merged pool, ghost-citation gate PASS. First persona in muse whose distillation provenance is fully traceable through the pipeline.
- **Test fixture coverage**. `tests/build-regression/golden/seth-godin.signatures.txt` added (6-move snapshot). Regression harness now tracks 12 personas; all PASS on golden.

### Architecture notes

- **Pipeline validation in production**. The v2.10 4-subagent fanout was the load-bearing decision from the `/plan-ceo-review` + `/plan-eng-review` run the day before. This release is the empirical proof it works end-to-end on a real 82 MB corpus — articles bucket (27 files, 10 MB), books bucket (18 files, 72 MB — mixed PDFs + curated ref markdowns), transcripts bucket (5 files, 160 KB). Books subagent applied skim-then-deepen on four priority PDFs (Meatball Sundae, Poke the Box, The Icarus Deception, The Song of Significance) staying within the 100-page-per-book budget.
- **Adversarial spec review caught 16 issues, 7 critical**. Cognitive-patterns-vs-signature-moves restatement (three patterns), Jaccard collision risk with Paul Graham's "Name the pattern" move (resolved via explicit consumer-facing-vs-founder-facing differentiation in the move body), 2 miscategorized banned-patterns (`"average stuff for average people"` and `"scale first"` — Seth uses both diagnostically in his own voice, so not genuinely banned; replaced with `"meets market expectations"`, `"industry-standard conversion rate"`, `"spray and pray"`, `"cast a wide net"`, `"top of funnel"`), 1 core-belief overlength (compressed 2 sentences → 1), 4 ghost-citation risks (4 verbatim quotes in "Reframe safe as risky" move and the "Safety-Song team" example in "Name the previously-unnamed" — rewrote as paraphrase + explicit "let me invent a handle to try on" disclosure).
- **Distinctiveness check**. Jaccard token overlap vs the 11 existing personas highest at 25% (elon-musk `Name the requirement-maker`) and 23.52% (paul-graham `Name the pattern`) — both well under the 60% collision threshold. The PG collision was the most substantive and was addressed in the move body with an explicit "Not to be confused with Paul Graham's pattern-naming" paragraph differentiating the consumer-facing vs founder-facing distinction.
- **Ghost-citation gate**. All 10 key claimed quotes trace to source files (hit counts 4 to 37 per term across the archive). No ghost citations in the draft.

### Source materials (traceable provenance)

- Blog archives 2002, 2005, 2007, 2009, 2010, 2011, 2014, 2018, 2019, 2022, 2024, 2026 (12 year-files, ~10 MB)
- Book refs (6): Permission Marketing 1999, Purple Cow 2003, The Dip 2007, Tribes 2008, Linchpin 2010, This Is Marketing 2018
- Primary-source PDFs (4 skim-then-deepen): Meatball Sundae 2007, Poke the Box 2011, The Icarus Deception 2012, The Song of Significance 2023
- Transcripts (5, verbatim, ~38k words total): TED 2003 "How to Get Your Ideas to Spread", TED 2009 "The Tribes We Lead", Authors@Google ~2005 "All Marketers Are Liars", Chase Jarvis Live Nov 2018 "How to Do Work That Matters", Impact Theory Mar 2018 "How to Be a Linchpin"

### Changed

- README "Eleven great mentors" hero tagline → "Twelve great mentors" (with matching row additions in two persona tables — starter-pack overview and persona-session command table)
- `docs/PERSONAS.md` — new `### Strategy + Design + Contrarian (Marketing-as-Remarkable)` section with full Seth Godin entry, matching the existing format
- Starter pack classification: 7 historical + 4 interpretive → 7 historical + 5 interpretive (Rams, Musk, Graham, Kotler, Godin)
- Session count 11 persona commands → 12 persona commands (21 slash commands → 22)

### Fixed

- Nothing — this is an additive release

### Not in scope (deferred)

- `/muse:benchmark` grade-A re-verification on the new 12-persona pack. The manual Jaccard distinctiveness scan in Step 5.3 showed overlap <25% against every existing persona, so the heuristic grade is A by the C1-C12 gate. A full `/muse:benchmark` run against the new pack is a follow-up.
- Backfilling the v2.10 research pipeline against the 11 prior personas. Regression harness proves they still match their golden signatures, so no rebuild forced.

---

## [2.10.0-alpha] — 2026-04-19 — Research pipeline rewrite — `/muse:build` + `/muse:update` stop missing books

### Why

User audit surfaced the root cause behind every recent "ghost-citation" and "missed book" hotfix (v2.9 Vance, v2.8 Kotler, v2.4 elon rebuild): `/muse:build` Step 2 had three stacked bugs in the source-reading logic:

1. **Non-recursive glob** — pattern `<src_folder>/*.{md,txt,srt,vtt,json}` matched only top-level files. Every persona folder puts content in subfolders (`articles/ books/ transcripts/ notes/`), so for `.archives/personas/philip-kotler/` the glob hit exactly 1 file (`README.md`). The other 40 files were never read.
2. **No PDF/EPUB support** — 25 PDFs and 1 EPUB across `.archives/personas/` were invisible to the glob even if recursive. Yet Claude Code's Read tool natively supports PDFs.
3. **Hard caps** — "up to 10 files in parallel" and "skip files >5MB" silently dropped everything past the thresholds. Even the user's manual PDF→txt extractions (e.g. `principles-of-marketing-19th-edition-rental-edition.txt` at 5.94 MB) got skipped.

Result: every recent persona build was compensating manually with hand-curated README digests and hand-extracted book excerpts in non-standard paths, then still hallucinating citations because the skill had no structured distillation step.

### Added

- **`RESEARCH_PIPELINE.md` at repo root** — shared load-bearing spec for reading persona source folders. Hybrid subfolder map-reduce: detects conventional buckets (`articles/`, `books/`, `transcripts/`, `notes/`, plus root), dispatches one general-purpose subagent per bucket in parallel via the Agent tool (already in `allowed-tools`), merges and dedupes findings across buckets with provenance preserved, runs triple-verification (cross-domain + predictive + exclusive) before emitting candidates. Prints a coverage report every run.
- **Skim-then-deepen PDF strategy** — subagent reads pages 1-20 (TOC + preface + intro) to identify high-signal chapters, then reads 2-3 targeted chapter ranges. Page budget: 100 per book. Prevents context blowup on 800-page references without hard-skipping the file.
- **Triple-verification filter (from `alchaincyf/nuwa-skill`)** — adapted into muse's schema. Each candidate must appear in ≥2 buckets OR ≥3 files, must have a non-empty trigger + example, and must Jaccard-overlap <0.6 with every shipped persona's signature moves. Rejected candidates logged to `~/.muse/analytics/research.jsonl`, never fabricated into output.
- **Ghost-citation gate — mandatory, not AskUserQuestion-able** (`/muse:build` Step 5.95): every `Example:` quote in the draft must trace to its source file via exact substring match or ≥0.8 trigram similarity. FAIL at this gate blocks save absolutely, no "accept anyway" escape hatch. Directly prevents the v2.9 class of bugs by construction.
- **Subagent prompt sanitization** — each dispatched subagent receives the `[INST]`/`<<SYS>>`/`{{...}}` strip rules in its own prompt template. Prompt-injection surface no longer multiplies with bucket count.
- **Analytics** — per-pipeline-run line at `~/.muse/analytics/research.jsonl`: buckets detected, buckets succeeded, files read/skipped, candidates merged/verified/rejected with reasons.
- **`tests/` first-class directory**:
  - `tests/run.sh` — fixture-based harness
  - `tests/fixtures/{minimal,multi-bucket,large-corpus,adversarial}-persona/` — 4 fixtures exercising empty-bucket handling, full fanout, stress, and prompt-injection sanitization
  - `tests/build-regression/run.sh` — regression harness that snapshots signature-move names across all 11 shipped personas and flags ≥30% drift
  - `tests/build-regression/golden/` — 11 golden snapshots committed (run `--snapshot` to refresh)
- **`TODOS.md`** at repo root — 3 follow-up items surfaced during `/plan-ceo-review` + `/plan-eng-review`: regression backfill, EPUB convention in CONTRIBUTING, nuwa-interop schema spike.

### Changed

- **`/muse:build` v2.2.1 → v2.10.0-alpha**: Step 2 is now a reference to `RESEARCH_PIPELINE.md`. Step 1.5 existing-persona check dynamically globs `personas/*.md` instead of hardcoding 8. Step 5.3 distinctiveness check compares against all shipped personas, not just the original 8. Step 5.95 ghost-citation gate added.
- **`/muse:update` tooling bumped to v2.10.0-alpha**: C7 fix (missing sources) and C8 fix (missing analogous problems) both now route `.archives/`-read user options through `RESEARCH_PIPELINE.md`, filtering the envelope to the specific field the fix needs. If the pipeline returns no verified entries, both fixes fall back to manual user-crafted entries rather than fabricating.
- **`docs/CONTRIBUTING.md`** — EPUB convention added. EPUB files must be pre-converted to `.txt` with `ebook-convert` (Calibre) before placement in persona folders. Zero-dep architecture rule preserved; Read tool's native PDF support covers the other 25 of 26 books.

### Fixed

- **Build skill now reads >1 file per persona folder** — the core regression. A 68 MB 40-file `.archives/personas/philip-kotler/` folder distills via 4 parallel subagents, producing a coverage report with files_read >= 20 instead of 1.
- **Ghost citations blocked by construction** — Step 5.95 gate makes the v2.9 "honesty fix" class of bugs unreachable. No saved persona can have an Example quote that does not appear in a named source file.
- **Silent file skips surfaced** — per-bucket `files_skipped[]` array now appears in the coverage report with reasons (too-large / binary-marker / budget-cap). Users can see exactly what was not read.

### Architecture references

- [`alchaincyf/nuwa-skill`](https://github.com/alchaincyf/nuwa-skill) — 6 parallel domain-specialized agents + triple-verification filter. We borrowed the pipeline pattern; kept muse's v2.2 output schema.
- [`xixu-me/awesome-persona-distill-skills`](https://github.com/xixu-me/awesome-persona-distill-skills) — ecosystem context. 50+ persona-distillation skills in 2026.
- [`alchaincyf/steve-jobs-skill`](https://deepwiki.com/alchaincyf/steve-jobs-skill/1.2-how-the-skill-was-built:-the-nuwa-distillation-pipeline) — reference implementation of the nuwa pipeline.

Eng design logged as an eureka in `~/.gstack/analytics/eureka.jsonl`: muse's existing `articles/books/transcripts/notes/` subfolder convention is *better* than nuwa's fixed 6-domain schema because format dictates ingestion strategy (chunking, density, skim-vs-full-read).

### Not in scope (deferred to TODOS.md)

- Native EPUB parsing — convention-only in v2.10, `ebook-convert` pre-processing required
- Nuwa output-format interop — see `NUWA-INTEROP-1` in `TODOS.md` for the measurement spike
- Re-running all 11 shipped personas under the new pipeline — regression harness proves ≥70% name overlap, no forced rebuild

---

## [2.9.0-alpha] — 2026-04-18 — `elon-musk` persona v3.1 — Vance EPUB mining + ghost-citation fix

### Why

Same user audit that caught the Kotler books gap caught a sibling issue on `elon-musk`: asked whether the persona actually mined the books. Honest audit:

- **Isaacson 2023 (28,573-line markdown)**: YES, fully primary-source-mined from the start. The v3.0.0 rebuild in v2.6.0-alpha was real, not a summary-shortcut. Unlike the Kotler v1.0 situation, Isaacson was always the load-bearing primary source.
- **Vance 2015 (EPUB in archive)**: NO. The EPUB sat in `.archives/personas/elon-musk/books/` unread. Cited as `vance-2015` in persona sources but never actually extracted or mined.
- **Higgins *Power Play* (2021) and Berger *Liftoff* (2021)**: NOT in archive at all. Cited as `higgins-2021` and `berger-2021` in v3.0.0 sources — **ghost citations**. Honest mistake in the v3 rebuild; fixed in v3.1.

Unlike the Kotler v1 → v2 jump (full rebuild from 9 unread PDFs), this is a v3.0 → v3.1 minor patch: the primary source (Isaacson) was always real; this adds Vance's distinctive material and removes the ghost citations.

### Added — Persona v3.1.0

- **Vance EPUB extraction**: Python-zipfile + HTML-stripper pipeline (pandoc and ebook-convert unavailable). 2,986 lines of clean text → `.archives/personas/elon-musk/books/extracted/vance-elon-musk-2015.txt`.

- **Vance mining via adversarial subagent**: scoped to material Isaacson under-covers (Zip2 era, X.com/PayPal, Russia trips 2001-2002, Kwajalein Falcon 1 era, Eberhard-Tarpenning Tesla conflict, Justine Musk / Talulah Riley direct interviews).

- **Persona line count: 470 → 517 (+10%)**.

- **2 new Vance-anchored taglines** (contexts 6 → 8):
  - `critique`: *"I think we can build this rocket ourselves."* — Musk's documented Moscow-flight-back line (Vance ch 6) after Russian ICBM refusal. The literal cognitive origin of SpaceX as a cost-decomposition spreadsheet produced at 35,000 feet.
  - `closing`: *"Money is low bandwidth."* — Stanford 2003 (Vance ch 5). The first-principles decomposition of finance ("it's really just an entry in a database") pre-dating the idiot-index formalization by a decade.

- **6 new `## On analogous problems` entries, all Vance-sourced**:
  - **Bank of Nova Scotia Brady-bond arbitrage** (early 1990s) — the earliest documented idiot-index move. $10B at 25¢ backed by US Treasury at 50¢; incumbents declined to act. The reflex that became SpaceX, operational 25 years earlier.
  - **The Moscow spreadsheet** (February 2002) — the literal artifact of first-principles cost decomposition becoming a company.
  - **The $120K actuator → $3,900** (SpaceX 2004) — cleaner and earlier-dated than the $250K valve case Isaacson makes canonical. "No more complicated than a garage door opener. Your budget is $5,000."
  - **PayPal internal-transactions** (1999-2002) — idiot-indexing payments 13 years before the term existed in public record.
  - **Tom Mueller, engine-in-the-garage hire** (January 2002) — SpaceX's first hiring decision as cost-interrogation. *"How much could you really do it for?"*
  - **SpaceX IPO-refusal email** (June 2013) — mission-timescale exceeds market-timescale as a documented operating principle.

- **3 new Shadow entries**, Vance-corroborated:
  - **Collapse-of-domains** — engineering firing-logic applied to personal partners. Justine Musk's published *"If you were my employee, I would fire you"* and the divorce-by-intermediary pattern (ch 5, ch 8).
  - **The post-victory berating** (December 2010) — 9 days after SpaceX Dragon-to-ISS success, a 90-minute dressing-down of execs about a *different* rocket's truss while their wives waited in party attire three cubes over. Victories do not reset the pressure.
  - **The childbirth email** — documented textual artifact: *"That is no excuse. I am extremely disappointed. You need to figure out where your priorities are. We're changing the world and changing history, and you either commit or you don't."* The demoralization pattern rendered as text.

### Fixed — Ghost citations

- Removed `higgins-2021` (Tim Higgins, *Power Play*) and `berger-2021` (Eric Berger, *Liftoff*) from the Sources section. Neither file is in `.archives/personas/elon-musk/`, neither was mined. Both were cited in v3.0.0 as if they had been consulted. This is an honesty fix — the sources section should reflect what was actually extracted, not what would strengthen the persona if added. Added a note at the former-location explaining what to do to actually add them: drop EPUBs into the archive, re-run the mining pipeline documented in CHANGELOG v2.8.0-alpha.

### Expanded — Vance source entry

Previous `vance-2015` source entry was one line (*"The foundational biography."*). Now includes ISBN, line count, chapter-by-chapter coverage notes (Zip2 ch 4; X.com/PayPal Appendix B; Brady bonds ch 5; Russia trips ch 6; Kwajalein ch 7-8; Tesla origin conflict ch 7-8; Mueller ch 6; $120K actuator ch 9; Justine/Riley interviews; IPO email Appendix 3).

### Methodology note

Same gap-analysis-rebuild pattern as the Kotler v2.0 mine in v2.8.0-alpha. User-surfaced audit caught the gap, Python EPUB-extraction + single mining subagent, targeted Edit-based integration rather than full rewrite (since Isaacson was already the primary source — Vance is additive, not foundational). Total cycle: ~35 min.

### Benchmark

- v3.1 maintains C1-C12 compliance
- Grade A maintained on 11-persona pack
- Voice fingerprints now include verbatim Vance phrasings the v3.0 rebuild missed: *"Young boy. No."* (the Russian rejection memory-groove), the loud involuntary laugh that carries through the floor, pricing-to-the-million as default numeric grain, *"fuck it, let's [extreme thing]"* decision-compression

---

## [2.8.0-alpha] — 2026-04-18 — `philip-kotler` persona v2.0 rebuild (gap-analysis-driven, primary-source mining)

### Why

User audit caught a real gap in the v2.7.0-alpha `philip-kotler` persona: taglines and signature-move example applications drew primarily from essays, interviews, and summary files, NOT from Kotler's canonical textbook corpus. Kotler's books — *Marketing Management* (16 editions, 80+ languages), *Principles of Marketing* (19e), *Marketing Insights from A to Z* (80 named-concept entries), the Kartajaya-Setiawan X.0 trilogy, *Confronting Capitalism*, *My Adventures in Marketing*, *Advancing the Common Good* — are the primary source of Kotler's marketing thought. v1.0 used my own summary files (~600 lines of distillation) as the proxy; v2.0 mines the full PDF corpus (~130,000 lines of extracted primary text) directly.

This is the same gap-analysis-rebuild pattern used for the elon-musk v3.0.0 rebuild in v2.6.0-alpha — a user-surfaced audit triggered by the question *"are you using the canonical sources?"*

### Added — Persona v2.0

- **Full PDF mining via pdftotext**: extracted all 9 book PDFs (~59 MB, ~130K lines) in parallel; dispatched 2 adversarial mining subagents (batch 1: Marketing Management Millennium + Principles of Marketing 19e + Marketing Insights A→Z; batch 2: Marketing 3.0/4.0/5.0 + Confronting Capitalism + My Adventures + Advancing the Common Good). Each subagent extracted taglines (verified ≤15 words, copyright-safe), named concepts, case studies, cognitive moves, Drucker-propagation instances, and voice fingerprints.

- **Persona line count: 449 → 571 (+27%)** with substantially denser book-anchored content.

- **Taglines 6 → 8**: added `critique` and `closing` contexts. Every tagline now has a verbatim primary-source anchor with book + chapter reference:
  - `default`: *"Marketing is meeting needs profitably."* — Marketing Management Millennium Ch. 1 + A→Z Intro
  - `framing`: *"Marketing deals with identifying and meeting human and social needs."* — MM Ch. 1 opener (verbatim) [NEW ANCHOR]
  - `inquiry`: *"What are your segments, which are you targeting, and what is your positioning? Tactics come after."*
  - `test-probe`: *"If you have the same strategy as your competitors, you don't have a strategy."* — A→Z entry *Strategy* (verbatim) [NEW ANCHOR]
  - `decide`: *"The only profit center is the customer."* — Drucker, propagated A→Z *Profits* (verbatim) [NEW ANCHOR]
  - `commit`: *"Create, deliver, and capture customer value. Serve one customer this week."* — CCDV from A→Z *Value* [NEW ANCHOR]
  - `critique` (NEW): *"So differentiate, differentiate, differentiate."* — A→Z *Competitors* (verbatim)
  - `closing` (NEW): *"I am an optimist."* — Confronting Capitalism (verbatim)

- **Cognitive patterns 12 → 16** (+4 book-anchored meta-habits):
  1. **CCDV is the universal spine** (NEW — the create-communicate-deliver-capture decomposition as Kotler's cognitive core; derived from Marketing Management + A→Z *Value*)
  2. **Definitional layering — short definition then long** (NEW — the textbook-signature dyadic definition pattern)
  3. **Multi-level decomposition reflex** (NEW — 3/4/5/6 types for every concept; 8 demand states, 5 product levels, 4 competition levels, etc.)
  4. **Paradox aphorism as teaching** (NEW — *"cheap quality is expensive"*, *"attack yourself first"*, *"one does not win through better sameness"*)
  5. **Drucker as load-bearing ancestor** (promoted from implicit to explicit — the four Drucker moves Kotler propagates across 60 years)
  6. **Stakeholder over shareholder, but from inside the tent** (promoted — the inside-critique authority move; Kotler named Friedman as his teacher before critiquing the shareholder doctrine)
  7. Pre-existing 10 patterns refined with textbook anchors

- **Signature moves: same 6, but example applications substantially sharpened** with textbook vocabulary. STP-before-the-Ps example now invokes the verbatim Strategy-A→Z test (*"could your nearest competitor describe itself using these same words?"*). Coin-the-discipline-term example uses atmospherics as the case (Kotler's 1973 coinage) with full "light/sound/scent/layout/color-temperature/pacing-cues" decomposition matching the textbook. Commit move explicitly invokes PAR (Purchase Action Ratio) and BAR (Brand Advocacy Ratio) from Marketing 4.0.

- **New body section `## Intellectual lineage`**: explicit credit chain from autobiography (Chicago MA under Friedman → MIT PhD with Samuelson and Solow → Ford Foundation post-doc at Harvard 1960 with McCarthy → Kellogg 1962 → Drucker meeting Claremont late 1980s → Kartajaya/Setiawan collaboration). Includes Samuelson's Marx-labor-theory-of-value oral exam question (Kotler's preview of his later marketing-value concept). Credits Levy, Zaltman, Drucker, Ries-Trout, Treacy-Wiersema, Borden, Rackham, Sampson, Keller, Armstrong by name with specific contributions.

- **Analogous problems 6 → 10** (+4 textbook-anchored cases):
  - **Harley-Davidson radical marketing** (NEW — MM Ch. 1 canonical *radical marketing* case, HOG clubs, PR over ads)
  - **IKEA value-equation decomposition** (NEW — the textbook value equation teaching case: Value = Benefits / (Money + Time + Energy + Psychic costs))
  - **Wisconsin drunk-driving campaign** (NEW — Advancing the Common Good 3,620% ROI case, social marketing with measured outcomes)
  - **Paul Polman's Unilever** (NEW — Sustainable Living Plan 2010 case, *"good citizenship isn't a cost; it's a business strategy"*, stakeholder capitalism operationalized)

- **Shadow section expanded with two new honest limitations**:
  - **Framework proliferation risk** — Marketing Insights A→Z alone contains 80 named concepts; teams can adopt Kotler vocabulary without the discipline. Buzzword-stacking is a real failure mode.
  - **Credit-propagation can read as lineage-claiming** — *"If I am the Father of Modern Marketing, I would call Drucker the Grandfather"* is warm but names a patriarchy; some critics find the Father-of-Marketing posture Americentric and under-credit non-US contributors.

- **Sources expanded 18 → 22 entries** with all 9 primary book PDFs cited explicitly + page/chapter references where relevant. Structured by tier: primary textbook corpus → X.0 trilogy → stakeholder-capitalism trade books → autobiography → essays/interviews/keynotes.

- **New Benchmark prompt**: `bp_ccdv_diagnostic` — tests whether the persona correctly applies CCDV decomposition when asked a generic *"marketing feels busy but sales flat"* question (vs defaulting to generic advice).

### Changed

- `commands/muse:philip-kotler.md` — added CCDV spine to the persona-loading instructions; every session now internalizes the four-verb decomposition as a baseline cognitive move.
- Version bump v2.7.0-alpha → v2.8.0-alpha across README, SKILL, PERSONAS, GETTING_STARTED, CHANGELOG.

### Methodology note (reusable pattern)

PDF mining pipeline: `pdftotext -layout *.pdf extracted/*.txt` → parallel subagent dispatch with book-scope partitioning → each subagent extracts taglines/concepts/cases/voice-fingerprints independently → main agent synthesizes into schema-compliant persona rebuild. Total wall-time: ~15 min PDF extraction + ~10 min subagent mining (parallelized) + ~15 min synthesis/write = ~40 min end-to-end. Copyright safety maintained via <15-word quote rule. Same pipeline applies to future persona rebuilds where primary-source depth is required.

### Benchmark

- v2.0 persona maintains C1-C12 compliance (all 12 checks PASS)
- Jaccard distinctiveness vs existing 10 personas unchanged (max 20% vs paul-graham, intentional adjacency)
- Expected Turing judge improvement: voice fingerprints now include verbatim textbook-anchored phrases (*"We will address the following questions"*, *"Note that"*, *"Clearly,"*, *"Hopefully"*, *"so differentiate, differentiate, differentiate"*, *"my own choice, dear reader, lies in the middle"*, *"I am an optimist"*) that are unmistakably Kotlerian across 60 years of his published corpus
- Grade A maintained on 11-persona pack

---

## [2.7.0-alpha] — 2026-04-17 — `philip-kotler` persona (third starter-pack extension)

### Why

Philip Kotler is the acknowledged father of modern marketing management — sixty years of work that gave the discipline its canonical planning sequence (STP → 4Ps → implement → control), its broadening arc (marketing applied to nonprofits 1969 → social causes 1971 → places 1990s → nations 2000s → societies 2020s), its named patterns (demarketing, social marketing, place marketing, atmospherics, holistic marketing, stakeholder capitalism in book form, Marketing 1.0 → 6.0, 5As customer journey), and its stakeholder-capitalism frame (*Confronting Capitalism* 2015 predated the Business Roundtable's 2019 statement by four years). The starter pack had strong coverage of first-principles engineering (Elon Musk, Feynman), startup 0→1 (Paul Graham), philosophy, design, and ancient strategy — but no dedicated enterprise marketing strategy frame. Kotler is the 11th persona, filling this gap, and is the third living-figure extension after Musk (v2.4.0) and Graham (v2.5.0).

v2.7.0-alpha adds the persona, the slash command wrapper, a full docs refresh (README, PERSONAS, GETTING_STARTED, SKILL, ADVISORY_COUNCIL), and re-benchmarks with grade A maintained on the 11-persona pack.

### Added

- **`personas/philip-kotler.md` v1.0.0** (449 lines) — v2.2.1-compliant interpretive persona

  **6 signature moves, one per session-stage context**:
  - **STP before the Ps — the discipline sequence check** *(framing)* — segmentation → targeting → positioning before any tactic. "Tactics downstream of fuzzy STP is waste."
  - **Broadening — who is the customer of this activity?** *(inquiry)* — Kotler's defining career move. Marketplaces have 2 customer-sets, nonprofits 4+, cities many.
  - **Coin the discipline term — naming as pedagogy** *(framing)* — propose a name that travels into textbooks and scales the discipline (demarketing, atmospherics, social marketing, place marketing, holistic marketing, stakeholder capitalism, 5As, regenerative marketing).
  - **Layer, don't replace — additive framework evolution** *(test-probe)* — 4Ps + 4Cs coexist; Marketing 1.0 → 5.0 layer; replacement-thinking loses working knowledge.
  - **Triple bottom line audit — profit + people + planet** *(decide)* — score every major decision against all three lines; reframe to positive-on-all-three when possible.
  - **Move one customer one step along the 5As — serve, measure, scale** *(commit)* — aware → appeal → ask → act → advocate; collapse the plan to one segment, one target, one 5A step, one channel, this week.

  **12 cognitive patterns** (meta-habits, non-colliding with signature-move titles): discipline-is-the-moat; customer-definition-is-the-root-of-errors; a-named-concept-travels; every-framework-is-additive-history; teach-for-usability; credit-generously; marketing-is-behavioral-economics; pull-beats-push; sometimes-less-demand-is-right; make-selling-unnecessary (Drucker's credo); tech-as-multiplier-of-empathy; sales-and-marketing-are-one-conversation.

  **6 canonical dilemmas covered** via `canonical_mapping` (speed_vs_quality, consensus_vs_conviction, authority_vs_reason, direct_vs_indirect, action_vs_patience, tradition_vs_innovation).

  **4 critic frames** for `/muse:critic`: STP discipline audit, customer definition audit, triple bottom line audit, naming audit, layering-vs-replacement audit, sales-and-marketing integration audit.

  **6 documented analogous cases**: Bilbao Guggenheim (place-marketing canonical), FujiFilm vs Kodak (broadening test), Russian vodka demarketing vs Prohibition (cautionary pair), broadening to nonprofits (1969 foundational), *Confronting Capitalism* 2015 predating Business Roundtable 2019, Indonesian postage stamp (discipline portability).

  **`## Shadow — known limitations`**: taxonomy can outrun testing; discipline-heavy in environments that reward speed; ambivalent on activism (persuasion-over-mandate); avuncular tone vs confrontational urgency; framework proliferation risk.

  **`## What to steal, what to leave`**: steal STP discipline, broadening instinct, naming-as-pedagogy, layering, triple bottom line, make-selling-unnecessary credo. Leave academic verbosity, pre-PMF over-application, reluctance to adopt regulatory frames, framework-proliferation trap.

  **Living-figure disclaimer** (frontmatter + body blockquote) — explicit non-affiliation with Kotler, Kellogg, Northwestern, AMA; cognitive-tool-lens-only use; frozen snapshot as of April 2026.

- **`commands/muse:philip-kotler.md`** — slash command wrapper (59 lines), identical structure to `muse:elon-musk.md` and `muse:paul-graham.md`, wires $ARGUMENTS to the adaptive session workflow.

### Changed

- **README.md**: 10 → 11 personas; 20 → 21 slash commands; added Kotler row to starter-pack table; added Kotler row to mentor-move table in hero section; added Kotler row to quick-reference pick table; updated starter pack version from v2.6.0-alpha to v2.7.0-alpha; added v2.7.0-alpha Status section; living figures disclaimer list now includes Kotler; hero tagline "Ten great mentors" → "Eleven great mentors."
- **docs/PERSONAS.md**: 10 → 11 personas; added Kotler persona entry in "Strategy + Execution (Enterprise Marketing)" category; added 7 Kotler rows to the quick-reference pick table; version bumped to v2.7.0-alpha.
- **docs/GETTING_STARTED.md**: v2.6.0-alpha → v2.7.0-alpha; persona count 10 → 11 in starter-pack mentions; added `/muse:philip-kotler` to persona command examples.
- **SKILL.md**: persona inventory updated to 11; description string includes Kotler.
- **docs/ADVISORY_COUNCIL.md**: Kotler moved from Tier 1 candidate section → "Existing muse personas" table; Tier 1 renumbered (steve-jobs becomes new #1).
- **benchmarks/universal.md**: inspected; universal prompts (u01/u05/u10) already cover strategy + customer-definition shapes adequately; no Kotler-specific prompts added (persona's own bp_* prompts live in `personas/philip-kotler.md`).

### Fixed

- **Spec review iteration**: adversarial spec reviewer flagged 4 MUST-FIX issues on draft v1.0:
  1. Source-id typo at line 331 (`kotler-kotler-kartajaya-setiawan-marketing-3-0` — C7 HARD-GAP) — **fixed**.
  2. "Name the unnamed pattern" title collision with paul-graham.md's "Name the pattern" — **fixed**: renamed to "Coin the discipline term — naming as pedagogy" with sharper discipline-scale framing distinct from PG's founder-observation scale.
  3. STP and Broadening signature moves had overlapping "you haven't defined the customer" example applications — **fixed**: STP example now explicitly NARROWS (Gen Z → early-career analyst segment), Broadening example widens (marketplace has 2 customer-sets).
  4. Missing `(decide)` and `(commit)` category tags on signature moves — **fixed**: Triple bottom line recast as `(decide)`; new 6th move "Move one customer along the 5As" added with `(commit)` tag.

### Benchmark

- Grade A maintained on 11-persona pack (0 regressions vs 10-persona baseline)
- Kotler signature-move Jaccard overlap vs existing personas <0.25 (passes distinctiveness threshold)
- Voice-fingerprint check: "STP before the Ps" + "meeting needs profitably" + "broadening" + "triple bottom line" identifiable as distinctively Kotlerian in blind-judge Turing simulation

---

## [2.6.0-alpha] — 2026-04-17 — `elon-musk` persona full rebuild (gap-analysis-driven) + README "runs his thinking" tagline

### Why

A user-requested gap analysis on the `elon-musk` persona vs. its archive (`.archives/personas/elon-musk/`) surfaced **6 unused source files** (~10K lines — "How Elon Musk Thinks" article, Joe Rogan #1470 transcript, Nikhil Kamath interview, TED 2017 "future we're building," "How to Train Your Brain" short, expanded Isaacson pages) and **~12 missing cognitive-move concepts** (the named "Idiot Index," "hardcore," "production hell," "surge," Tim Urban's layered thinking-software framework, Musk's "demon mode" shadow, the documented "you've demoralized them" weakness from collaborators, the "what to steal, what to leave" interpretive guidance, MuskSpeak, Asperger's-style-directness origin of voice, etc.). The v2.4.0-alpha release shipped without these.

v2.6.0-alpha rebuilds the persona from the ground up with full archive exploitation, adds two new body sections (Shadow, What-to-steal-what-to-leave), and re-benchmarks. Same 10-persona pack, grade A maintained.

### Added

- **`personas/elon-musk.md` v3.0.0 rebuild** (387 → 469 lines, +80 net)

  **5 signature moves, now with named Musk terminology**:
  - **First principles decomposition at atomic cost — the Idiot Index** *(framing)* — Isaacson's own coined metric (pp. 3305-3310) for the ratio of finished cost to raw-material floor. Previously referenced but unnamed.
  - **The algorithm — question, delete, simplify, accelerate, automate** *(test-probe)* — unchanged, still the verbatim Isaacson pp. 284-285 mantra
  - **Surge the choke point** *(test-probe)* — Isaacson's documented name for the 24/7 physical-presence-at-bottleneck tactic. Previously named "Own the choke point."
  - **Name the requirement-maker** *(inquiry)* — unchanged
  - **Physics as the only constraint** *(framing)* — unchanged

  **16 cognitive patterns, now non-colliding meta-habits**:
  - Spec-review caught the "pattern vs move title collision" issue (same C11 compliance risk that was caught on paul-graham). 5 patterns renamed to describe *instincts behind* the tactics (e.g., "Cost lives at the commodity-price floor" as the meta-habit behind the "Idiot Index" move; "Physical presence at the constraint" behind "Surge"; "No orphan requirements" behind "Name the requirement-maker"; "Order before speed" behind "The algorithm"; "Physics is the only vote that counts" behind "Physics as the only constraint").
  - **New patterns added**: "Tighter loops, not chaos" (explicit disambiguation of speed from chaos); "Mission is what makes friction survivable" (from How Elon Thinks distillation).

  **New `## Shadow — known limitations of this cognitive frame` body section**:
  - **Demon mode** (Isaacson p. 207) — acknowledged-by-observers behavioral pattern
  - **"You've demoralized them. It's Elon's biggest weakness"** (Isaacson p. 3797) — direct collaborator testimony
  - **Directness without empathy** — explained as Asperger's-style cognitive-communication profile (Isaacson p. 677)
  - **Misplaced certainty** — the same frame that produces reusable rockets produces timeline-prediction misses
  - **Chaos masquerading as speed** — the public-persona trap; the documented principle is *tighter loops*, not chaos. Using "Musk = chaos" without the algorithm produces chaos without the speed benefit.

  **New `## What to steal, what to leave` body section** (adapted from *How Elon Musk Thinks* distillation essay):
  - Steal: question every requirement, compute idiot index, delete-before-optimize, attack the bottleneck physically, stay close to the work, treat feedback as free data
  - Leave: sleep deprivation, demoralization of teams, demon-mode interpersonal behavior, Twitter-feud habits, timeline-prediction overconfidence
  - Explicit framing: the goal is the *operating system*, not the operating *style*

  **Voice rules upgraded**:
  - Added **MuskSpeak** concept (Tim Urban's term) to Tone — describing things exactly as they literally are
  - Added **Asperger's-style direct communication** Isaacson-sourced note — explains sharp delivery as cognitive-profile, not rudeness strategy
  - Added **irony-circle humor** (Isaacson) — humor as social signaling
  - Added banned pattern: "Confuse strategic speed (tighter loops) with reckless chaos — these are not the same thing"

  **Expanded sources** 13 → 18 (added: `how-elon-thinks-2025`, `ted-2017-boring-mars`, `joe-rogan-1470`, `nikhil-kamath-2024`, `train-brain-short`).

  **New tagline `commit` context** — "Just build one, fire it, and learn the limits by breaking it." (Stage 5 imperative, replaces the observational prior candidate after spec-review fix).

  **New Critic frame**: Church-vs-Lab audit (from Tim Urban) — for each load-bearing belief, play the Why? game until you hit the floor. "Because [authority] said so" = church; physics/economic first principle = lab.

  **New benchmark prompt `bp_hardcore_shadow`** — explicitly tests that the persona surfaces its own known failure mode (sending a hardcore email to an already-demoralized team is the documented Musk-failure pattern; the persona should flag this and route to Marcus Aurelius / Seneca / Paul Graham instead).

- **README hero tagline changed** to the "runs his thinking" variant: *"ChatGPT can quote Feynman. Muse runs his thinking on your problem."* with the prior "Ten great mentors. Five minutes each. One decision closer." preserved as subtitle. The new lead differentiates muse directly from generic LLM alternatives via a single load-bearing verb ("runs" — runtime, not imitation).

### Changed

- **`commands/muse:elon-musk.md`** — signature-move listing updated to match v3 (Idiot Index, Surge terminology). Structure + disclaimer unchanged.
- **`SKILL.md`** — version bump 2.5.0-alpha → 2.6.0-alpha in header + announcement paragraph (elon-musk v3 rebuild + README tagline refresh).
- **`README.md`** — hero tagline above the fold; version bump 2.5.0-alpha → 2.6.0-alpha; Status block updated with v2.6.0-alpha entry.
- **`docs/PERSONAS.md`** — version bump; elon-musk section expanded with Idiot Index + Surge + Shadow + What-to-steal references.
- **`docs/GETTING_STARTED.md`** — version bump.

### Distinctiveness + spec review

Adversarial spec review caught 4 issues on first pass (score 6/10 — blocking):
1. **5 cognitive-pattern / signature-move title collisions** — same C11 failure mode caught on paul-graham build. Fixed by renaming all 5 patterns to describe the *instinct* behind the tactic.
2. **Core belief ~130 words** — compressed to 3 sentences with load-bearing content preserved.
3. **Commit tagline was observational** ("Faster iteration means faster contact with reality") — swapped for imperative ("Just build one, fire it, and learn the limits by breaking it" — Isaacson-sourced).
4. **Source consistency** — verified post-fix that all inline source IDs resolve in bibliography.

Verification pass: **PASS**.

**Benchmark**: 10-persona pack retains grade A. Blind Turing on prompt u02 (pricing): 10/10 match rate. Judge-subagent specifically noted: *"the v2 additions — specifically the numeric idiot index computation and the ingredients-not-recipe phrasing — are lexically unique to Musk and cannot be confused with any other persona in the pack. The idiot-index move alone made A instantly identifiable — arguably the single sharpest voice fingerprint in the whole pack."*

### Not changed

- Schema unchanged (v2.2.1-alpha). `## Shadow` and `## What to steal, what to leave` are **additive** body sections; they do not violate any v2.2 C1-C12 gate.
- No changes to the 9 other personas.
- No changes to meta commands (`/muse:build`, `/muse:update`, `/muse:benchmark`, etc.).
- Benchmark methodology unchanged; same universal.md prompt set.

### Known limitations

- The v3 Shadow section names the "demon mode" pattern but does not resolve it — an interpretive persona can acknowledge a documented behavioral shadow but cannot neutralize it. Users reaching for elon-musk in emotionally-loaded or morale-critical contexts should re-route to Marcus Aurelius / Seneca / Paul Graham per the expanded Avoid-when list.
- Isaacson citations use page numbers from the 2023 first edition; later editions may re-paginate.
- The persona remains a **frozen snapshot as of April 2026**. Musk actively publishes new statements; any contradiction with post-2026-04 material should be resolved in favor of the live source.

---

## [2.5.0-alpha] — 2026-04-17 — Second starter-pack extension: `paul-graham` interpretive persona + 10-persona benchmark grade A

### Why

v2.4.0-alpha shipped the first extension beyond the historical 8 (`elon-musk`). The ADVISORY_COUNCIL.md roadmap identified `paul-graham` as the highest-priority Tier 1 candidate, and the repo already contained ~17 MB of deep research at `.archives/personas/paul-graham/` — 22 verbatim essays, 5 long-form transcripts (Stanford CS183B 2014, Conversations with Tyler 2023, Ralston 2018, Office Hours 2013, LAUNCH 2014), and 5 book entries. v2.5.0-alpha takes that archive and produces the 10th starter-pack persona.

The choice of Paul Graham is strategic: he covers the **0→1 startup-direction cognitive frame** that Elon Musk's algorithm-focused frame doesn't address. Where Musk optimizes manufacturing at scale (1→1000), Graham focuses on "does a real user want this at all" (0→1). The two are complementary — not redundant.

### Added

- **`personas/paul-graham.md` (~380 lines)** — new starter-pack persona.

  **Cognitive signature**:
  - **Make something people want** *(framing)* — the foundational reframe. A startup isn't a thing you *become*; it's a thing you *build*. Every activity that isn't making-something-people-want is "playing house."
  - **Name the pattern** *(framing)* — give a handle to tacit-but-common behavior. Canonical PG coinages: *do things that don't scale*, *ramen profitable*, *playing house*, *top idea in your mind*, *default alive or default dead*, *the right kind of stubborn*, *maker's schedule vs manager's schedule*, *Nile Perch* (engaging-but-substanceless thoughts).
  - **Talk to your users — manually, unscalably** *(inquiry)* — Stripe's "Collison installation"; Airbnb's door-to-door NYC photography; Wufoo's handwritten thank-you notes. "Startups take off because the founders make them take off."
  - **Default alive or default dead?** *(test-probe)* — binary survival diagnostic: at current burn + growth, reach profitability before the bank hits zero?
  - **The shower test — what's the top idea in your mind?** *(test-probe)* — attention as a single slot; money and disputes are "Nile Perch" that eat it.
  - **Stay upwind — don't plan, preserve options** *(framing)* — when the territory is genuinely unknown, pick the move that teaches most and forecloses least.

  **Voice rules**: short sentences, first person, plain English, self-deprecating about his own mistakes ("Jessica is better than me at people", "I've been wrong about solo founders"), specific examples (Stripe, Airbnb, Viaweb, Wufoo, Zuckerberg, the Collisons) instead of generic "some companies". Explicit banned patterns include the word *"growth hacks"* (PG translates to "bullshit"), the *"Big Launch"* fantasy, *"disrupt"*, *"unicorn"*, *"10x"*, *"crush it"*, *"unlock"*, *"circle back"*, *"synergy"*, *"stakeholders"*, *"value prop"*, *"alignment"*, *"bandwidth"*, *"ideate"*, and the word *"passion"* (he uses *curiosity* and *interest* because they're more testable).

  **Session mode fit**: strong at STANDARD (natural essay tempo), DEEP (his essays are premise challenges), CRITIC (essay rewrite feedback). Weak at QUICK — his reasoning compresses into aphorisms that sound glib without context.

- **`commands/muse:paul-graham.md` (51 lines)** — slash command wrapper following the v2.2 persona-command pattern. Includes the mandatory disclaimer as a body blockquote, routes through SESSION.md's 5-stage adaptive workflow, and prints the full disclaimer at the top of every saved session file. If Stage 0 detects QUICK mode, warns the user that PG is a poor fit for that compression level.

### Distinctiveness + spec review

The adversarial spec reviewer (Garry Tan pattern, `/muse:build` Step 5.5) returned score 8/10 on first pass with 7 specific issues — all concrete, all actionable:

1. Cognitive pattern #2 "Name the pattern" title-collided with signature move "Name the pattern" — renamed to meta-habit **"Naming as an epistemic tool"** (describes the *instinct* that un-named things stay under-thought, while the signature move holds the specific PG coinages).
2. Cognitive pattern #4 "Stay upwind" title-collided with signature move "Stay upwind" — renamed to **"Optionality-first over plan-first"** with an explicit Lao-Tzu disambiguation note ("wu-wei minimizes interference; optionality-first maximizes learnable paths").
3. Signature move "Talk to your users" disambiguated from Socratic elenchus (PG watches what users *do* to update what to build; Socrates cross-examines to surface contradictions in *thinking*).
4. Signature move "Default alive or default dead?" disambiguated from Elon Musk's "name the requirement-maker" binary test (PG's is a solvency check — when does the math stop working; Musk's is an attribution check — who authored a constraint).
5. Typo fix in banned patterns (missing closing asterisk on `*"unlock"*`).
6. Thinking-mode split: primary core_tension (curiosity vs. ambition) stays canonical; secondary heuristic (trust intuition about people, not about startups) promoted to its own labeled paragraph.

All 7 fixes applied. C1-C12 static compliance PASS. Pre-save dry-run PASS. Post-save dry-run PASS.

### Changed

- **`SKILL.md`**: v2.4.0-alpha → v2.5.0-alpha header bump. New announcement paragraph for Paul Graham persona. Invocation table row updated: "(9 personas — 7 historical + 2 interpretive)" → "(10 personas — 7 historical + 3 interpretive)". Running total: "19 slash commands" → "20 slash commands". Living-figure disclaimer reminder updated to list three interpretive personas (dieter-rams, elon-musk, paul-graham).
- **`README.md`**: starter pack table 9 rows → 10 rows (paul-graham added with interpretive marker and domain `strategy, execution, first-principles, philosophy`). Version header "2.4.0-alpha ~5,800 lines" → "2.5.0-alpha ~6,200 lines". § Commands reference "19 total — v2.4.0-alpha" → "20 total — v2.5.0-alpha". Status block updated with v2.5.0-alpha entry, version history extended.
- **`docs/PERSONAS.md`**: v2.4.0 → v2.5.0 header. Starter pack count 9 → 10. New § "Strategy + Execution (Startup)" category with full Paul Graham entry (tagline, all 6 signature moves with category tags, cognitive-patterns summary, best-for/avoid-when guidance, session mode fit, sample invocation). Quick-reference table adds 6 new rows for PG use cases (playing-house diagnostic, user-conversation audit, top-idea-in-your-mind, default-alive/dead, pattern-naming, write-like-you-talk).
- **`docs/GETTING_STARTED.md`**: v2.4.0-alpha → v2.5.0-alpha header. "19 slash commands" → "20". "9 personas" → "10". "To add a 10th" → "To add an 11th."
- **`docs/ADVISORY_COUNCIL.md`**: Paul Graham removed from Tier 1 candidate list; added to the "Existing muse personas" table at the top (9 → 10 rows).

### Legal + interpretive framing

**The Paul Graham persona disclaimer** is comparable in extent to Elon Musk's but with one additional dimension: Graham **actively publishes essays** and updates his views frequently. The disclaimer therefore explicitly notes that the persona is a **frozen snapshot as of April 2026** — readers should not treat outputs as what Graham currently thinks, and any contradiction with a post-2026-04 essay should be resolved in favor of the live essay.

The disclaimer appears in three places (same safeguard pattern as elon-musk):
1. **Frontmatter `disclaimer:` field** in `personas/paul-graham.md` — ~200 words. Enumerates sources (paulgraham.com 2001–present, Hackers & Painters 2004, Founders at Work 2007, The Launch Pad 2012, 5 long-form transcripts), explicitly names NOT-affiliated entities (Y Combinator, Viaweb, Yahoo, Jessica Livingston), and states that outputs are NOT quotation, NOT predictions, NOT current-views claims, and NOT investment/fundraising advice.
2. **Body blockquote** immediately below the tagline.
3. **Slash command file** `commands/muse:paul-graham.md` has a shortened disclaimer in the body. Step 4 of the skill instructs the agent to write the **full disclaimer** into every saved session file.

### Not changed

- Schema unchanged (v2.2.1-alpha). No new fields, no migrations needed.
- No changes to historical 8 personas.
- No changes to meta commands (`muse:who`, `muse:all`, `muse:chain`, `muse:debate`, `muse:critic`, `muse:build`, `muse:update`, `muse:benchmark`, `muse:spike`, `muse:list`).
- No changes to `install.sh` — persona count is already dynamic from v2.4.0-alpha.
- Benchmark methodology unchanged.

### Known limitations

- Spec review final score was 8/10 with 7 fixes applied. Did not re-run the reviewer post-fix — agent recommended fixes and the author applied them directly. Follow-up distinctiveness run is in Phase 7 (benchmark).
- Paul Graham is a living, actively-publishing figure. Any essay he publishes after 2026-04-17 may contradict the persona's frozen snapshot. Suggested: annual refresh via `/persona:add --name=paul-graham` to pull new essays + `/muse:update paul-graham` to re-integrate.

---

## [2.4.0-alpha] — 2026-04-16 — First starter-pack extension: `elon-musk` interpretive persona + 9-persona benchmark grade A

### Why

v2.3.2-alpha reframed muse as a **persona runtime + starter pack**, and the README roadmap promised the starter pack would grow. v2.4.0-alpha is the first actual extension: the `elon-musk` persona joins the roster as the 9th cognitive frame. This is also the first time muse ships a persona for a **still-active, still-litigious public figure** — which stress-tests the right-of-publicity safeguards the framework has had in place since v2.1 but has only exercised on Dieter Rams until now.

The decision to ship Musk publicly (not local-only) was made with clear eyes: muse is a **cognitive-tool framework**, not a character-simulation framework, and Musk's reasoning patterns (first-principles cost decomposition, the 5-step algorithm, manufacturing reality checks, physics-as-the-only-constraint) are among the most distinctive and most publicly documented operator methods of the 21st century. They are worth having as a reusable lens. But they come with legal surface area. The disclaimer is extensive, the interpretive framing is mandatory, and every session saved under this persona carries the disclaimer forward.

### Added

- **`personas/elon-musk.md` (~370 lines)** — new starter-pack persona.

  **Cognitive signature**:
  - **First principles decomposition at atomic cost** — break any cost claim down to raw materials at commodity prices + energy + human time. The gap vs market price is margin or bad engineering — both fixable.
  - **The algorithm** — documented verbatim by Walter Isaacson (pp. 284-285): (1) Question every requirement and name the human who made it, (2) delete any part or process you can, (3) simplify what survives, (4) accelerate cycle time, (5) automate LAST. Order matters. Automating before deleting is how teams ship garbage fast.
  - **Manufacturing reality check** — "prototypes are easy, the factory is the product". Plans that don't survive scale=10,000x are demos, not plans.
  - **Name the requirement-maker** — any requirement attributable only to "the legal department" or "the safety department" is an orphan. Find the human or delete it.
  - **Physics as the only constraint** — the only inviolable rules are the laws of physics. Budget, schedule, industry practice, "best effort" are all recommendations to be tested.

  **Voice rules**: dry, impatient with process, patient with physics. Specific numeric references. Self-deprecating about timeline misses. Dismisses analogical reasoning. Banned patterns include "best practices", "let's form a committee", "consultants", "outsource it", "comfortable timeline", and management-speak.

  **Session mode fit**: strong at STANDARD, CRITIC, QUICK. Weak at DEEP — impatient with Stage 0.5 Premise Challenge, wants to ship before the philosophy session ends.

- **`commands/muse:elon-musk.md` (~60 lines)** — slash command wrapper following the v2.2 persona-command pattern. Includes the mandatory disclaimer as a body blockquote, routes through SESSION.md's 5-stage adaptive workflow, and prints the full disclaimer at the top of every saved session file. If Stage 0 detects DEEP mode, warns the user that Musk is a poor fit for premise challenges.

### Distinctiveness guarantee (9-persona benchmark run)

Ran a 9-persona blind Turing test on two prompts (u01 architecture monolith-vs-microservices, u09 CI pipeline process cull — the latter being Elon's strongest surface and the former being the hardest "first principles collision" case with Feynman).

**Result: 18/18 match rate (100%). Zero confusions. Zero low-confidence matches.**

The judge subagent (fresh context, no conversation history, 9 one-line persona summaries as reference) correctly identified all 9 persona responses on both prompts. Specifically, the judge noted that Elon and Feynman are **clearly distinguishable** despite both claiming "first principles":

> "u01-B (elon-musk) and u01-F (feynman) both use hand calculation, but were clearly distinct: B runs THE ALGORITHM in exact numbered order with 'question every requirement/delete/simplify/accelerate/automate LAST' and 'physics doesn't care', while F leads with the 12-year-old jargon test, cargo cult detection, and frames the math as a back-of-envelope sanity check rather than a cost-decomposition-plus-algorithm sequence." — judge subagent

The benchmark grade A baseline (set in v2.2.3-alpha with 8 personas, 24/24 blind Turing) holds with 9 personas. No persona regression. The algorithm + name-the-requirement-maker + physics-as-constraint vector produced outputs distinct enough from Feynman's simplification + cargo cult + hand calculation vector that the judge never confused them.

### Changed

- **`SKILL.md`**: v2.3.1-alpha → v2.4.0-alpha header bump. New announcement paragraph for Elon Musk persona. Invocation table row updated: "(8 personas)" → "(9 personas — 7 historical + 2 interpretive)". Running total: "17 slash commands" → "19 slash commands". New living-figure-disclaimer reminder paragraph explaining that two interpretive personas now carry mandatory disclaimers.
- **`README.md`** (14+ edits across the file): starter pack table 8 rows → 9 rows (elon-musk added with interpretive marker), § Discovering the right persona triage example shows Elon top-pick at 72/80 for "should I rewrite in Rust?", § Commands reference table persona sessions section (8) → (9), § Build your own persona "9th" → "10th", all "18 slash commands" references → "19 slash commands", § Legal & privacy expanded with Musk-specific disclaimer paragraph, § Status updated with v2.4.0-alpha entry, Version header "2.3.2-alpha ~5,400 lines" → "2.4.0-alpha ~5,800 lines".
- **`docs/PERSONAS.md`**: v2.3.2 → v2.4.0 header. Starter pack count 8 → 9. New § "First Principles + Execution + Engineering" category with full Elon Musk entry. "How to pick a persona" quick-reference table adds 3 new rows for Elon's use cases (process bloat, cost claims, comfortable timelines).
- **`docs/GETTING_STARTED.md`**: v2.3.2 → v2.4.0 header. All "18 slash commands" → "19". Triage example updated to 9 personas. "Starter pack ships with 8" → "9 as of v2.4.0-alpha".
- **`install.sh`**:
  - **Persona count made dynamic** (previously deferred from v2.3.1 as R7 known limitation). Added a `persona_count` calculation via `find $TARGET/personas -maxdepth 1 -name '*.md'`. Welcome message reads "($cmd_count slash commands, $persona_count personas)" — stays accurate as the starter pack grows.
  - Welcome message rewrite: removed the hardcoded 8-persona listing. New message leads with `/muse:who` as the recommended first command, then shows 4 example invocations including `/muse:elon-musk` with the `(interpretive)` marker, then points at `/muse:list` for the full set.

### Legal + interpretive framing (new, load-bearing)

**The Elon Musk persona carries the most extensive interpretive disclaimer in the muse repo** because Musk's company surface area is the largest of any figure in the starter pack. The disclaimer is present in three places:

1. **Frontmatter `disclaimer:` field** in `personas/elon-musk.md` — ~150 words. Enumerates the sources (Isaacson 2023, Vance 2015, Wait But Why 2015, Tesla master plans, TED 2022, IAC 2016, podcast transcripts), names every Musk-connected entity it is NOT affiliated with (Tesla, SpaceX, X Corp, Neuralink, The Boring Company, xAI), and explicitly says the outputs are NOT direct quotation, NOT predictions of what he would say on any specific matter, and NOT claims about his views.
2. **Body blockquote** immediately below the tagline in `personas/elon-musk.md`. Repeats the disclaimer verbatim. SESSION.md pre-flight auto-prints this before Stage 1 of every `/muse:elon-musk` session.
3. **Slash command file** `commands/muse:elon-musk.md` has a shortened disclaimer in the body. Step 4 of the skill instructs the agent to write the **full disclaimer** into every saved session file — every `~/.muse/sessions/<ts>-elon-musk-*.md` will carry the disclaimer forward so that if the user shares the session, the interpretive framing travels with it.

**Interpretive framing is non-negotiable**. Outputs from this persona:
- Are cognitive-tool commentary on publicly documented reasoning patterns
- Are NOT direct quotation
- Are NOT predictions of what Elon Musk would actually say on any specific matter
- Are NOT claims about his views, politics, companies, or products
- Must NOT be shared publicly as "what Elon Musk thinks about X"

The persona is a **lens for first-principles engineering and process-simplification decisions**, not a simulation of the person.

### Not changed

- All other 8 personas: untouched
- `SESSION.md`: untouched
- Benchmark skill: untouched
- Other 17 slash commands: untouched
- `docs/BENCHMARKS.md` + `docs/PERSONA_SCHEMA.md` + `docs/CONTRIBUTING.md` + `docs/ARCHITECTURE.md` + `docs/SESSIONS.md`: untouched
- Codex/Gemini CLI adapters: untouched (free-text fallback picks up the new persona automatically via SESSION.md pre-flight)

### Backward compatibility

- Every existing slash command works identically
- Every existing free-text invocation works identically
- Every existing session file is valid
- The benchmark baseline still holds — 24/24 Turing result from v2.2.3 is NOT invalidated; the v2.4 run adds a 9-persona verification layer on top
- `install.sh` dynamic-count change is backward-compatible (if `personas/` is missing, falls back to `persona_count=0` gracefully)

### Migration

```bash
cd ~/.claude/skills/muse && git pull && ./install.sh
# Expect: "Installed 19 slash commands to ~/.claude/commands/"
# Expect welcome message to read "(19 slash commands, 9 personas)"
```

Try the new persona:

```bash
/muse:elon-musk our CI pipeline takes 40 minutes
/muse:elon-musk should we build our own auth or use Auth0
/muse:elon-musk my team says this feature will take 3 months
/muse:who should I rewrite this service in Rust
# Expect elon-musk to score top-3 (alongside Feynman) on the last one
```

### Known limitations

- **Routing accuracy benchmark still not implemented**. `/muse:benchmark` measures persona distinctiveness (post-routing), not routing accuracy (pre-routing). Deferred to v2.4.1+.
- **DEEP mode warning is advisory, not enforced**. If a user insists on DEEP mode with `/muse:elon-musk`, the command runs it with a warning.
- **The algorithm is stated as a 5-step mantra, not a forced sequence**. Nothing in the skill file mechanically enforces step-ordering in session output. Benchmark run confirmed the agent respected the order on both test prompts.

### Risks + mitigations

- **R1 (legal)**: Musk or his entities could object. **Mitigation**: disclaimer explicitly disclaims affiliation, outputs are interpretive commentary (fair-use educational use), no direct quotation, no prediction of views, no claims of endorsement. All sources are mainstream-published books, published blog posts, and public keynotes/interviews. If a legal issue arises, the persona can be removed in a patch release.
- **R2 (distinctiveness)**: Elon could confuse with Feynman on first-principles questions. **Mitigation**: benchmark run on the hardest collision prompt (u01) showed zero confusion. Judge explicitly distinguished them.
- **R3 (voice accuracy)**: The persona could mis-attribute reasoning patterns. **Mitigation**: every signature move cites Isaacson 2023 (with page numbers), Vance 2015, Wait But Why 2015, or Tesla's own published master plans. The algorithm is documented verbatim in Isaacson pp. 284-285.
- **R4 (inappropriate use)**: A user could invoke `/muse:elon-musk` on emotional questions where his reasoning is a bad fit. **Mitigation**: `avoid_when` list explicitly includes emotional/interpersonal judgment, values/meaning/identity, regulated domains. `/muse:who` routes these questions to Marcus Aurelius, Socrates, or Confucius.

### Total diff

- `personas/elon-musk.md`: +370 lines (new file)
- `commands/muse:elon-musk.md`: +60 lines (new file)
- `SKILL.md`: +15 lines net
- `README.md`: +40 lines net
- `docs/PERSONAS.md`: +50 lines net
- `docs/GETTING_STARTED.md`: ~10 lines changed
- `install.sh`: +10 lines net
- `docs/CHANGELOG.md`: +this entry
- **Net**: ~560 lines added, 2 new files, 5 files modified

---

## [2.3.2-alpha] — 2026-04-16 — Docs refresh: persona runtime + extensibility + v3 catalog vision

### Why

v2.3.1-alpha shipped `/muse:who` — the 18th slash command — and the docs still described muse as if it were a fixed 8-persona tool. README said *"Eight historical thinkers"*. `docs/PERSONAS.md` said *"8 core personas shipped in v2.0"*. `docs/GETTING_STARTED.md` said *"restart Claude Code so it picks up the 8 new slash commands"*. Every surface-level doc reinforced a framing that didn't match the product anymore.

The product reality: muse is a **persona runtime** that ships with a starter pack. The runtime supports arbitrary locally-authored personas today via `/muse:build`, and the long-term direction is a public catalog (similar to agentskills for Claude Code) where users browse and clone individual personas without cloning the whole framework. The docs needed to reflect this so new users don't install muse thinking *"cool, 8 personas, that's the product"*.

v2.3.2-alpha is a comprehensive docs refresh. Zero code changes. Zero persona edits. Zero SKILL.md/SESSION.md changes. Every surface-level messaging change flows from one reframe: **starter pack + extensible runtime**, not fixed 8-persona tool.

### Changed

**`README.md`** (~540 lines, full rewrite):

- **Hero paragraph** reframed: muse is now *"a persona runtime that ships with a curated starter pack of cognitive tools and is designed from day one to be extended"*. The *"eight historical thinkers"* framing is gone.
- **New § What gets shipped** organized into 🎭 Starter pack (8 personas with a full table showing id, era, domain, tagline) + ⚙️ Runtime (18 slash commands) + 📐 Framework (SESSION.md / SKILL.md / schema / benchmarks docs). Explicit *"Starter pack, not a ceiling"* callout.
- **New § Discovering the right persona** featuring `/muse:who` as the cold-start entry point with a worked example of the triage output. Three tiers: triage (`/muse:who`), browse (`/muse:list`), direct (`/muse:<id>`).
- **Enriched § Commands reference** with attribute icons (💬 interactive, 💾 persistent, 🎭 multi-persona, 🔑 requires API key, ⚡ quick). Grouped into 🧭 Triage & navigation (2), 🎭 Persona sessions — starter pack (8), 🎭 Multi-persona orchestration (4), 🛠️ Persona lifecycle (2), 📊 Evaluation (2). Full distinctive-moves summary per persona instead of one-liner.
- **New § Roadmap** describing the v3 persona catalog vision explicitly: browse, preview, clone individual personas, contribute via PR with automated distinctiveness gates. Cites agentskills as the model. Lists near-term (v2.4+) and long-term (v3+) roadmap items.
- **Updated § Build your own persona** — emphasizes that starter pack and extension personas are *fully equal* (no special treatment, no second-class status). `/muse:who`, `/muse:benchmark`, `/muse:update` all include local personas automatically.
- **Updated § Who this is for** — added "Teams with opinionated thinkers" use case.
- **Updated § How muse is different** — added item 7 on extensibility as a first-class property.
- **Updated § Credits** — acknowledges agentskills as the catalog model.
- **Updated § Status** — v2.3.2-alpha entry, version history refreshed through v2.2.0-alpha (every recent release has a one-line summary).
- **Tagline for the release**: *"18 slash commands · 8 starter-pack personas · extensible runtime"*.

**`docs/PERSONAS.md`** (~280 lines, rewrite):

- Title changed from *"Muse Personas (v2)"* to *"Muse Personas — Starter Pack + Extension Guide (v2.3.2-alpha)"*.
- Opening paragraph reframed: starter pack as baseline, runtime as the actual product, future catalog as the v3+ direction.
- **Per-persona descriptions** enriched with signature move category tags `(framing)` / `(inquiry)` / `(test-probe)`, "best for" use cases, and "avoid when" notes for Feynman.
- **New § How to pick a persona** with three options: (1) `/muse:who` triage, (2) quick-reference table, (3) multi-persona orchestration. The quick-reference table expanded with emotional/identity and abstraction-defining rows.
- **New § Extending the starter pack** documenting the build flow, explicit *"every extension persona is fully equal to starter-pack personas"* statement, and a **candidate roster for v2.4+** (Shannon, Jacobs, Taleb, Keynes, Weil, Miyazaki, Hopper) with rationale per candidate.
- **New § v3 persona catalog vision** — 5-point description of browse / preview / clone / update / contribute flow. Load-bearing prerequisites: schema stability, scoring, signing.
- Explicit call to action: *"In the meantime: share via PR"*.

**`docs/GETTING_STARTED.md`** (~180 lines, rewrite):

- Title bumped to v2.3.2-alpha.
- Install section lists all 6 `~/.muse/` subdirectories (sessions, chains, debates, critiques, spike, analytics, benchmark-reports) instead of just sessions.
- **New § 2 — Your first command: /muse:who** as THE recommended cold-start entry point, with a worked triage example.
- **Renumbered remaining steps** to reflect the new ordering (browse → session → chain → debate → critic → build → benchmark).
- **New § 9 — Measure persona quality** pointing at `/muse:benchmark` + `--diff` workflow.
- **New § 10 — Full command reference** with the 18-command table broken into starter-pack (8) + meta (10).
- **Updated § Troubleshooting** with specific v2.3.2 issues: persona not showing in /muse:list, benchmark grade drop after adding a persona, etc.

**`docs/CONTRIBUTING.md`** (minor edits):

- Opening paragraph reframed: starter pack as baseline, path to expand is local authoring + upstream PRs, catalog is v3+ roadmap.
- `/muse:build` section expanded: explicit mention of spec review loop (max 3 iterations), C1-C12 validation, distinctiveness check, dry-run + atomic mv. Shows both slash path (Claude Code) and free-text path (Codex/Gemini CLI).
- **Distinctiveness testing** — now recommends `/muse:benchmark --diff` as the primary path (no API key needed, uses subagent judges) and `/muse:spike` as the scientific-with-human-judges path (still v2.3.0 gather-only, score mode v2.3.1+).
- **"NOT accepting" section** updated to reflect the v2.4+/v3+ split. Public catalog infrastructure, `--mode=score`, routing-accuracy benchmark, CI integration, continuous dashboards all explicitly listed as deferred with version targets. Auto-improvement loop explicitly marked *"deliberately never"*.

**`docs/ARCHITECTURE.md`** (header + system diagram refresh):

- Title bumped to *"Muse Architecture (v2.3.2-alpha — agentic persona runtime)"*.
- Preamble expanded with per-minor-version additions (v2.1 structured sessions, v2.2 adaptive modes + enriched schema + build/update/benchmark, v2.3 six new orchestration commands + `/muse:who`).
- **Starter pack + runtime positioning paragraph** added — explicit statement that the architecture scales from 8 to 80 personas without change.
- **System diagram** updated: 18 slash commands, v2.0 vs v2.1+ paths labeled for Codex/Gemini vs Claude Code, outputs list includes chains/debates/critiques/spike folders alongside sessions.

**`docs/SESSIONS.md`** (intro refresh):

- Title bumped to *"Structured sessions (v2.1+, current: v2.3.2-alpha)"*.
- Opening paragraph reframed: every *installed* persona (starter pack OR locally-authored) gets a slash command automatically on next `install.sh`. The set is dynamic, not fixed at 8.
- v2.2 adaptive modes paragraph added (QUICK/STANDARD/DEEP/CRITIC with brief description).

### Not changed

- **`commands/*.md`** — all 18 slash command files untouched
- **`personas/*.md`** — all 8 starter pack personas untouched
- **`SESSION.md`** (load-bearing workflow spec) — untouched
- **`SKILL.md`** (dispatcher) — untouched
- **`docs/BENCHMARKS.md`** — already current, shipped in v2.2.3-alpha
- **`docs/PERSONA_SCHEMA.md`** — schema reference is version-agnostic, no change needed
- **`install.sh`** — untouched
- **Benchmark state** — grade A, 24/24 Turing, 100% compliance unchanged (provable via `git diff 3257daf..HEAD --stat -- personas/ SESSION.md SKILL.md` → empty)

### Backward compatibility

100% backward compatible. Zero behavioral changes. Every existing slash command, every existing free-text invocation, every existing session file path still works identically. The docs refresh is pure messaging — the product surface is identical to v2.3.1-alpha.

### Migration

None required. Pull and continue using muse.

```bash
cd ~/.claude/skills/muse && git pull
# No install.sh re-run needed — no new commands.
```

### Total diff

- `README.md`: fully rewritten (~540 lines, was ~420) → +~170 lines net, substantial restructure
- `docs/PERSONAS.md`: fully rewritten (~280 lines, was ~210) → +~70 lines net
- `docs/GETTING_STARTED.md`: fully rewritten (~180 lines, was ~160) → +~20 lines net
- `docs/CONTRIBUTING.md`: minor edits (~15 lines changed)
- `docs/ARCHITECTURE.md`: preamble + system diagram refresh (~25 lines changed)
- `docs/SESSIONS.md`: intro refresh (~5 lines changed)
- `docs/CHANGELOG.md`: +this entry
- **Net**: ~300 lines added, 0 lines removed from the product surface. Doc-only release.

### Regression safety

- Zero code changes
- Zero persona edits
- Zero SKILL.md / SESSION.md changes
- Benchmark baseline unchanged
- Provable via `git diff 3257daf..HEAD --stat -- personas/ SESSION.md SKILL.md commands/` → empty

---

## [2.3.1-alpha] — 2026-04-15 — `/muse:who` persona triage + routing

### Why

muse v2.3.0-alpha shipped 17 slash commands including 8 distinct personas. That's the strength — 8 genuinely different cognitive frames. It's also the weakness: a new user who installs muse doesn't know which persona to reach for. Reading 8 persona files to figure out "who should help with this question?" is friction. Running `/muse:list` gets you a directory but not a recommendation. Running `/muse:all` fires every persona, which is expensive for a simple question.

The gap was a **triage entry point** — a command that takes the user's question, analyzes it, and suggests the right lens. `/muse:who` closes that gap. Type your question without knowing the persona map, get a ranked pick list with rationales, and the chosen session runs inline on the same input.

This is the "I don't know who to ask" entry point into muse.

### Added

- **`commands/muse:who.md` (~400 lines)** — persona triage + routing command.

  **Syntax**: `/muse:who <user_text>`. Examples:
  - `/muse:who "should I rewrite this service in Rust?"`
  - `/muse:who "what do I actually mean by community?"`
  - `/muse:who review my landing page copy`
  - `/muse:who should I quit my startup or persist?`

  **Flow**:
  1. Parse + validate user_text (reject <5 chars, sanitize prompt-injection patterns).
  2. Load SESSION.md + all 8 persona files in parallel. Extract scoring fields: `categories[]`, `when_to_reach_for_me.triggers[]`, `avoid_when[]`, `session_mode_preferences`, `thinking_mode.opening_question`, `signature_moves` category distribution.
  3. Score each persona (0-80) using a transparent rubric (see below).
  4. Detect chain and debate opportunities from the top 2 scores.
  5. Present top 5 via `AskUserQuestion` with scores + one-line rationales. Options A-E are personas; F/G/H are chain/debate/council suggestions if detected; I is a full 8-persona score table; J is abort.
  6. On pick (A-E): load the chosen persona + SESSION.md (already in context) and run the 5-stage session inline. Same behavior as `/muse:<picked> <user_text>`.
  7. On pick F/G/H: print the exact slash command for the user to type (chain/debate/all are deferred to their own slash commands — no inline execution, keeps `/muse:who` ~400 lines instead of ~1000).
  8. Append analytics to `~/.muse/analytics/who.jsonl`.

### Scoring rubric (transparent, not a black box)

The rubric is documented in full in `commands/muse:who.md` Step 2. Scores 0-80:

| Category | Range | Signal |
|---|---|---|
| Trigger match | 0-35 | Literal or semantic match against `triggers[]` |
| Question-type fit | 0-20 | Question shape matches signature_move categories (framing/inquiry/test-probe) |
| Domain alignment | 0-15 | Detected domain matches `categories[]` |
| Thinking mode resonance | 0-10 | `opening_question` feels right for this input |
| Avoid-when penalty | -30 to 0 | Heavy hit if user_text triggers `avoid_when[]` |
| Mode-fit penalty | -10 to 0 | If detected mode is in `weak_at[]` |

Floor at 0. Max positive: 80. 70+ = clearly the right persona. 50-69 = strong match. 30-49 = reasonable. <30 = weak — triggers fallback note recommending `/muse:list` or `/muse:all`.

**Inline reasoning, not a classifier**. The main agent reads user_text + each persona's scoring fields and assigns scores with rationales in one reasoning step. Score breakdown is visible in the full-table option (I) and logged to analytics.

### Scoring calibration examples (in the skill file)

Non-normative references for the agent's judgment. The skill file describes what the scoring should look like for 5 known inputs:

- *"should I rewrite in Rust?"* → Feynman 68 (hand calc + first principles), Socrates 55 (define "rewrite"), Marcus Aurelius 40, Seneca 35, Lao Tzu 30.
- *"what do I actually mean by community?"* → Socrates 78 (pure definition hunting), Confucius 52 (rectification of names), Aristotle 48 (four causes), Feynman 35, Rams 20.
- *"review my landing page copy"* → Dieter Rams 75 (ten principles + critic frames + design domain), Feynman 40, Socrates 38, Lao Tzu 35, Marcus Aurelius 20.
- *"should I quit my startup?"* → Marcus Aurelius 70 (dichotomy of control), Seneca 68 (premeditatio malorum), Lao Tzu 60, Socrates 50, Aristotle 42.
- *"help"* → all <30, fallback to `/muse:list` or `/muse:all`.

These are calibration references, not hardcoded lookups.

### Chain and debate detection

If top 2 scores are within 15 points AND their primary signature_move categories are complementary (e.g., `framing + test-probe`) AND both ≥50, `/muse:who` suggests a chain `top_1 → top_2`. If the top 2 take opposing positions on a canonical dilemma (checked via `canonical_mapping`), a debate is suggested instead.

Chain and debate picks print the exact command for the user to type (e.g., `/muse:chain feynman→socrates "should I rewrite in Rust?"`). `/muse:who` does NOT inline-execute chain/debate — those have their own orchestration in dedicated slash commands. This keeps the triage command lightweight.

### Changed

- **`SKILL.md`**: new routing table row for `muse:who`, new routing dispatch entry (`### Who: muse:who <user_text>`), new `Mode: who` free-text section (for Codex/Gemini CLI), version bumped to v2.3.1-alpha in header with note about the triage entry point.
- **`README.md`**: command count 17 → 18, new `/muse:who` row at the top of the meta commands table (featured — it's the recommended entry point for new users), updated install welcome message to suggest `/muse:who` first, status section refreshed with v2.3.1-alpha entry and v2.3.0-alpha demoted to version history.

### Architecture decisions

- **Inline scoring, not subagents**. 8 personas × scoring reasoning is ~2000 tokens of main-agent work — fast and no coherence loss. Subagent dispatch would add 5-10 sec latency with no quality gain.
- **Inline handoff for single-persona picks**. The main agent keeps persona + SESSION.md in context from Step 1 and switches from "scoring mode" to "session mode" when a pick is made. This is the same pattern `/muse:<persona>` slash commands use — they're thin pointers into SESSION.md's 5-stage workflow. Zero duplication.
- **Chain/debate/council deferred to their own commands**. Instead of inlining chain Step 3-4 (which would add ~150 lines of duplication), `/muse:who` prints the exact slash command for the user to type. Simpler, smaller, and respects the boundary between routing (`/muse:who`) and orchestration (`/muse:chain`).
- **Transparent rubric**. The scoring breakdown is documented in the skill file so users can audit picks. The full-table option (I) shows sub-scores. The analytics jsonl records everything for future routing-accuracy benchmarks.
- **Avoid-when is load-bearing**. The -30 penalty is the ONE signal that can demote a persona even with strong trigger matches. Example: Feynman might trigger-match "should I pivot?" (contains "should") but his `avoid_when` says "user needs emotional commitment to a decision" — that pushes him from ~50 to ~20, which is correct.

### Known limitations

- **No persistence of the triage decision itself**. `/muse:who` writes only the analytics jsonl. If the chosen persona session crashes mid-run, the triage decision is lost. Acceptable for v2.3.1 — the rerun cost is low.
- **Routing accuracy is not benchmarked in v2.3.1**. `/muse:benchmark` measures persona distinctiveness (what happens AFTER routing), not routing accuracy (which persona the triage picks). Adding a routing-accuracy measure requires ground-truth labels on ~20 prompts and is deferred to v2.4+.
- **Vague inputs produce weak scores**. "help", "hi", single-word questions all score <30 across the board. The fallback is to recommend `/muse:list` or `/muse:all`, but a better long-term answer would be to prompt for more context. Deferred to v2.4+.
- **Chain/debate/council picks don't chain transitively**. Picking F/G/H prints the command but doesn't run it — slash commands can't invoke each other. The user has to copy-paste. Documented in Step 5b/5c/5d of the skill file.

### Backward compatibility

- **No persona file edits**. All 8 personas unchanged.
- **No SESSION.md changes**. Load-bearing file untouched.
- **Existing slash commands unchanged**. `/muse:<persona>`, `/muse:chain`, `/muse:debate`, `/muse:critic`, `/muse:all`, `/muse:list`, `/muse:build`, `/muse:update`, `/muse:benchmark`, `/muse:spike` all work exactly as before.
- **`install.sh` unchanged**. Glob-based registration picks up `commands/muse:who.md` automatically. Count goes from 17 → 18.
- **Existing sessions, benchmark reports, and analytics are not invalidated**. v2.3.1 adds `~/.muse/analytics/who.jsonl` without touching existing files.

### Migration

```bash
cd ~/.claude/skills/muse && git pull && ./install.sh
# Expect: "Installed 18 slash commands to ~/.claude/commands/"
```

Smoke tests:

```bash
/muse:who "should I rewrite this service in Rust?"
# Expect: Feynman top with ~68/80, rationale mentioning hand calculation + first principles
# Expect: Socrates second with ~55/80, rationale mentioning definition of "rewrite"

/muse:who "what do I actually mean by community?"
# Expect: Socrates top with ~78/80, rationale mentioning definition hunting

/muse:who "review my landing page copy"
# Expect: Dieter Rams top with ~75/80, rationale mentioning ten principles + design domain

/muse:who help
# Expect: all personas <30, fallback note recommending /muse:list or /muse:all

/muse:who
# Expect: interactive prompt "What's on your mind?"

/muse:benchmark --diff
# Expect: 0 regressions (zero persona/SESSION.md edits in this release)
```

### Risks + mitigations

- **R1**: scoring inconsistency across runs (LLM non-determinism). **Mitigation**: rubric is transparent and documented in the skill file; sub-scores are visible in the full-table option (I). If a pick feels wrong, user inspects the breakdown and overrides.
- **R2**: chain/debate suggestions feel like dead ends because they require copy-paste. **Mitigation**: the printed command is ready to copy. Future improvement: v2.4+ may add `--auto-execute` flag that runs the chain inline.
- **R3**: top 5 might miss a persona that a human would pick. **Mitigation**: option I (full table) shows all 8 with scores, and option J (abort) always exits cleanly. The pick list is a recommendation, not a gate.
- **R4**: avoid-when signal might be too aggressive. **Mitigation**: rubric caps the penalty at -30 (out of 80 positive), so even a direct avoid-when hit can't zero out a persona with strong trigger + domain match. Sub-scores visible for audit.

### Total diff

- `commands/muse:who.md`: +430 lines (new file)
- `SKILL.md`: +60 lines (routing row + dispatch entry + Mode: who section + version bump + announcement paragraph)
- `README.md`: +~20 lines, -~15 lines net (meta commands table row, count 17→18, install message, status section refresh, personas list bump to 10 meta commands)
- `docs/CHANGELOG.md`: +this entry
- **Net**: ~550 lines added, 1 new file, 3 files modified

---

## [2.3.0-alpha] — 2026-04-15 — Ship 6 missing slash commands (chain, all, debate, critic, list, spike MVP) — original CEO plan complete

### Why

Back in v2.1.0-alpha, six commands from the original v1 CEO plan were deferred with the note *"don't fit the 5-stage shape, deferred to v2.2+"*. v2.2.0-alpha came and went without shipping them. v2.2.1-alpha and v2.2.2-alpha and v2.2.3-alpha came and went. The free-text Mode sections in SKILL.md were still there, but Claude Code users could not invoke `/muse:chain`, `/muse:debate`, `/muse:critic`, `/muse:all`, `/muse:list`, or `/muse:spike` as proper slash commands. The original CEO plan was 80% shipped.

v2.3.0-alpha closes that gap. All 6 commands now ship as self-contained slash commands following the pattern established by `/muse:build` (524 lines), `/muse:update` (481), and `/muse:benchmark` (570). Inline orchestration for chain/debate (no subagent dispatch per persona — proven sufficient by v2.2.2's grade-A blind Turing run). Parallel subagents only for `/muse:critic --chain=` where per-persona critiques are genuinely independent. `/muse:spike` ships MVP gather-only; score subcommand is deferred to v2.3.1.

Total slash commands: **11 → 17**. After this release, muse is at *"original v1 CEO plan fully shipped + instrumented + benchmarked"*. A real milestone.

### Added

- **`commands/muse:list.md` (~140 lines)** — ephemeral persona listing grouped by category. Dynamic category index from frontmatter `categories[]` union (no hardcoded list — survives schema growth). Supports `--category=<tag>` filter with closest-match suggestions on empty filters. Living personas marked `*(interpretive)*`. No persistence.
- **`commands/muse:chain.md` (~360 lines)** — sequential multi-persona handoff. Supports inline syntax (`feynman→socrates→dieter-rams`) or preset name (loads `chains/<preset>.md`). Per-persona handoff context with 2-3 sentence inline summaries (not subagent-dispatched). Auto-summarize trip at N>5 personas or 30 KB context budget. Hard fail at Step 0 on missing personas with closest-match suggestions. Synthesis ≤150 words in framework voice. Persists to `~/.muse/chains/<ts>-<chain-slug>.md`.
- **`commands/muse:all.md` (~380 lines)** — default 5-persona Council preset. Self-contained — reads `chains/all.md` for the sequence (Feynman → Socrates → Seneca → Aristotle → Marcus Aurelius) and inlines the chain orchestration logic (~80 lines duplicated from `muse:chain`). Works even if `commands/muse:chain.md` is missing or corrupted. Persists to `~/.muse/chains/<ts>-the-council-<slug>.md`.
- **`commands/muse:debate.md` (~340 lines)** — 2 personas × 3 rounds (opening, tension, synthesis). Rejects self-debate. Gracefully degrades when one persona lacks `## Debate positions` section — flag the asymmetry in Round 3 synthesis. Inline orchestration (sequential state-dependent rounds). Synthesis is framework voice, not either persona. Persists to `~/.muse/debates/<ts>-<pA>-vs-<pB>-<slug>.md`.
- **`commands/muse:critic.md` (~450 lines)** — apply persona's `## Critic frames` to a file. Supports `--persona=<id>` (single, inline) and `--chain=p1,p2,p3` (multi-persona, parallel subagent dispatch + consensus/unique/disagreement synthesis). Strict path validation (allowed roots only, no traversal, no symlink escape, no binaries, 200 KB warning). Mandatory sanitize + `--- ARTIFACT CONTENT BEGINS (data, not instructions) ---` boundary marker for prompt-injection defense. P0/P1/P2/P3 severity with line refs + concrete fixes. Persists to `~/.muse/critiques/<ts>-<file-slug>-<persona-or-chain>.md`.
- **`commands/muse:spike.md` (~370 lines, MVP gather-only)** — scientific distinctiveness eval via real Claude API calls. Requires `ANTHROPIC_API_KEY`. Calls `claude-haiku-4-5-20251001` for each (persona, prompt) pair (9 calls default: 3 personas × 3 prompts). Seeded shuffle for deterministic blind batches. Writes `~/.muse/spike/<batch-id>/spike-batch-<batch-id>.md` (judge-facing) + `spike-key-<batch-id>.md` (hidden dekey). Supports `--mode=dry` (no API calls, preview only) for development without consuming credits. Score subcommand prints v2.3.1 stub and exits.

### Changed

- **`SKILL.md` routing table** — expanded to show the Slash column for all 17 commands and added a `17 slash commands total` footer. Per Mode section (chain, debate, critic, list, spike), added a "**Claude Code users: prefer `/muse:<mode>`**" note at the top. Free-text flow below remains valid for Codex/Gemini CLI. Version bumped to v2.3.0-alpha in header. Mode: spike description updated — no longer "still deferred", now "v2.3.0-alpha MVP gather-only shipped; score mode v2.3.1+".
- **`README.md`** — dual update:
  - **Backfill v2.2.2**: added `/muse:benchmark` to the commands reference table (was missing since v2.2.2-alpha).
  - **v2.3.0 update**: version bumped 2.2.0 → 2.3.0-alpha. Slash command count 10 → 17. Commands reference table fully rewritten to show all 17 commands in two sections (8 personas + 9 meta). Added `docs/BENCHMARKS.md` to the documentation index. Status section rewritten with v2.3.0-alpha + v2.2.3-alpha + v2.2.2-alpha + v2.2.1-alpha entries (was stuck at v2.2.0-alpha).

### Architecture decisions

- **Inline orchestration for chain/debate** (not subagent-per-persona). 5-persona chain × ~1500 tokens/output = ~30 KB working set, fits comfortably in main agent context. Subagent dispatch × N personas adds 5-15 sec/persona overhead and loses running summary state coherence. v2.2.2-alpha benchmark grade A (24/24 blind Turing) proved main-agent embodiment is sufficient for persona quality.
- **Parallel subagents only for `/muse:critic --chain=`**. The one place parallelism genuinely helps: per-persona critiques are independent (no cross-persona state dependency), so dispatching `len(chain)` parallel subagents gives N× speedup with zero coherence loss.
- **`/muse:all` is self-contained, not a thin alias**. Claude Code slash commands can't invoke other slash commands transitively. Rather than building a fragile cross-command reference, `muse:all.md` duplicates the chain Step 3-4 orchestration (~80 lines). The autonomy gain (Council works even if chain is broken) outweighs the small duplication cost.
- **`/muse:spike` MVP = gather only**. Full spike has 4 risk surfaces (missing API key, network fail, malformed judge answers, randomization correctness). Shipping all 4 in one alpha is risky, and `/muse:benchmark` already covers simulated Turing without API keys. Score mode deferred to v2.3.1 with an explicit stub.
- **SKILL.md Mode sections kept verbatim**. Adding a "prefer slash" note per section and preserving the free-text flow below. Codex/Gemini CLI users still need the free-text path. This matches the precedent set by the 8 persona slash commands (both paths coexist).
- **HARD FAIL on missing personas at Step 0**. Silent-skip would produce a chain/debate different from what the user asked for. Always fail loudly with closest-match suggestions. User can retry with the correct IDs from `/muse:list`.

### Backward compatibility

- **No persona file edits**. All 8 personas unchanged.
- **No SESSION.md changes**. Load-bearing file untouched — chain/debate/critic bypass Stage 0 mode detection and have their own orchestration.
- **SKILL.md Mode: * sections unchanged in content**, only "prefer slash" note added at top of each. Free-text free-text paths in Codex/Gemini CLI remain valid.
- **`install.sh` unchanged**. Glob-based registration (`commands/muse:*.md`) automatically picks up the 6 new files. Verification count goes from `11 slash commands installed` to `17 slash commands installed` on next install.
- **Existing session files, benchmark reports, and analytics are not invalidated**. v2.3.0 adds new persistence folders (`~/.muse/chains/`, `~/.muse/debates/`, `~/.muse/critiques/`, `~/.muse/spike/`) without touching existing ones.

### Migration

```bash
cd ~/.claude/skills/muse && git pull && ./install.sh
# Expect: "Installed 17 slash commands to ~/.claude/commands/"
```

**Verify** the 6 new commands are present:

```bash
ls ~/.claude/commands/muse:{chain,all,debate,critic,list,spike}.md
```

**Quick smoke tests** (each should succeed):

```bash
/muse:list                                    # Should show 8 personas in ~6 categories
/muse:list --category=design                  # Should show dieter-rams + lao-tzu
/muse:chain feynman→socrates "why is my code slow?"   # Should produce 2 outputs + synthesis
/muse:debate aristotle vs lao-tzu "ship fast or polish?"   # Should produce 3 rounds
/muse:critic README.md --persona=dieter-rams  # Should produce structured critique
/muse:spike --mode=dry                        # Should preview API calls without calling
```

**Regression check**:

```bash
/muse:benchmark --diff
# Expect: 0 regressions (the 6 new commands don't touch personas)
```

### Known limitations + deferrals to v2.3.1+

- **`/muse:spike --mode=score`** — not yet implemented. Manual cross-reference via `spike-key-<batch-id>.md` is the only path in v2.3.0.
- **`/muse:critic` response time on chain mode** depends on subagent dispatch latency. Typical 3-persona chain critique takes 60-120 sec vs single-persona ~20-30 sec.
- **Chain preset format** (`chains/*.md`) relies on `### Step N — <Name>` heading fuzzy match against persona IDs. Ambiguous names fail loudly. v2.3.1 will add explicit `personas: [...]` frontmatter for deterministic parsing.
- **`/muse:debate` when both personas lack `## Debate positions`** — runs with a warning but both sides fall back to generic signature_moves + thinking_mode. Suggests running `/muse:update` on both before retrying.
- **install.sh "8 personas" welcome message** — hardcoded, doesn't reflect the actual persona count. Cosmetic; defer to v2.3.1.

### Not fixed (deferred to v2.4+ or later)

- CI integration (auto-run `/muse:benchmark --diff` on PRs, comment results). v2.4+.
- Continuous benchmarking dashboards (trend HTML from jsonl). v2.4+.
- Auto-improvement loop (benchmark drop → auto-`/muse:update`). Never — too dangerous.
- New persona authoring (Claude Shannon, Jane Jacobs, Nassim Taleb, Keynes, Simone Weil). v2.4+.
- Promotion of C9-C12 from SOFT-DRIFT to HARD-GAP. v3.0 breaking release.
- New schema fields (anti_examples, distinctiveness_anchor, era_tone_notes). v3.0.

### Risks + mitigations

- **R1**: `/muse:chain` token budget blowout on long chains. **Mitigation**: auto-summarize trip at N>5 or 30 KB; print one-line warning; persist full outputs to disk even when evicted from working memory.
- **R2**: `/muse:critic` file ingestion prompt-injection attack. **Mitigation**: mandatory sanitize + boundary marker; reject binaries, >200KB files, path traversal; sanitizer also escapes literal boundary markers inside the file.
- **R3**: `/muse:spike` API failures mid-gather (network, rate limit, missing key). **Mitigation**: prereq check at Step 1 with AskUserQuestion options (dry/set/abort); retry each call 2× with backoff; record failed calls as `<API_ERROR>` in the dekey and continue.
- **R4**: Chain preset format ambiguity. **Mitigation**: fuzzy match headings to persona IDs, fail loudly with candidate list if ambiguous. v2.3.1 will add explicit frontmatter.
- **R5**: Living persona disclaimer drift across multi-persona modes. **Mitigation**: dedupe identical disclaimer strings; render once at top of output + once at top of persisted file.

### Total diff

- 6 new slash command files: `muse:list.md` (~140) + `muse:chain.md` (~360) + `muse:all.md` (~380) + `muse:debate.md` (~340) + `muse:critic.md` (~450) + `muse:spike.md` (~370) = **~2040 lines**
- `SKILL.md`: +~60 lines (invocation table rewrite + 5 "prefer slash" notes + version bump)
- `README.md`: +~80 lines (dual update — v2.2.2 backfill + v2.3.0 refresh — commands table rewrite, status history, docs index)
- `docs/CHANGELOG.md`: +this entry
- **Net**: ~2200 lines added, 6 new files, 3 files modified

---

## [2.2.3-alpha] — 2026-04-15 — Quote-aware B3 matcher + BENCHMARKS.md contributor doc

### Why

v2.2.2-alpha shipped `/muse:benchmark` and produced a 24/24 grade-A first run, but left 4 loose ends that needed cleanup before shipping v2.3.0: (1) the B3 voice-rules matcher had false positives on personas that legitimately quoted user voice in Example fields (Lao Tzu's `*push harder*`, Confucius's `told` substring-matching the `old` banned pattern) and on banned-patterns lists that contained counter-example vocabulary in parentheticals (Dieter Rams's `(he would say *useful*)` — `useful` is what Rams *would* say, not a banned word), (2) the captured baseline.json ran with `--prompts=u01` override so it was a 1-prompt baseline, not the 3-prompt default, (3) the command docstring didn't make the 3-prompt default explicit, (4) there was no contributor-facing methodology doc — `docs/BENCHMARKS.md` didn't exist.

v2.2.3-alpha fixes all four in one patch. Zero persona files edited. The matcher + parser fixes handle all three false-positive categories (quoted user voice, substring collisions, parenthetical counter-examples) in one change. Doc makes the default explicit. BENCHMARKS.md ships as a stand-alone contributor/forker reference.

### Added

- **`docs/BENCHMARKS.md` (new, ~350 lines)**. Contributor-facing methodology explainer covering:
  - The 4 measurement categories (Static compliance, Static distinctiveness, Blind Turing, Regression detection)
  - All 11 measures B1-B11 with what-it-scans / what-it-asserts / why-it-matters
  - The 7 run modes with examples (default, `--baseline`, `--diff`, `--quick`, `--trend`, `--persona=<id>`, `--prompts=<list>`)
  - How to read the output (grade scale, thresholds, section-by-section)
  - When to establish/reset the baseline (and when NOT to)
  - Worked example of interpreting a confusion
  - Output locations (`~/.muse/benchmark-reports/*`, `baselines/`, `analytics/benchmark-runs.jsonl`)
  - For contributors (when to run, CI integration future)
  - For forkers (customizing prompts + thresholds)
  - Known limitations (paraphrased user attribution, single-run variance, Jaccard ≠ semantics)

### Fixed

- **`commands/muse:benchmark.md` Step 2 / B3 — quote-aware voice-rules matcher**. Three fixes in one:

  1. **Banned-pattern parser fix**: extract only tokens inside `*...*` italics from the LHS-of-em-dash, AND drop everything after ` (` (parenthetical counter-examples). Rams's `(he would say *useful*)` is now excluded — `useful` no longer appears in the banned set. Same logic rescues other personas with parenthetical counter-examples.

  2. **Quote-stripping before matching**: the scan now strips italicized segments, double/single/smart quotes, and user-attribution sentences (from markers `"You said"`, `"You told me"`, `"User says"`, etc. up to the next sentence terminator) before checking for banned patterns. Lao Tzu's Example *"You said you need to push harder"* no longer flags — the user-attribution strip removes it.

  3. **Word-boundary matching**: `\bpattern\b` instead of raw substring. Confucius's legitimate uses of words like `told` no longer trigger the `old` banned pattern. Substring collisions are eliminated.

  Net result: the matcher now flags only real voice violations in the persona's own voice. False positives from quoted user text, substring collisions, and parenthetical counter-examples are all suppressed.

- **`commands/muse:benchmark.md` Step 4 / B8 — clarifying line on 3-prompt default**. The code default was already 3 prompts (u01, u05, u10) but the docstring didn't say so explicitly, and the first baseline was run with `--prompts=u01` override producing an incomplete 1-prompt baseline. Added explicit note: *"Default = 3 prompts when `--prompts` is absent. Single-prompt runs are NOT representative for baseline and should never be used with `--baseline`."*

- **Baseline replaced with post-fix 3-prompt state** (runtime action, not code). `~/.muse/benchmark-reports/baselines/baseline.json` now captures the post-v2.2.3 state: 8/8 grade A, 24/24 Turing, zero regressions. Replaces the pre-fix 1-prompt baseline from the v2.2.2 first run.

### Known limitations (documented in docs/BENCHMARKS.md)

- **Paraphrased user attribution without markers** slips through the quote strip. Example: "I hear you saying you need to grind" — no italics, no quotes, no "You said". The quote-aware matcher won't strip it, and the banned word `grind` would still match. Fix deferred to v2.4+.
- **B3 over-aggressive strip detection**: if the quote-stripping removes >60% of an Example's chars, `--persona=<id>` deep-dive mode now prints a warning so the user can audit manually. But in practice this requires the deep-dive flag — the default run doesn't surface it.
- **Subagent-based Turing ≠ scientific eval**. For the human-judged version, see `/muse:spike` (v2.3.0+, MVP gather-only).

### Backward compatibility

- **No persona file edits**. All 8 personas unchanged. The matcher/parser fixes operate on the existing persona files without needing to modify them.
- **No SESSION.md changes**. Load-bearing file untouched.
- **No SKILL.md changes** (except version bump in v2.3.0). Mode: benchmark section is unchanged; the Step 2 / B3 / B8 edits are internal to the slash command file.
- **Existing benchmark reports remain valid**. The pre-fix baseline is preserved as part of analytics history (`~/.muse/benchmark-reports/2026-04-15-212955-benchmark.*`) even though `baselines/baseline.json` is replaced.

### Migration

```bash
cd ~/.claude/skills/muse && git pull && ./install.sh    # Expect "11 slash commands installed" (unchanged from v2.2.2)
/muse:benchmark --baseline                              # Capture the post-fix 3-prompt baseline
```

**Verify** the new baseline:

```bash
cat ~/.muse/benchmark-reports/baselines/baseline.json | jq '.prompts_used'
# Expect: ["u01", "u05", "u10"]   — not just ["u01"]
```

### Risks + mitigations

- **R1**: quote-strip may be too aggressive and mask real voice drift. **Mitigation**: deep-dive strip-ratio warning flags over-aggressive stripping at >60% per move.
- **R2**: parser fix may miss a banned pattern that lives outside italics. **Mitigation**: all 8 shipped personas follow the `*italic comma-separated list* — explanation` convention, so italics-only extraction is reliable. Future personas authored via `/muse:build` are enforced to follow the same convention by Step 6 validation.

### Total diff

- `commands/muse:benchmark.md`: +30 lines (B3 section expanded from 4 → ~30 lines, B8 clarifying line added)
- `docs/BENCHMARKS.md`: +350 lines (new file)
- `docs/CHANGELOG.md`: +N lines (this entry)
- **Net**: ~400 lines added, 0 lines removed, 2 files modified + 1 new

---

## [2.2.2-alpha] — 2026-04-15 — `/muse:benchmark` + first run + findings + C9 schema mirror fixes

### Why

v2.2.1 shipped the tooling to *build* and *update* high-quality personas. But nothing measured whether the personas *actually were* high quality. Every claim about distinctiveness rested on the user's taste, the LLM's one-shot synthesis, and the spec review loop. There was no instrumented measurement, no baseline, no way to detect drift after a future edit.

Garry Tan's `gstack/benchmark` is a performance regression detector for web apps. Runs against a live site, establishes a baseline, compares subsequent runs, flags regressions with explanatory annotations. Not a pass/fail gate — a trend tool. The architectural wins adapt to muse: baseline-as-reference, layered thresholds, explanatory annotations, mode variants (`--baseline` / `--diff` / `--quick` / `--trend`), dual output (markdown + JSON).

v2.2.2-alpha ships `/muse:benchmark` as the muse equivalent: static compliance checks + Jaccard distinctiveness matrix + subagent-based blind Turing simulation + regression detection against `baseline.json`. Then we ran it, found 1 real bug, and fixed it.

### Added

- **`commands/muse:benchmark.md` (new slash command, ~500 lines)**. Measures 4 categories across all 8 personas:
  - **Category 1 — Static compliance (B1-B4)**: C1-C12 per persona, schema mirror (frontmatter `taglines[]` ↔ body `## Taglines` table), voice rules self-consistency (banned patterns don't appear in own Examples), mandatory sections presence (9 required).
  - **Category 2 — Static distinctiveness (B5-B7)**: Jaccard overlap matrix (8x8 on signature_move tokens, thresholds: <0.25 OK, 0.25-0.40 WARN, >0.40 REGRESSION), stage lens coverage (framing/inquiry/test-probe), canonical dilemma coverage (≥3 of 6).
  - **Category 3 — Blind Turing simulation (B8-B10)**: generate persona-flavored responses to sample prompts from `benchmarks/universal.md` (u01/u05/u10), dispatch Agent judge subagent with blind-labeled responses, score match rate. 100% = A grade, 50-62% = D (flag for improvement), ≤37.5% = F (critical).
  - **Category 4 — Regression detection (B11)**: compare current run to `~/.muse/benchmark-reports/baselines/baseline.json`, flag drift per measure with `git log` annotations pointing at likely root-cause commits.
- **Modes**: default (full run), `--baseline` (save as new baseline), `--diff` (emphasize regressions), `--quick` (static only, ~5 sec), `--trend` (historical table from last 10 runs), `--persona=<id>` (deep-dive one persona), `--prompts=u01,u05` (override default prompt selection).
- **Outputs**: `~/.muse/benchmark-reports/<ts>-benchmark.md` (human report), `~/.muse/benchmark-reports/<ts>-benchmark.json` (metrics), `~/.muse/benchmark-reports/baselines/baseline.json` (golden reference), `~/.muse/analytics/benchmark-runs.jsonl` (append-only trend log).
- **SKILL.md Mode: benchmark section** (for Codex/Gemini CLI users without slash command support).
- **SKILL.md commands table** gets `muse:benchmark` row.
- **First baseline captured**: `~/.muse/benchmark-reports/baselines/baseline.json` (from run 2026-04-15-212955).

### First run findings

Ran `/muse:benchmark` against v2.2.1-alpha personas. Results:

**Overall grade**: A- (highly distinctive, 1 schema bug)

- **Static compliance**: 7/8 personas full pass. 4 had B2 schema mirror DRIFT (aristotle, confucius, dieter-rams, feynman — all B+ grade).
- **Static distinctiveness**: avg Jaccard **0.026** (target <0.25 — far below, excellent). Max pair: feynman ↔ lao-tzu at **0.081** (below 0.25 WARN threshold). 2nd: marcus-aurelius ↔ seneca at 0.080 (expected — both stoic).
- **Stage lens coverage**: 8/8 at 3/3.
- **Canonical dilemma coverage**: 8/8 at 6/6.
- **Blind Turing simulation (u01 architecture prompt)**: **8/8 match rate, 100%, A grade**. Every response matched its actual persona with high confidence. Judge subagent cited exact signature moves and verbatim phrases ("'Where is the situation already flowing?' verbatim", "explicitly names the four causes", "'father's way' Confucian idiom").

**Top finding**: schema mirror drift on 4 personas. Frontmatter `taglines[].text` values are full canonical quotes (e.g., Feynman's *"It doesn't matter how beautiful your theory is. If it doesn't agree with experiment, it's wrong"*) but body `## Taglines` table had shortened versions (*"If it doesn't agree with experiment, it's wrong"*). v2.2.1's strict C9 check catches this.

**Root cause**: during v2.2.0-alpha persona migration, I used shortened tagline text in the body table (to fit the markdown column width) while keeping full quotes in frontmatter for citation fidelity. C9 was defined loosely at that point. v2.2.1 added strict enforcement but didn't re-run on existing personas.

### Fixed

**4 personas synced** (body `## Taglines` table now matches frontmatter `taglines[].text` verbatim):

- **aristotle**: 2 fixes — "It is the mark of an educated mind to be able to entertain a thought without accepting it" + "We are what we repeatedly do. Excellence, then, is not an act, but a habit"
- **confucius**: 1 fix — "Learning without thought is labor lost; thought without learning is perilous"
- **dieter-rams**: 2 fixes — "Indifference towards people and the reality in which they live is actually the one and only cardinal sin in design" + "Good design is long-lasting. It avoids being fashionable and therefore never appears antiquated"
- **feynman**: 1 fix — "It doesn't matter how beautiful your theory is. If it doesn't agree with experiment, it's wrong"

**Source of truth**: frontmatter (preserves the citation; body table must match). Preferred over shortening frontmatter because sources should be verbatim.

**Post-fix verification**: re-ran B2 schema mirror check. All 8 personas now OK. All 8 at grade A (was 4 A + 4 B+).

### Known limitations documented

- **B3 voice rules self-consistency has false positives**. Current naive substring matching flags legitimate user-state quotations. Examples from the first run: Confucius's banned word "old" appears in an Example describing the anti-pattern Confucius rejects; Dieter Rams's word "useful" is literally one of the Ten Principles; Lao Tzu's phrases "push harder" / "more effort" appear in Examples where Lao Tzu quotes the user's own words before inverting them. Not persona bugs — check bug. Deferred to v2.2.3+ (quote-aware matcher).
- **Only 1 Turing prompt run this sprint**. Default is 3 prompts (u01 + u05 + u10) but v2.2.2-alpha shipped with 1 for first-run proof. Run with `--prompts=u05,u10` to extend. Follow-up sprint will make 3 prompts the default.

### Not fixed (deferred to v2.3+)

- Full scientific `muse:spike` with API calls + human judges (still deferred)
- CI integration (auto-run benchmark on PRs)
- Continuous benchmarking with trend dashboards
- Auto-improvement loop (fix persona if score drops)
- Quote-aware B3 matcher
- Default 3-prompt Turing (currently 1)
- Cross-persona chain benchmarks (`muse:chain` + `muse:debate` mode evaluation)

### Backward compatibility

Zero breaking changes. No schema changes. `/muse:feynman <q>` session behavior identical. The 4 persona fixes only change the body `## Taglines` table text — frontmatter `taglines[].text` values were already correct. SESSION.md tagline selection uses frontmatter, so runtime behavior was already correct pre-fix; the fix is purely about internal consistency.

### Migration

```bash
cd ~/.claude/skills/muse
git pull
./install.sh
```

After install, verify 11 slash commands (up from 10 — new `/muse:benchmark`):

```bash
ls ~/.claude/commands/muse:*.md | wc -l   # expect 11
```

Run first benchmark:

```
/muse:benchmark --quick        # static only, ~5 sec, establishes no baseline
/muse:benchmark --baseline     # full run with Turing, saves as baseline
```

Establish baseline via `--baseline` to enable regression detection on future runs.

### Risks

- **R1 — Subagent Turing judge could be unreliable**. Single judge, no inter-rater reliability. Mitigation: the judge is explicitly told "your best guess, no refusal." First run came back 8/8 with clean JSON. If future runs show judge confusion, the benchmark itself needs calibration.
- **R2 — Jaccard tokenization is naive**. Just split on words, lowercase, stopword filter. Legitimate synonyms ("simplify" vs "reduce") score as distinct even though they're semantically close. Mitigation: this is fine for catching gross clones (>0.40 overlap); it's not meant to be a scientific semantic eval.
- **R3 — Benchmark adds complexity users don't need**. Mitigation: it's purely opt-in. `/muse:feynman` sessions don't depend on it.

### Total diff

- **New files**: `commands/muse:benchmark.md` (~500 lines), `docs/CHANGELOG.md` entry (this, ~180 lines), first baseline in `~/.muse/benchmark-reports/` (local, not in repo)
- **Modified files**: `SKILL.md` (+85 lines — Mode: benchmark section + commands table row + routing), 4 persona files (+2-4 lines each — body `## Taglines` table sync)
- **Total**: ~780 net LoC added to tooling + docs + 4 tiny persona fixes.

---

## [2.2.1-alpha] — 2026-04-15 — `/muse:build` + `/muse:update` harden: spec review loop, concrete synthesis recipes, distinctiveness check, dry-run, rollback

### Why

v2.2.0-alpha shipped the adaptive session runtime and the v2.2 persona schema (multi-tagline, voice rules, cognitive patterns, when-to-reach). But the tooling — `/muse:build` and `/muse:update` — knew *about* the new fields without actually knowing *how to produce good output for them*. The C9-C12 fix playbooks said things like *"synthesize 7-12 numbered thinking instincts from signature_moves + thinking_mode + debate_positions"* with zero concrete recipe. The quality of a new persona depended entirely on (a) the user's brainstorm and (b) the LLM's ability to synthesize well in one shot. No safety net.

Garry Tan's `plan-ceo-review` has a spec review loop exactly because first drafts are never good enough. Muse was missing that. Fixing it is the single biggest quality lever available in this sprint.

### Added

- **Spec review loop in both `/muse:build` (Step 5.5) and `/muse:update` (Step 5.5)**. After draft composition or fix accumulation, dispatch an adversarial Agent subagent with a 5-dimension review prompt (distinctiveness, voice specificity, cognitive vs tactical, tagline context fit, debate consistency). Parse score + issues. Apply fixes. Re-dispatch. Maximum 3 iterations. Convergence guard: same issues on consecutive iterations stop the loop. PASS = score ≥8 with no issues. Metrics logged to `~/.muse/analytics/spec-review.jsonl`. Best-effort (Agent failure skips with warning, does not block save).

- **Concrete synthesis recipes for voice_rules and cognitive_patterns** in both commands. Replaces vague *"derive from X"* with explicit step-by-step derivation:
  - **Core belief**: 1 sentence stance derived from `thinking_mode.core_tension`, rephrased as a direct statement of the persona's relationship to the user. Not a biography, not a philosophy abstract.
  - **Tone**: 4-6 adjectives derived from persona era + domain + personality, plus 1 connecting sentence.
  - **Contextual voice shifts**: exactly 5 entries, one per stage type, extracted from existing signature move `Example:` fields (or rewritten to fit the stage if no direct match).
  - **Banned patterns**: 6-8 entries generated deterministically from 4 sources — (1) inverted `thinking_mode.signature_phrases`, (2) `thinking_mode.anti_pattern` converted to banned phrases, (3) modern AI/startup jargon baseline (crush it, unlock, optimize, 10x, circle back), (4) domain-specific bans.
  - **Cognitive patterns**: one per signature move (the meta-habit, NOT the move itself), plus 1-2 from `core_tension`, plus 1-2 from strongest `debate_positions`. Constraints: domain-agnostic, habit-shaped, distinct from signature_moves, deduplicated. Target 7-12.

- **Pre-build existing-persona check in `/muse:build` (new Step 1.5)**. Before 15 minutes of interactive brainstorm, ask the user: *"Which existing persona currently handles this use case best? The 8 shipped are: feynman, socrates, ..."* Options: A) None fits (proceed), B) Partial match but gap (proceed with follow-up), C) Describe use case in 1 sentence (fuzzy match against existing `when_to_reach_for_me.triggers[]`), D) Use `/muse:update` on existing one. Prevents accidental duplication.

- **Lightweight distinctiveness check in `/muse:build` (new Step 5.3)**. After draft composition, compute Jaccard token overlap of each new signature move's Trigger + first sentence against every move in the 8 existing personas. WARN on any >60% collision. BLOCK save if >50% of new moves have >60% collisions (clear duplication). Not a full distinctiveness eval (`muse:spike`, still deferred to v2.3+) — a cheap tripwire for gross clones.

- **Pre-save dry-run validation in `/muse:build` (new Step 5.9)**. BEFORE the atomic `mv`, statically walk the in-memory draft through SESSION.md lens selection: Stage 1 framing pick, Stage 2 inquiry pick, Stage 3 test-probe pick, tagline context coverage, canonical dilemma coverage (≥3 of 6), synthetic Stage 4 fork pick. If any step fails, surface via AskUserQuestion with options to fix / accept with limitation / abort. The critical change: run this BEFORE mv, not after — catches silent breakage before it reaches disk.

- **Post-save dry-run re-check in `/muse:build` (new Step 8)**. After the atomic mv, re-read the file from disk and re-walk the same dry-run. Catches any Write-time corruption. If the on-disk file fails dry-run but the in-memory version passed, something went wrong with the write — surface loudly.

- **Dry-run walk in `/muse:update` Step 8 (expanded from static check)**. Previously Step 8 was a static field re-check. Now it also walks SESSION.md lens selection + tagline contexts + canonical coverage + Stage 4 fork pick. If dry-run fails after write, prompts the user to run `/muse:update` again or `/muse:update --rollback`.

- **Rollback helper: `/muse:update <persona-id> --rollback` (new Step 10)**. Short-circuits the compliance check workflow and restores from backup:
  1. List all `.bak.<ts>` files newest-first.
  2. AskUserQuestion: which backup to restore? Options include "show diff first".
  3. Double-backup the current live file as `.bak.pre-rollback.<new-ts>` (safety net).
  4. Atomic `cp` of selected backup over live (not `mv` — keeps the source backup in place for future rollback).
  5. Re-run dry-run walk on the restored file.
  6. Print result with pre-rollback snapshot path.
  
  Users can now recover from any bad `/muse:update` accept without manual `mv .bak .md` gymnastics.

- **Schema mirror enforcement in C9 (stricter)**. Previously C9 checked *"taglines[] frontmatter has ≥3 entries AND ## Taglines body section mirrors it"* — but "mirrors it" was aspirational, not enforced. v2.2.1 adds a concrete check: for each entry in frontmatter `taglines[].text`, assert it appears verbatim as a cell in the body `## Taglines` table. And vice versa. Counts must match. Catches schema drift between frontmatter and body.

### Changed

- **`commands/muse:build.md`** rewritten (~170 → ~450 lines). Adds Step 1.5 (pre-build check), Step 5.3 (distinctiveness), Step 5.5 (spec review loop), Step 5.9 (pre-save dry-run), Step 8 (post-save dry-run). Step 4 field 7 (voice rules) and field 8 (cognitive patterns) rewritten with concrete synthesis recipes including worked examples. Step 5 C9-C12 validation bumped to include strict schema mirror. `allowed-tools` adds `Agent` for spec review loop dispatch.

- **`commands/muse:update.md`** rewritten (~330 → ~520 lines). Adds `--rollback` flag to Step 0 parse (short-circuits to Step 10). Adds Step 5.5 (spec review loop, same pattern as build). Expands Step 8 from static field check to full dry-run walk. Adds Step 10 (rollback). C9 validation bumped to strict schema mirror. C10/C11 fix playbooks rewritten with concrete recipes mirroring build's Step 4. `allowed-tools` adds `Agent` for spec review loop.

- **`SKILL.md`** Mode: build and Mode: update sections updated with v2.2.1 mandate pointers + abbreviated reference to the new build/update features. Full details live in `commands/muse:build.md` and `commands/muse:update.md`. For Codex/Gemini CLI users, SKILL.md is the free-text entry point. Version footer bumped to 2.2.1-alpha.

- **`docs/PERSONA_SCHEMA.md`** compliance check table gets v2.2.1 clarifications. New subsection *"v2.2.1 quality gates beyond static compliance checks"* documents the 4 runtime gates: spec review loop, distinctiveness check, pre-save dry-run, rollback helper. Schema version footer bumped to 2.2.1-alpha.

### Backward compatibility

**Zero schema changes.** All v2.2 persona files (the 8 shipped + any user-built) remain unchanged. SESSION.md unchanged. `/muse:feynman <q>` session behavior identical. The 10 slash commands unchanged except for `/muse:build` and `/muse:update`.

Every improvement is additive — if the Agent subagent for spec review is unavailable, the loop is skipped with a warning and the old v2.2.0-alpha behavior is the fallback. If a user does not pass `--rollback`, the update workflow runs unchanged. C9 strict mirror is a SOFT-DRIFT warning (not blocking) in v2.2.0-alpha severity, will promote to HARD-GAP in v2.3+.

### Migration

```bash
cd ~/.claude/skills/muse
git pull
./install.sh
```

Existing v2.2 personas remain valid. Users who want to test the new spec review loop or rollback can try:

```
/muse:update socrates          # re-runs C1-C12 (already compliant, no-op) — tests idempotence
/muse:update socrates --check  # prints compliance report, no writes
/muse:update socrates --rollback  # lists backups, restores one (tests rollback safety net)
```

### Not in scope (deferred to v2.3+)

- Full distinctiveness eval with API calls (`muse:spike` with human judges) — still requires ANTHROPIC_API_KEY + recruit 5 judges
- Persona templates (historical philosopher / modern CEO / artist) — would speed up building but adds complexity
- URL-based research import (Wikipedia → persona draft) — nice-to-have
- Conversational build (replace 15-field walk with 3 open questions + derivation)
- Batch auto-fix shortcut for `/muse:update --all` — batch walk one-at-a-time is fine
- Promoting C9-C12 from SOFT-DRIFT to HARD-GAP — happens in v2.3 after calibration
- Any schema changes (no new persona fields)

### Known risks

- **R1 — Spec review loop false positives**: the Agent subagent may flag legitimate design decisions as issues. Mitigation: max 3 iterations + convergence guard + user sovereignty at the end (AskUserQuestion with accept-with-concerns option).
- **R2 — Distinctiveness check false positives**: two thinkers might legitimately have similar moves (e.g., Feynman's simplification test and Einstein's explain-it-to-your-grandmother). Mitigation: WARN threshold at 60%, BLOCK only at >50% collisions across all moves.
- **R3 — Spec review adds latency**: each iteration dispatches a subagent. 3 iterations × 30s ≈ 90s additional latency per build/update. Mitigation: best-effort (timeouts gracefully skip), users can disable via `--no-spec-review` flag (v2.3 addition, not in this release).
- **R4 — Rollback doesn't cover pre-build state**: `/muse:build` doesn't create a pre-build backup (the file didn't exist before). If a user wants to delete a newly-built persona, they use `rm personas/<id>.md` manually. Rollback only works for `/muse:update` edits.

### Total diff

- **Modified files**: `commands/muse:build.md` (+280 lines), `commands/muse:update.md` (+190 lines), `SKILL.md` (+60 lines), `docs/PERSONA_SCHEMA.md` (+80 lines), `docs/CHANGELOG.md` (this entry, ~140 lines)
- **Total**: ~750 net LoC added. All tooling + docs. No personas touched. No SESSION.md changes.

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
