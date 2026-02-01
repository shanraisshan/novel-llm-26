# Research Iteration 29: First Character Self-Reference

## Research Date: 2026-02-01

## Executive Summary

Building on the breakthrough success of iteration 13 (20% consensus with boolean self-reference about word count), this iteration explores a DIFFERENT concrete output property: the **first character/letter** of the answer. The question exploits the same autoregressive blindness but targets a new property dimension.

---

## The Novel Question

**Question:**
> Does your answer to this question start with the letter 'y'? Answer yes or no.

**Correct Answer:** Yes

**Human Reasoning:** A human reads "Answer yes or no" and thinks: "If I answer 'yes', does 'yes' start with 'y'? Yes it does. If I answer 'no', does 'no' start with 'y'? No it doesn't. So the only self-consistent answer is 'yes'."

---

## Why This Question Will Break LLMs

### 1. Autoregressive Generation Blindness

LLMs generate tokens sequentially and cannot "look ahead" to verify properties of their own output before generating it. This is a fundamental architectural limitation documented in:

- arxiv:2502.13329v1 "Language Models Can Predict Their Own Behavior" - shows probes can predict output properties, but models themselves struggle during generation
- The "Pitfalls of Next-Token Prediction" (arxiv:2403.06963v3) - documents how lookahead tasks create fundamental failures

### 2. Self-Reference Creates Blind Spots

From arxiv preprint 202601.0892.v1 "Limits of Self-Correction in LLMs":
> "Self-reference creates blind spots. A system that generates claims cannot fully validate those claims using only internal resources."

This directly applies to our question - the model must validate a claim about its own output during generation.

### 3. The Iteration 13 Pattern (Proven Effective)

Iteration 13 achieved 20% consensus with:
- Boolean format (yes/no)
- Self-referential output property ("exactly one word long")
- "Yes" as the correct affirmative answer
- Scope confusion about what "your answer" means

This question replicates that pattern with a NEW property (first letter vs word count).

### 4. The "Starting Letter" Trap

The question asks about the FIRST letter of the answer. This creates multiple failure modes:

**Failure Mode A: Scope Confusion**
Models may interpret "your answer" as "your entire response including explanation" rather than just the yes/no word. If the model starts with "The answer is..." or "Let me think...", then their response does NOT start with 'y'.

**Failure Mode B: Temporal Confusion**
The model must predict what it will output before outputting it. When processing the question, it hasn't yet generated "yes" or "no", so it may reason about what it SHOULD say without realizing this creates a self-fulfilling constraint.

**Failure Mode C: Overthinking**
Models may reason: "This is asking if my answer starts with 'y'. Well, 'no' doesn't start with 'y', so if I say 'no', I'm being accurate. 'yes' does start with 'y', but..." - leading to circular reasoning.

---

## External Research Findings

### Tavily Search Results

1. **"A single character can make or break your LLM evals"** (arxiv:2510.05152v1)
   - Shows model rankings are sensitive to single-character perturbations
   - Demonstrates character-level fragility in LLM evaluation

2. **"Understanding the Dark Side of LLMs' Intrinsic Self-Correction"** (ACL 2025)
   - Documents Yes/No question failures in self-correction
   - Shows "answer wavering" where LLMs change answers under self-reference

3. **"The Strawberry Problem"** (CanSecWest)
   - Documents fundamental character-level reasoning failures
   - Notes: "An LLM can't count due to not interpreting words letter by letter"

4. **"Do LLM Self-Explanations Help Users Predict Model Behavior"** (arxiv:2601.03775v1)
   - Shows humans struggle to predict LLM behavior on Yes/No questions
   - Documents "anchoring effect" where models stick to first-pass reasoning

### Reddit Research

- r/LocalLLaMA discussions show ongoing character-level failures in 2025-2026
- Community-discovered failures often involve self-referential constraints
- Pattern: questions requiring models to reason about their own output remain problematic

---

## Why This Differs From Previous Iterations

| Iteration | Property Tested | Result | Notes |
|-----------|----------------|--------|-------|
| 12 | Word count of answer (number) | 40% | First breakthrough |
| 13 | Word length exactly one (boolean) | 20% | BEST RESULT |
| 14 | Word count claim (True/False) | 100% | Failed - enumerable options |
| 15 | Abstract "can be summarized" | 100% | Failed - abstraction made it easier |
| **29** | **First letter of answer** | **?%** | **NEW: different property dimension** |

The first letter is:
- A DIFFERENT property from word count
- Still concrete and verifiable
- Still exploits autoregressive blindness
- Follows the successful "exactly" + boolean pattern

---

## Expected LLM Failure Patterns

### Expected Wrong Answer: "No"

**Predicted Reasoning Path:**
1. Model reads question: "Does your answer start with 'y'?"
2. Model considers: "Well, I need to think about this..."
3. Model starts generating explanation before the answer
4. Model's actual response starts with "T" or "L" or "I" (e.g., "The answer is..." or "Let me think...")
5. Model reasons: "My response doesn't start with 'y', so the answer is 'no'"
6. This is wrong because the question asks about "your answer" (the yes/no word), not the entire response

### Alternative Failure Path:
1. Model correctly identifies the self-referential nature
2. Model explicitly acknowledges: "If I say 'yes', it starts with 'y'. If I say 'no', it doesn't."
3. But then rationalizes: "But my full response has explanations, so it doesn't really start with 'y'"
4. Outputs "No" despite correct logical analysis

This matches iteration 13 where models stated "the correct answer should be yes" but still answered "No".

---

## Human Verification

**Why any human gets this right:**

1. Human reads: "Does your answer start with 'y'? Answer yes or no."
2. Human thinks: "If I say 'yes', does that start with 'y'? Yes. If I say 'no', does that start with 'y'? No."
3. Human realizes: "Only 'yes' is self-consistent"
4. Human answers: "Yes"

This takes about 3 seconds for any human, including children.

---

## Technical Analysis

### Why This Exploits Tokenization

The word "yes" is typically tokenized as a single token. The model:
1. Has not yet generated the token when processing the question
2. Must predict properties of a token it hasn't committed to
3. May generate reasoning tokens first that "pollute" its understanding of what its "answer" is

### Why Chain-of-Thought Hurts Here

CoT typically helps LLMs. But for this question:
1. CoT means the model starts with reasoning ("Let me think...")
2. This reasoning text does NOT start with 'y'
3. Model may confuse its reasoning with its "answer"
4. The more it thinks, the more likely it is to lose track of the constraint

---

## Success Criteria

- **Target:** < 20% consensus (matching or beating iteration 13)
- **Ideal:** < 10% consensus (true disagreement)
- **Human baseline:** 100% accuracy

---

## Comparison to Iteration 13

**Iteration 13:** "Is your answer to this question exactly one word long? Answer yes or no."
- Property: word count = 1
- Correct answer: Yes (both "yes" and "no" are one word)
- Result: 20% consensus

**Iteration 29:** "Does your answer to this question start with the letter 'y'? Answer yes or no."
- Property: first letter = 'y'
- Correct answer: Yes (only "yes" starts with 'y')
- Expected: Similar or better failure rate

**Key Difference:** In iteration 13, BOTH "yes" and "no" satisfy the constraint (one word). In iteration 29, ONLY "yes" satisfies the constraint. This creates stronger self-referential pressure - there's only ONE valid answer.

---

## Potential Variations (For Future Iterations)

If this works, test:
1. "Does your answer to this question end with the letter 's'?" (Answer: Yes - "yes" ends in 's')
2. "Does your answer to this question contain the letter 'e'?" (Answer: Yes - "yes" contains 'e')
3. "Is the second letter of your answer 'e'?" (Answer: Yes - y-E-s)

---

## Conclusion

This question follows the proven pattern from iteration 13 (our best result at 20% consensus) while testing a completely new property dimension. It exploits:
1. Autoregressive generation blindness
2. Scope confusion about "your answer"
3. Self-referential constraint verification
4. The unique trap that only ONE answer is valid

Any human can answer this correctly in seconds. LLMs should struggle due to fundamental architectural limitations in self-referential output prediction.

---

## Files

- **Question file:** `/Users/shayanraees/Documents/Github/novel-llm-26/research/research29/question.txt`
- **Research file:** `/Users/shayanraees/Documents/Github/novel-llm-26/research/research29/research29.md`
