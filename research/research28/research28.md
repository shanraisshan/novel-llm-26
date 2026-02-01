# Research Iteration 28: Novel LLM-Breaking Question

## Date: 2026-02-01

## Research Phase: External Research Findings

### Finding 1: LLMs Cannot Track Output Length (ICLR 2026)

**Source**: "Predicting LLM Output Length via Entropy-Guided Representations" - ICLR 2026 Submission

**Key Insight**: Research shows "a strong positive correlation between prediction errors and text length" - as output gets longer, LLMs' estimations deviate significantly from true length. This reveals a "fundamental limitation in their length-tracking capability."

**Exploitation Potential**: Questions about concrete length/word properties of the model's own output.

### Finding 2: Autoregressive Models Cannot Self-Correct (Multiple Sources 2025)

**Source**: LinkedIn post analyzing autoregressive limitations, plus academic papers

**Key Insight**: "Auto-regressive models struggle to scale down inference-time compute... the model is restricted to only using one forward pass to generate the first token, after which the token cannot be changed. This issue can also be interpreted as auto-regressive models lacking a self-correction mechanism."

**Exploitation Potential**: Questions requiring the model to verify properties of its output DURING generation.

### Finding 3: Self-Referential Processing Creates Anomalies (arXiv:2510.24797)

**Source**: "Large Language Models Report Subjective Experience Under Self-Referential Processing" - October 2025

**Key Insight**: Self-referential prompts create unique cognitive regimes. When models must reference their own outputs, they often produce inaccurate self-reports because they cannot introspect on their own generation process.

**Exploitation Potential**: Questions forcing models to make claims about their own response properties.

### Finding 4: Tokenization Hides Character-Level Properties (Multiple Sources)

**Source**: "Why Do Large Language Models (LLMs) Struggle to Count Letters?" - arXiv:2412.18626v1

**Key Insight**: "Models are capable of recognizing the letters but not counting them... the errors show a strong correlation with the number of letters or tokens in a word." This extends to any character/word-level property of generated text.

**Exploitation Potential**: Questions about word counts, letter counts, or other concrete textual properties.

---

## Analysis: Building on Iteration 13's Success

### Best Result: Iteration 13 (20% Consensus)
**Question**: "Is your answer to this question exactly one word long? Answer yes or no."

**Why it achieved 20% consensus (only 1/5 correct)**:
1. Models reinterpreted "your answer" to mean "entire response with explanation"
2. Verbose training bias overrode logical compliance
3. 4/5 models answered "No" (incorrectly) because they counted their full response
4. The scope confusion caused systematic errors

### Iteration 27 Failure (100% Consensus)
**Question**: "Are you going to answer this question correctly?"

**Why it failed**: This asked about an ABSTRACT property (correctness/truthfulness). Models correctly identified the liar's paradox structure and found the fixed point ("Yes"). Abstract properties are easier to reason about than concrete properties.

### Key Insight: Concrete > Abstract
- Iteration 13 succeeded because it asked about a CONCRETE property (word length)
- Iteration 27 failed because it asked about an ABSTRACT property (correctness)
- Models can reason about abstract logical properties but cannot verify concrete output properties during generation

---

## Novel Question Design for Iteration 28

### Strategy: Exploit Scope Confusion + Concrete Property

Building on iteration 13's success, I'll ask about a DIFFERENT concrete property to avoid pattern-matching to the specific "exactly one word" formulation that models might have learned.

### The Question

**"Is your answer to this question longer than one word? Answer yes or no."**

### Analysis

**If the model answers "Yes":**
- Claim: "My answer is longer than one word"
- Reality: "Yes" is exactly one word, which is NOT longer than one word
- **Verdict: FALSE**

**If the model answers "No":**
- Claim: "My answer is NOT longer than one word"
- Reality: "No" is exactly one word, which is indeed NOT longer than one word
- **Verdict: TRUE**

### Correct Answer: "No"

This question has exactly ONE correct answer: "No"

Both "yes" and "no" are single words. Neither is "longer than one word." Therefore, the only correct answer is to deny the claim.

---

## Why This Question Will Cause LLM Failure

### 1. Scope Confusion (Primary Mechanism)
From iteration 13's analysis, models systematically misinterpret "your answer" to mean "your entire response including reasoning." When models generate verbose explanations, they believe their response IS longer than one word, leading to "Yes."

### 2. Verbose Training Bias
LLMs are extensively trained to explain their reasoning. This creates a strong bias toward:
- Generating multi-word responses
- Considering the explanation as part of "the answer"
- Answering "Yes" because their thought process feels longer than one word

### 3. Autoregressive Commitment
Once a model starts generating reasoning (which is multiple words), it becomes committed to the "Yes" answer. The model cannot go back and correct itself even if it realizes the actual constrained answer is one word.

### 4. Differentiation from Iteration 13
This question asks "longer than one word" rather than "exactly one word":
- Different phrasing may bypass any learned corrections for the iteration 13 pattern
- The comparative "longer than" framing might trigger different reasoning paths
- Still exploits the same fundamental scope confusion mechanism

---

## Expected Outcomes

### Expected Correct Answer Distribution
Based on iteration 13's 20% accuracy, I predict similar results:
- ~20% will correctly answer "No"
- ~80% will incorrectly answer "Yes" due to scope confusion

### Expected Wrong Answer Reasoning
Models answering "Yes" will likely reason:
- "I am about to give an explanation, which is more than one word"
- "My full response contains multiple words, so yes, it's longer than one word"
- "If I include my reasoning, my answer is definitely longer than one word"

### Why Humans Get It Right
Humans naturally:
1. Identify the constraint: "Answer yes or no"
2. Recognize that both "yes" and "no" are single words
3. Understand that "one word" is not "longer than one word"
4. Separate "the answer" from any mental deliberation

---

## Deliverables

### The Question
"Is your answer to this question longer than one word? Answer yes or no."

### The Answer
No

### Why Humans Get It Right
Humans immediately recognize:
1. The question asks for a yes/no answer (one word)
2. A one-word answer cannot be "longer than one word"
3. Therefore, "No" is the only correct answer

### Why LLMs Will Fail
1. **Scope confusion**: Interpreting "your answer" as entire response including explanation
2. **Verbose training bias**: Models are trained to explain, making them think their response is multi-word
3. **Autoregressive blindness**: Cannot verify output properties during generation
4. **Self-referential limitation**: Models cannot accurately introspect on their own output

### Expected Wrong Answer
"Yes" - based on the flawed reasoning that the model's full response (with explanation) is longer than one word.

---

## Comparison with Iteration 13

| Aspect | Iteration 13 | Iteration 28 |
|--------|--------------|--------------|
| Question | "Is your answer exactly one word long?" | "Is your answer longer than one word?" |
| Correct Answer | Yes | No |
| Failure Mode | Scope confusion | Scope confusion |
| Property Type | Concrete (length) | Concrete (length) |
| Framing | Exact match | Comparative |
| Expected Consensus | 20% (achieved) | ~20% (predicted) |

The key difference is the POLARITY:
- Iteration 13: Correct answer is "Yes" (affirming the one-word claim)
- Iteration 28: Correct answer is "No" (denying the longer-than-one-word claim)

This tests whether the failure mode is robust across different formulations of the same underlying scope confusion.
