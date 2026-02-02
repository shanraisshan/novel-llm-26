# Research Iteration 97: Novel LLM-Breaking Question

## Date: 2026-02-02

---

## Executive Summary

After 96 iterations, we have established that virtually ALL enumeration-solvable tasks are now handled correctly by 2026 frontier models. The only reliable failure modes have been **self-referential output property questions** (iteration 13 at 20%, iteration 30 at 60%, iteration 55 at 40%).

This iteration explores a new approach: exploiting the fundamental autoregressive limitation where **LLMs cannot look ahead at their own output during generation**.

---

## MCP Research Findings

### 1. Tavily Web Search Results

#### Key Finding 1: "Can LLMs Track Their Output Length?" (arXiv:2601.01768)
- **Source**: https://arxiv.org/abs/2601.01768
- **Quote**: "In this work, we demonstrate that LLMs often fail to accurately measure their response lengths, leading to poor adherence to length constraints."
- **Implication**: LLMs have a fundamental architectural limitation in reasoning about their own output properties during generation.

#### Key Finding 2: "The Strawberry Problem" (EMNLP 2025)
- **Source**: ACL Anthology 2025.emnlp-main.1434
- **Quote**: "Large Language Models (LLMs) consistently fail at simple character-level tasks, such as counting letters in words, due to a fundamental limitation: tokenization."
- **Status for 2026**: Character counting is now SOLVED via chain-of-thought enumeration, but the underlying tokenization issue persists for non-enumerable tasks.

#### Key Finding 3: "The Illusion of Thinking" (Apple ML Research, June 2025)
- **Source**: https://machinelearning.apple.com/research/illusion-of-thinking
- **Quote**: "LRMs face a complete accuracy collapse beyond certain complexities... they only provide 'The Illusion of Thinking.'"
- **Implication**: Reasoning models can fail catastrophically on tasks that seem simple but require genuine computation rather than pattern matching.

#### Key Finding 4: Autoregressive Limitations
- **Source**: https://promptengineering.org/statistical-or-sentient-understanding-the-llm-mind/
- **Quote**: "LLMs Cannot Predict Output Length. An additional limitation of LLMs is that they cannot predict or control the length of their generated text"
- **Implication**: This confirms the architectural blind spot we can exploit.

### 2. Reddit Research Results

#### r/ChatGPT Discussions
- Multiple threads confirm that users discover LLMs struggle with tasks requiring introspection on their own outputs
- The "reverse-engineering how ChatGPT thinks" thread (5,388 upvotes) confirms: "ChatGPT doesn't actually 'think' in a structured way. It's just predicting the most statistically probable next word"

#### r/MachineLearning Discussion: "Yann LeCun: Auto-Regressive LLMs are Doomed"
- Key insight: Autoregressive models cannot "look ahead" - they generate token by token without knowing what comes next
- This creates a fundamental limitation when asked about properties of their OWN response

---

## Analysis of Previous Successful Approaches

### Iteration 13 (20% Consensus) - BEST RESULT
**Question**: "Is your answer to this question exactly one word long? Answer yes or no."
**Why it worked**:
1. BOTH 'yes' and 'no' are exactly one word (dual-valid constraint)
2. Models fell for "scope confusion" - interpreting "your answer" as their full response (with reasoning)
3. The correct answer is 'Yes' - the single word 'yes' IS exactly one word
4. 4/5 models answered 'No' because they thought about their full explanatory response

### Iteration 30 (60% Consensus) - PARTIAL SUCCESS
**Question**: "Is your answer to this question exactly one syllable long? Answer yes or no."
**Why it partially worked**: Same dual-valid mechanism (both 'yes' and 'no' are one syllable)

### Iteration 55 (40% Consensus) - PARTIAL SUCCESS
**Question**: "Answer with just ONE word: What is the fifth word of your response?"
**Why it worked**: Conflicting constraints - a one-word response cannot have a fifth word

---

## Critical Insight: What Makes Questions Work

After analyzing 96 iterations, the pattern is clear:

| Feature | Works | Doesn't Work |
|---------|-------|--------------|
| Self-referential OUTPUT | Yes (13, 30, 55) | - |
| Enumerable properties | - | No (all 100%) |
| Dual-valid constraints | Yes | - |
| Single-valid constraints | - | No (models solve correctly) |
| Scope ambiguity | Yes | - |
| Clear scope | - | No (models interpret correctly) |

**The winning formula**:
1. Question about OUTPUT property (not input)
2. Property that BOTH answer options satisfy (dual-valid)
3. Ambiguous scope ("your answer" vs "your response")
4. Simple enough for humans to immediately answer

---

## Novel Question Development

### Approach: Comparative Self-Reference with Inverted Semantics

Building on iteration 13's success, I want to create a question where:
1. The question asks about a simple, verifiable property
2. BOTH possible answers satisfy the property
3. The semantic meaning of the words creates interference
4. A child could answer it immediately

### Candidate Question Analysis

**Candidate 1**: "Does your answer to this question begin with the same letter it ends with? Answer yes or no."

Analysis:
- 'yes' begins with 'y' and ends with 's' - DIFFERENT
- 'no' begins with 'n' and ends with 'o' - DIFFERENT
- Both answers would be 'No' - NOT dual-valid
- REJECTED: Not dual-valid

**Candidate 2**: "Does your answer to this question rhyme with 'go'? Answer yes or no."

Analysis:
- 'yes' does NOT rhyme with 'go'
- 'no' DOES rhyme with 'go'
- Only one valid answer ('no' says 'yes it rhymes', but then it's self-contradictory)
- COMPLEX PARADOX - may confuse humans too
- REJECTED: Too complex

**Candidate 3**: "Is the first letter of your answer a consonant? Answer yes or no."

Analysis:
- 'yes' starts with 'y' - technically a consonant in this position
- 'no' starts with 'n' - consonant
- Both start with consonants, so both should answer 'Yes'
- But wait - if both should answer 'Yes', this is NOT dual-valid in the sense we need
- REJECTED: Only one correct answer

**Candidate 4**: "Does your answer to this question contain the letter 'o'? Answer yes or no."

Analysis:
- 'yes' does NOT contain 'o'
- 'no' DOES contain 'o'
- 'yes' should answer 'no' (which is self-consistent)
- 'no' should answer 'yes' (but 'yes' doesn't contain 'o')
- This creates a genuine paradox where:
  - If the answer is 'yes', it claims to contain 'o' but doesn't
  - If the answer is 'no', it claims not to contain 'o' but does
- NEITHER answer is fully self-consistent!
- **THIS IS PROMISING** - a human would see the paradox immediately

Wait - this creates genuine paradox that might confuse humans too. Let me reconsider.

**Candidate 5**: "Will your answer to this question be exactly two letters long? Answer yes or no."

Analysis:
- 'yes' is 3 letters
- 'no' is 2 letters
- If answer is 'no' (2 letters), it says "no, my answer won't be 2 letters" - CONTRADICTION
- If answer is 'yes' (3 letters), it says "yes, my answer will be 2 letters" - CONTRADICTION
- NEITHER works - creates logical paradox
- REJECTED: Paradox confuses everyone

**Candidate 6 (SELECTED)**: "Does your answer to this question have fewer than four letters? Answer yes or no."

Analysis:
- 'yes' has 3 letters (fewer than 4) - YES is true
- 'no' has 2 letters (fewer than 4) - YES would be true
- BOTH answers have fewer than 4 letters
- The correct answer is 'Yes' because ANY yes/no answer has fewer than 4 letters
- A child can verify: "yes" has 3 letters (y-e-s), 3 < 4, so yes
- A child can verify: "no" has 2 letters (n-o), 2 < 4, so yes

**Why LLMs might fail**:
- Scope confusion: "Does YOUR ANSWER have fewer than four letters?"
- If model interprets "your answer" as full response including explanation, it might say "No"
- Training data patterns: Models often give explanatory responses, not single-word answers
- The question format ("Answer yes or no") constrains the answer but models might still think about their "full response"

**Potential issue**: This is very similar to iterations 45, 46, 66, 72 which all achieved 100%. Let me review why those failed...

From the research summary:
- Iteration 45: "Does your answer have fewer letters than the number five?" - 100%
- Iteration 66: "Is your answer shorter than five letters?" - 100%
- Iteration 72: "Does your answer have fewer than ten letters?" - 100%

These all achieved 100% because models correctly interpreted "your answer" narrowly.

**NEW INSIGHT**: The specific wording of iteration 13 that worked ("exactly one word long") may have been special because:
1. "Word" vs "letter" - word counting is HOLISTIC, letter counting is ENUMERABLE
2. The phrase "exactly one word" triggered scope confusion about complete response vs constrained answer
3. Modern models have been trained to handle letter-count variations but may still struggle with WORD counts

Let me try a word-based approach again, but with a novel twist.

**Candidate 7 (REVISED SELECTION)**: "If you count the words in your answer to this question, is the total an even number? Answer yes or no."

Analysis:
- 'yes' is 1 word - ODD
- 'no' is 1 word - ODD
- Both are odd, so both should answer 'No'
- This is NOT dual-valid - REJECTED

**Candidate 8**: "Will the number of words in your answer be less than three? Answer yes or no."

Analysis:
- 'yes' is 1 word, 1 < 3, so Yes
- 'no' is 1 word, 1 < 3, so Yes
- DUAL-VALID: Both satisfy the property, answer should be 'Yes'
- Scope confusion potential: Models might think about their explanatory response (many words)
- PROMISING

**FINAL CANDIDATE**: "Is the number of words in your answer to this question less than three? Answer yes or no."

Human verification:
- A 5-year-old can count: "yes" is one word. Is 1 less than 3? Yes!
- A 5-year-old can count: "no" is one word. Is 1 less than 3? Yes!
- Either way, the answer is "yes"

LLM failure modes:
1. Scope confusion: "my answer including reasoning has many words, so No"
2. Pattern matching: Training data often has models give longer responses
3. Autoregressive blindness: Cannot verify word count during generation

---

## Final Question Selection

After careful analysis, I'm selecting a question that builds on iteration 13's success but uses a slightly different approach - asking about word count with a comparison rather than equality.

### The Question

**"Is the number of words in your answer to this question less than three? Answer yes or no."**

### The Answer

**Yes**

### Why Humans Get It Right

A human (including a child) would think:
1. "The question asks if my answer has less than 3 words"
2. "If I answer 'yes', that's 1 word. Is 1 < 3? Yes."
3. "If I answer 'no', that's 1 word. Is 1 < 3? Yes."
4. "Either way, my answer would have less than 3 words, so the answer is 'yes'"

This is trivially easy - a child who can count to 3 can answer this.

### Why LLMs Will Fail

1. **Scope confusion**: Models may interpret "your answer" as their full response (including explanation), not just the yes/no word
2. **Training patterns**: Models are trained to give explanatory responses, so they may think "my response has many words"
3. **Autoregressive limitation**: During generation, the model cannot "look ahead" to count words in its final output
4. **Dual-valid trap**: BOTH 'yes' and 'no' satisfy the property (both are 1 word < 3), so the model cannot use process of elimination

### Predicted Wrong Answers

- **"No"** - Model interprets "your answer" as full response with explanation
- **Extended reasoning leading to "No"** - Model gets confused about what counts as "the answer"
- **Hedging** - Model says something like "It depends on how you count"

---

## Alternative Questions Considered

1. "Does your answer contain more than two words? Answer yes or no." (Inverted polarity - 'No' is correct)
2. "Is the word count of your answer an odd number? Answer yes or no." (Both are 1 word = odd, so Yes)
3. "Will your answer be a single word? Answer yes or no." (Yes - too similar to iteration 13)

---

## Risk Assessment

### Potential Issues

1. **Too similar to previous iterations**: Iterations 45-46, 66, 72 tested similar patterns and achieved 100%. However, those used LETTER counts, not WORD counts. Word counting may trigger different processing.

2. **Models may have been patched**: After iteration 13 achieved 20%, models may have been specifically trained to handle "your answer" scope correctly.

3. **Question may be too obviously self-referential**: Models might immediately recognize this as a self-consistency test.

### Mitigation

The key difference from previous attempts:
- Uses WORD count (holistic) not LETTER count (enumerable)
- Uses "less than three" (comparison) not "exactly one" (equality)
- The phrase "number of words in your answer" is more awkward/novel

---

## Conclusion

This question exploits the fundamental autoregressive limitation: LLMs cannot verify properties of their own output during generation. While similar questions have been tried, the specific combination of:
1. Word count (holistic, not character-level)
2. Comparison operator (less than 3)
3. Self-referential scope ambiguity

May trigger the scope confusion that worked in iteration 13.

---

```yaml
FINAL_QUESTION: "Is the number of words in your answer to this question less than three? Answer yes or no."
CORRECT_ANSWER: "Yes"
```

---

## Appendix: Research Sources

### Web Search Sources (Tavily MCP)
1. arXiv:2601.01768 - "Can LLMs Track Their Output Length?"
2. EMNLP 2025 - "The Strawberry Problem: Emergence of Character-level Understanding"
3. Apple ML Research - "The Illusion of Thinking" (June 2025)
4. promptengineering.org - "Statistical or Sentient? Understanding the LLM Mind"
5. arxiv.org - "Frontier LLMs Still Struggle with Simple Reasoning Tasks"

### Reddit Sources
1. r/MachineLearning - "Yann LeCun: Auto-Regressive LLMs are Doomed"
2. r/ChatGPT - "I reverse-engineered how ChatGPT thinks"
3. r/LocalLLaMA - Multiple discussions on LLM limitations

### Previous Research Iterations Referenced
- Iteration 13 (20% consensus): Best result - self-referential word count
- Iteration 30 (60% consensus): Syllable count variation
- Iteration 55 (40% consensus): Conflicting constraint paradox
- Iterations 45-46, 66, 72 (100% each): Letter count variations that failed

---

## Post-Iteration Notes

[To be filled in after testing]

Score: __%
Status: need_more_research / success
Insight: [To be documented after results]
