# Previous Research Summary for Iteration 19

## Best Results So Far
- **Iteration 13 (20% consensus)**: "Is your answer to this question exactly one word long? Answer yes or no." - Boolean self-reference exploited scope confusion.
- **Iteration 12 (40% consensus)**: "How many words are in your answer to this question?" - Self-referential output counting.

## Key Insights from 18 Iterations

### What WORKS (Partial Success):
1. **Self-referential OUTPUT questions** - Models cannot introspect on their own output during generation (BUT user rejected this category in iteration 16)
2. **Scope confusion** - "Your answer" gets reinterpreted as "entire response"
3. **Relational reasoning** (80%) - Some models make arithmetic errors under complexity

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
10. **SIMPLE CIRCULAR SPATIAL REASONING (iteration 18)** - "Who is across from Bob in a 6-person circle?" was solved by ALL 5 models. They reduced it to position arithmetic (pos 2 + 3 = pos 5). The 35% LLM accuracy cited in research may only apply to MORE COMPLEX spatial tasks.

### Critical Strategic Lessons:
- Questions solvable by enumeration WILL BE SOLVED
- Questions reducible to simple arithmetic WILL BE SOLVED
- Explicit modifications are ALWAYS caught by 2026 models
- Well-known cognitive traps are in training data
- Self-reference only works when answer cannot be predicted beforehand (but user rejected this)
- Simple circular arrangements are reducible to position math

## Next Directions to Explore (Iteration 19)

### HIGHEST PRIORITY - Must NOT be reducible to simple math:
1. **Complex multi-step spatial reasoning** - Where position arithmetic doesn't work
2. **Implicit information questions** - Where the "obvious" reading misses something
3. **Questions where CoT leads to WRONG answer** - Counter-intuitive solutions
4. **Ambiguous word boundaries or parsing** - Where models disagree on interpretation

### AVOID:
- Self-referential questions (user rejected)
- Anything solvable by writing out letters/words and counting
- Explicit modifications ("the wolf can swim")
- Famous cognitive traps
- Simple arithmetic shortcuts
- Simple circular arrangements (now proven solved)
- Enumerable answer options

## Research Resources
- Use Tavily MCP for academic papers on LLM failures
- Use Reddit MCP for community-discovered failure modes
- Focus on 2025-2026 findings (older research may be outdated)
