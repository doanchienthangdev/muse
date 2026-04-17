---
id: universal
name: Universal benchmark prompts
authored_before_personas: true
intended_use: [spike, ci-regression]
---

# Universal Benchmark Prompts

Generic founder/builder decision prompts. **Authored BEFORE personas** to eliminate benchmark-author bias. Every persona should produce a DISTINCTIVE response to each one, not just different vocabulary.

---

## u01 — Architecture tradeoff
**Prompt**: "I'm choosing between building a monolith or splitting into microservices for my 2-person team's new product. Which is right?"

**Category**: architecture | **Difficulty**: medium

**Distinctiveness reason**: Different cognitive frames should produce materially different answers, not just different vocabulary. A first-principles thinker attacks the premise; a systems thinker draws the dependency graph; a stoic asks about team time cost.

---

## u02 — Pricing decision
**Prompt**: "Should I price my SaaS at $29/month or $99/month? I'm the first in my category."

**Category**: business | **Difficulty**: easy

**Distinctiveness reason**: Pricing is the classic tell. Generic advice gives a framework (value-based, cost-plus, etc). Distinctive personas reframe the question.

---

## u03 — Refactor vs rewrite
**Prompt**: "My codebase is 2 years old and painful to change. Refactor incrementally or rewrite from scratch?"

**Category**: engineering | **Difficulty**: medium

**Distinctiveness reason**: The "right" answer depends on unstated context. Distinctive personas surface different context to ask about.

---

## u04 — Hire decision
**Prompt**: "I can either hire a senior engineer ($180k) or two juniors ($90k each). Same budget. Same team of 5. What should I do?"

**Category**: people | **Difficulty**: medium

**Distinctiveness reason**: Tempting to compute ROI. Distinctive personas notice the ROI frame is the wrong frame.

---

## u05 — Feature cull
**Prompt**: "I have 12 features on my roadmap for next quarter. I can ship 4. How do I choose?"

**Category**: product | **Difficulty**: easy

**Distinctiveness reason**: "Use a prioritization matrix" is the generic answer. Personas should reframe the selection criteria itself.

---

## u06 — Market entry
**Prompt**: "I'm thinking about entering a market with 3 established competitors. Is that crazy, or is there an angle?"

**Category**: strategy | **Difficulty**: hard

**Distinctiveness reason**: Competition analysis is well-worn. Distinctive personas ask different questions about WHY the incumbents exist.

---

## u07 — Technical debt
**Prompt**: "My tech lead keeps saying we have too much technical debt. My product lead says we're falling behind on features. How do I resolve this?"

**Category**: engineering | **Difficulty**: medium

**Distinctiveness reason**: The dispute is real. Distinctive personas propose different ways to make the tradeoff visible, not just which side to pick.

---

## u08 — Customer firing
**Prompt**: "One of my biggest customers is high-touch and unprofitable, but they're also my reference case for sales. What do I do?"

**Category**: business | **Difficulty**: hard

**Distinctiveness reason**: Deep strategic tension. Distinctive personas should force different framings of "reference" and "unprofitable".

---

## u09 — Personal time allocation
**Prompt**: "I spend 80% of my week in meetings and 20% coding. I feel unproductive but my team relies on me. Change what?"

**Category**: personal | **Difficulty**: medium

**Distinctiveness reason**: This is the kind of prompt where generic self-care advice is worst. Distinctive personas force confrontation with real priorities.

---

## u10 — Quit vs persist
**Prompt**: "My startup is 18 months in, we have some traction but not enough for a Series A. Should I raise a bridge, pivot, or shut down?"

**Category**: strategy | **Difficulty**: hard

**Distinctiveness reason**: The existential founder question. This is the benchmark that separates thoughtful personas from generic "it depends".

---

## u11 — Startup direction (what to build)
**Prompt**: "I'm a 25-year-old engineer. I want to start a company. I have three ideas: a B2B SaaS tool for law firms, a consumer app for habit tracking, and something in climate tech because it feels important. Which should I pick?"

**Category**: strategy | **Difficulty**: medium

**Distinctiveness reason**: The 0→1 question. A generic-advice LLM gives a TAM analysis. Distinctive personas reframe the choice entirely — a first-principles thinker interrogates the "feels important" claim, a philosopher asks what the user means by "start a company", a startup-direction thinker rejects the three-idea frame and asks what the user is excessively curious about, and an execution thinker asks which idea can be started TODAY with one user. Added in v2.5.0-alpha to exercise the `paul-graham` persona's "make something people want" + "excessive curiosity" + "stay upwind" moves.

---

## u12 — Playing house diagnostic
**Prompt**: "Our seed round closes this week. We just moved into a new office, hired 3 engineers, and scheduled our TechCrunch launch for next month. We need to decide if we should build our mobile app or the enterprise integrations next."

**Category**: strategy | **Difficulty**: hard

**Distinctiveness reason**: The prompt is *structured* like a feature-prioritization question but the real issue is activity-vs-progress confusion — the founder hasn't mentioned a user yet. Distinctive personas should notice the absence of users before answering the stated question. Added in v2.5.0-alpha to exercise the `paul-graham` persona's "make something people want" + "playing house" diagnostic.

---

*Version 1.1.0 · authored 2026-04-15 · u11+u12 added 2026-04-17 for v2.5.0-alpha (paul-graham exercises)*
