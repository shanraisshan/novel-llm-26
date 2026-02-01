# Previous Research Summary for Iteration 86

## Last Iteration (85)
- **Question**: "How many times does the letter 'b' appear in the word 'blueberry'?"
- **Answer**: 2
- **Score**: 100% (all 5 models answered correctly)
- **Lesson**: The 'blueberry has 3 b's' bug has been patched in 2026 frontier models. Like strawberry before it, viral failure modes become training signal. ALL simple character counting tasks are now solved via chain-of-thought enumeration.

## Key Findings from 85 Iterations

### What ALWAYS Gets 100% (Models Solve These)
1. **Character counting** - Any word, models enumerate letter-by-letter
2. **Letter position questions** - Models spell out and count
3. **Syllable counting** - Models break down systematically
4. **Alphabetical comparisons** - Character-by-character comparison
5. **Simple arithmetic** - Including decimal comparisons with money framing
6. **Self-referential output questions** - Models now disambiguate scope correctly
7. **Classic riddles** - "All but 9" type questions are recognized
8. **Physical intuition** - Gravity, evaporation, etc. are well-encoded
9. **Spatial reasoning** - Clock hands, perspective shifts, etc.
10. **Pattern counting** - LL pairs, consecutive letters, overlapping patterns

### What Achieved Lower Scores (Promising Directions)
- **Iteration 13**: 20% - "Is your answer to this question exactly one word long? Answer yes or no."
  - Scope confusion between "answer word" vs "full response"
- **Iteration 30**: 60% - Syllable count self-reference (dual-valid)
- **Iteration 33**: 60% - "What is the third word of your response?"
- **Iteration 43**: 40% - Ambiguity in "the R" in CHERRY (which R?)
- **Iteration 55**: 40% - Constraint conflict paradox (ONE word, fifth word position)

### Critical Insight
After 85 iterations, virtually ALL tasks reducible to:
- Sequential character enumeration
- Step-by-step reasoning
- Rule-based logic

...are now SOLVED by 2026 frontier models via chain-of-thought.

## What We Need for Iteration 86

### THE STRAWBERRY PARADIGM
Questions must be:
1. **Child-simple**: A 5-year-old can answer immediately
2. **LLM-breaking**: Due to tokenization, not philosophy
3. **Unambiguous**: ONE clear correct answer
4. **Novel**: Not a famous failure mode (strawberry, blueberry are now patched)

### Potential Directions
1. **Truly obscure words** not in training data heavily
2. **Visual/spatial properties** that can't be enumerated
3. **Questions where enumeration itself leads to wrong answer**
4. **Novel character patterns** not yet tested

### What NOT to Try
- Self-referential output questions (trained away)
- Classic riddles (in training data)
- Character counting in common words (solved via enumeration)
- Philosophical paradoxes (confuse humans too)
- Constraint impossibility paradoxes (not strawberry-type)
