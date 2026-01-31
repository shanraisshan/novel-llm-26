# Previous Research Summary for Iteration 8

## Iterations 1-7 Summary

### Iteration 1: Python Math Expression
- **Question**: Complex Python math.ceil expression
- **Score**: 100% (all correct)
- **Lesson**: Technical/Python questions are too easy for modern LLMs

### Iteration 2: Semantic Contradiction
- **Question**: "What is the last letter of the word 'FIRST'?"
- **Score**: 100% (all correct)
- **Lesson**: Simple semantic traps are caught by chain-of-thought

### Iteration 3: Forced Choice with Priming
- **Question**: "Which word has more letters: 'FOUR' or 'FIVE'?"
- **Score**: 100% (all correct)
- **Lesson**: Letter-by-letter verification defeats semantic priming

### Iteration 4: Position + Occurrence
- **Question**: "In the word 'ELEVEN', at what position is the third letter 'E'?"
- **Score**: 100% (all correct)
- **Lesson**: Enumeration defeats even complex position questions

### Iteration 5: Self-Referential Trap
- **Question**: "How many letters are in 'FIVE LETTERS'?"
- **Score**: 100% (all correct)
- **Lesson**: LLMs don't trust semantic self-descriptions, they enumerate

### Iteration 6: Relational Reasoning (PARTIAL SUCCESS)
- **Question**: "A girl has 3 brothers. Each brother has 2 sisters. How many children are in the family?"
- **Score**: 80% (4/5 correct, one arithmetic error)
- **Lesson**: Relational puzzles can cause disagreement but most still solve correctly

### Iteration 7: Modification Trap - Explicit
- **Question**: River crossing where wolf swims, goat swims, cabbage floats
- **Score**: 100% (all correct - said 1 trip)
- **Lesson**: **CRITICAL** - Explicit modifications are NOW caught by 2026 frontier models. The modification trap from 2024 research may be outdated.

## Key Insights for Iteration 8

### What Doesn't Work (Dead Ends):
1. Letter counting with semantic primes - enumeration defeats it
2. Position/occurrence questions - enumeration defeats it
3. Self-referential false claims - LLMs don't trust them
4. Explicit modification traps - 2026 models READ the modifications
5. Simple relational puzzles - 80% still get them right

### What Might Work (Unexplored):
1. **IMPLICIT modifications** - where the change isn't explicitly stated
2. **Questions where CoT leads to wrong answer** - careful reasoning produces wrong result
3. **Genuine ambiguity** - where reasonable people disagree
4. **Spatial/circular reasoning** - 5 people in a circle type problems
5. **Questions requiring external knowledge** - facts not in training

### Critical Realization from Iteration 7:
The academic research (arXiv:2405.19616) showing 0% accuracy on modification traps may be **OUTDATED** for 2026 frontier models. Claude Opus 4.5 correctly identified all the modifications and gave the simple answer.

### Strategy for Iteration 8:
Focus on one of these approaches:
1. **Implicit modification traps** - modifications that must be INFERRED, not read
2. **Counter-intuitive problems** - where thinking harder makes you wrong
3. **Classic traps that CoT makes WORSE** - more reasoning = more wrong
4. **Circular/spatial reasoning** - inherently hard for sequential token processing
5. **Questions about questions** - meta-linguistic puzzles
