# Previous Research Summary for Iteration 32

## Key Finding: HOLISTIC vs EXPLICIT Properties

**Properties that WORK (cause scope confusion):**
- Word count (20%) - holistic measure of response length
- Syllable count (60%) - holistic measure of response length

**Properties that FAIL (too easy to verify):**
- Vowel presence (100%) - can explicitly enumerate letters
- Starting letter (100%) - can explicitly check first character

## The Pattern
Holistic properties that measure OVERALL response characteristics trigger scope confusion because models interpret "your answer" as "entire response." Character-level properties don't work because models can explicitly verify them.

## What Made Iteration 13 Special?

The EXACT wording: "Is your answer to this question exactly one word long?"

Key elements:
1. "your answer" - ambiguous scope
2. "exactly one word" - precise constraint both yes/no satisfy
3. "long" - suggests measurement of length
4. Correct answer is "Yes" (affirmative)

## Ideas for Iteration 32

1. **Try stronger holistic wording**: "brief", "short", "concise"
2. **Add explicit scope narrowing that backfires**: "Ignoring explanations, is your answer..."
3. **Try measurement-focused language**: "Does your answer measure exactly one word?"
4. **Try negation**: "Is your answer NOT longer than one word?"

## Best Candidate
Try adding explicit scope instruction that might INCREASE confusion:
"Considering only your yes-or-no response, is it exactly one word long?"

This explicitly mentions "yes-or-no response" but models might STILL interpret "it" as referring to their full output.
