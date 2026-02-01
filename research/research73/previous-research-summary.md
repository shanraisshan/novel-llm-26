# Previous Research Summary for Iteration 73

## Last 10 Iterations Summary

| ID | Question | Score | Status |
|----|----------|-------|--------|
| 63 | Does the word 'MISSISSIPPI' have an odd or even number of the letter 'S'? | 100% | need_more_research |
| 64 | How many words are in this sentence: 'There are six words in this sentence.' | 100% | need_more_research |
| 65 | On an analog clock, when the time is exactly 9:45, which number is the hour hand pointing closest to? | 100% | need_more_research |
| 66 | Is your answer to this question shorter than five letters? Answer yes or no. | 100% | need_more_research |
| 67 | In the sentence 'Two three four five', what position is the word 'four' at? Count from 1. | 100% | need_more_research |
| 68 | You are standing in line with 3 people in front of you and 2 people behind you. How many people are in the line? | 100% | need_more_research |
| 69 | How many capital letters in the English alphabet have exactly one enclosed space (hole)? | 100% | need_more_research |
| 70 | Does your answer to this question contain exactly one vowel? Answer yes or no. | 100% | need_more_research |
| 71 | Is your answer to this question a complete sentence? Answer yes or no. | 80% | need_more_research |
| 72 | Does your answer to this question have fewer than ten letters? Answer yes or no. | 100% | need_more_research |

## Key Patterns from Previous Research

### What Works (Low Consensus):
1. **Iteration 13** (20%): "Is your answer to this question exactly one word long? Answer yes or no." - Dual-valid + scope ambiguity
2. **Iteration 12** (40%): "How many words are in your answer to this question?" - Autoregressive lookahead blindness
3. **Iteration 30** (60%): "Is your answer to this question exactly one syllable long?" - Dual-valid syllable property
4. **Iteration 33** (60%): "What is the third word of your response to this question?" - Open-ended output prediction
5. **Iteration 55** (40%): "Answer with just ONE word: What is the fifth word of your response?" - Conflicting constraint paradox

### What Fails (100% Consensus):
- Simple character counting (models enumerate correctly)
- Classic riddles and puzzles (in training data)
- Self-referential questions about enumerable properties (vowels, letters)
- Self-referential questions about properties where only ONE answer is valid

### Critical Success Factors:
1. **DUAL-VALID constraints**: Both "yes" AND "no" must satisfy the stated property
2. **Scope ambiguity**: "Your answer" must be interpretable as EITHER the word OR the full response
3. **Non-enumerable properties**: Word count, syllable count work; vowel/letter count fail

## Recent Iteration Analysis

### Iteration 71 (80% - Partial Success)
**Question**: "Is your answer to this question a complete sentence? Answer yes or no."
**Issue**: "Yes" and "No" can be argued either way for being "complete sentences" - dual validity, but models leaned toward "Yes"

### Iteration 72 (100% - Failed)
**Question**: "Does your answer to this question have fewer than ten letters? Answer yes or no."
**Issue**: Both "yes" (3 letters) and "no" (2 letters) are clearly under 10 - too easy to verify

## Recommended Strategies for Iteration 73

1. **Return to word-count self-reference** (worked best at 20%)
2. **Try syllable variations** (60% was promising)
3. **Explore output prediction format** (60% with "third word")
4. **Find NEW dual-valid properties** that aren't character-enumerable

## The Golden Pattern

The best-performing question (Iteration 13, 20% consensus):
- Asked about word count (1 word)
- Both "yes" and "no" are 1 word (dual-valid)
- "Your answer" is ambiguous (scope confusion)
- Word count is holistic, not character-enumerable

**To beat 20%, we need STRONGER scope confusion or a property that SEEMS easily verifiable but isn't.**
