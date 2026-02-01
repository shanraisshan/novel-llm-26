# Previous Research Summary for Iteration 27

## Best Results So Far
- **Iteration 13**: 20% consensus - "Is your answer to this question exactly one word long? Answer yes or no." (Boolean self-reference)
- **Iteration 12**: 40% consensus - "How many words are in your answer to this question? Answer with just a number." (Self-referential output counting)
- **Iteration 6 & 8**: 80% consensus - Relational reasoning / contradiction detection questions

## Key Insights from 26 Iterations

### What WORKS (Partial Success)
1. **Self-referential OUTPUT questions** - Models cannot count/predict their own output during generation
2. **Boolean self-reference** - Asking yes/no about output properties causes scope confusion
3. **Relational reasoning** - Complex family relationships can induce errors
4. **Contradiction detection** - Some models try to "solve" contradictions rather than reject them

### What FAILS (All 100% Consensus - DEAD ENDS)
1. Letter counting with semantic primes (iterations 1-5)
2. Position tracking / occurrence questions (iteration 4)
3. Explicit modification traps to classic puzzles (iterations 7, 9, 10, 20)
4. Unit mismatch in classic puzzles (iteration 10)
5. Classic cognitive trap questions (iteration 11)
6. Self-referential CLAIMS with enumerable options (iterations 14, 15)
7. Last digit arithmetic (iteration 17)
8. Simple circular spatial reasoning (iteration 18)
9. Physical world intuition with implicit context (iteration 19)
10. Irrelevant information traps (iteration 20)
11. Reasoning delirium / overthinking with explicit answers (iteration 21)
12. Age gap riddles with semantic primes (iteration 22)
13. False presupposition rejection for basic math (iteration 23)
14. Physical state transformation with presupposition (iteration 24)
15. Nested container tracking (iteration 25)
16. Multi-step temporal reasoning (iteration 26)

## Critical Lessons

### Self-Referential Questions Work When:
- The answer CANNOT be enumerated beforehand
- Direct property assertions ("IS your answer...") not abstract ("CAN BE summarized...")
- Boolean format (yes/no) creates scope confusion
- Models must introspect on their OWN output, not external text

### Self-Referential Questions Fail When:
- Answer options are finite and enumerable (True/False both = 1 word)
- CLAIM format allows verification against known options
- Abstraction layers ("can be summarized as") make it easier

## Last 5 Questions (Iterations 22-26) - All 100% Consensus

| Iteration | Question | Why It Failed |
|-----------|----------|---------------|
| 22 | Age gap riddle (half his age, now 100) | Constant age gap correctly recognized |
| 23 | Whole number between 3 and 4 | Simple false presupposition rejected |
| 24 | Water evaporation (collect puddle) | Evaporation physics applied correctly |
| 25 | Nested boxes (ball in first box) | Container tracking works correctly |
| 26 | Day after tomorrow is Thursday | Multi-step temporal reasoning solved |

## Promising Unexplored Directions

### HIGH PRIORITY
1. **Questions where CoT leads to WRONG answer** - Not explored enough
2. **Implicit modifications** (not explicitly stated) - Different from explicit mods
3. **Questions about the question itself** - Meta-linguistic puzzles
4. **Genuine ambiguity** - Where reasonable people disagree

### MEDIUM PRIORITY
5. **Unicode/emoji traps** - Homoglyphs, invisible characters
6. **Questions requiring external knowledge** - Obscure facts
7. **Garden path sentences** - First parse is wrong

### AVOID
- Anything that can be solved by enumeration
- Anything with explicit conditions that can be read and processed
- Well-known cognitive traps (likely in training data)
- SimpleBench-style questions about common physics (evaporation, containers, etc.)

## Focus for Iteration 27

Since iterations 12-13 achieved best results with self-referential OUTPUT questions, and iterations 22-26 have been 100% consensus on non-self-referential approaches, consider:

1. **NEW variant of self-referential output** - Different formulation that exploits scope confusion
2. **Questions where careful reasoning leads astray** - CoT makes it worse
3. **Implicit constraint questions** - Where the "obvious" answer is wrong
4. **Novel failure mode from external research** - Search for latest 2026 findings
