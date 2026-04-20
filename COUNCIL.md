# Muse v2.16 — Council Dispatch

**This file is the load-bearing spec for multi-persona councils during a session.**

Invoked via the `/council <p1> <p2> [<p3>]` command at any STOP point in a running session. Different from `/muse:chain` (sequential) and `/muse:debate` (adversarial 2-way): council is **parallel advisory** — 2-3 personas produce their probe/frame/test at the current stage SIMULTANEOUSLY, outputs shown side-by-side, user picks or merges.

---

## Why council

During a session, sometimes the user realizes "I want Feynman's take AND Aristotle's take before I commit to one framing." Currently that requires aborting and running `/muse:chain` or two separate sessions. Council does it inline: single stage, multiple persona outputs, user synthesizes.

Use cases:
- Stage 1 Frame: get 2 different framings from different thinkers
- Stage 3 Test: compare Feynman's hand calculation vs Aristotle's four causes
- Stage 3.5 Alternative Paths: have each persona name their preferred path
- Stage 4 Decide: surface the dilemma from 2 different canonical lenses

Not council use cases:
- Full multi-persona session (that's `/muse:chain`)
- Persona vs persona debate (that's `/muse:debate`)
- Single persona deep work (default session)

---

## Invocation

User types `/council <p1> <p2> [<p3>]` at any STOP point.

**Argument validation**:
- 2-3 persona-ids (exactly — 1 is no-op, 4+ exceeds parallel Agent budget)
- Each `<p>` matches `^[a-z][a-z0-9-]{0,30}$` AND `personas/<p>.md` exists
- Current session persona MUST NOT be in the council list (council adds perspectives, not redundant current-persona output)

On validation failure, print error + re-prompt (per SESSION.md Command Grammar conventions).

---

## Dispatch

### Context budget per persona

Each council Agent receives:
- Full persona file (`personas/<id>.md`)
- Current stage name + purpose (from SESSION.md Stage library)
- Working framing (from current session's Stage 1 output)
- Original user question (verbatim)
- `outputs_so_far` compressed to 500 words (drop-oldest-first if longer)

NOT passed:
- Other council personas' outputs (parallel, not sequential — each produces independently)
- Bookmarks (those stay with the main session)
- Other personas' session-history voice caches
- Convergence state (council runs outside the convergence loop — its result feeds back INTO the current stage)

### Agent dispatch pattern

Council dispatches 2-3 Agent tool calls **in a single message** (parallelism idiom). Each Agent receives:

```
Agent({
  description: `Council: <persona-id> at <stage>`,
  subagent_type: "general-purpose",
  prompt: `
You are applying the cognitive moves of <Persona Name> (via the persona file below) 
to produce a <stage_type> output at the current session stage.

=== PERSONA FILE ===
<full persona file contents>
=== END PERSONA FILE ===

=== SESSION CONTEXT ===
Current stage: <stage_name> (<stage_purpose>)
Working framing: <framing>
Original question: <question>

Prior outputs so far (compressed):
<outputs_so_far compressed>
=== END SESSION CONTEXT ===

Task: Produce this persona's <stage_type>-category output for this stage.
Pick ONE signature move from the persona's signature_moves[] matching the <stage>'s category.
Apply that move concretely to the current situation. Produce 3-5 sentences of output.
End with the move name cited (so user can see which move was applied).

Format:
  [<persona-id>:<move-name>]
  <3-5 sentence output>
  Source: <source-id from persona's sources>

Do NOT respond as the persona in first person ("As Feynman..."). Just apply the move.
Stay within the move's voice; do not use banned patterns from the persona's voice rules.
Budget: 200 words max.
`,
  timeout_ms: 45000
})
```

### Per-Agent timeout: 45s

Longer than convergence detector's 30s because council Agents produce richer output. If an Agent times out while others return, render a placeholder cell (see below).

---

## Output rendering

After all dispatches complete (or timeout), render side-by-side ASCII:

### Two-persona case (council <p1> <p2>)

```
┌───────────────────── COUNCIL at Stage <N> ──────────────────────┐
│                                                                  │
│  <P1 NAME>                    │  <P2 NAME>                       │
│  ─────────                    │  ─────────                       │
│  [move-p1:<name>]             │  [move-p2:<name>]                │
│                               │                                  │
│  <p1 output wrapped           │  <p2 output wrapped              │
│   at ~50 chars per line,      │   at ~50 chars per line,         │
│   up to 6 lines>              │   up to 6 lines>                 │
│                               │                                  │
│  Source: <citation>           │  Source: <citation>              │
│                                                                  │
├──────────────────────────────────────────────────────────────────┤
│  AskUserQuestion:                                                │
│  A) Go with <P1>'s probe                                         │
│  B) Go with <P2>'s probe                                         │
│  C) Synthesize both (I'll merge, you confirm)                    │
│  D) Neither — stay with <current-persona>'s probe                │
└──────────────────────────────────────────────────────────────────┘
```

### Three-persona case (council <p1> <p2> <p3>)

3-column version of the above. Each column narrower (~35 chars). Options A/B/C become "Go with <P1>", "Go with <P2>", "Go with <P3>"; option D = "Synthesize / Neither — type which".

### Timeout case

If 1 of N Agents timed out:

```
│  <P1 NAME>                    │  <P2 NAME>                       │
│  ─────────                    │  ─────────                       │
│  [move-p1:<name>]             │  [TIMEOUT — 45s, no response]    │
│  <p1 output>                  │                                  │
│  Source: <citation>           │  (Agent unavailable)             │
```

Options still rendered; one cell just shows placeholder. User can pick the other, synthesize (which falls back to just the one available), skip, or `/rerun-council` to retry.

If ALL Agents time out: print "Council unavailable; continuing with <current-persona>'s stage output" and skip the council panel (session continues as if council wasn't invoked).

---

## Option handling

### A or B or C (single-persona pick)

1. Extract the chosen persona's output from the council response.
2. Replace the current session's would-have-been stage output with the chosen council output.
3. Append to session file as new stage block (checkpoint): include `council: true` + `chosen_persona: <id>` + `council_personas: [<list>]` metadata.
4. Convergence detector (if in EXPLORE mode) runs on this new stage output as normal.

### C (synthesize both)

1. Dispatch a new Agent (not in parallel; sequential after council outputs returned) with:
   - Current session's persona file (the PRIMARY persona, not council members)
   - Both (or all 3) council outputs
   - Prompt: "Synthesize these cognitive moves into a single output that's true to YOUR voice. If they contradict, pick the stronger argument and acknowledge the disagreement. If they complement, merge. Respect banned patterns from your own voice rules."
   - Timeout: 45s
2. Render the synthesis to user with AskUserQuestion:
   - A) Accept synthesis (Recommended)
   - B) Go back to original council — pick a single persona instead
   - C) Let me merge manually (enters free-text edit mode)

### D (neither)

Discard council outputs. Resume current session's stage as if council hadn't been invoked. Checkpoint the council invocation + rejection (for analytics).

### Contradiction handling

If the council outputs directly contradict each other (different conclusions on the same test-probe, incompatible framings), the presentation STILL shows both without forcing resolution. Option C's merge prompt gets an extra instruction: "These contradict. Pick the stronger argument AND acknowledge the other in the merge."

---

## Checkpoint + analytics

After council completes (any option):

1. Write to session file: new `## Stage <N> — Council (<p1>, <p2>[, <p3>])` block with:
   - Each persona's output
   - User's choice (A/B/C/D)
   - Synthesis (if C)
2. Update frontmatter: increment `council_invocations` counter.
3. Log to `~/.muse/analytics/council.jsonl`:
   ```json
   {
     "ts": "...",
     "session_path": "...",
     "current_persona": "feynman",
     "council_personas": ["aristotle", "paul-graham"],
     "stage": "stage_3_test",
     "user_choice": "C",
     "outputs_agreed": false,
     "synthesis_produced": true,
     "latency_ms_per_agent": [4230, 3890],
     "timeouts": 0
   }
   ```

---

## Failure modes

| Mode | Handling |
|---|---|
| Invalid persona-id in args | Error + re-prompt; session continues |
| Current-session persona in council list | Error "council adds perspectives; you're already <current>" + re-prompt |
| One Agent times out | Placeholder cell + options still offered |
| All Agents time out | Council skipped; session continues |
| Synthesis Agent times out | Fall back to option A/B/D choice manually |
| User types `/council` with wrong arity (1 or 4+ personas) | Error explaining 2-3 range + re-prompt |
| `MUSE_REGRESSION_MODE=true` | Council dispatch SKIPPED entirely (dispatch would be non-deterministic). User gets error "council is disabled in regression mode; re-run without env var set." |

---

*Version: 2.16.0-alpha · part of muse-core · consumed by SESSION.md Command dispatch handler. Uses Agent tool with parallel dispatch.*
