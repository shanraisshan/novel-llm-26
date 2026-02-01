# Previous Research Summary for Iteration 78

## Last Completed Research: Iteration 77

**Question**: "In the list 'first, second, third', what word is in the second position?"
**Answer**: "second"
**Score**: 100% (all 5 models agreed)
**Status**: need_more_research

### Why It Failed
The semantic-positional alignment trap did not work. Despite creating a situation where ordinal words were used as list items (where "second" is both at position 2 AND means position 2), all models correctly identified "second" as the answer. The tautological structure ("second is at second position") did not cause overthinking or confusion.

## Key Insights from Recent Iterations (70-77)

### Questions That Achieved 100% Consensus (FAILED to break LLMs):

| ID | Question | Why It Failed |
|----|----------|---------------|
| 70 | "Does your answer to this question contain exactly one vowel?" | Self-referential scope correctly handled; "Yes" has 1 vowel (e) |
| 71 | "Is your answer to this question a complete sentence?" | 80% - slight disagreement but still high consensus |
| 72 | "Does your answer to this question have fewer than ten letters?" | "Yes" has 3 letters, straightforward |
| 73 | "Is your answer to this question exactly two syllables long?" | "No" is one syllable, correctly identified |
| 74 | "If I say 'one', 'won', and 'sun' out loud, how many different sounds?" | Phonetic enumeration correctly done (2 sounds) |
| 75 | "Water surface tilted glass parallel to ground or bottom?" | Physics intuition correctly applied |
| 76 | "Nine dollars ninety cents minus nine dollars eleven cents" | Decimal arithmetic correctly computed (79 cents) |
| 77 | "In list 'first, second, third', word in second position?" | Positional enumeration defeated semantic interference |

### Questions That Achieved < 100% Consensus (PARTIAL SUCCESS):

| ID | Score | Question | Why It Worked |
|----|-------|----------|---------------|
| 55 | 40% | "Answer with just ONE word: What is the fifth word of your response?" | Constraint impossibility paradox |
| 57 | 80% | "Answer with exactly ONE letter: What is the second letter of your response?" | Similar paradox |
| 58 | 80% | "Answer with exactly THREE words: What is the fourth word of your response?" | Marked as WRONG_DIRECTION - not strawberry-type |
| 71 | 80% | "Is your answer a complete sentence? Answer yes or no" | Meta-referential structure caused some disagreement |

## Critical Lesson

The "constraint impossibility" questions (55-58) achieved lower scores but were marked as **WRONG_DIRECTION** because:
- They are NOT "strawberry-type" questions
- Not easy for humans to answer correctly
- Rely on paradoxes rather than exploiting LLM architectural limitations
- Don't meet criteria: "Any 5-year-old can answer, but LLMs fail"

## What Works (Based on 77 Iterations)

### Effective Patterns (Caused Some Disagreement):
1. **Semantic-positional conflation** (partially effective)
2. **Self-referential output properties** (achieved 40-80% but wrong direction)
3. **Family relationship reasoning** (iteration 6 got 80%)

### Ineffective Patterns (LLMs Always Solve):
1. Simple character counting (enumeration solves it)
2. Semantic priming alone (CoT bypasses it)
3. Modified classic puzzles (models read carefully)
4. Physical intuition questions (physics knowledge applied)
5. Decimal arithmetic (explicit conversion works)
6. Alphabetical ordering (systematic comparison succeeds)

## Strategies for Iteration 78

Must find questions that:
1. **Cannot be solved by step-by-step enumeration**
2. **Exploit tokenization blindness in a NEW way**
3. **Create genuine architectural confusion, not just tricky wording**
4. **Are trivially easy for humans but genuinely hard for LLMs**

### Unexplored Areas:
- **Multi-step relational reasoning** with counter-intuitive semantics
- **Visual/spatial properties** that require "seeing" text
- **Phonetic processing** edge cases
- **Cultural/linguistic conventions** that contradict semantic meaning
- **Temporal/causal reasoning** with misdirection
- **Counting with overlapping categories**
