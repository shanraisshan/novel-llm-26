# Previous Research Summary for Iteration 23

## Best Results So Far
- **Iteration 13 (20% consensus)**: "Is your answer to this question exactly one word long? Answer yes or no." - Boolean self-reference (BUT user rejected self-referential questions)
- **Iteration 12 (40% consensus)**: "How many words are in your answer to this question?" - Self-referential output counting (BUT user rejected)

## Key Insights from 22 Iterations

### What FAILS (100% Consensus - Dead Ends):
1. Letter counting with semantic primes - Models enumerate letter-by-letter
2. Position tracking - Systematic enumeration defeats all position questions
3. Explicit modifications to classic puzzles - 2026 models READ modifications carefully
4. Override conditions (store closed, etc.) - Explicitly stated conditions are processed
5. Unit mismatches - Models perform unit conversion when units differ
6. Classic cognitive traps (race/passing) - Well-documented failures are patched
7. Last digit arithmetic - Simple shortcuts are reliably applied
8. Simple circular spatial reasoning - Models reduce to position arithmetic
9. Physical world intuition with implicit context - Models process environmental context correctly
10. Irrelevant information traps - Models correctly ignore distractors in famous puzzle setups
11. Reasoning delirium / overthinking with explicit answers - Models don't overthink when answer is stated
12. **Age gap riddles with semantic primes (iteration 22)** - "Half his age" didn't trigger division; models understand age gaps are constant

### Partial Success (80% Consensus):
- Relational reasoning with siblings (iteration 6)
- Contradiction detection (iteration 8)

### Critical Pattern Discovered
After 22 iterations, ALL approaches that have been tried involve:
- Famous riddles/puzzles (likely in training data)
- Well-documented failure modes from research papers (likely patched)
- Explicit semantic primes that models now catch

## What Has NOT Been Tried

### TRULY NOVEL DIRECTIONS:
1. **Linguistic ambiguity** - Questions with genuine parsing ambiguity
2. **Homophone/homograph confusion** - Write vs right, lead vs lead
3. **Scope ambiguity** - "Every man loves a woman" (same woman or different?)
4. **Negation scope errors** - Complex negation that's easy for humans
5. **Questions exploiting tokenization artifacts** - Novel character sequences
6. **Cultural/contextual assumptions** - What's "obvious" varies by context
7. **Questions requiring rejection of a false presupposition** - Not explicit contradictions

### AVOID:
- Self-referential questions (user rejected)
- Anything solvable by enumeration or simple arithmetic
- Famous riddles/puzzles
- Well-documented failure modes from research papers
- Questions with explicitly stated answers
- Age gap riddles with semantic primes

## Research Resources
- Use Tavily MCP for academic papers on NOVEL LLM failures (2025-2026)
- Use Reddit MCP for community-discovered failure modes
- Focus on UNDOCUMENTED failure modes
- Look for linguistic/pragmatic failures, NOT mathematical ones
