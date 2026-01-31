# Previous Research Summary for Iteration 22

## Best Results So Far
- **Iteration 13 (20% consensus)**: "Is your answer to this question exactly one word long? Answer yes or no." - Boolean self-reference (BUT user rejected self-referential questions)
- **Iteration 12 (40% consensus)**: "How many words are in your answer to this question?" - Self-referential output counting (BUT user rejected)

## Key Insights from 21 Iterations

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
11. **Reasoning delirium / overthinking (iteration 21)** - "Two doors, he opens money door, what happens?" = 100% consensus on "He gets $1 million". Models don't overthink when answer is EXPLICITLY STATED.

### Partial Success (80% Consensus):
- Relational reasoning with siblings (iteration 6)
- Contradiction detection (iteration 8)

### Critical Strategic Lessons:
- Questions solvable by enumeration WILL BE SOLVED
- Questions reducible to simple arithmetic WILL BE SOLVED
- Explicit modifications are ALWAYS caught by 2026 models
- Well-known cognitive traps are in training data
- Self-reference works but user rejected this category
- Irrelevant information traps don't work
- Reasoning delirium/overthinking doesn't trigger when answer is explicitly stated
- Famous puzzle templates don't cause pattern-matching errors anymore

## CRITICAL INSIGHT FROM ITERATION 21
The "reasoning delirium" / "overthinking" hypothesis FAILED. When presented with:
- "A man stands in front of two doors. Tiger behind one, $1M behind other. He opens the money door. What happens?"
- ALL 5 models correctly answered "He gets $1 million"

This means:
1. When answers are EXPLICITLY stated, models don't overthink
2. Famous puzzle templates (two doors, Monty Hall) don't trigger pattern-matching errors
3. The "unpuzzles" research may only apply to IMPLICIT answers, not explicit ones

## What Remains Unexplored

### MUST TRY NEXT:
1. **Questions with IMPLICIT (not explicit) obvious answers** - Where the answer requires one step of inference
2. **Pragmatic vs literal interpretation** - Where common usage differs from literal meaning
3. **Questions exploiting tokenization** - Novel strings, unusual characters
4. **Temporal reasoning with implicit order** - Where sequence matters but isn't stated
5. **Questions where the "obvious" answer requires rejecting a premise** - Not explicit contradictions

### AVOID:
- Self-referential questions (user rejected)
- Anything solvable by enumeration or simple arithmetic
- Explicit modifications to classic puzzles
- Famous cognitive traps
- Spatial reasoning reducible to position math
- Physical world questions
- Irrelevant information traps
- Questions with explicitly stated answers

## Research Resources
- Use Tavily MCP for academic papers on LLM failures
- Use Reddit MCP for community-discovered failure modes
- Focus on 2025-2026 findings (older research is outdated for current models)
- Look for NOVEL, UNDOCUMENTED failure modes
- Specifically search for: implicit inference failures, pragmatic reasoning failures
