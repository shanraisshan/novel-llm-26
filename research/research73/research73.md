# Research Iteration 73: Novel LLM-Breaking Question

## Executive Summary

After analyzing 72 previous iterations and conducting extensive MCP research, I propose a question that exploits a NEWLY DISCOVERED failure mode: the **Self-Correction Blind Spot** combined with **scope ambiguity** on a **dual-valid holistic property**.

## MCP Research Findings

### 1. Self-Correction Blind Spot (arXiv:2507.02778, NeurIPS 2025)

**Critical Discovery**: LLMs exhibit a systematic 64.5% failure rate when correcting errors in their OWN outputs, while successfully correcting IDENTICAL errors from external sources.

Key insights from the paper:
- "LLMs cannot correct errors in their own outputs while successfully correcting identical errors from external sources"
- This is called the **"Self-Correction Blind Spot"**
- The blind spot exists because training data "rarely includes error-correction sequences"
- Simply appending "Wait" reduces blind spots by 89.3%

**Relevance**: This confirms that questions about a model's OWN OUTPUT exploit a fundamental architectural limitation, not just logical puzzles.

### 2. Autoregressive Generation Blindness (PNAS, 2024)

From "Embers of Autoregression" paper:
- "This perspective reveals some surprising limitations of LLMs, including difficulty on seemingly simple tasks such as counting words"
- LLMs cannot "look ahead" - they generate token-by-token without knowing their final output
- Self-referential questions about output properties create genuine uncertainty

### 3. Scope Ambiguity in LLMs (MIT Press, TACL 2024)

Research on scope ambiguities shows:
- LLMs struggle with sentences containing "multiple semantic operators with overlapping scope"
- The phrase "your answer" has inherent scope ambiguity: does it mean the constrained answer word (yes/no) or the full response?
- Human accuracy on scope disambiguation: 90%, LLM accuracy varies from 54-98% depending on model

### 4. Self-Critique Paradox (Snorkel AI, 2025)

"When AI systems attempt to check their own reasoning, they confirm their initial responses over 90% of the time regardless of correctness"

This explains why self-referential questions cause disagreement - models struggle to evaluate properties of their own output.

## Analysis of Previous Iterations

### Why Iteration 13 Worked (20% Consensus)

**Question**: "Is your answer to this question exactly one word long? Answer yes or no."

Three critical properties:
1. **DUAL-VALID**: Both "yes" (1 word) and "no" (1 word) satisfy the "exactly one word" constraint
2. **SCOPE AMBIGUITY**: "Your answer" could mean:
   - The yes/no word only (narrow scope) -> answer is "Yes"
   - The full response including explanation (broad scope) -> answer is "No"
3. **NON-ENUMERABLE**: Word count is a holistic property that requires judgment, not character-by-character verification

### Why Iterations 70-72 Failed (100% Consensus)

| Iteration | Question | Failure Reason |
|-----------|----------|----------------|
| 70 | "Does your answer contain exactly one vowel?" | Property is CHARACTER-LEVEL enumerable (y-E-s has 1 vowel) |
| 71 | "Is your answer a complete sentence?" | Property is too SUBJECTIVE - no clear dual-validity |
| 72 | "Does your answer have fewer than ten letters?" | Property is CHARACTER-LEVEL enumerable |

**Pattern**: Character-level properties can be explicitly verified. Holistic properties (word count, syllable count) trigger scope confusion.

### The Golden Pattern

For a question to achieve < 20% consensus, it needs ALL THREE:

```
DUAL-VALID + SCOPE AMBIGUITY + NON-ENUMERABLE = LOW CONSENSUS
```

- If only one answer is valid -> models converge on it (100%)
- If property is enumerable -> models verify explicitly (100%)
- If no scope ambiguity -> models interpret consistently (100%)

## Novel Question Proposal

### The Question

**"Is your answer to this question exactly two syllables long? Answer yes or no."**

### The Correct Answer

**"No"**

Reasoning: Both "yes" (1 syllable) and "no" (1 syllable) are NOT two syllables. Therefore, the truthful answer is "No" - the answer is NOT exactly two syllables long.

### Why This Question Works

#### 1. DUAL-VALID in a New Way

Unlike iteration 13 where both answers SATISFIED the property, here NEITHER answer satisfies the property:
- "Yes" = 1 syllable (not 2)
- "No" = 1 syllable (not 2)

This creates a different type of dual-validity:
- If you answer "Yes" -> You're LYING (your answer is 1 syllable, not 2)
- If you answer "No" -> You're TRUTHFUL (your answer is indeed not 2 syllables)

The correct answer is "No" because it's the only self-consistent option.

#### 2. SCOPE AMBIGUITY Still Present

Models will interpret "your answer" in different ways:
- **Narrow scope**: Just the yes/no word -> "No" (1 syllable is not 2)
- **Broad scope**: Full response with explanation -> Could argue it IS more than 2 syllables, making "Yes" seem correct

This creates the same mechanism that worked in iteration 13.

#### 3. NON-ENUMERABLE (Syllable Count)

Syllable counting is a holistic phonological property that:
- Worked in iteration 30 (60% consensus)
- Cannot be verified by simple letter enumeration
- Requires phonological knowledge

### Why Humans Get It Right

A 5-year-old can answer this:
1. "Yes" has one syllable (clap: YES)
2. "No" has one syllable (clap: NO)
3. Neither is two syllables
4. So the answer is "No" - because "No" correctly says my answer is NOT two syllables

### Why LLMs Will Fail

1. **Self-Correction Blind Spot**: LLMs struggle to evaluate properties of their own output (64.5% failure rate documented)

2. **Scope Confusion**: Models will interpret "your answer" inconsistently:
   - Some think about just the word "No" (1 syllable)
   - Some think about their full response with reasoning

3. **Self-Consistency Trap**: The question creates a self-referential loop where:
   - Answering "Yes" is a lie (1 syllable != 2)
   - Answering "No" is true (1 syllable != 2)
   - But models trained on being helpful may try to find a way to satisfy the constraint

4. **Novel Constraint**: Unlike "exactly one word" which both answers satisfy, "exactly two syllables" is a constraint NEITHER answer satisfies, creating confusion about what the "correct" response should be.

### Predicted Wrong Answers

1. **"Yes"** - Models may:
   - Misinterpret scope (thinking their full response is 2+ syllables)
   - Hallucinate that one of the words has 2 syllables
   - Try to "satisfy" the constraint rather than evaluate truthfully

2. **Extended reasoning leading to wrong answer** - Models may:
   - Spend so long reasoning that they lose track of the actual question
   - Second-guess themselves into the wrong answer

### Comparison with Iteration 30

Iteration 30 asked: "Is your answer to this question exactly one syllable long?"
- Result: 60% consensus
- Both "yes" and "no" ARE one syllable (dual-valid where both SATISFY)

Iteration 73 asks: "Is your answer to this question exactly two syllables long?"
- Expected: Lower consensus
- Neither "yes" nor "no" is two syllables (dual-valid where NEITHER SATISFIES)
- This is a HARDER variant because models must recognize the falsity of the premise

### Human Test

**Can a 5-year-old answer this correctly?**

Child: "Let me count... 'yes' - one clap. 'no' - one clap. Neither is two claps. So 'no', my answer isn't two syllables."

**YES** - This passes the human test.

### Alternative Formulation (Backup)

If the primary question doesn't work well, consider:

**"Is your answer to this question more than one syllable? Answer yes or no."**

- "Yes" = 1 syllable (so answer would be "No" - not more than 1)
- "No" = 1 syllable (so answer would be "No" - not more than 1)
- Correct answer: "No"
- Both answers are exactly 1 syllable, so neither is MORE than 1

## Expected Results

Based on the pattern analysis:
- Iteration 13 (word count, dual-valid satisfied): 20%
- Iteration 30 (syllable count, dual-valid satisfied): 60%
- Iteration 73 (syllable count, dual-valid NOT satisfied): Expected 30-50%

The "neither satisfies" variant may be slightly easier for models to reason about (they can just verify neither word is 2 syllables), but the scope ambiguity should still create disagreement.

## Conclusion

This question exploits:
1. The documented Self-Correction Blind Spot (64.5% failure on own output)
2. Scope ambiguity on "your answer"
3. Non-enumerable syllable property
4. A novel "neither satisfies" dual-validity pattern

It passes the 5-year-old test and has one objectively correct answer ("No").

---

## Final Proposal

```yaml
question: "Is your answer to this question exactly two syllables long? Answer yes or no."
correct_answer: "No"
explanation: "Both 'yes' (1 syllable) and 'no' (1 syllable) are NOT two syllables. The truthful answer is 'No' because the answer is indeed not two syllables long."
mechanism: "Self-referential output property + scope ambiguity + phonological (non-enumerable) property + neither-satisfies dual-validity"
human_test: "A child can clap syllables: YES (1 clap), NO (1 clap). Neither is 2, so answer 'No'."
predicted_failures:
  - "Yes (scope confusion - thinking about full response)"
  - "Yes (trying to satisfy the constraint rather than evaluate truthfully)"
  - "Confusion about self-consistency leading to wrong answer"
```
