# Previous Research Summary for Iteration 93

## Recent Results (Last 10 Iterations)

| ID | Question | Score | Status |
|----|----------|-------|--------|
| 92 | "Is the word 'monosyllabic' a monosyllabic word?" | 100% | need_more_research |
| 91 | "I have a red ball in my left hand and a blue ball in my right hand. I put the ball in my left hand into a box. What color is the ball in the box?" | 100% | need_more_research |
| 90 | "Is your answer to this question a complete word? Answer yes or no." | 100% | need_more_research |
| 89 | "Can you spell the word 'BALL' using only the letters B, A, L?" | 100% | need_more_research |
| 88 | "Does your answer to this question contain more than two words? Answer yes or no." | 100% | need_more_research |
| 87 | "Is your answer to this question shorter than this question? Answer yes or no." | 100% | need_more_research |
| 86 | "What is the middle letter of the word 'BIRD'?" | 100% | need_more_research |
| 85 | "How many times does the letter 'b' appear in the word 'blueberry'?" | 100% | need_more_research |
| 84 | "How many times does the letter pair 'LL' appear in the word 'SKILLFULLY'?" | 100% | need_more_research |
| 83 | "Which word comes LAST alphabetically: 'AND' or 'AN'?" | 100% | need_more_research |

## Key Findings from Iteration 92

**Question**: "Is the word 'monosyllabic' a monosyllabic word?"
**Answer**: No (the word has 5 syllables: mo-no-syl-lab-ic)
**Score**: 100% consensus

**Failed Hypothesis**: Semantic priming from word meaning ("monosyllabic" = one syllable) would override property verification.

**Actual Result**: All 5 models correctly answered "No" by counting syllables: mo-no-syl-lab-ic = 5 syllables, which is not monosyllabic.

**Lesson Learned**: Heterological word questions (where word meaning contradicts actual property) are still solved by explicit verification. The semantic priming from "monosyllabic = one syllable" did NOT prevent models from counting syllables.

## What Has Been Exhaustively Tested and FAILS:

1. **Character/letter counting** (all solved via enumeration): Iterations 35, 59, 63, 84-85, etc.
2. **Self-referential output questions** (dead end): Iterations 12-15, 27-32, 66-73, 87-90
3. **Syllable counting/comparison** (solved): Iterations 48, 30, 73, 92
4. **Semantic priming** (overcome by explicit verification): Iterations 2, 3, 11, 22, 92
5. **Physical world intuition** (solved): Iterations 19, 24, 25, 75
6. **Temporal/spatial reasoning** (solved): Iterations 18, 26, 53, 78-79
7. **False presupposition** (solved): Iterations 23-24, 86
8. **Classic riddles/puzzles** (too well-known): Iterations 6-11, 60
9. **Heterological words** (solved by verification): Iteration 92

## Best Historical Results (Lowest Consensus)

| Iteration | Question | Score | Why It Worked |
|-----------|----------|-------|---------------|
| 13 | "Is your answer to this question exactly one word long? Answer yes or no." | 20% | Scope confusion - models confused "answer" with "full response" |
| 12 | "How many words are in your answer to this question? Answer with just a number." | 40% | Autoregressive lookahead blindness |
| 33 | "What is the third word of your response to this question?" | 60% | Output prediction failure |
| 30 | "Is your answer to this question exactly one syllable long? Answer yes or no." | 60% | Scope confusion with dual-valid property |

## Critical Insight

The ONLY successful questions (< 100% consensus) were:
- **Self-referential OUTPUT property questions** where BOTH "yes" and "no" technically satisfy the constraint
- **Open-ended OUTPUT prediction** ("What is the third word of your response?")

BUT these have been exhausted - all recent variations achieve 80-100% consensus as models have learned to handle scope carefully.

## Directions NOT Yet Explored

1. **Questions requiring real-time information** the model cannot have
2. **Questions about the question itself** (not about the answer)
3. **Questions with ambiguous quantifier scope**
4. **Questions exploiting training data patterns vs reality**
5. **Questions about LLM behavior/limitations meta-level**
6. **Questions involving visual reasoning about text structure**
7. **Questions about word identity vs representation**

## The Strawberry Principle

> "If a 5-year-old can answer it, but GPT-5 can't, it's perfect"

The question must be:
- TRIVIALLY easy for any human (including children)
- GENERICALLY failing for frontier LLMs (not just one model)
- NOT a philosophical paradox or ambiguous
- Exploiting a FUNDAMENTAL architectural limitation

## Notes for Iteration 93

Consider exploring:
1. Questions about what the question IS vs what it ASKS
2. Meta-questions about the text itself
3. Homophones or word identity confusion
4. Questions where chain-of-thought reasoning reinforces wrong answer
5. Questions about the form of language vs its content
