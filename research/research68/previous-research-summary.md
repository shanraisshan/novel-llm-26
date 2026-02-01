# Previous Research Summary for Iteration 68

## Key Findings from Recent Iterations

### Iteration 67: Word Position with Number Words
- **Question**: "In the sentence 'Two three four five', what position is the word 'four' at? Count from 1."
- **Score**: 100% (FAILED)
- **Insight**: Semantic priming from number words (word 'four' → number 4) did NOT override simple word position counting. Chain-of-thought enumeration correctly identified position 3.

### What's Been Tried and FAILED (100% consensus = LLMs solve it):
1. Character counting in common words (solved by enumeration)
2. Letter position questions (solved by enumeration)
3. Backward spelling (solved by letter-by-letter reversal)
4. Numeric comparisons like 3.11 vs 3.7 (solved by decimal alignment)
5. Classic riddles (in training data)
6. Semantic interference with number words (solved by explicit counting)
7. Syllable counting (solved by enumeration)
8. Self-referential questions about output properties (now solved)
9. Visual transformation questions (mostly solved)
10. Alphabetical ordering with modified criteria (solved)
11. Simple spatial/temporal reasoning (solved)
12. Analog clock reasoning (converted to arithmetic)

### What's PARTIALLY Worked (Low Consensus):
1. **Iteration 13 (20%)**: "Is your answer to this question exactly one word long? Answer yes or no." - Scope confusion between "your answer" and full response
2. **Iteration 12 (40%)**: Self-referential word counting in output
3. **Iteration 43 (40%)**: Ambiguous reference with double letters ("the R" in CHERRY)
4. **Iteration 55 (40%)**: Conflicting constraints ("ONE word" + "fifth word" = impossible)
5. **Iteration 30 (60%)**: Syllable-based self-reference with dual-valid structure

### Critical Lessons Learned:
1. **Chain-of-thought enumeration defeats counting tasks** - Models spell out letters/words and count
2. **Explicit instructions are followed carefully** - Models read modifications and constraints
3. **Semantic priming alone is insufficient** - Models overcome word meanings through explicit reasoning
4. **Self-referential output questions were promising but may be learned away**
5. **Dual-valid constraints create ambiguity** - When BOTH yes/no satisfy the property, confusion occurs

## CURRENT STATUS: Need Novel Approach

After 67 iterations, almost all "strawberry-type" questions are now solved by 2026 frontier models:
- Character counting
- Letter positions
- Numeric comparisons
- Classic riddles
- Spatial/temporal reasoning
- Word position counting

### What MIGHT Still Work:
1. **Questions with genuine ambiguity** (like iteration 43's "the R" in CHERRY)
2. **Extremely long strings** where enumeration is tedious/error-prone
3. **Novel patterns** not in training data
4. **Tasks where enumeration ITSELF leads to wrong answer**
5. **Visual/perceptual tasks** that cannot be converted to arithmetic

### Constraints for New Question:
- MUST pass the "5-year-old test" (child can answer immediately)
- MUST have ONE objectively correct answer
- MUST NOT be a philosophical paradox or meta-cognitive puzzle
- Should exploit architectural limitations (tokenization, representation), not semantic confusion
