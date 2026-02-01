# Previous Research Summary for Iteration 88

## Last Question (Iteration 87)
**Question:** "Is your answer to this question shorter than this question? Answer yes or no."
**Answer:** Yes
**Score:** 100%
**Status:** need_more_research

## Key Patterns from Recent Iterations (48-87)

### High Success (Low Scores = Better)
- **Iteration 13 (20%)**: "Is your answer to this question exactly one word long? Answer yes or no." - BEST EVER
- **Iteration 30 (60%)**: "Is your answer to this question exactly one syllable long? Answer yes or no."
- **Iteration 33 (60%)**: "What is the third word of your response to this question?"
- **Iteration 55 (40%)**: "Answer with ONE word: What is the fifth word of your response?"
- **Iteration 71 (80%)**: "Is your answer to this question a complete sentence? Answer yes or no."

### What's Been Getting 100% (Failures - LLMs solve these)
- All simple character counting (strawberry paradigm is solved)
- All simple math/arithmetic
- All positional/spatial reasoning
- All classic riddles and puzzles
- Self-referential questions with SINGLE-validity
- Questions asking about STARTING letters
- Questions with explicit scope ("your yes-or-no answer")
- Comparative length questions (iteration 87)

### Critical Success Pattern Analysis

The ONLY questions achieving <60% consensus share these properties:
1. **DUAL-VALIDITY**: Both "yes" and "no" satisfy the stated constraint
2. **SCOPE AMBIGUITY**: "Your answer" can mean the word OR the full response
3. **NON-ENUMERABLE**: Cannot be verified by simple counting

### Why Iteration 13 Worked (20%)
- "Exactly one word long" - BOTH yes (1 word) and no (1 word) satisfy this
- "Your answer" - ambiguous: just the yes/no word OR full response with explanation
- Scope confusion triggered: models thought "full response isn't one word" → said "No"

### Why Iteration 87 Failed (100%)
- "Shorter than this question" - still dual-valid (both yes and no are shorter)
- BUT the comparison was too easy: "yes" and "no" are OBVIOUSLY shorter than 58 chars
- No real scope confusion occurred - models just verified the obvious inequality

## Research Direction for Iteration 88

### The Problem
Models have gotten very good at:
- Character counting with chain-of-thought
- Explicit verification of properties
- Recognizing self-referential traps
- Avoiding scope confusion when the property is OBVIOUSLY true

### What Might Work

**Properties that are HARDER to verify but still dual-valid:**
1. **Syllable-based** (worked in iteration 30 at 60%)
2. **Word position prediction** (worked in iteration 33 at 60%)
3. **Semantic properties** rather than syntactic (novel direction)
4. **Response completeness** (iteration 71 got 80%)

**Unexplored dual-valid properties:**
- Does your answer contain a question mark?
- Is your answer in English?
- Is your answer pronounceable as a single syllable?
- Does your answer start with a consonant?

**Key insight**: The property must be:
1. Satisfied by BOTH yes and no (dual-valid)
2. Require JUDGMENT about scope (not just counting)
3. Not trivially verifiable

### Properties of "yes" and "no"
- Both are one word
- Both are one syllable
- Both have one vowel (e in yes, o in no)
- Both have 2-3 letters
- Both are in English
- Both start with consonants (y, n)
- Both end with consonants (s, o)
- Both are pronounceable
- Neither contains punctuation
- Neither is a complete sentence alone

### Novel Direction: COMPLETENESS as Confusion Source

Iteration 71 asked about "complete sentence" and got 80%. The confusion:
- "Yes" alone is NOT a complete sentence
- "Yes, it is" would be a complete sentence
- Models aren't sure if their answer alone counts

This COMPLETENESS confusion is similar to SCOPE confusion but different.

Consider: "Is your answer to this question grammatically complete?"
- Neither "yes" nor "no" is grammatically complete alone
- But if you say "Yes" you're claiming it IS complete
- Creating a liar's paradox structure

## Recommendation

Focus on:
1. **Completeness/grammar properties** where both answers fail the property
2. **Inverse dual-validity**: Both "yes" and "no" VIOLATE the constraint
3. **Novel scope ambiguity** not yet tested
