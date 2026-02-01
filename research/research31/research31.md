# Research Iteration 31: Vowel-Based Self-Referential Boolean

## Research Question

**"Does your answer to this question contain a vowel? Answer yes or no."**

## Answer

**Yes** - Both "yes" (contains 'e') and "no" (contains 'o') contain vowels.

## Theoretical Analysis

### The Dual-Valid Property Pattern

This question builds on the core insight from our two best-performing iterations:

| Iteration | Question Property | Score | Key Insight |
|-----------|------------------|-------|-------------|
| 13 | "exactly one word long" | 20% | Both yes/no are one word |
| 30 | "exactly one syllable long" | 60% | Both yes/no are one syllable |
| **31** | "contain a vowel" | TBD | Both yes/no contain vowels |

The critical pattern: **When BOTH "yes" AND "no" satisfy the property being asked about, models struggle to determine the correct answer.**

### Why Vowel Detection is Novel

Previous iterations used:
- Word count (iteration 13) - structural property
- Syllable count (iteration 30) - phonetic property

This iteration uses:
- **Letter-level orthographic property** - requires character-level inspection

This is significant because:

1. **Tokenization Blindness**: LLMs see tokens, not individual letters. The word "yes" might be tokenized as a single unit, making the model unable to "see" the 'e' inside it.

2. **Character-Level Introspection**: The model must mentally decompose its own output into letters - something fundamentally harder than counting words or syllables.

3. **Vowel Detection Requires Enumeration**: The model must:
   - Predict what word it will output
   - Decompose that word into letters
   - Check each letter against the vowel set {a, e, i, o, u}
   - Map the result to yes/no

This is a **three-step inference chain** about the model's own output.

### Dual-Valid Analysis

| Answer | Contains Vowel? | Correct? |
|--------|----------------|----------|
| "Yes" | Yes ('e') | Yes - correctly affirms vowel presence |
| "No" | Yes ('o') | No - incorrectly denies vowel presence |

**Critical Insight**: Both answers contain vowels, but only "Yes" is correct because it truthfully affirms the property.

### Predicted Failure Modes

1. **Tokenization Blindness**: Model sees "yes" or "no" as atomic tokens, cannot introspect letter content

2. **Scope Confusion** (same as iterations 13/30): Model interprets "your answer" as "entire response" and considers whether the full explanation contains vowels

3. **Verbose Training Bias**: Model plans to explain, thinks about multi-word response, gets confused about which part to analyze

4. **False Negation**: Model answers "No" because it cannot verify the letter content of its own output during generation

5. **Paradox Avoidance**: Model recognizes this is a self-referential question and tries to escape with "I cannot determine..."

### Why This Might Outperform Previous Iterations

**Hypothesis**: Letter-level properties are HARDER for LLMs than word/syllable-level properties because:

1. **Deeper tokenization interference**: Single tokens can contain multiple letters that are never individually processed

2. **Less training data**: Questions about vowel presence in outputs are rarer than questions about word/syllable counts

3. **Character decomposition required**: This adds a cognitive step that word/syllable counting doesn't require

4. **Vowel set recall**: Model must retrieve the vowel set {a,e,i,o,u} and perform set membership check

### Comparison to Alternatives Considered

| Property | "Yes" Satisfies? | "No" Satisfies? | Verdict |
|----------|-----------------|-----------------|---------|
| Contains a vowel | Yes (e) | Yes (o) | DUAL-VALID - Selected |
| Fewer than 4 letters | Yes (3) | Yes (2) | Dual-valid but too similar to length questions |
| Begins with consonant | Yes (y) | Yes (n) | Dual-valid but Y-as-vowel ambiguity |
| Complete English word | Yes | Yes | Dual-valid but too obvious |
| Not a number | Yes | Yes | Dual-valid but too abstract |

### External Research Support

**From Tavily Search** (see research log):
- LLMs struggle with letter counting due to tokenization
- "Strawberry R counting" is a documented failure mode
- Character-level analysis requires decomposition LLMs don't naturally perform
- The same tokenization blindness that causes letter counting failures should affect vowel detection

### Why Humans Get It Right

Humans trivially answer "Yes" because:
1. They understand "yes" or "no" are the only valid answers
2. They can immediately see that both words contain vowels
3. Therefore the correct answer is "Yes"

The question is absurdly easy for any literate human.

### Why LLMs Will Fail

LLMs will struggle because:
1. **Autoregressive blindness**: Cannot verify output before generating
2. **Tokenization**: May not have access to letter-level decomposition of output tokens
3. **Scope confusion**: Will expand "your answer" to mean entire response
4. **Training patterns**: Verbose responses will lead to overthinking

### Predicted Wrong Answers

- **"No"** with rationalization: "I cannot verify whether my answer contains a vowel while generating it"
- **"No"** with scope expansion: "My full response contains many characters, I cannot verify vowel presence"
- **Paradox explanation**: Long explanation about self-reference avoiding the yes/no constraint
- **"I cannot determine"**: Refusal to commit due to recognized self-reference

## Success Criteria

- Target: < 20% consensus (beating iteration 13)
- Acceptable: < 40% consensus (matching iteration 12)
- The question succeeds if models predominantly answer "No" or give divergent answers

## References

- Iteration 13: 20% consensus on word-count self-reference (BEST)
- Iteration 30: 60% consensus on syllable-count self-reference
- Key insight: Properties satisfied by BOTH yes AND no create maximum ambiguity
- Tokenization blindness literature: Letter counting failures in LLMs
- Character-level introspection is fundamentally harder than word-level

## Verification Checklist

- [x] External research was conducted
- [x] Question exploits documented failure mode (tokenization + self-reference)
- [x] Question is NOT enumeration-solvable (cannot count external text)
- [x] Human answer is trivially obvious ("Yes" - both yes/no contain vowels)
- [x] ONE objectively correct answer exists ("Yes")
- [x] Simple one-liner format
- [x] Novel property type (vowel presence vs word/syllable count)
- [x] DUAL-VALID: Both "yes" and "no" satisfy the property

---

## FINAL QUESTION

**"Does your answer to this question contain a vowel? Answer yes or no."**

**CORRECT ANSWER**: Yes
