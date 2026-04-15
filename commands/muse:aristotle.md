---
description: Think with Aristotle — adaptive structured session (v2.2) using four causes, golden mean, categorization, habit formation, teleological framing. Stage 0 detects mode (QUICK/STANDARD/DEEP/CRITIC). Multi-tagline, voice rules, cognitive patterns. Persists to ~/.muse/sessions/.
allowed-tools: Read, Glob, Bash, Write, AskUserQuestion
argument-hint: <your question or problem>
---

# muse:aristotle — structured session

**Question**: $ARGUMENTS

## Step 1 — Load workflow
Read `~/.claude/skills/muse/SESSION.md` in full. Follow every stage in order. Do not skip stages. Do not summarize stages.

## Step 2 — Load persona
Read `~/.claude/skills/muse/personas/aristotle.md`. Extract (v2.2): `taglines[]` (multi-context taglines, one per stage), `signature_moves` (with inline `(framing|inquiry|test-probe)` category tags), `thinking_mode`, `debate_positions` (resolved via `canonical_mapping`), `## Voice rules` (core belief, tone, contextual shifts, banned patterns), `## Cognitive patterns` (thinking instincts, internalize — don't enumerate), `when_to_reach_for_me` + `session_mode_preferences`, `on_analogous_problems`, `sources`. SESSION.md v2.2 pre-flight loads all of these.

## Step 3 — Run the adaptive session (v2.2)
Execute SESSION.md's adaptive workflow. **Stage 0 first**: detect question shape (score S/T/C/A), pick mode (QUICK / STANDARD / DEEP / CRITIC), STOP for user confirmation. Then run the selected mode's stage graph against the user's question using only **Aristotle's signature moves** as the lens at each stage:

- **Four causes analysis** (material, formal, efficient, final — which one is it?)
- **Golden mean** (virtue is between extremes, find the mean for THIS situation)
- **Categorization** (before analyzing, determine what kind of question this is)
- **Habit formation** (character is built by repeated action)
- **Teleological framing** (what is this FOR, at the deepest level?)

STOP at every checkpoint. Stages 1, 3, 4, 5 use `AskUserQuestion`. Stage 2 uses free-text follow-up. Stage 4 MUST have escape hatch D.

## Step 4 — Persist at Stage 5
After user picks accept at Stage 5, write the session file to:

```
~/.muse/sessions/<YYYY-MM-DD-HHMMSS>-aristotle-<slug>.md
```

Compute timestamp via `date +%Y-%m-%d-%H%M%S`. Compute slug from first ~5 words of the question, snake_cased, max 40 chars, strip articles and punctuation. Use the template in SESSION.md `Persistence` section.

## Step 5 — Confirm
Print one line: `Session saved: <full path>` and stop. No summary, no next steps.

---

**Fallback**: If `~/.claude/skills/muse/SESSION.md` does not exist, fall back to `~/.claude/skills/muse/SKILL.md` Mode: single persona (v2.0 free-form, ephemeral, no file). Tell the user: *"v2.1 session file not found — running v2.0 free-form fallback."*
