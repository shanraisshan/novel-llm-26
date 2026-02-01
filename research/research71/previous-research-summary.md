# Previous Research Summary for Iteration 71

## Last 5 Iterations Summary

### Iteration 70 (Score: 100%)
- **Question**: "Does your answer to this question contain exactly one vowel? Answer yes or no."
- **Answer**: Yes
- **Result**: FAILED - All 5 models correctly answered 'Yes' recognizing dual-valid constraint
- **Lesson**: Vowel count dual-valid constraints do not cause disagreement. Character-level properties are too enumerable.

### Iteration 69 (Score: 100%)
- **Question**: "How many capital letters in the English alphabet have exactly one enclosed space (hole)?"
- **Answer**: 6 (A, D, O, P, Q, R)
- **Result**: FAILED - All models have robust factual knowledge about letter topology
- **Lesson**: Letter visual property questions are solved via factual knowledge, not visual reasoning

### Iteration 68 (Score: 100%)
- **Question**: "You are standing in line with 3 people in front of you and 2 people behind you. How many people are in the line?"
- **Answer**: 6
- **Result**: FAILED - All models correctly included themselves
- **Lesson**: Self-inclusion counting with explicit "you" framing is solved

### Iteration 67 (Score: 100%)
- **Question**: "In the sentence 'Two three four five', what position is the word 'four' at? Count from 1."
- **Answer**: 3
- **Result**: FAILED - Semantic interference from number words did not override counting
- **Lesson**: Word position counting with number word interference is solved

### Iteration 66 (Score: 100%)
- **Question**: "Is your answer to this question shorter than five letters? Answer yes or no."
- **Answer**: Yes
- **Result**: FAILED - Self-referential output property questions are solved
- **Lesson**: Scope ambiguity no longer reliably triggers

## Critical Pattern Analysis

### What Works (Low Consensus - 20-60%):
| Iteration | Question Type | Score | Key Mechanism |
|-----------|--------------|-------|---------------|
| 13 | "Is your answer exactly one word long?" | 20% | Scope confusion + dual-valid |
| 30 | "Is your answer exactly one syllable long?" | 60% | Scope confusion + dual-valid |
| 43 | "Letter before R in CHERRY" | 40% | Double letter ambiguity |
| 55 | "ONE word - fifth word of response" | 40% | Conflicting constraints |

### Critical Success Factors from Best Results:
1. **DUAL-VALID constraints** where BOTH yes and no satisfy the property
2. **HOLISTIC properties** (word count, syllable count) vs CHARACTER properties (vowels, letters)
3. **SCOPE AMBIGUITY** where "your answer" can mean word OR full response
4. **CONFLICTING CONSTRAINTS** that are impossible but models try to solve anyway

### What NEVER Works (100% Consensus):
- Character counting in words (solved by enumeration)
- Alphabet comparisons (solved by position lookup)
- Physical/spatial questions (solved by factual knowledge)
- Numeric comparisons (solved by decimal alignment)
- Self-referential questions with explicit character properties

## Current Strategic Direction

### The Remaining Viable Approaches:
1. **Scope ambiguity with holistic properties** - word/syllable count, NOT letter count
2. **Conflicting constraints** - where impossibility is obvious to humans but models try to comply
3. **Questions requiring TRULY novel patterns** not in training data

### Research Focus for Iteration 71:
Given that iterations 66-70 all achieved 100% (failures), we need to:
1. Return to the HOLISTIC property approach that worked in iteration 13 (20%)
2. Explore NEW dual-valid constraints not yet tested
3. Consider completely different paradigms (maybe non-self-referential)

### Untested Dual-Valid Properties:
- "Does your answer have fewer than two sentences?" (both yes/no are one sentence)
- "Is your answer shorter than your question?" (both yes/no are shorter)
- "Does your answer end with a consonant?" (yes ends with 's', no ends with 'o')

### Key Constraint for All Questions:
**THE 5-YEAR-OLD TEST**: Would a child answer this correctly in 2 seconds?
- If NO → REJECT the question immediately
- If YES → Test for LLM failure mechanism
