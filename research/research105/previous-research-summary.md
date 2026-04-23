# Previous Research Summary (for Iteration 105)

## Accumulated Findings Through Iteration 104

### Best Results So Far
- **Iteration 103**: Shadow riddle inversion → **0% consensus** (SUCCESS!)
  - Question: "I follow you everywhere but I get LONGER the closer you get to the sun. What am I?"
  - Answer: Your footprints/trail (NOT a shadow)
  - Exploit: Modified famous riddle; physics contradiction with canonical "shadow" answer

- **Iteration 104**: Candle inversion → **40% consensus**
  - Question: "I'm short when I'm young and tall when I'm old. What am I?"
  - Answer: A person (NOT a candle)
  - Partial success — some models caught the inversion of the famous candle riddle

### Strategy That Works: Modified Famous Riddle Pattern-Matching
1. Take a universally known riddle with one dominant answer in training data
2. Modify a key detail that INVALIDATES the canonical answer
3. Make the correct answer obvious to any human, but the canonical answer pattern-matches so strongly that LLMs miss the modification

### Strategies That DON'T Work (consistently 100% consensus)
- Letter counting (LLMs have learned this)
- Position/enumeration questions
- Numeric comparisons (3.9 vs 3.11)
- Alphabetical ordering
- Physical intuition (ball vs feather)
- Simple relational logic (who is behind who)
- Classic unmodified riddles (already in training data)

### Strategies That Don't Meet Criteria
- Self-referential paradoxes (humans also confused)
- Constraint impossibility paradoxes (not easy for humans)
- Philosophical questions

## Key Insight from Recent Iterations

The "modification trap" is the highest-signal attack vector. The pattern-match to the famous riddle is so strong that even chain-of-thought reasoning rationalizes around the modification instead of noticing it.

However, the shadow and candle riddles may now be in training data as known test cases (MisguidedAttention benchmark, Reddit r/LocalLLaMA "candle test" post with 252 upvotes).

## Direction for Iteration 105

Continue exploring modified famous riddles, but:
- Pick a riddle that is VERY famous but has NOT been publicly discussed as an LLM test case
- Ensure the modification creates a clean physics/logic contradiction
- Ensure the correct human answer is trivially obvious (5-year-old test)
- Avoid any riddle that has been written about in MisguidedAttention or similar repositories

### Candidate Riddle Structures to Explore
1. **"What has X but no Y?" riddles** (with Y swapped to something contradictory)
2. **"The more you take, the more you leave behind"** (footsteps) — invert the relationship
3. **"I speak without a mouth"** (echo/wind) — invert context
4. **"I'm full of holes but still hold water"** (sponge) — invert property
5. **Riddle of the Sphinx variants** — swap legs/time

### Alternative Attack: Contradictory Compound Questions
A question that combines TWO famous concepts in a way that requires noticing a subtle contradiction between them. Not explored yet.
