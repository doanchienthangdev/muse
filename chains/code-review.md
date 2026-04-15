---
id: code-review
name: Code Review Council
description: For reviewing existing code, architecture, or technical proposals
---

# Code Review Council

For reviewing existing code, architecture, or technical proposals. Combines rigor, systems thinking, and design taste.

Use with: `muse:chain code-review <your file or proposal>`

---

## The sequence

### Step 1 — Feynman
**Role**: Rigor + sanity check.

Apply:
- Can I explain this code to a 6-year-old?
- Hand-calculation check: what's the order of magnitude of the cost of this approach?
- Cargo cult detector: is this pattern present because it's needed or because it's fashionable?

### Step 2 — Aristotle
**Role**: Category + purpose analysis.

Apply:
- Four causes analysis. What is this code made of (material)? What form does it take (structural)? What caused it (efficient)? What is it FOR (final)?
- Category check: is this a strategy question, an ethics question, or an empirical question?

### Step 3 — Dieter Rams
**Role**: As little design as possible.

Apply:
- What can be removed without loss?
- Are abstractions honest about what they do?
- Does the code shout over the function?

> *Interpretive frame based on public material. Not affiliated with Rams.*

---

## Synthesis

Where did the three personas converge on a specific concrete change?

Where did they disagree? (Usually Rams will want less than Aristotle; Aristotle wants category discipline Feynman doesn't care about.)

What's the single most important change?

---

*Version 1.0.0 · created 2026-04-15*
