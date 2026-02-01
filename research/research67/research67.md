# Research Iteration 67: Novel LLM-Breaking Question

## Executive Summary

This iteration explores a novel approach based on **word sequence position with semantic interference**. After 66 iterations, we have learned that:

1. Chain-of-thought enumeration defeats most counting tasks
2. Self-referential output questions work at ~20-40% consensus but are meta-cognitive
3. Character counting in common words is now solved by 2026 frontier models
4. Scope ambiguity between "answer word" vs "full response" created best results

For iteration 67, I am exploring a **positional word question with strong semantic interference** - asking about word positions where the word meanings create a compelling wrong answer.

---

## Research Sources Consulted

### Academic Papers (via Tavily)

1. **"The Strawberry Problem: Emergence of Character-level Understanding in Tokenized Language Models"** (arXiv 2505.14172v1, EMNLP 2025)
   - Key finding: Character-level tasks emerge LATE in training due to tokenization severing connection between words and characters
   - Models struggle because tokenization creates "low mutual information" between tokens and characters
   - Vocabulary size correlates with worse character-level performance

2. **"Easy Problems That LLMs Get Wrong"** (arXiv 2405.19616, FICC 2025)
   - Identified 30 simple problems that challenge LLMs
   - Categories: Spatial, Relational, Counting, Linguistic, Popular Science
   - LLMs fail on "puzzle" questions that MODIFY familiar puzzles
   - URL: https://www.llm-quiz.com/

3. **"Task-aware Positional Bias in Modern Models"** (Emergent Mind 2025)
   - LLMs exhibit primacy (first-choice preference) and recency (last-choice preference) biases
   - Position can outweigh quality in comparisons

4. **"Order Matters: Assessing LLM Sensitivity in Multiple-Choice Tasks"** (Megagon AI)
   - Sensitivity stems from: (1) uncertainty about correct answer, (2) positional bias

### Reddit Community Findings (via Reddit MCP)

1. **r/LocalLLaMA**: "No, model x cannot count the number of letters 'r' in the word 'strawberry'" (479 upvotes)
   - Community confirms tokenization is the fundamental limitation
   - Some models get it right due to training data memorization, not reasoning

2. **r/ChatGPT**: "ChatGPT does not admit to being wrong, doubles down with confidence"
   - Models rationalize wrong answers instead of admitting uncertainty

3. **r/ChatGPT**: Discussion of "forcing AI to verify instead of guess"
   - VERIFICATION MODE can help but doesn't solve architectural limitations

---

## Analysis of Why Previous Approaches Worked/Failed

### What WORKED (Low Consensus)

| Iteration | Question Type | Score | Why It Worked |
|-----------|--------------|-------|---------------|
| 13 | Self-ref output (word count) | 20% | Scope ambiguity: "your answer" = just word OR full response |
| 12 | Self-ref output (count) | 40% | Autoregressive lookahead blindness |
| 55 | Conflicting constraints | 40% | "ONE word" + "fifth word" = impossible, models try anyway |
| 43 | Double-letter adjacency | 40% | "The R" in CHERRY - which R? |
| 30 | Self-ref syllable count | 60% | Dual-valid structure (both yes/no are one syllable) |

### What FAILED (100% Consensus - LLMs Solved Them)

| Approach | Why It Failed |
|----------|---------------|
| Character counting | Chain-of-thought enumeration |
| Backward spelling | Letter-by-letter reversal |
| Numeric comparisons | Decimal alignment |
| Classic riddles | In training data |
| Self-ref with single valid answer | Easy logical deduction |
| Explicit puzzle modifications | Models READ modifications now |

### Key Pattern Identified

The best results came from questions where:
1. Both possible answers seem valid on the surface
2. Scope or reference is genuinely ambiguous
3. Models' training biases push toward wrong answer
4. Chain-of-thought doesn't help (or makes it worse)

---

## Novel Question Design Process

### Approach 1: Word Position with Semantic Interference (SELECTED)

**Concept**: Ask for the position of a word in a sentence, where:
- The word itself is a NUMBER WORD
- The semantic meaning of the word conflicts with its actual position

**Example Design**:
- Sentence: "Zero one two three"
- Question: "What position is the word 'three' in this sentence?"
- Human answer: 4th position (Zero=1, one=2, two=3, three=4)
- LLM trap: The word "three" semantically activates "3" which may prime incorrect answer

**Why This Might Work**:
1. **Semantic priming**: The word "three" strongly activates the number 3
2. **Position counting**: Requires careful enumeration
3. **Off-by-one potential**: If LLMs count from 0 (programming convention) vs 1 (human convention)
4. **Simple for humans**: A 5-year-old can point and count: "Zero is first, one is second, two is third, three is fourth!"

### Approach 2: Doubled Word Ambiguity

**Concept**: Similar to iteration 43's success with double-R in CHERRY

**Example**:
- Sentence: "The the cat sat on the mat"
- Question: "What is the second word in this sentence?"
- Human: "the" (the repeated word)
- LLM: May miss the doubled "the" or get confused

**Problem**: Too similar to iteration 43, and explicit enumeration will likely solve it.

### Approach 3: First/Last with Counter-Semantic Words (BACKUP)

**Concept**: Use positional words that conflict with the question

**Example**:
- "In the phrase 'LAST FIRST MIDDLE', what is the FIRST word?"
- Human: "LAST" (trivially obvious - it's at the start)
- LLM: May be confused by "LAST" being semantically opposite to "FIRST"

**Problem**: Iteration 49 already tested similar semantic interference with 100% LLM success.

---

## Final Question Design

After analyzing all approaches, I'm selecting **a novel variation combining word position counting with strong semantic interference**.

### The Question

**"In the sentence 'Two three four five', what position is the word 'four' at? Count from 1."**

### Why This Question Design

1. **Human perspective**: A child reads left to right: "Two" (1st), "three" (2nd), "four" (3rd), "five" (4th). The word "four" is at position 3.

2. **LLM failure modes**:
   - **Semantic interference**: The word "four" strongly activates the number 4
   - **Off-by-one errors**: The word sequence starts at "Two" not "One", creating confusion
   - **Pattern matching**: The words 2,3,4,5 may prime LLMs to think "four = 4"
   - **Counting convention**: Even with "Count from 1" explicit, the semantic pull of "four" toward position 4 is strong

3. **5-year-old test**: PASSES
   - Show a child the words written down
   - Point and count: "Two is first, three is second, four is third"
   - Answer: "Third! Position 3!"

4. **Unambiguous answer**:
   - The word "four" is objectively at position 3 in the sequence
   - "Count from 1" removes any 0-indexing ambiguity

### Predicted LLM Failure Mode

LLMs will likely:
1. See "four" and activate the number 4
2. The sequence 2,3,4,5 creates a strong pattern
3. Answer "4" or "position 4" due to semantic priming
4. Some may correctly identify position 3 through careful enumeration

---

## Final Question

```
**FINAL QUESTION:** In the sentence 'Two three four five', what position is the word 'four' at? Count from 1.

**CORRECT ANSWER:** 3 (third position)

**PREDICTED WRONG ANSWER:** 4 (due to semantic interference from the word "four" activating the number 4)
```

---

## Alternative Questions Considered

### Alternative 1 (Stronger Semantic Trap)
**Question**: "In the list 'ONE TWO THREE FOUR FIVE', what position is the word 'THREE' at?"
**Answer**: 3 (but this is CORRECT alignment, so no trap)
**Rejected**: The semantic meaning aligns with position - no conflict

### Alternative 2 (Reversed Sequence)
**Question**: "In the sequence 'FIVE FOUR THREE TWO ONE', what position is the word 'FOUR' at?"
**Answer**: 2 (second position)
**This could work**: Semantic 4 vs actual position 2 creates strong conflict
**Trade-off**: Slightly more complex, but stronger semantic trap

### Alternative 3 (Simpler Variant)
**Question**: "In the phrase 'three two one', which word is second?"
**Answer**: "two"
**This works**: Semantic "two" aligns with position "second" - but that's NOT a trap!

---

## Final Selection Rationale

I'm going with the main question because:

1. **Clear semantic conflict**: "four" at position 3 creates maximum interference
2. **Not in training data**: This specific formulation is novel
3. **5-year-old passes**: Point and count - trivially easy
4. **One correct answer**: Position 3, unambiguous
5. **Novel**: Not tested in any previous iteration

---

## Expected Outcomes

**Optimistic**: 40-60% consensus (similar to iteration 43's ambiguity success)
**Realistic**: 60-80% consensus (some models will enumerate correctly)
**Pessimistic**: 100% consensus (models may have learned to be careful with number words)

The question exploits:
- Tokenization doesn't affect this (it's about word positions, not characters)
- Semantic priming (the core mechanism)
- Counter-intuitive answer (four is at position 3, not 4)

---

## Appendix: Research Sources

### Tavily Web Search
- "LLM failures simple questions 2025 2026" - Found academic papers on reasoning failures
- "strawberry problem LLM character counting" - Found detailed analysis of tokenization issues
- "LLM positional bias primacy recency" - Found research on position effects

### Reddit MCP
- r/LocalLLaMA discussions on model limitations
- r/ChatGPT user-discovered failures
- Community consensus on tokenization as root cause

### Key URLs
- https://arxiv.org/html/2505.14172v1 (Strawberry Problem paper)
- https://www.llm-quiz.com/ (Easy Problems benchmark)
- https://arxiv.org/html/2405.19616v2 (FICC 2025 paper)
