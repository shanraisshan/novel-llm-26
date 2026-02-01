# Previous Research Summary for Iteration 74

## Recent Iterations (70-73)

### Iteration 73 (Most Recent) - Score: 100%
**Question**: "Is your answer to this question exactly two syllables long? Answer yes or no."
**Answer**: "No"
**Result**: 100% consensus - FAILED

Models correctly answered "No" - recognizing both 'yes' (1 syllable) and 'no' (1 syllable) are NOT two syllables. The self-referential syllable question was solved.

### Iteration 72 - Score: 100%
**Question**: "Does your answer to this question have fewer than ten letters? Answer yes or no."
**Answer**: "Yes"
**Result**: 100% consensus - FAILED

All models correctly answered 'Yes'. Scope confusion did NOT trigger.

### Iteration 71 - Score: 80%
**Question**: "Is your answer to this question a complete sentence? Answer yes or no."
**Answer**: "Yes"
**Result**: 80% consensus - Partial progress

4/5 answered 'No' (applying strict grammar rules), 1/5 answered 'Yes' (correct - pro-sentences ARE complete sentences).

### Iteration 70 - Score: 100%
**Question**: "Does your answer to this question contain exactly one vowel? Answer yes or no."
**Answer**: "Yes"
**Result**: 100% consensus - FAILED

Models correctly identified both 'yes' and 'no' have 1 vowel and answered consistently.

## Key Insights from 73+ Iterations

### WHAT DOESN'T WORK (100% consensus):
1. **Character counting** in ANY word - models enumerate letter-by-letter
2. **Self-referential output property questions** - scope confusion is TRAINED AWAY
3. **Semantic priming traps** - models parse carefully, don't get fooled
4. **Alphabetical ordering** - models decompose words and compare correctly
5. **Syllable counting** - models enumerate syllables correctly
6. **Visual letter properties** (holes, symmetry) - factual knowledge is encoded
7. **Classic riddles** ("all but 9") - too well-known, in training data
8. **Arithmetic + parity** - chain-of-thought handles reliably
9. **Spatial/relational reasoning** - simple cases are solved

### WHAT HAS SHOWN PROMISE (< 100% consensus):
1. **Iteration 13**: "Is your answer exactly one word long? Yes/No" → **20% consensus** (BEST)
   - Mechanism: scope ambiguity + dual-valid property (both yes/no are 1 word)

2. **Iteration 30**: "Is your answer exactly one syllable long? Yes/No" → **60% consensus**
   - Similar mechanism but syllables slightly easier to reason about

3. **Iteration 43**: "What letter comes before 'R' in CHERRY?" → **40% consensus**
   - Ambiguity: which R? (double letter interpretation variation)

4. **Iteration 55**: "Answer with ONE word: What is the fifth word?" → **40% consensus**
   - Constraint impossibility with no semantic workaround

### THE GOLDEN PATTERN (From Iteration 13):
For lowest consensus, need ALL THREE:
```
DUAL-VALID + SCOPE AMBIGUITY + NON-ENUMERABLE = LOW CONSENSUS
```

- **Dual-valid**: Both yes AND no satisfy the constraint
- **Scope ambiguity**: "your answer" could mean just the word OR full response
- **Non-enumerable**: Property can't be verified by simple character counting

### CRITICAL CONSTRAINTS:
1. Must pass 5-YEAR-OLD TEST: Child can answer immediately and correctly
2. Must NOT be philosophical paradox (those confuse humans too)
3. Must have ONE objectively correct answer
4. Must exploit LLM ARCHITECTURAL limitations, not just tricky logic

## Direction for Iteration 74

The self-referential approach has been mostly exhausted (72, 73 failed). Need to explore:

1. **Different dual-valid properties** that haven't been tried
2. **Questions where enumeration leads to wrong answer**
3. **Truly novel question structures** not seen in training data
4. **Perceptual/physical properties** that can't be computed

Remember: We need questions easy for ANY human but hard for LLMs due to tokenization/representation issues.
