# Changelog

All notable changes to Muse will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

Nothing yet.

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
