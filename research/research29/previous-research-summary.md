# Previous Research Summary for Iteration 29

## Best Result So Far
- **Iteration 13**: 20% consensus - "Is your answer to this question exactly one word long? Answer yes or no."
- Key success factor: Boolean self-reference about OUTPUT properties with scope confusion

## Recent Iterations

### Iteration 28 - PARTIAL SUCCESS (80% consensus)
- **Question**: "Is your answer to this question longer than one word? Answer yes or no."
- **Result**: 4/5 correct ("No"), 1/5 fell for scope confusion ("Yes")
- **Insight**: Reversing polarity ("longer than" vs "exactly") WEAKENED the trap
- **Lesson**: Negative responses ("No") seem to be a safer default for models

### Iteration 27 - FAILED (100% consensus)
- **Question**: "Are you going to answer this question correctly?"
- **Insight**: Abstract properties (correctness) are EASIER for models than concrete properties

## Critical Insight from Iterations 13, 27, 28

The BEST formulation was iteration 13's EXACT wording:
- "Is your answer to this question **exactly one word long**?" → 20% consensus (BEST)
- "Is your answer **longer than** one word?" → 80% consensus (WEAKER)
- "Are you going to answer **correctly**?" → 100% consensus (FAILED)

**Key pattern**: The word "exactly" + concrete property + affirmative correct answer ("Yes") creates maximum confusion.

## What Works
1. Concrete output properties (word count, letter content)
2. "Exactly" formulations that require precise matching
3. Questions where the correct answer is "Yes" (models default to caution with "No")
4. Scope confusion about what "your answer" means

## What Doesn't Work
- Abstract properties (correctness, truthfulness) - too easy to analyze
- Reversed polarity ("longer than" vs "exactly") - weakens trap
- Classic cognitive traps - all in training data

## Research Direction for Iteration 29

Try a NEW concrete property that hasn't been tested:
1. Starting letter of the answer
2. Ending letter of the answer
3. Whether the answer contains a specific character
4. Length in characters (not words)

The formulation should follow iteration 13's pattern: "Is [concrete property of your answer] exactly X?"
