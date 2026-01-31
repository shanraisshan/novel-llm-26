# Previous Research Summary for Iteration 18

## Best Results So Far
- **Iteration 13 (20% consensus)**: "Is your answer to this question exactly one word long? Answer yes or no." - Boolean self-reference exploited scope confusion where models redefine "your answer" to mean entire response.
- **Iteration 12 (40% consensus)**: "How many words are in your answer to this question?" - Self-referential output counting exploited autoregressive blindness.

## Key Insights from 17 Iterations

### What WORKS (Partial Success):
1. **Self-referential OUTPUT questions** - Models cannot introspect on their own output during generation
2. **Scope confusion** - "Your answer" gets reinterpreted as "entire response"
3. **Boolean format with yes/no constraints** - Direct property assertions trigger confusion
4. **Relational reasoning** (80%) - Some models make arithmetic errors under complexity

### What FAILS (100% Consensus - Dead Ends):
1. Letter counting with semantic primes - Models enumerate letter-by-letter
2. Position tracking - Systematic enumeration defeats all position questions
3. Explicit modifications to classic puzzles - 2026 models READ modifications carefully
4. Override conditions (store closed, etc.) - Explicitly stated conditions are processed
5. Unit mismatches - Models perform unit conversion when units differ
6. Classic cognitive traps (race/passing) - Well-documented failures are patched
7. Last digit arithmetic - Simple shortcuts are reliably applied
8. Self-referential CLAIMS with enumerable options - "True/False" options can be verified
9. Abstraction layers ("can be summarized as") - Makes questions EASIER not harder

### Critical Strategic Lessons:
- Questions solvable by enumeration WILL BE SOLVED
- Explicit modifications are ALWAYS caught by 2026 models
- Well-known cognitive traps are in training data
- Self-reference only works when answer cannot be predicted beforehand
- DIRECT property assertions beat abstract formulations

## Next Directions to Explore (Iteration 18)

### HIGHEST PRIORITY:
1. **Spatial/circular reasoning** - "5 people in circle, who is to X's right?" (35% LLM accuracy in research)
2. **Questions where CoT leads to WRONG answer** - Counter-intuitive solutions
3. **Implicit modifications** - Not stated but implied
4. **Non-enumerable self-reference** - Where the answer genuinely can't be predicted

### Avoid:
- Anything solvable by writing out letters/words and counting
- Explicit modifications ("the wolf can swim")
- Famous cognitive traps
- Simple arithmetic shortcuts
- Enumerable answer options (True/False, Yes/No with clear logic)

## Research Resources
- Use Tavily MCP for academic papers on LLM failures
- Use Reddit MCP for community-discovered failure modes
- Focus on 2025-2026 findings (older research may be outdated)
