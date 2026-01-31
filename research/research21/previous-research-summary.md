# Previous Research Summary for Iteration 21

## Best Results So Far
- **Iteration 13 (20% consensus)**: "Is your answer to this question exactly one word long? Answer yes or no." - Boolean self-reference (BUT user rejected self-referential questions)
- **Iteration 12 (40% consensus)**: "How many words are in your answer to this question?" - Self-referential output counting (BUT user rejected)

## Key Insights from 20 Iterations

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
10. **Irrelevant information traps (iteration 20)** - River crossing + "how many legs does wolf have" = 100% consensus on "4"

### Partial Success (80% Consensus):
- Relational reasoning with siblings (iteration 6)
- Contradiction detection (iteration 8)

### Critical Strategic Lessons:
- Questions solvable by enumeration WILL BE SOLVED
- Questions reducible to simple arithmetic WILL BE SOLVED
- Explicit modifications are ALWAYS caught by 2026 models
- Well-known cognitive traps are in training data
- Self-reference works but user rejected this category
- Irrelevant information traps don't work - models correctly ignore distractors
- Pattern-matching to famous puzzles doesn't cause errors anymore
- Physical world questions with any implicit/explicit context are solved

## CRITICAL INSIGHT FROM ITERATION 20
The "irrelevant information trap" strategy FAILED completely. When presented with:
- "A farmer needs to cross a river with a wolf, a goat, and a cabbage. How many legs does the wolf have?"
- ALL 5 models correctly answered "4" with 100% consensus

This means frontier models in 2026 can:
1. Recognize when a question is unrelated to a famous puzzle setup
2. Answer simple factual questions regardless of surrounding context
3. NOT get distracted by famous problem templates

## What Remains Unexplored

### MUST TRY NEXT:
1. **Temporal/sequential reasoning errors** - Questions where the order of events matters in non-obvious ways
2. **Implicit negation or exception handling** - Where something is excluded but not stated directly
3. **Pragmatic vs literal interpretation** - Questions where common usage differs from literal meaning
4. **Questions with genuine ambiguity** - Where two valid interpretations lead to different answers
5. **Questions exploiting tokenization artifacts** - Novel strings that might tokenize unexpectedly

### AVOID:
- Self-referential questions (user rejected)
- Anything solvable by enumeration or simple arithmetic
- Explicit modifications to classic puzzles
- Famous cognitive traps
- Simple spatial arrangements
- Physical world questions
- Irrelevant information traps (just failed in iteration 20)

## Research Resources
- Use Tavily MCP for academic papers on LLM failures
- Use Reddit MCP for community-discovered failure modes
- Focus on 2025-2026 findings (older research is outdated for current models)
- Look for NOVEL, UNDOCUMENTED failure modes
