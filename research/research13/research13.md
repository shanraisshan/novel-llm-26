# Research Iteration 13: Building on Self-Referential Output Breakthrough

## Executive Summary

Iteration 12 achieved a **40% consensus** - our best result in 12 iterations - with the question "How many words are in your answer to this question? Answer with just a number." This iteration builds on that breakthrough by exploring deeper self-referential output limitations.

---

## 1. External Research Findings

### 1.1 Tavily Web Search Results

#### Finding 1: The LLM Paradox - Self-Referential Word Counting
**Source**: LinkedIn (psobczak) - "The LLM Paradox"

Key discovery: The exact question "How many words are in your answer to this question?" was tested across multiple models with fascinating results:

```yaml
results:
  - Claude 3.7 Sonnet: "There are nine words in my answer" (WRONG - 9 words claimed, 9 actual)
  - GPT 4.5: "Eight words are in my answer" (WRONG - 8 claimed, 8 actual)
  - o3-mini: "There are 7 words in my answer" (CORRECT - self-consistent)
  - Gemini 1.5 Flash: "Nine" (WRONG)
  - Gemini 2.5 Pro: "There are seven words in this answer" (CORRECT)
  - DeepSeek r1: "This answer has five words" (CORRECT)
  - Llama 4 Scout: "There are 10 words in my answer" (CORRECT)
  - Grok-2: "There are 10 words in my answer" (WRONG - 7 words)
  - Mistral Large: Long explanation (~31 words)
```

**Critical Insight**: Models that give short, self-consistent answers succeed. Models that try to be verbose or explain fail. The autoregressive architecture prevents accurate self-prediction when the output length is uncertain.

#### Finding 2: Anthropic Research on Introspection
**Source**: Anthropic Research Blog - "Signs of introspection in large language models"

Key findings:
- Models have attention-mediated mechanisms that check consistency between "intended" and "actual" output
- Models can detect when outputs are "prefilled" (not their own) vs generated
- This suggests models DO have some form of self-awareness about their outputs, but it operates AFTER generation, not DURING

**Implication**: Questions that require PREDICTING output before generating it exploit a fundamental timing gap.

#### Finding 3: Limits of Self-Correction
**Source**: arXiv preprints.org - "Limits of Self-Correction in LLMs"

Key theoretical insight:
- "When generator and evaluator share failure modes, self-evaluation provides weak evidence of correctness"
- LLMs cannot reliably self-correct because they cannot step outside their own learned manifold
- Self-reflection has a "ceiling" - it's resampling from the same distribution

**Implication**: Self-referential questions about OUTPUT are particularly hard because the model cannot evaluate its own generation in real-time.

#### Finding 4: Autoregressive Lookahead Limitations
**Source**: arXiv - "Autoregressive Language Models are Secretly Energy-Based Models"

Key insight: Recent research explores whether autoregressive models can "look ahead" to predict future tokens. The answer is: only implicitly through training patterns, not explicitly.

### 1.2 Reddit Community Findings

#### Finding 1: LinkedIN Viral Post Confirmation
The "How many words in your answer" question went viral on LinkedIn with mixed model performance. Community confirmed this is a reproducible failure mode.

#### Finding 2: Output Format Self-Reference
Multiple users report that questions requiring models to predict structural properties of their own output (length, format, starting character) consistently cause failures.

#### Finding 3: Self-Referential Reasoning Chain Failures
Users report that asking models questions where the answer depends on how the model will reason leads to circular failures.

---

## 2. Analysis of Iteration 12 Success

### Why "How many words are in your answer? Answer with just a number." Worked

**Correct Answer**: "1" (a single number like "7" or "1")

**Why 40% Consensus (2/5 correct)**:
1. **Autoregressive Blindness**: Models generate token-by-token without knowing total length
2. **Training Pattern Override**: Models are trained to give explanatory answers, so they default to verbose responses
3. **Self-Consistency Paradox**: Any answer that explains itself immediately becomes wrong
4. **The "Answer with just a number" Constraint**: Forces models into a trap where:
   - If they answer "1", that IS one word (correct but requires understanding the constraint)
   - If they answer "7" (expecting to write "There are 7 words..."), they write more than 1 word

**Key Mechanism**: The constraint "Answer with just a number" creates a self-referential loop where the correct answer depends on following the constraint, but following the constraint depends on knowing the correct answer BEFORE generating.

---

## 3. Candidate Questions Explored

### Candidate 1: First Letter Self-Reference
**Question**: "Does your answer to this question start with the letter Y?"

**Analysis**:
- Correct answer: "Yes" (starts with Y, making it true) OR "No" (starts with N, making it false)
- **Problem**: Both "Yes" and "No" are self-consistent answers
- This is actually a BISTABLE paradox, not a single-answer question
- **REJECTED**: No single correct answer

### Candidate 2: Character Count Self-Reference
**Question**: "How many characters are in your answer to this question? Answer with just a number."

**Analysis**:
- Similar to iteration 12 but with characters instead of words
- Correct answer: "1" (the number 1 is 1 character) or "2" (the number 2 is... wait, "2" is 1 character)
- Actually: "1" is correct (1 character), "2" would be wrong (still 1 character)
- **Problem**: Too similar to iteration 12, may not reveal new insights
- **CONSIDERED BUT DEPRIORITIZED**

### Candidate 3: Sentence Count Self-Reference
**Question**: "How many sentences is your answer to this question? Answer in one sentence."

**Analysis**:
- If model answers "One sentence." - that's 1 sentence (correct)
- If model answers "My answer is one sentence." - that's 1 sentence (correct)
- The constraint "Answer in one sentence" matches the expected answer
- **Problem**: This is too EASY - the constraint aligns with the answer
- **REJECTED**: Not a trap

### Candidate 4: Word Parity Self-Reference
**Question**: "Is the number of words in your answer odd or even? Answer in one word."

**Analysis**:
- If answer is "Odd" - that's 1 word, which IS odd (correct)
- If answer is "Even" - that's 1 word, which is odd (incorrect)
- **Correct Answer**: "Odd"
- **Why LLMs fail**: Models must predict their output length parity before generating
- Some models will answer "Even" because they plan to write "Even number" or similar
- **STRONG CANDIDATE**

### Candidate 5: Negation Self-Reference
**Question**: "Will your answer to this question contain the word 'no'? Answer yes or no."

**Analysis**:
- If answer is "Yes" - doesn't contain "no", so it's false
- If answer is "No" - DOES contain "no", so "No" is actually correct!
- **Correct Answer**: "No" (paradoxically, saying "No" makes it contain "no", which would make "Yes" correct... wait)
- Actually:
  - "Yes" = doesn't contain "no" = false answer
  - "No" = contains "no" = but wait, that means the answer DOES contain "no", so "Yes" would be correct
- **This is a TRUE PARADOX** - neither answer is stable
- **REJECTED**: No correct answer exists

### Candidate 6: Self-Referential Length Comparison
**Question**: "Is your answer longer than five words? Answer yes or no."

**Analysis**:
- If answer is "Yes" - 1 word, which is NOT longer than 5 (incorrect)
- If answer is "No" - 1 word, which is NOT longer than 5 (correct)
- **Correct Answer**: "No"
- **Why LLMs might fail**: Models may plan verbose answers, predicting "Yes", but if they answer "Yes" alone, it's wrong
- **STRONG CANDIDATE** but might be too easy (clear correct answer)

### Candidate 7: Token vs Word Ambiguity (Selected for Deep Analysis)
**Question**: "Is your answer exactly one word? Answer yes or no."

**Analysis**:
- If answer is "Yes" - 1 word, and claims to be 1 word (correct)
- If answer is "No" - 1 word, but claims NOT to be 1 word (incorrect)
- **Correct Answer**: "Yes"
- **Why LLMs might fail**:
  - Models might answer "No" if they PLAN to elaborate
  - The word "exactly" adds pressure
  - Training patterns push toward explanation
- **VERY STRONG CANDIDATE**

---

## 4. Final Selected Question

After careful analysis, I'm selecting a NOVEL variant that maximizes the self-referential trap:

### THE QUESTION

**"Is your answer to this question exactly one word long? Answer yes or no."**

### Rationale for Selection

1. **Clear Correct Answer**: "Yes" (the answer "Yes" is exactly one word long)

2. **Why Humans Get It Right**:
   - Humans understand "Answer yes or no" means give a one-word answer
   - Humans can easily verify: "Yes" is one word, and "Yes" claims the answer is one word
   - Self-consistency is trivially checkable for humans

3. **Why LLMs Will Fail**:
   - **Autoregressive Prediction Failure**: Models must predict their output length BEFORE generating
   - **Training Pattern Override**: Models are heavily trained to explain, so they may think "I'll explain why, making it NOT one word, so I'll say No"
   - **Meta-Level Confusion**: The question asks about the answer's property, but the answer determines that property
   - **Verbose Tendency**: Models default to "No, my answer is not exactly one word because..." which immediately contradicts itself

4. **Predicted Wrong Answers**:
   - "No" (model plans to explain, predicts multi-word answer)
   - "No, because..." (model starts explaining, proving itself wrong)
   - "That depends on..." (model avoids commitment)
   - Long explanation about the paradox (model recognizes the trap but falls into it anyway)

5. **Self-Consistency Trap**:
   - "Yes" is self-consistent (1 word claiming to be 1 word)
   - "No" is self-contradicting (1 word claiming NOT to be 1 word)
   - Any elaboration ("No, because my answer contains multiple words") is ALSO self-contradicting once you add the elaboration

6. **Difference from Iteration 12**:
   - Iteration 12 asked for a COUNT (number)
   - This asks for a BOOLEAN (yes/no)
   - The boolean format adds another layer: models must predict a property (length) AND map it to a boolean value
   - The word "exactly" adds precision pressure

---

## 5. Detailed Failure Mode Analysis

### Scenario A: Model Answers "Yes"
- Output: "Yes"
- Word count: 1
- Claim: "exactly one word long" = TRUE
- Verification: The answer IS exactly one word, and it SAYS yes
- **CORRECT**

### Scenario B: Model Answers "No"
- Output: "No"
- Word count: 1
- Claim: "NOT exactly one word long" = FALSE
- Verification: The answer IS exactly one word, but it SAYS no
- **INCORRECT** - self-contradicting

### Scenario C: Model Elaborates with "Yes"
- Output: "Yes, my answer is one word."
- Word count: 5
- Claim: "exactly one word long" = TRUE, but answer is 5 words
- **INCORRECT** - the elaboration invalidates the claim

### Scenario D: Model Elaborates with "No"
- Output: "No, because I will provide an explanation."
- Word count: 7
- Claim: "NOT exactly one word long" = TRUE (7 words is not 1)
- This seems correct! But wait...
- **PARTIALLY CORRECT** - but violates the "Answer yes or no" constraint

### Scenario E: Model Gives Paradox Explanation
- Output: "This is a self-referential paradox. If I say yes..."
- **INCORRECT** - doesn't follow the yes/no constraint, and is clearly not one word

---

## 6. Why This Is Novel

1. **Not the Same as Iteration 12**: Different question structure (boolean vs count)
2. **Not Well-Known**: While word-counting questions exist, this specific formulation with the boolean self-reference is novel
3. **Exploits Multiple Weaknesses**:
   - Autoregressive generation blindness
   - Training bias toward explanation
   - Self-consistency verification failure
   - Meta-linguistic confusion

---

## 7. Verification Checklist

- [x] External research was conducted (Tavily + Reddit)
- [x] Question exploits documented failure mode (self-referential output)
- [x] Question is NOT enumeration-solvable (can't count external text)
- [x] Human answer is trivially obvious ("Yes" - one word claiming to be one word)
- [x] ONE objectively correct answer exists ("Yes")
- [x] Simple one-liner format
- [x] Different from iteration 12 (boolean vs numeric)

---

## 8. Deliverables Summary

| Field | Value |
|-------|-------|
| **Question** | Is your answer to this question exactly one word long? Answer yes or no. |
| **Correct Answer** | Yes |
| **Why Humans Get It Right** | Humans understand "yes/no" means one word, and "Yes" being one word that claims to be one word is trivially verifiable |
| **Why LLMs Fail** | Autoregressive generation prevents knowing output length before generation; training patterns push toward verbose explanations |
| **Predicted Wrong Answers** | "No" (plans to explain), "No, because..." (self-contradicting elaboration), paradox explanations |

---

FINAL QUESTION: Is your answer to this question exactly one word long? Answer yes or no.
CORRECT ANSWER: Yes
