# Previous Research Summary for Iteration 81

## Last Iteration (80)
**Question**: "I have $9.9 in my left pocket and $9.11 in my right pocket. Which pocket has more money?"
**Answer**: Left pocket (because $9.90 > $9.11)
**Score**: 100% consensus - FAILED (models correctly identified $9.90 > $9.11)
**Insight**: The decimal/version number confusion trap did NOT work - models correctly converted and compared money values

## Key Patterns from Recent Iterations (76-80)

All achieving 100% consensus (i.e., LLMs solving correctly):
- **Iteration 76**: Money arithmetic ($9.90 - $9.11 = $0.79) - SOLVED
- **Iteration 77**: Positional word questions ("second" in "first, second, third") - SOLVED
- **Iteration 78**: Mirror/perspective questions (facing someone, which side is their hand) - SOLVED
- **Iteration 79**: Overlapping pattern counting ("11" in "11111" = 4) - SOLVED
- **Iteration 80**: Decimal money comparison ($9.9 vs $9.11) - SOLVED

## What Has Been Tried and Failed (80 iterations)

### Completely Solved by Modern LLMs:
1. **Character counting** - CoT enumeration solves all variants
2. **Semantic priming** (number words like ELEVEN) - Explicit counting defeats
3. **Self-referential output questions** - Best result was 20% (iteration 13)
4. **Position/sequence questions** - Systematic enumeration solves
5. **Classic cognitive traps** (race position, age gaps) - In training data
6. **Physical reasoning** (ball vs feather) - Context parsing works
7. **Puzzle modifications** (river crossing variants) - Read carefully now
8. **Decimal/money comparisons** - Explicit conversion works
9. **Spatial reasoning** (circular, perspective) - Reduced to arithmetic
10. **Overlapping pattern counting** - Position-by-position analysis works

### Best Results (Non-100%):
- **Iteration 13**: 20% - "Is your answer to this question exactly one word long? Answer yes or no."
- **Iteration 12**: 40% - "How many words are in your answer to this question?"
- **Iterations 6, 8, 55, 57, 58, 71**: 80% - Various family puzzles and constraint paradoxes

## Remaining Attack Vectors

1. **Self-referential output constraints** (best performing category)
2. **Questions where CoT reasoning REINFORCES wrong answer**
3. **Extremely subtle contradictions that seem solvable**
4. **Novel combinations not in training data**
5. **Visual/typographical questions requiring "seeing" text**

## Critical Constraint

The question MUST:
- Be trivially easy for a 5-year-old human
- Have ONE unambiguous correct answer
- NOT be technical or domain-specific
- NOT be a well-known puzzle/riddle
- Result in < 10% consensus among 5 AI answerers

## Research Direction Suggestion

Given 80 iterations of failures, consider:
1. **Completely novel question structures** never seen before
2. **Simple visual/counting tasks** with unusual framing
3. **Self-referential constraints** that create logical traps
4. **Questions where "thinking more" makes it worse**
