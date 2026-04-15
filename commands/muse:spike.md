---
description: Scientific persona distinctiveness eval via real Claude API calls. Requires ANTHROPIC_API_KEY. v2.3.0-alpha ships the gather subcommand only (generate blind batch + dekey for human judges). Score subcommand (cross-reference judge answers + GO/PIVOT/NO-GO verdict) is v2.3.1+. For the lightweight subagent-based alternative (no API key needed), use /muse:benchmark.
allowed-tools: Read, Glob, Bash, Write, AskUserQuestion, Agent
argument-hint: "[--personas=<csv>] [--seed=<n>] [--mode=gather|score|dry]"
---

# muse:spike — scientific distinctiveness eval (v2.3.0-alpha, MVP gather-only)

**Args**: $ARGUMENTS

Ports the Mode: spike section of SKILL.md into a runnable slash command. v2.3.0-alpha ships **gather** mode only: generate persona-flavored responses via real API calls, randomize under blind labels, write batch + dekey files, print judge instructions. **Score mode is v2.3.1+ deferred** — the command prints a stub and exits if `--mode=score` is passed.

This is the heavyweight scientific version. For daily regression detection without API keys, use `/muse:benchmark`.

## Step 0 — Parse + validate

Parse `$ARGUMENTS` into `(personas, seed, mode)`. Order-independent flag parsing:

- `/muse:spike` → defaults: `personas=feynman,socrates,seneca`, `seed=42`, `mode=gather`
- `/muse:spike --personas=feynman,socrates,dieter-rams --seed=7` → custom personas + seed
- `/muse:spike --mode=dry` → dry run, no API calls, no files written
- `/muse:spike --mode=score` → prints v2.3.1 stub and exits (not yet implemented)

**Validation**:

- `personas` must be 3-5 comma-separated persona IDs. Each must match `^[a-z][a-z0-9-]{0,30}$`. Reject duplicates.
- `seed` must be a non-negative integer ≤ `2^31 - 1`. Default 42 for reproducibility.
- `mode` must be one of `gather`, `score`, `dry`. Default `gather`.

**Score mode stub** (if `mode=score`):

```
Score mode is not yet implemented in v2.3.0-alpha.

To score a spike batch manually:
  1. Read ~/.muse/spike/<batch-id>/spike-batch-<batch-id>.md
  2. Recruit 5 judges (see the batch file for instructions)
  3. Collect judge answers in a shared doc
  4. Cross-reference judge answers against:
     ~/.muse/spike/<batch-id>/spike-key-<batch-id>.md

     (this file contains the label→persona decoding)
  5. Compute distinguishability %:
     correct_matches / (judges × prompts × personas_per_prompt)

  Verdict thresholds:
    ≥70% distinguishability → GO    (personas are distinct enough to ship)
    50-69% → PIVOT                 (sharpen weakest personas before shipping)
    <50%  → NO-GO                  (too many confusions — back to the drawing board)

Score mode (automated cross-reference + decision memo) is scheduled
for v2.3.1-alpha. Track at: docs/CHANGELOG.md
```

Exit after printing the stub. Do not proceed to Step 1 if `mode=score`.

**Directory setup** (only if mode != score):

```bash
mkdir -p ~/.muse/spike
mkdir -p ~/.muse/analytics
```

## Step 1 — Prereq check

Run via Bash:

```bash
if [ -z "$ANTHROPIC_API_KEY" ]; then
  echo "MISSING_API_KEY"
fi
```

If `MISSING_API_KEY` is output AND `mode != dry`, then `AskUserQuestion` with 3 options:

- **A) Run in --mode=dry** (preview the API calls + batch structure, no real calls, no files)
- **B) Abort** — let user `export ANTHROPIC_API_KEY=sk-ant-...` and retry
- **C) Point me at an alternative** — explain that `/muse:benchmark` does subagent-based Turing simulation and needs no API key

If the user picks A, proceed to Step 2 with `mode=dry`. If B, exit cleanly with:

```
Aborted. To run /muse:spike, set ANTHROPIC_API_KEY first:

  export ANTHROPIC_API_KEY=sk-ant-your-key-here
  /muse:spike --personas=feynman,socrates,seneca

For the lightweight subagent-based alternative (no API key required),
run /muse:benchmark instead.
```

If the key is present, proceed.

## Step 2 — Load personas + benchmark prompts

### 2a. Read persona files

Parallel `Read` all persona files listed in `personas`. Extract:

- `id`, `name`, `tagline`, `living_status`, `disclaimer` (if living)
- `## Signature moves` (full section — feeds the persona frame)
- `## Thinking mode` (opening_question, core_tension, anti_pattern)
- `## Voice rules` (banned patterns — the scoring side can check for voice violations)

**HARD FAIL** if any persona is missing — show closest matches via Glob + Levenshtein.

### 2b. Read benchmark prompts

Parallel `Read`:

- `~/.claude/skills/muse/benchmarks/universal.md` → 10 prompts `u01..u10`
- `~/.claude/skills/muse/benchmarks/founder-questions.md` → 10 prompts `f01..f10`

Parse each file for the prompt definitions. Each prompt has `id`, `category`, `difficulty`, `text`. Store in a flat list. Total: 20 prompts.

For v2.3.0-alpha gather mode, select **3 prompts** by default: `u01` (architecture, medium), `u05` (feature cull, easy), `u10` (quit vs persist, hard). These cover 3 difficulty tiers. Allow override via `--prompts=<list>` (same syntax as /muse:benchmark).

## Step 3 — Generate raw eval responses

For each (persona, prompt) pair — 3 personas × 3 prompts = 9 pairs total:

### 3a. Construct the persona frame

Build a persona-embedding prompt that tells the API to respond AS the persona. Template:

```
You are <persona.name>, a thinker characterized by these signature moves:

<persona.signature_moves section, full text>

Your opening question to any problem is: <thinking_mode.opening_question>
Your core tension is: <thinking_mode.core_tension>
The anti-pattern you always avoid: <thinking_mode.anti_pattern>

You must NEVER use these phrases or moves (they are NOT in your voice):
<persona.voice_rules.banned_patterns>

Respond to the following question IN YOUR VOICE, using your signature
moves. 120-180 words. End with a commitment-language closer appropriate
to your thinking style. Do not break character. Do not mention that you
are an AI or that you are "playing" a persona.

QUESTION:
<sanitized prompt text>
```

### 3b. Call the API (gather mode)

If `mode=gather`, call the Claude API for each pair via Bash + curl. Rate limit: max 3 concurrent to avoid triggering rate limits.

```bash
call_api() {
  local persona_frame="$1"
  local prompt_text="$2"
  local combined=$(jq -n --arg pf "$persona_frame" --arg pt "$prompt_text" '{
    model: "claude-haiku-4-5-20251001",
    max_tokens: 512,
    messages: [{role: "user", content: ($pf + "\n\nQUESTION:\n" + $pt)}]
  }')

  curl -sS --max-time 60 https://api.anthropic.com/v1/messages \
    -H "x-api-key: $ANTHROPIC_API_KEY" \
    -H "anthropic-version: 2023-06-01" \
    -H "content-type: application/json" \
    -d "$combined" \
    | jq -r '.content[0].text'
}
```

Loop through the 9 pairs sequentially (keep it simple — no concurrent pool for v2.3.0 MVP). Retry each call up to 2 times on non-200 response or network timeout. If a call fails after 2 retries, record `{persona, bp_id, prompt, response: "<API_ERROR: reason>"}` and continue.

Store responses in an in-memory list: `responses = [{persona_id, persona_name, bp_id, prompt_text, response_text}, ...]`.

### 3c. Dry mode (mode=dry)

If `mode=dry`, DO NOT call the API. Instead, for each pair, print:

```
[DRY RUN] Would call claude-haiku-4-5-20251001 with:
  Persona: <persona.name> (<persona.id>)
  Prompt: <bp_id> — <first 60 chars>...
  Frame size: <N> bytes
  Max tokens: 512
```

At the end of dry mode, print a summary:

```
[DRY RUN] Total API calls that would be made: <3 personas × 3 prompts = 9>
Estimated tokens consumed: ~<9 × 1500 avg> = ~13500 tokens
Estimated cost (haiku pricing): ~$<0.01 × tokens / 1000>

Re-run without --mode=dry (and with ANTHROPIC_API_KEY set) to gather.
```

Exit dry mode here. Do not proceed to Step 4.

## Step 4 — Randomize blind batch

Use a deterministic seeded shuffle. For each prompt (3 total):

1. Take the 3 persona responses for this prompt
2. Shuffle them using `seed` + `prompt_index` as the RNG seed (reproducible across runs with the same seed)
3. Assign labels `A`, `B`, `C` in shuffled order
4. Store the shuffle mapping: `{prompt_id: {A: <persona_id>, B: <persona_id>, C: <persona_id>}}`

The shuffle can be computed in the main agent's reasoning (a 3-element list is tiny) or via a small awk/python one-liner. Either is fine.

## Step 5 — Write batch + dekey files

Compute batch ID:

```
batch_id = date +%Y-%m-%d-%H%M%S
spike_dir = ~/.muse/spike/<batch_id>
mkdir -p $spike_dir
```

### 5a. Write judge-facing batch file

`~/.muse/spike/<batch-id>/spike-batch-<batch-id>.md`:

```markdown
# Muse Spike Batch — <batch-id>

**Date**: <timestamp>
**Personas tested**: <persona names, NOT IDs — keep blinded>
**Prompts**: <prompt count> prompts across <difficulty tiers>

## Instructions for judges

You are judging a blind persona-attribution test. For each question below,
3 responses are shown (labeled A, B, C). These were generated by 3 different
"cognitive personas" — each is a different thinker's way of approaching the
question. Your job: match each response to the persona you think wrote it.

The 3 personas in play are (in no particular order):
  1. <name-1>
  2. <name-2>
  3. <name-3>

You DO NOT need to be an expert on these thinkers. Use your intuition based
on the style, the moves, the vocabulary, the way each response opens and
closes. Trust your gut.

## How to submit your answers

Create a text file with this format:

  Q1: A=<persona-1>, B=<persona-2>, C=<persona-3>
  Q2: A=<persona-2>, B=<persona-3>, C=<persona-1>
  Q3: A=<persona-3>, B=<persona-1>, C=<persona-2>

Use the persona NAMES exactly as shown in the list above (lowercase, single word,
or first name only for multi-word names). Example: "feynman", "socrates", "dieter-rams".

Return the file to the person who gave you this batch. They'll cross-reference
your answers against the hidden key and compute your accuracy.

---

## Question 1 — <prompt_id>

**Prompt**: <prompt_text>

### Response A
<shuffled response for this position>

### Response B
<shuffled response for this position>

### Response C
<shuffled response for this position>

---

## Question 2 — <prompt_id>

<repeat structure>

---

## Question 3 — <prompt_id>

<repeat structure>

---

*Generated by /muse:spike (v2.3.0-alpha, MVP gather mode) · batch <batch-id>*
```

### 5b. Write dekey file

`~/.muse/spike/<batch-id>/spike-key-<batch-id>.md`:

```markdown
# Spike Batch Key — <batch-id>

**⚠ KEEP THIS HIDDEN FROM JUDGES ⚠**

This file contains the decoding from blind label (A/B/C) to actual persona.
Use it AFTER judges submit their answers to compute accuracy.

---

## Question 1 — <prompt_id>

| Label | Actual persona |
|---|---|
| A | <persona_id> |
| B | <persona_id> |
| C | <persona_id> |

## Question 2 — <prompt_id>

<repeat>

## Question 3 — <prompt_id>

<repeat>

---

## Seed + config

- Seed: <seed>
- Personas: <csv>
- Prompts: <csv>
- Model: claude-haiku-4-5-20251001
- API calls: <N>
- Failed calls: <N> (if any)

---

*Generated by /muse:spike (v2.3.0-alpha, MVP gather mode) · batch <batch-id>*
```

## Step 6 — Print judge instructions + close

```
═══════════════════════════════════════════════════════════
Spike batch gathered. Files written:

  ~/.muse/spike/<batch-id>/spike-batch-<batch-id>.md  (judge-facing)
  ~/.muse/spike/<batch-id>/spike-key-<batch-id>.md   (keep hidden!)

Next steps:
  1. Recruit ≥5 judges (people with general thinking ability, no
     expertise in the specific personas required).
  2. Share spike-batch-<batch-id>.md with each judge.
  3. Collect answers — one file per judge in the format shown in
     the batch instructions.
  4. To score: manually cross-reference each judge's answers against
     spike-key-<batch-id>.md. Compute accuracy per judge + per persona.

Score mode (automated cross-reference + GO/PIVOT/NO-GO verdict) is
deferred to v2.3.1-alpha.

For a quick-and-dirty distinctiveness check without API keys or human
judges, run /muse:benchmark instead — it uses subagent-based Turing
simulation and gives a grade in ~60 seconds.
═══════════════════════════════════════════════════════════
```

### 6a. Append analytics

```json
{"ts": "<iso>", "command": "muse:spike", "mode": "gather", "batch_id": "<id>", "personas": ["<id-1>", ...], "prompts": ["<bp-1>", ...], "seed": <n>, "api_calls_attempted": <N>, "api_calls_failed": <N>, "batch_path": "<path>", "dekey_path": "<path>", "duration_s": <seconds>}
```

Append to `~/.muse/analytics/spike.jsonl`.

## Notes

- **MVP gather-only** in v2.3.0-alpha. Score subcommand (cross-reference judge answers + decision memo) is v2.3.1. The stub is intentional — ships a complete-enough tool without committing to 4 extra risk surfaces in one alpha.
- **Requires ANTHROPIC_API_KEY**. This is the scientific version. For quick regression detection without API keys, use `/muse:benchmark` (subagent-based, no API calls).
- **3 personas × 3 prompts = 9 API calls** by default. Each ~500 tokens response. Total ~5K tokens input + ~5K output = ~10K tokens per run, ~$0.01 on haiku pricing.
- **Deterministic seed**. Same `--seed=<n>` produces the same shuffle, so two runs with the same config produce identical batch files (except for the API response variation).
- **Living personas**: if any tested persona is living/estate_protected, the disclaimer is included in the blind batch file header (the judges see it, because attribution matters for living subjects even in blind tests).
- **API failure handling**: 2 retries per call, then record as `<API_ERROR>` and continue. A partial batch with 1-2 failed calls is still useful; a fully failed batch (all 9 fail) is treated as a network / auth problem and the user is told to check `ANTHROPIC_API_KEY` + connectivity.

## Related commands

- `/muse:benchmark` — lightweight subagent-based Turing simulation, no API key required
- `/muse:list` — browse installed personas
- `/muse:<persona>` — single-persona 5-stage session
- `/muse:chain p1→p2→p3 <q>` — sequential chain for a specific question

*Generated by muse v2.3.0-alpha*
