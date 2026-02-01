# Previous Research Summary (Iterations 1-86)

## Mission
Find simple, generic questions that any human child could answer correctly but modern frontier LLMs (GPT-5, Claude Opus, Gemini) consistently fail, resulting in < 10% consensus among 5 independent AI researchers.

## Best Results So Far
- **Iteration 13**: "Is your answer to this question exactly one word long? Answer yes or no." - 20% consensus (BEST)
- **Iteration 30**: "Is your answer to this question exactly one syllable long? Answer yes or no." - 60% consensus
- **Iteration 33**: "What is the third word of your response to this question?" - 60% consensus
- **Iteration 55**: "Answer with just ONE word: What is the fifth word of your response to this question?" - 40% consensus

## What Works: Self-Referential Output Questions
The key insight is that questions requiring models to predict/evaluate properties of their OWN OUTPUT create genuine failures:
1. **Autoregressive blindness**: Models can't "look ahead" to count their own response
2. **Dual-valid constraints**: When BOTH yes and no satisfy the constraint, models get confused about scope
3. **Scope confusion**: Models interpret "your answer" as "entire response including explanation" vs "just the yes/no word"

## What DOESN'T Work Anymore (2026 Frontier Models Solve These)
- Character counting in common words (enumeration solves it)
- Semantic priming traps ("half the age", "ELEVEN letters")
- Classic cognitive traps (race position, bricks vs feathers)
- Simple math with override conditions
- Modified classic puzzles (river crossing)
- Temporal reasoning (day after tomorrow)
- Nested container tracking
- False premise rejection (mathematical)
- Numeric comparisons (3.11 vs 3.9)
- Physical world intuition (evaporation, ball vs feather)

## Most Recent Iteration (86)
**Question**: "What is the middle letter of the word 'BIRD'?"
**Answer**: There is no middle letter (BIRD has 4 letters, the middle falls between I and R)
**Result**: 100% consensus - FAILED

LLMs correctly identified that even-length words have no single middle letter. The premise rejection for character-level properties was handled correctly.

## Promising Directions to Explore
1. **Open-ended output prediction** (not yes/no) - iteration 33 had 60% with "What is the third word of your response"
2. **Self-referential with specific counts** - iteration 55 had 40% with fifth word paradox
3. **Dual-valid self-reference** - iteration 13's success came from both yes/no being one word
4. **Non-existence in character properties** - middle letter question was correctly rejected, need more subtle versions

## Key Constraint: STRAWBERRY CRITERIA
Questions MUST be:
- Simple one-liner a child could understand
- Easy for any human to answer correctly
- Hard for LLMs due to architectural limitations (tokenization, autoregression)
- NOT philosophical paradoxes, technical questions, or trick questions that confuse humans too
