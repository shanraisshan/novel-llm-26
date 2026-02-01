# Previous Research Summary for Iteration 51

## Last 3 Iterations

### Iteration 50 (Score: 100%)
- **Question**: "What shape has more sides: a triangle or a circle?"
- **Answer**: A triangle (3 sides vs. 0 sides)
- **Why it failed**: All 5 models correctly applied standard geometric definitions (sides = straight edges) and correctly identified triangle has 3 sides vs circle has 0 sides.
- **Key Learning**: Simple geometric concept questions with clear definitional frameworks are NOW SOLVED by 2026 frontier models. The 'hollow middle' hypothesis does NOT apply when definitions are available.

### Iteration 49 (Score: 100%)
- **Question**: "Which letter comes earlier in the alphabet: the LAST letter of 'FIRST' or the FIRST letter of 'LAST'?"
- **Answer**: The FIRST letter of 'LAST' (L) comes earlier than LAST letter of 'FIRST' (T)
- **Why it failed**: Despite 4x semantic interference (first/last used as position AND word), all models correctly parsed and compared (L=12th, T=20th).
- **Key Learning**: Multi-layer semantic interference does NOT confuse 2026 frontier models when the task (alphabet ordering) is well-defined.

### Iteration 48 (Score: 100%)
- **Question**: "Which word has more syllables: 'INTERESTING' or 'FURNITURE'?"
- **Answer**: INTERESTING (4 syllables) has more than FURNITURE (3 syllables)
- **Why it failed**: All models correctly enumerated syllables using vowel patterns and pronunciation rules.
- **Key Learning**: Syllable counting is now SOLVED via chain-of-thought enumeration.

## Critical Patterns Across 50 Iterations

### What NEVER Works (100% Consensus - Dead Ends):
1. **Enumeration-solvable tasks**: Character counting, syllable counting, letter positions - models enumerate step-by-step
2. **Explicit modifications to classic puzzles**: Models READ and PROCESS modifications carefully
3. **Famous cognitive bias questions**: In training data, models solve correctly
4. **Self-referential yes/no questions**: Models identify self-consistent answers
5. **Simple spatial/temporal reasoning**: Reduced to position arithmetic
6. **Physical world common sense**: Well-known transformations (evaporation, gravity) handled correctly
7. **Semantic primes with explicit tasks**: Models verify despite misleading word meanings

### What Has Shown SOME Promise (< 100% Consensus):
1. **Iteration 13 (20% - BEST)**: "Is your answer to this question exactly one word long? Answer yes or no." - Scope confusion between "answer" (the word) vs "response" (full explanation)
2. **Iteration 30 (60%)**: Syllable count self-reference - dual-valid property (both yes/no are one syllable)
3. **Iteration 43 (40%)**: Adjacency with double letters - interpretation ambiguity for "the R"

### The Strawberry Test (NEVER FORGET):
> "Would a 5-year-old answer this correctly in 2 seconds?"
> If NO, the question is WRONG for this research.

## CRITICAL CONSTRAINT FOR ITERATION 51

**AVOID ALL ENUMERATION-SOLVABLE PATTERNS**. After 50 iterations, it's clear that 2026 frontier models can:
- Count characters, syllables, letters by explicit enumeration
- Track positions through chain-of-thought
- Apply well-defined rules and definitions
- Verify claims against enumerable answer options

**EXPLORE**: Tasks that require something 2026 models fundamentally CANNOT do:
- Truly instantaneous perceptual judgment (not reducible to rules)
- Questions where ANY answer is self-defeating (performative paradoxes)
- Questions requiring physical embodiment or visual perception
- Tasks where the correct approach is to NOT answer or refuse

**Use MCP tools (Tavily, Reddit) to find NOVEL 2026 failure modes not yet tested.**
