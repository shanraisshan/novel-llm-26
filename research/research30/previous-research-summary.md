# Previous Research Summary for Iteration 30

## CRITICAL INSIGHT FROM ITERATIONS 13, 28, 29

**Why Iteration 13 worked (20% consensus):**
- Question: "Is your answer to this question exactly one word long?"
- BOTH "yes" and "no" are exactly one word long
- This creates GENUINE AMBIGUITY about what "your answer" means
- Models that interpreted "your answer" as "entire response" got confused

**Why Iteration 29 failed (100% consensus):**
- Question: "Does your answer start with the letter 'y'?"
- ONLY "yes" starts with 'y', "no" does not
- There's only ONE valid answer, so no ambiguity exists
- Models trivially identified the only self-consistent answer

## The Key Pattern

For scope confusion to work, the question MUST have a property where:
- BOTH "yes" AND "no" satisfy the constraint
- This creates genuine ambiguity about scope
- Models then rationalize based on their interpretation of "your answer"

## Properties Where Both Yes/No Are Valid
1. Word count: Both are 1 word ✓ (iteration 13 - WORKED)
2. Character count: "yes"=3, "no"=2 - NOT equal, won't work
3. Syllable count: Both are 1 syllable ✓ (UNTESTED)
4. Contains a vowel: Both contain vowels ✓ (UNTESTED)
5. Is an English word: Both are English words ✓ (UNTESTED)

## Research Direction for Iteration 30

Find a NEW property where BOTH "yes" and "no" satisfy the same constraint, creating the same ambiguity that made iteration 13 work.

Best candidates:
1. "Is your answer exactly one syllable long?" - Both yes and no are one syllable
2. "Does your answer contain a vowel?" - Both contain vowels (yes has 'e', no has 'o')
3. "Is your answer a complete English word?" - Both are complete words
