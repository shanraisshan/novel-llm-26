# Previous Research Summary for Iteration 20

## Best Results So Far
- **Iteration 13 (20% consensus)**: "Is your answer to this question exactly one word long? Answer yes or no." - Boolean self-reference (BUT user rejected self-referential questions)
- **Iteration 12 (40% consensus)**: "How many words are in your answer to this question?" - Self-referential output counting (BUT user rejected)

## Key Insights from 19 Iterations

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
10. **Simple circular spatial reasoning (iteration 18)** - Models reduce to position arithmetic
11. **Physical world intuition with implicit context (iteration 19)** - "Ball vs feather in living room" - models correctly processed "living room" = air resistance

### Partial Success (80% Consensus):
- Relational reasoning with siblings (iteration 6)
- Contradiction detection (iteration 8)

### Critical Strategic Lessons:
- Questions solvable by enumeration WILL BE SOLVED
- Questions reducible to simple arithmetic WILL BE SOLVED
- Explicit modifications are ALWAYS caught by 2026 models
- Well-known cognitive traps are in training data
- Self-reference works but user rejected this category
- Simple spatial arrangements reducible to position math
- Physical world intuition questions with implicit context are now solved
- Pattern-matching traps to famous physics demos don't trigger

## Next Directions to Explore (Iteration 20)

### HIGHEST PRIORITY - Must exploit novel failure modes:
1. **Ambiguous parsing/word boundaries** - Where models disagree on interpretation
2. **Questions where CoT actively hurts** - Counter-intuitive solutions
3. **Questions requiring unstated real-world knowledge** - Not just "implicit" but truly unstated
4. **Novel linguistic traps** - Not documented in research

### AVOID:
- Self-referential questions (user rejected)
- Anything solvable by enumeration or simple arithmetic
- Explicit modifications
- Famous cognitive traps
- Simple spatial arrangements
- Physical world questions with implicit context (now solved)

## Research Resources
- Use Tavily MCP for academic papers on LLM failures
- Use Reddit MCP for community-discovered failure modes
- Focus on 2025-2026 findings (older research may be outdated)
- Look for NOVEL, UNDOCUMENTED failure modes
