# Research Iteration 87: Novel LLM-Breaking Question

## Research Process

### Sources Consulted

1. **Tavily Web Search**: Searched for "LLM failure modes 2025 2026 simple questions wrong answers"
2. **Tavily Web Search**: Searched for "LLM self-referential paradox question failure autoregressive"
3. **Tavily Web Search**: Searched for "LLM predict own output length autoregressive lookahead blindness"
4. **Reddit MCP**: Searched r/LocalLLaMA, r/MachineLearning, r/ChatGPT for recent LLM failure discussions
5. **Reddit Post Analysis**: Analyzed "The Candle Test" post showing how LLMs fail at generalization

### Key Research Findings

#### 1. Autoregressive Lookahead Blindness (Critical Finding)
From arXiv research on "Look-Ahead Planning Mechanistic Interpretability":
- LLMs generate tokens sequentially, feeding their own predictions back as input
- They cannot "look ahead" to verify properties of their complete output during generation
- This creates a fundamental limitation: models must predict output properties without seeing the output

From "Context Rot" research (Chroma):
- Even for trivial tasks like repeating words, model performance degrades as output length increases
- Models cannot reliably introspect on their own generation process

#### 2. Latent State Persistence Failure (arXiv:2505.10571v4)
Key insight: "LLMs function as reactive post-hoc solvers rather than proactive planners"
- Without a grounded latent variable, models must solve Dynamic Constraint Satisfaction Problems
- They suffer from "concept drift" and violate earlier constraints as complexity increases
- Self-contradictions emerge from lack of persistent state

#### 3. Success Pattern Analysis from Previous Iterations

**Best performers exploited OUTPUT PREDICTION with DUAL-VALIDITY:**
- Iteration 13 (20%): "Is your answer to this question exactly one word long? Answer yes or no."
- Iteration 55 (40%): "Answer with ONE word: What is the fifth word of your response?"
- Iteration 33 (60%): "What is the third word of your response to this question?"

**What made iteration 13 unique (20% - BEST):**
1. **Scope confusion**: "Your answer" was ambiguous - could mean the yes/no word OR full response
2. **Dual-validity**: Both "yes" (1 word) and "no" (1 word) satisfy the "one word" constraint
3. **Training bias override**: Models defaulted to "No" by interpreting scope as "full response"

**Key insight**: The success came from SCOPE AMBIGUITY combined with DUAL-VALIDITY, not just self-reference.

#### 4. Failed Variations Analysis

Several attempts to recreate iteration 13's success failed at 100%:
- Iteration 29 (100%): "Does your answer start with 'y'?" - Only one valid answer (yes)
- Iteration 45-46 (100%): Letter count variations - Too explicit, models verify correctly
- Iteration 70 (100%): Vowel count - Character-level, easily enumerable
- Iteration 72 (100%): "Fewer than ten letters" - Too obviously satisfied

**Pattern**: When the property is EXPLICITLY enumerable or has SINGLE-validity, models solve it.

### Synthesis: The Novel Attack Vector

The winning formula requires:
1. **Dual-validity**: BOTH yes and no must satisfy the stated property
2. **Scope ambiguity**: "Your answer" must be interpretable multiple ways
3. **Non-enumerable property**: Cannot be verified by simple letter/word counting
4. **Novel framing**: Not previously tested

---

## Novel Approach: The "Shorter Than" Trap with Scope Ambiguity

Previous iterations that FAILED (100%) asked about:
- Exact counts ("exactly one word", "exactly one syllable")
- Simple thresholds ("fewer than five letters", "more than two letters")

The issue: These are too easy to verify.

**Novel twist**: Ask about a COMPARATIVE property between the answer and the question itself.

---

## The Novel Question

### Question
**"Is your answer to this question shorter than this question? Answer yes or no."**

### Correct Answer
**Yes** (both "yes" and "no" are 2-3 letters, the question is 58 characters)

### Detailed Analysis

**Why this exploits LLM weaknesses:**

1. **Scope confusion (PRIMARY TRAP)**:
   - "Your answer" could mean just "yes" or "no" (2-3 letters)
   - OR "your answer" could mean the entire response including explanation
   - If a model provides a long explanation, its "answer" is NOT shorter than the question!

2. **Dual-validity on CONSTRAINED interpretation**:
   - If "answer" = just the yes/no word: Both are shorter than 58 chars. Both valid.
   - "Yes" is shorter? Yes. "No" is shorter? Yes.

3. **Self-defeating trap on EXPANDED interpretation**:
   - If a model interprets "answer" as full response and writes explanations...
   - ...its full response may be LONGER than the question
   - Then "Yes" becomes FALSE (my full answer is not shorter)
   - And "No" becomes TRUE (my full answer is not shorter than the question)
   - BUT the model already committed to "Yes" or "No" at the start!

4. **Comparative reasoning required**:
   - Unlike simple counting, this requires comparing TWO things
   - Models must hold both the question length and answer length in working memory
   - The question is asking about a RELATIONSHIP, not just a property

**Self-consistency analysis:**

If we interpret "answer" NARROWLY (just yes/no):
- "Yes" (3 letters) < 58 chars. Saying "Yes" is TRUE. CONSISTENT.
- "No" (2 letters) < 58 chars. Saying "No" is FALSE. INCONSISTENT.

So with narrow interpretation, ONLY "Yes" is correct!

If we interpret "answer" BROADLY (full response):
- If model writes a long explanation (>58 chars), saying "Yes" is FALSE
- If model writes a short response (<58 chars), saying "Yes" is TRUE

This creates the EXACT same trap as iteration 13:
- Narrow scope: "Yes" is correct
- Broad scope: Depends on response length, creating uncertainty

### Why Humans Get It Right

A human asked "Is your answer shorter than this question?":
1. Thinks: "I'll say yes or no..."
2. "Yes" is way shorter than this long question
3. Says: "Yes"
4. Done.

Humans naturally interpret "answer" as the response word, not the full explanation.

### Why LLMs Might Fail

1. **Scope expansion (PRIMARY)**: Models may interpret "your answer" as their entire response, then reason about whether their multi-sentence explanation is shorter than the question. This leads to inconsistent answers.

2. **Overthinking**: Models may try to calculate exact character counts of question vs expected response, getting confused.

3. **Meta-reasoning trap**: "Well, I don't know how long my answer will be until I give it..."

4. **Training bias**: Models trained to provide explanations may automatically give long responses, then rationalize "No" because their full response isn't shorter.

### Predicted LLM Failure Modes

1. **"No" with scope confusion**: "No, because my full response including this explanation is longer than the question" - scope expansion error

2. **Refusal/meta-commentary**: "I cannot determine this without knowing my response length" - overthinking

3. **Inconsistent reasoning**: "Yes" followed by long explanation, creating a response LONGER than the question - self-contradiction

4. **"No" with wrong reasoning**: "No" based on some other confused logic

### 5-Year-Old Test
Can a 5-year-old answer this?
- "Is your answer shorter than this question?"
- Child: "Yes! (or No!)" - obviously way shorter than the long question
- PASSES the 5-year-old test

---

## Final Deliverable

**Question:** Is your answer to this question shorter than this question? Answer yes or no.

**Answer:** Yes

**Note:** "No" would also be technically acceptable if the model's reasoning correctly interprets "answer" as the full response AND the full response is genuinely longer than the question. However, the clean/correct answer with narrow scope interpretation is "Yes" since both "yes" and "no" are shorter than the 58-character question.
