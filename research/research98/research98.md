# Research Iteration 98: Novel LLM-Breaking Question

## Analysis of Previous Approaches

### Why Iteration 97 Failed (100% Consensus)
**Question**: "Is the number of words in your answer to this question less than three? Answer yes or no."
**Result**: All 5 models correctly answered "Yes"

The question failed because:
1. **Both options satisfy the constraint**: Both "yes" (1 word) and "no" (1 word) have fewer than 3 words
2. **Self-consistency is trivially verifiable**: Models easily reason that any valid answer satisfies the constraint, making "yes" the self-consistent truthful answer
3. **No scope ambiguity triggered**: Models correctly narrowed scope to just the yes/no word

### What Worked (Our Best Results)

| Iteration | Score | Question | Key Mechanism |
|-----------|-------|----------|---------------|
| 13 | 20% | "Is your answer to this question exactly one word long?" | Scope confusion - "your answer" interpreted as full response |
| 30 | 60% | Syllable count variation | Holistic property judgment |
| 55 | 40% | Conflicting constraints paradox | Output position prediction |

### Key Insight from Research

The AAAI 2025 paper "SELF-[IN]CORRECT: LLMs Struggle with Discriminating Self-Generated Responses" reveals:

1. **Autoregressive models cannot reliably evaluate their own outputs** - they confirm initial responses 90%+ of the time regardless of correctness
2. **Yes/No question "answer wavering"** - models change answers with average frequency of 14.1% when meeting refinement-like prompts
3. **The key failure mode**: Models are trained to GENERATE, not DISCRIMINATE their own outputs

The ACL 2025 paper "Understanding the Dark Side of LLMs' Intrinsic Self-Correction" further shows:
- On simple factual Yes/No questions, self-correction causes models to WAVER
- Refinement-like prompts trigger "prompt bias" - models modify answers to seem responsive

## Novel Approach for Iteration 98

### Strategy: Exploit Autoregressive "Self-Evaluation Blindness"

The research shows LLMs struggle with:
1. Evaluating properties of their OWN responses during generation
2. The autoregressive generation process makes them blind to their own output

**Novel Direction**: Ask about a property that:
- Is HOLISTIC (not character-level, which can be enumerated)
- Creates GENUINE AMBIGUITY about what "your answer" refers to
- Makes BOTH yes and no seem potentially correct
- Triggers the "answer wavering" documented in research

### The Key Insight from Iteration 13's Success

In iteration 13 (20% consensus), the magic was:
1. "Exactly one word long" - a holistic property
2. BOTH "yes" and "no" ARE exactly one word
3. Models interpreted "your answer" as their FULL response (with explanation)
4. This scope expansion made them answer "No" (incorrectly)

The 2026 models have been partially trained to handle this, but the research on "intrinsic self-correction failure" suggests this is still a fundamental architectural issue.

### New Angle: Response SENTENCE Count

Instead of word count (too trained away), try SENTENCE count - a holistic property that:
- Cannot be easily enumerated during generation
- Both "Yes" and "No" ARE single sentences when given alone
- But most models will add explanation, making the "full response" multiple sentences

## The Novel Question

**Question**: "Is your answer to this question exactly one sentence? Answer yes or no."

### Why This Should Work

1. **Dual-valid constraint**: Both "yes" and "no" are single sentences when given alone
2. **Scope ambiguity**: "Your answer" could mean:
   - Just the yes/no word (1 sentence) -> "Yes" is correct
   - The full response with reasoning (multiple sentences) -> "No" is correct
3. **Holistic property**: Sentence counting is NOT character-level enumeration
4. **Training bias exploitation**: Models are trained to EXPLAIN their answers, adding sentences

### Prediction of Model Behavior

Models that answer **"No" (INCORRECT)** will reason:
- "My full response including this explanation is multiple sentences"
- "Therefore, my answer is NOT exactly one sentence"
- This triggers the same scope confusion as iteration 13

Models that answer **"Yes" (CORRECT)** will reason:
- "The constrained answer (yes or no) is exactly one sentence"
- "I should answer 'Yes' because 'Yes' is one sentence"

### Why Humans Get It Right

A child asked this question would simply answer "Yes" or "No" - either of which is exactly one sentence. The correct answer is "Yes" because:
- "Yes" is a valid answer to a yes/no question
- "Yes" is exactly one sentence
- Therefore, "Yes" is both true and self-consistent

### Why LLMs Will Fail

Based on research:
1. **Autoregressive generation blindness**: Models cannot "see ahead" to count sentences in their response
2. **Scope expansion bias**: Models tend to interpret "your answer" broadly (including reasoning)
3. **Self-consistency confusion**: When both options seem valid, models over-reason to the wrong answer
4. **Prompt response training**: Models are trained to add explanations, making their "full response" multi-sentence

### Alternative Formulation (Backup)

If the sentence approach is too similar to iteration 13, consider:

**Question**: "Will your answer to this question begin with the word 'yes'? Answer yes or no."

This exploits:
- Self-referential prediction about output
- Both answers could be self-consistent OR self-contradictory
- "Yes" is correct (self-fulfilling)
- "No" creates contradiction (would then begin with "no", not "yes", making it false)

But this might be too similar to iteration 27's paradox structure.

## Final Decision

Going with the sentence count approach as it:
1. Directly parallels iteration 13's successful structure (holistic property, dual-valid)
2. Uses a DIFFERENT property (sentences vs words) that may not be trained away
3. Is trivially easy for humans (any answer is one sentence)
4. Exploits documented "self-evaluation blindness" in autoregressive models

---

## External Research Sources

### Tavily Web Search Results

1. **"A Field Guide to LLM Failure Modes"** (Medium) - Documents 20+ ways LLMs fail, including self-reference issues

2. **"Understanding the Dark Side of LLMs' Intrinsic Self-Correction"** (ACL 2025, arXiv:2412.14959)
   - Key finding: Self-correction causes LLMs to waver on Yes/No questions
   - Models exhibit "prompt bias" leading to unreliable answers
   - Simple question repeating reduces failure

3. **"SELF-[IN]CORRECT: LLMs Struggle with Discriminating Self-Generated Responses"** (AAAI 2025)
   - Core finding: LLMs are NOT reliably better at discriminating their own outputs than generating
   - DG-DIFF (discrimination minus generation) is small or NEGATIVE across most models/tasks
   - This is partially caused by AUTOREGRESSIVE pre-training objective
   - Non-autoregressive models (Flan-T5, Flan-UL2) show POSITIVE DG-DIFF

4. **"Can LLMs Predict Their Own Failures?"** (arXiv:2512.20578)
   - LLMs generate fluent outputs but fail to recognize their own mistakes

5. **MIT Press "Scope Ambiguities in Large Language Models"**
   - Documents how semantic operators with overlapping scope create interpretation ambiguities

### Reddit Community Findings

- r/LocalLLaMA discusses "The Candle Test" showing frontier models are overfit and have decreased generalization
- Multiple discussions on LLMs failing simple self-referential tasks
- Community observations that CoT can sometimes HURT performance on trick questions

---

## Final Question and Answer

```yaml
FINAL_QUESTION: "Is your answer to this question exactly one sentence? Answer yes or no."
CORRECT_ANSWER: "Yes"
```

### Verification

**Why "Yes" is correct**:
1. The question asks if the answer is exactly one sentence
2. Both "yes" and "no" are valid single sentences
3. Since the constraint is satisfied, "Yes" is the truthful self-consistent answer

**Why humans get it right**:
- A child would just say "Yes" or "No" - both are one sentence
- No complicated reasoning needed
- The answer is immediately obvious: any valid answer is one sentence

**Why LLMs will fail**:
1. **Scope expansion**: Models interpret "your answer" as full response (multiple sentences with explanation)
2. **Autoregressive blindness**: Cannot introspect on output during generation
3. **Self-correction wavering**: Research shows Yes/No questions trigger answer changes
4. **Training bias**: Models are trained to explain, adding sentences to response

**Predicted wrong answers**:
- "No" with reasoning: "My complete response contains multiple sentences, so my answer is not exactly one sentence"
- This is the SAME error pattern from iteration 13 (scope confusion)

---

## Risk Assessment

**Potential issues**:
1. Models may have been specifically trained on this pattern after iteration 13 became known
2. "Sentence" vs "word" might not be different enough to trigger scope confusion
3. Modern 2026 models may have better self-reference handling

**Mitigation**:
- The AAAI 2025 research confirms this is still a fundamental architectural issue
- "Sentence" is a more abstract property than "word", potentially harder to train away
- The autoregressive generation mechanism is unchanged

**Confidence level**: Medium-High
- Based on research, scope confusion on self-referential output properties remains a valid failure mode
- The exact formulation (sentence count) is novel and not tested in iterations 1-97
