# Previous Research Summary for Iteration 64

## Last Iteration (63) Results

**Question**: "Does the word 'MISSISSIPPI' have an odd or even number of the letter 'S'?"
**Answer**: Even (4 S's)
**Score**: 100% (all 5 models correct)
**Status**: need_more_research

**Lesson Learned**: The combination of letter counting + parity determination was correctly handled by all models. They enumerated M-I-S-S-I-S-S-I-P-P-I, counted 4 S's, and correctly identified 4 as even. Chain-of-thought reasoning defeats this approach even with complex words.

## Recent Pattern Analysis (Iterations 59-63)

| Iter | Question Type | Score | Outcome |
|------|--------------|-------|---------|
| 59 | Letter counting ('a' in 'abracadabra') | 100% | Solved via enumeration |
| 60 | Classic riddle (sheep "all but 9") | 100% | Famous riddle, likely in training |
| 61 | Dictionary ordering (SIX vs SEVEN) | 100% | Alphabetical comparison solved |
| 62 | Grammar (TEETH singular/plural) | 100% | Basic grammar knowledge |
| 63 | Parity of letter count | 100% | Two-stage reasoning worked |

## Critical Insight

The ZEH (Zero-Error Horizon) paper shows GPT-5.2 fails on parity of "11000" (5-bit binary), but this DOES NOT transfer to natural language parity questions. When asked about odd/even in words, models correctly:
1. Enumerate letters
2. Count the target letter
3. Determine parity of that count

## Best Results in Project History

| Iter | Question Type | Score | Why It Worked |
|------|--------------|-------|---------------|
| 13 | "Is your answer exactly one word?" | 20% | Scope confusion + dual-valid constraint |
| 30 | "Is your answer exactly one syllable?" | 60% | Same mechanism, slightly weaker |
| 33 | "What is the third word of your response?" | 60% | Output prediction during generation |
| 55 | "Fifth word of one-word response" | 40% | Self-referential impossibility |
| 57 | "Second letter of one-letter response" | 80% | Constraint impossibility (weaker) |

## What HAS NOT Worked

1. **Character counting** - Chain-of-thought defeats it
2. **Semantic priming** (ELEVEN has 11 letters) - Models enumerate anyway
3. **Classic riddles** - In training data
4. **Parity of counts** - Two-stage reasoning works
5. **Physical intuition** - Common physics is encoded
6. **Spatial reasoning** - Converted to position arithmetic
7. **Constraint impossibility paradoxes** - Rejected (confuses humans too)

## Promising Directions (Not Yet Fully Explored)

1. **Self-referential output properties** - Best results (20-60%)
2. **Questions where enumeration itself causes errors**
3. **Novel words/neologisms not in training data**
4. **Questions requiring visual perception of text**
5. **Questions where the "correct" method leads to wrong answer**

## Requirements for Novel Question

MUST BE:
- Simple one-liner (5-year-old can understand)
- Generic (no technical domain knowledge)
- Easy for any human
- Exploits fundamental LLM limitation

MUST NOT BE:
- Philosophical paradox
- Technical specification
- Already famous (strawberry, etc.)
- Ambiguous (must have one clear answer)

## Target for Iteration 64

Given the pattern, I recommend exploring:
1. A NOVEL self-referential output question with different properties
2. A question where visual pattern recognition is essential
3. A question involving counting something OTHER than characters
4. A question where applying the "correct" algorithm produces wrong answer

Focus on finding something that CANNOT be solved by enumeration or chain-of-thought reasoning.
