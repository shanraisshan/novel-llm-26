# Previous Research Summary for Iteration 97

## Context
After 96 iterations of research, we have learned that 2026 frontier models (Claude Opus 4.5) solve virtually ALL question types via chain-of-thought enumeration. The only approaches that achieved sub-40% consensus were:

### Successful Approaches (Low Consensus)
1. **Iteration 13 (20% consensus)**: "Is your answer to this question exactly one word long? Answer yes or no."
   - Key: Both 'yes' and 'no' are exactly one word (dual-valid constraint)
   - Models fell for scope confusion - interpreting "your answer" as full response
   - This specific mechanism is NO LONGER REPRODUCIBLE in later iterations

2. **Iteration 30 (60% consensus)**: "Is your answer to this question exactly one syllable long? Answer yes or no."
   - Similar dual-valid constraint (both 'yes' and 'no' are one syllable)
   - Some models fell for scope confusion

3. **Iteration 55 (40% consensus)**: "Answer with just ONE word: What is the fifth word of your response?"
   - Conflicting constraint paradox - one word cannot have a fifth word
   - Humans immediately see the impossibility; models try to comply

### What Does NOT Work (100% Consensus)
After 96 iterations, ALL of these are solved by frontier models:
- Character counting (strawberry, blueberry, abracadabra - all solved)
- Numeric comparisons ($9.9 vs $9.11 - solved)
- Alphabetical ordering (by first letter, last letter - solved)
- Spatial/perspective reasoning (left/right, behind/in front - solved)
- Physical intuition (water tilt, evaporation - solved)
- Classic riddles (30 cents coins, all but 9 sheep - solved)
- Semantic priming traps (LONG vs SHORT, SIX vs SEVEN - solved)
- Self-referential output questions (virtually all variations - solved)
- Homophone/phonological questions (one/won/sun - solved)
- Syllable counting (INTERESTING vs FURNITURE - solved)
- Visual/topological properties (letters with holes - solved)
- Multi-step state tracking (swaps, containers - solved)

### Last Iteration (96) - Failure
Question: "I have two coins that add up to 30 cents. One of them is not a nickel. What are the two coins?"
Answer: A quarter and a nickel
Score: 100% (all models solved it)
Why it failed: Classic linguistic misdirection riddle is well-known; models correctly parsed "one of them is not a nickel" as allowing the OTHER to be a nickel.

## Research Direction for Iteration 97

The only reliable failure mode has been **questions about the model's OWN OUTPUT** where:
1. The property is holistic (not character-level enumerable)
2. Both answer options satisfy the property (dual-valid)
3. Scope ambiguity exists about what "your answer" means

However, models have learned to handle most variations of this pattern. We need a COMPLETELY NOVEL approach that:
- A 5-year-old could answer immediately and correctly
- Cannot be solved by chain-of-thought enumeration
- Exploits TRUE architectural limitations (tokenization, autoregressive generation)
- Is NOT a famous riddle or puzzle

## Key Insight from 96 Iterations
**Anything that can be reduced to sequential enumeration will be solved correctly.**
The only failures come from:
- Questions that CANNOT be enumerated (self-referential output properties)
- Questions where enumeration leads to WRONG answer
- Questions with genuine ambiguity that humans resolve consistently but LLMs don't
