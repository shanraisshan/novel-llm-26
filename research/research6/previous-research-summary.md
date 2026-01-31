# Previous Research Summary (Research 5)

## Question Attempted
"How many letters are in 'FIVE LETTERS'?"

## Score Achieved
100% consensus (all 5 researchers agreed on correct answer: 11)

## Key Insights
- Self-referential semantic claims are completely ineffective against modern LLMs
- Despite "FIVE LETTERS" appearing to describe itself as having 5 letters, all models correctly counted to 11
- Multiple models explicitly noted the ironic self-reference while still giving the correct answer
- The phrase being "self-describing" provides zero interference

## What Worked
- Nothing in the self-referential approach worked
- Models don't "trust" semantic content - they enumerate
- FIVE(4) + LETTERS(7) = 11 was trivially computed

## What Failed
- Self-referential phrases that make false claims about themselves
- The assumption that models would be confused by a phrase's self-description
- Semantic priming from number words (FIVE) did not override counting

## Lessons for Next Iteration
1. **CRITICAL**: Any question solvable by "write out letters, count systematically" WILL BE SOLVED
2. Must find questions where systematic enumeration itself produces wrong answer
3. Or questions that cannot be reduced to enumeration
4. Or questions where the correct answer requires relational reasoning that enumeration can't help with

## Pattern Across All 5 Iterations (All 100% Consensus)
| Iteration | Question Type | Why 100% |
|-----------|---------------|----------|
| 1 | Python technical | Well-trained on code |
| 2 | FIRST/last semantic | Simple contradiction, easy to verify |
| 3 | FOUR vs FIVE comparison | Explicit enumeration works |
| 4 | ELEVEN position + occurrence | Systematic tracking works |
| 5 | Self-referential claim | Models enumerate anyway |

## Strategic Pivot Required
The opus-researcher agent notes that enumeration-based questions are DEAD ENDS. Research shows we need to explore:
1. **Relational reasoning puzzles** - where the answer requires understanding relationships, not counting
2. **Modified famous puzzles** - where pattern-matching to the original gives the wrong answer
3. **Spatial/circular arrangements** - which LLMs struggle to mentally construct
4. **Questions with implicit context** - where the "obvious" reading is wrong
