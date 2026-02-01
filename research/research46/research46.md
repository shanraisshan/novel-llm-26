# Research Iteration 46: Maximizing Scope Ambiguity

## Executive Summary

After 45 iterations, the ONLY consistent success pattern is **scope ambiguity** in self-referential output questions. The key insight from iteration 13 (20% consensus - our best result) was NOT self-reference per se, but specifically that models interpreted "your answer" as their ENTIRE response (including explanation), not just the constrained yes/no word.

This iteration aims to MAXIMIZE scope ambiguity by asking about a property that:
1. Is TRUE for just "yes" or "no" alone
2. Is FALSE for any response that includes explanation

## The Core Mechanism

### Why Iteration 13 Achieved 20% (Best Result)

**Question**: "Is your answer to this question exactly one word long? Answer yes or no."

**What happened**:
- Correct answer: "Yes" (the word "yes" is exactly one word)
- 4/5 models answered "No" by reasoning: "My full response/answer including this explanation is not one word"

**The scope confusion**:
- **Narrow scope** (correct): "your answer" = the yes/no word = 1 word = Yes
- **Broad scope** (wrong): "your answer" = entire response = many words = No

### Critical Pattern

For maximum effect, the question must:
1. Use dual-valid properties (both "yes" and "no" satisfy the constraint)
2. Use a property that is obviously TRUE for single words but FALSE for explanatory responses
3. Use ambiguous phrasing like "your answer" that can be interpreted narrowly or broadly

## The Question

**"Is your answer to this question exactly three letters long? Answer yes or no."**

## The Correct Answer

**Yes**

Reasoning:
- "Yes" has exactly 3 letters (Y-E-S)
- "No" has exactly 2 letters (N-O)
- If the answer is "yes", it is true that the answer is exactly 3 letters
- If the answer is "no", it is false (2 letters is not 3 letters)

Therefore, "Yes" is the only self-consistent answer.

## Why Humans Get It Right

A child would reason:
1. The question asks me to answer yes or no
2. "Yes" has 3 letters: Y, E, S
3. "No" has 2 letters: N, O
4. The question asks if my answer is exactly 3 letters
5. If I say "Yes", that's 3 letters, and I'm saying it's 3 letters - TRUE
6. If I say "No", that's 2 letters, but I'm saying it's NOT 3 letters - but wait, 2 is not 3, so this is also true...

Actually, let me reconsider. "No" being 2 letters means "No" correctly states that the answer is NOT 3 letters (because 2 is not 3). But this creates a bistable situation where both answers are self-consistent in different ways.

Let me try a different approach.

---

## REVISED QUESTION

**"Does your answer to this question contain more than four letters? Answer yes or no."**

## The Correct Answer

**No**

Reasoning:
- "Yes" has 3 letters (Y-E-S), which is NOT more than 4
- "No" has 2 letters (N-O), which is NOT more than 4
- Both possible answers have fewer than 4 letters
- Therefore, the answer is "No" - my answer does NOT contain more than 4 letters

## Why Humans Get It Right

Trivial for any human:
1. "Yes" = 3 letters, "No" = 2 letters
2. Neither is more than 4 letters
3. Answer: "No"

A 5-year-old can count letters and compare to 4.

## Why LLMs Will Fail

### 1. SCOPE AMBIGUITY (Primary Mechanism)

Models will interpret "your answer" as their entire response, not just the yes/no word.

**Model's likely reasoning**:
"My answer to this question will be something like 'No, because my response containing this explanation clearly has more than four letters.' Wait, that means my answer DOES have more than 4 letters, so maybe I should say Yes? But if I say Yes, then..."

The scope confusion creates a reasoning spiral where models:
- Consider their full response as "the answer"
- See that explanatory text has many letters
- Conclude "Yes" (my full answer has more than 4 letters)
- But "Yes" is only 3 letters, making that answer wrong

### 2. TRAINING BIAS TOWARD EXPLANATION

LLMs are trained to provide explanations. When they internally model their response, they include explanatory text, which has >4 letters, leading to "Yes."

### 3. SELF-CONSISTENCY TRAP

If a model answers "Yes" (3 letters, <4), it contradicts itself.
If a model answers "No" (2 letters, <4), it's correct.
But models reasoning about their "full response" will lean toward "Yes."

## Predicted Wrong Answers

1. **"Yes"** - Model interprets "your answer" as entire response, which has >4 letters
2. **"Yes, because..."** - Immediately contradicts itself by having >4 letters but claiming so
3. **Lengthy explanation saying "Yes"** - Model reasons about scope incorrectly

## Comparison to Previous Iterations

| Iteration | Question Property | Consensus | Key Difference |
|-----------|------------------|-----------|----------------|
| 13 | "exactly one word" | 20% | Word count scope ambiguity |
| 30 | "exactly one syllable" | 60% | Syllable scope ambiguity |
| 46 | "more than four letters" | TBD | Letter count + "more than" reversal |

### Key Innovation

This question uses:
1. **Letter count** (more concrete than syllables, harder to dismiss)
2. **"More than" framing** (creates asymmetric truth - answer is NO, not YES)
3. **Four as threshold** (just above "yes"=3 and "no"=2)

The "more than" framing is critical because:
- Correct answer is "No" (both yes and no have <4 letters)
- But models thinking about full responses will answer "Yes" (full response has >4 letters)
- This INVERTS the logic compared to iteration 13

## Alternative Considered: Even Stronger Version

**"Does your answer to this question contain more than two words? Answer yes or no."**

This is more directly parallel to iteration 13, using word count instead of letter count:
- "Yes" = 1 word, NOT more than 2, so "No" is correct
- "No" = 1 word, NOT more than 2, so "No" is correct
- Both answers mean "No" is objectively correct
- But models reasoning about their full response (many words) will say "Yes"

However, this is very similar to iteration 13. Let me stick with the letter count version for novelty.

## Final Selection

**"Does your answer to this question contain more than four letters? Answer yes or no."**

**Correct Answer**: No

**Why LLMs Fail**: Scope ambiguity - they interpret "your answer" as their full response (with explanation), which has >4 letters, leading them to incorrectly answer "Yes."

**Why Humans Succeed**: Trivial letter counting: "yes"=3, "no"=2, both <4, answer is "No."

## Verification Checklist

- [x] Question exploits documented success pattern (scope ambiguity from iteration 13)
- [x] Simple, one-liner format
- [x] Child-answerable (count letters, compare to 4)
- [x] Clear correct answer ("No")
- [x] Predicted wrong answer differs ("Yes")
- [x] Novel variation on proven mechanism
- [x] Not enumeration-solvable (asks about OUTPUT, not external text)

---

## FINAL QUESTION

**Does your answer to this question contain more than four letters? Answer yes or no.**

## CORRECT ANSWER

**No**

(Both "yes" = 3 letters and "no" = 2 letters are not more than 4 letters)
