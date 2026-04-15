# TODOs — Muse Framework

Generated from `/plan-ceo-review` on 2026-04-15 (revision 2, post outside voice review).
All items here were **explicitly deferred** during planning with user decision.

---

## P0 — Pre-v1 Prerequisites (required before Phase 1 build)

These unblock the build phase conditional on spike passing.

### [P0-1] Recruit 5 human judges for spike eval
**What**: Find 5 technical founders willing to do ~30min blind evaluation task.  
**Why**: Fix D combined eval requires human judges with external rubric (T2 resolution). LLM-as-judge has the same blind spots as the persona being tested.  
**Pros**: Eliminates judge-jury bias; produces publishable-quality validation data.  
**Cons**: Recruitment friction; scheduling; ~$50-100 honorarium if needed.  
**Context**: Judges should be from ICP (technical founders). Can be friends, YC network, Twitter DMs. Need diverse opinions.  
**Effort**: S (human: 2-4 hours / CC: N/A — human task)  
**Priority**: P0 (spike blocker)  
**Blocked by**: None  
**Blocks**: Phase 0 spike

### [P0-2] Create 20 benchmark prompts for founder decisions
**What**: Write 20 high-quality benchmark prompts covering pricing, architecture, hiring, feature cull, fundraising, tech debt, market entry, product cut decisions.  
**Why**: Spike needs real founder-flavored test prompts, not academic questions (T10 ICP specificity).  
**Pros**: Forces the spike to measure value for the actual ICP, not random domain.  
**Cons**: Writing good prompts is harder than it looks — too easy = can't distinguish personas, too hard = noisy eval.  
**Context**: Each prompt should have a "known good" answer that founders would recognize. Steal from actual YC office hours, Founder Stories, Hacker News threads.  
**Effort**: S (CC: ~2-4 hours)  
**Priority**: P0  
**Blocked by**: None  
**Blocks**: Phase 0 spike

### [P0-3] Translate 10 benchmark prompts to Vietnamese
**What**: Pick 10 from the 20 English prompts, translate to natural Vietnamese.  
**Why**: T8 — Vietnamese language quality is unmentioned in original plan; cognitive moves may collapse in translation. Need parallel testing.  
**Pros**: Validates framework works for Vietnamese-speaking users (user's own language).  
**Cons**: Translation quality matters — machine translation may introduce artifacts.  
**Context**: User is Vietnamese-speaking (from conversation). This is a real compatibility question.  
**Effort**: XS (CC: ~30 min)  
**Priority**: P0  
**Blocked by**: P0-2  
**Blocks**: Phase 0 spike

### [P0-4] Design spike evaluation rubric (external, not LLM-as-judge)
**What**: Write 1-page rubric: distinctiveness (reverse Turing), usefulness (A/B vs raw Claude), signature-move presence checklist, cognitive-frame coherence score.  
**Why**: T2 resolution — external rubric prevents judge-jury problem.  
**Pros**: Forces spike to measure meaningful dimensions.  
**Cons**: Rubric design is itself biased if written by same person building personas. Have outside voice validate rubric too.  
**Context**: Rubric should take judge <5 min per output to score (otherwise recruitment suffers).  
**Effort**: S (CC: ~2 hours)  
**Priority**: P0  
**Blocked by**: None  
**Blocks**: Phase 0 spike

---

## P1 — Post-spike (if spike passes, enters Phase 1 build)

### [P1-1] Legal review for first living-figure persona addition
**What**: Consult lawyer re: right-of-publicity + defamation exposure for 1 living figure (e.g., Bezos or Thiel), document guidelines.  
**Why**: T6 — Character.ai got sued; impersonating named public figures has exposure. Hybrid strategy accepted but needs legal grounding before adding any living figure.  
**Pros**: Protects against lawsuit; establishes framework policy.  
**Cons**: ~$500-1500 consult fee; may constrain product.  
**Context**: v1 ships primarily historical personas (Feynman, Socrates, Seneca, Rams). Living figures added only after this review lands.  
**Effort**: M (human: 1-2 weeks wall clock, 2-4 hours consult)  
**Priority**: P1  
**Blocked by**: Phase 0 spike passing  
**Blocks**: Adding any living-figure persona

### [P1-2] Collect ONE real before/after case study for landing page hero
**What**: Find/create one concrete story: founder had X problem, used Muse:[persona], made Y decision, outcome was Z. With permission to publish.  
**Why**: T4 — "Platonic Ideal is hope, not demo" per outside voice. Landing page needs concrete proof.  
**Pros**: Removes vaporware perception; gives adoption a narrative.  
**Cons**: Dependent on finding willing founder; may need to be user's own story.  
**Context**: Can be as small as "priced at $49 → $99, conversion +12%". Does not need to be epic.  
**Effort**: S  
**Priority**: P1  
**Blocked by**: Phase 1 build (need working Muse to generate the demo)  
**Blocks**: Landing page launch

---

## P2 — v2 Roadmap (after v1 ships)

### [P2-1] `muse:scan` web research automation
**What**: Automated research agent that fetches sources (Wikipedia/arxiv/YouTube/Medium/Substack) into `.archives/personas/<name>/`.  
**Why**: Originally scoped for v1, deferred per T9 outside voice warning: 2-week rabbit hole (search/scrape/consent/rate limits/hallucinations).  
**Pros**: Reduces friction for user-built personas; growth loop for community personas.  
**Cons**: Each source type has its own complexity (robots.txt, rate limits, content licensing, scraping fragility).  
**Context**: V1 replaces with richer `muse:build` accepting manual `.archives/` folder — user does own research. V2 adds automation after core value proven.  
**Effort**: L (CC: ~1 week, after v1)  
**Priority**: P2  
**Blocked by**: v1 shipping

### [P2-2] Community persona marketplace/registry
**What**: Signed persona registry with reputation system, allowing third-party personas to be installed via `muse install persona=@author/name`.  
**Why**: Growth loop; user-contributed personas scale framework beyond core set. Deferred from v1 per security review (prompt injection surface).  
**Pros**: Network effect moat; community contributions.  
**Cons**: Platform chicken-and-egg; requires signing infrastructure, trust tiers, moderation.  
**Context**: V1 ships Core + local only. V2 adds community tier after trust infrastructure matures.  
**Effort**: XL  
**Priority**: P2  
**Blocked by**: v1 traction + trust infrastructure

### [P2-3] Journal/memory across sessions
**What**: Persistent thinking log — framework remembers what you worked on, tracks decisions over time, surfaces patterns.  
**Why**: Compounding value — framework learns YOUR thinking patterns. Deferred because requires persistence layer design and is not critical for v1.  
**Pros**: Enables personalized persona recommendations for your blindspots.  
**Cons**: Privacy implications; schema design; potential for creepiness.  
**Context**: Only surfaces after user opts in explicitly.  
**Effort**: M  
**Priority**: P2

### [P2-4] `muse:mirror` — user's own thinking style as persona
**What**: Framework calibrates to user's own cognitive patterns (from journal data) and offers "mirror mode" — think against your own blindspots.  
**Why**: Advanced feature for power users; deferred as too speculative for v1.  
**Pros**: Genuinely novel; highly personalized.  
**Cons**: Depends on P2-3 journal existing; calibration is hard.  
**Effort**: L  
**Priority**: P2  
**Blocked by**: P2-3

### [P2-5] Auto-contextualize problem detection
**What**: Framework detects what problem you're currently working on (from Claude Code context, file changes, etc.) and suggests relevant personas without explicit invocation.  
**Why**: Zero-friction invocation. Deferred as "too much AI magic for v1."  
**Pros**: Friction reduction; feels magical.  
**Cons**: Brittle; can't be trusted for important decisions.  
**Effort**: L  
**Priority**: P3

### [P2-6] Full day-1 Codex + Antigravity adapters
**What**: Port Muse to Codex and Antigravity skill formats; ship installers for all three platforms day-1.  
**Why**: User mentioned multi-IDE support in original request; v1 ships Claude Code only (adapter architecture ready).  
**Pros**: Broader reach; validates multi-IDE architecture.  
**Cons**: Research + test matrix; each platform has its own skill format.  
**Context**: V1 adapter layer designed to support this without refactor.  
**Effort**: M-L  
**Priority**: P2

### [P2-7] Persona versioning + rollback
**What**: Personas are semver-versioned; users can roll back to prior version; compare versions diffs.  
**Why**: As personas improve (better research, refined moves), users should be able to see changes + revert if desired.  
**Pros**: User control; rollback safety.  
**Cons**: Adds complexity to install/update flow.  
**Effort**: S-M  
**Priority**: P2

### [P2-8] Cross-persona tensions/harmonies map
**What**: Pre-computed map of where each persona disagrees/agrees with others, used to smartly select debate pairs and chain sequences.  
**Why**: Makes `muse:all` and `muse:debate` smarter; surfaces unexpected combinations.  
**Pros**: Emergent value from persona library.  
**Cons**: Needs data from multiple sessions; v1 doesn't have enough content.  
**Effort**: M  
**Priority**: P3

---

## Open Questions (not yet TODOs — need decision first)

### [OQ-1] If spike fails, what's the pivot destination?
Outside voice suggests pivot to "curated prompt gist + simple CLI" (80% of value). Need to decide: is this worth building at all if personas don't measurably differ? Or kill project entirely?

### [OQ-2] Eval framework ongoing CI cost
Fix B (per-commit A/B vs raw Claude on 20 prompts) = ~40 API calls per commit. At muse.dev scale, could be $$ if PR frequency high. Need budget guardrails.

### [OQ-3] Will `.archives/personas/` folder pattern scale to community contributions?
Current design is personal research vault. If users want to share their .archives (e.g., publish a Feynman archive), need sharing protocol.

---

_Generated by `/plan-ceo-review` with outside voice adversarial review. Last updated: 2026-04-15_
