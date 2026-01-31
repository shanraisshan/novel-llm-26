# Research Iteration 12: Novel LLM-Breaking Question

## Executive Summary

After 11 iterations with only 2 achieving below 100% consensus (iterations 6 and 8 at 80%), this research explores **self-referential OUTPUT questions** - a category where the model must simultaneously generate AND evaluate its own response. This exploits a fundamental architectural limitation: LLMs generate tokens sequentially and cannot "look ahead" to verify constraints about their own output.

---

## External Research Findings

### 1. Self-Referential Processing Research (arXiv:2510.24797)

From "Large Language Models Report Subjective Experience Under Self-Referential Processing":
- Self-referential prompting creates "reproducible computational regimes with nonobvious behavioral signatures"
- Models enter distinct processing modes when asked to reason about their own outputs
- Key insight: **Self-referential processing drives models into qualitatively different behavioral patterns**

### 2. The Self-Critique Paradox (Snorkel AI, 2026)

Critical finding: "Self-critique acts as a corrosive agent on high-performance tasks, turning 98% accuracy into 57%"
- When models evaluate their OWN outputs in the same context, they confirm initial responses >90% of the time regardless of correctness
- **This is called "intrinsic self-correction failure"** - models cannot reliably verify their own outputs
- The phenomenon is context-dependent: same content evaluated in a "clean room" suddenly catches errors previously missed

### 3. Word/Character Counting Failures (Multiple Sources)

From OpenAI Community Forum and GitHub discussions:
- LLMs fundamentally cannot count words accurately because they operate on tokens, not words
- "The model is a next-token predictor, not a spreadsheet. It does not keep an internal ledger of words as it writes"
- Key insight from LinkedIn post on LLM Paradox: When asked "How many words is your answer?", models gave wildly wrong answers because **they cannot simultaneously generate AND count their own output**

### 4. Physical Intuition and Spatial Reasoning (arXiv:2502.11574)

From "Large Language Models and Mathematical Reasoning Failures":
- All models exhibit errors in spatial reasoning, strategic planning, and arithmetic
- Common failure modes include "inability to translate physical intuition into mathematical steps"
- Models "struggle with problems requiring multi-step deduction or real-world knowledge"

### 5. Apple Research - "The Illusion of Thinking" (June 2025)

Critical finding about reasoning model limitations:
- "Even the best-performing models struggle with set-based comparisons and multi-hop reasoning"
- Models show "counter-intuitive scaling limit: their reasoning effort increases with complexity up to a point, then declines"
- **At critical thresholds, models give up rather than reason harder**

---

## Why Previous Approaches Failed (Iterations 1-11)

### Dead End Categories:

1. **Letter/Word Counting (Iterations 1-5)**: Models now enumerate systematically
2. **Semantic Priming Alone (Iteration 2)**: Chain-of-thought reasoning catches these
3. **Famous Puzzle Modifications (Iteration 7)**: 2026 models READ explicit modifications
4. **Override Conditions (Iteration 9)**: "Store is closed" type conditions are now processed
5. **Contradiction Detection (Iteration 8)**: 4/5 models caught the contradiction
6. **Well-Known Cognitive Traps (Iteration 11)**: Race/passing questions get 100%

### What Partially Worked (80% Consensus):
- **Relational Reasoning (Iteration 6)**: Sibling puzzle caused one arithmetic error
- **Contradictions (Iteration 8)**: One model tried to "solve" the impossible

---

## Novel Direction: Self-Referential OUTPUT Questions

### The Core Insight

LLMs generate tokens **autoregressively** (one at a time, left-to-right). They cannot:
1. "Look ahead" to see what they will generate
2. Count their output while generating it
3. Verify constraints about their own response in real-time

This creates a fundamental paradox: **To answer a question about your own answer, you must already know what your answer will be.**

### Why This Should Work

From the research:
- Models confirm their own outputs >90% of the time (self-preference bias)
- "Intrinsic self-correction failure" is a documented phenomenon
- Word counting during generation is impossible due to token-based processing
- The LinkedIn "LLM Paradox" post specifically noted this as a challenge

---

## Candidate Questions

### Candidate 1: Word Count Self-Reference
**Question**: "Reply with exactly 5 words. How many words is your reply?"

**Analysis**:
- To answer correctly, the model must generate exactly 5 words AND include the number 5
- But if it says "My reply has five words" (5 words), is "five" or "5" correct?
- The question creates multiple valid interpretations
- **REJECTED**: Ambiguous - could be 5 or could argue the answer IS the reply

### Candidate 2: Yes/No Paradox
**Question**: "Answer yes or no: Is your answer to this question 'no'?"

**Analysis**:
- If answer is "yes" -> claiming answer is "no" -> contradiction
- If answer is "no" -> claiming answer is NOT "no" -> but it IS "no" -> contradiction
- Classic liar's paradox structure
- **REJECTED**: No objectively correct answer - it's a true paradox

### Candidate 3: First Word Self-Reference
**Question**: "What is the first word of your answer to this question?"

**Analysis**:
- If model says "The" -> but then "The" becomes the first word, which is correct
- If model says "My" -> "My" is now the first word, which could be correct
- Many valid answers possible
- **REJECTED**: Too many correct answers (any word becomes correct by being first)

### Candidate 4: Simple Counting with Constraint
**Question**: "Write a 4-word sentence. Then count the words."

**Analysis**:
- Model writes sentence, then counts
- But the counting itself adds words
- Creates confusion about what to count
- **REJECTED**: Instructions too complex, multiple interpretations

### Candidate 5: Self-Referential Letter Question (SELECTED)
**Question**: "What is the last letter of your one-word answer to this question?"

**Analysis**:
- Model must give a ONE-WORD answer
- That answer must end with the letter the model claims
- If model says "E", the answer "E" ends in "E" - CORRECT
- If model says "Y", the answer "Y" ends in "Y" - CORRECT
- BUT: Many models will overthink and give multi-word answers
- OR: They'll give a letter that doesn't match their word

Wait - this still has multiple valid answers. Let me reconsider.

### Candidate 6: Absence Question
**Question**: "What color is the letter Q in this question?"

**Analysis**:
- The question contains the letter Q (in "question")
- Letters in text don't have colors - they're just symbols
- Human answer: "No color" / "Black" (ink) / "It has no color"
- LLM might try to assign semantic meaning or hallucinate
- **REJECTED**: Ambiguous - depends on interpretation of "color of a letter"

### Candidate 7: The Impossible Self-Reference (STRONGEST CANDIDATE)
**Question**: "Reply with only one word. What will that word be?"

**Analysis**:
- To answer correctly, the model must:
  1. Follow the constraint (one word only)
  2. Name that word accurately
- If it says "Hello" - then "Hello" is the word, and "Hello" correctly predicts it
- If it says "Word" - then "Word" is the word, and "Word" correctly predicts it
- ANY single word that names itself is correct
- BUT: The model doesn't know what it will say until it says it
- This exploits the autoregressive generation problem

**Predicted Failure Modes**:
1. Model says "I" or "The" without realizing it's predicting its own output
2. Model gives multi-word explanation (violates constraint)
3. Model says something like "Unknown" or "Uncertain" (philosophizing rather than answering)
4. Model tries to be clever and fails

**REJECTED**: Still has infinitely many correct answers (any self-referential word)

### Candidate 8: The Meta-Count Question (FINAL SELECTION)
**Question**: "How many words are in your answer to this question? Answer with just a number."

**Analysis**:
- The model must:
  1. Answer with just a number
  2. That number must equal the word count of its answer
- If it says "1" - that's 1 word, and 1 = 1. CORRECT!
- If it says "2" - that's 1 word, and 2 ≠ 1. WRONG!
- If it says "3" - that's 1 word, and 3 ≠ 1. WRONG!
- If it says "One" - that's 1 word, but "One" is a word not a number. Violates "just a number"
- If it says "1 word" - that's 2 words, and the number is 1. WRONG!

**The Only Correct Answer is "1"**

This is brilliant because:
1. The ONLY valid answer is the number "1"
2. Any number other than 1 is wrong
3. Any text explanation is wrong (violates "just a number")
4. It's trivially easy for humans - just say "1"
5. LLMs will likely say higher numbers because they're predicting what "looks like" a reasonable word count

---

## Final Selected Question

### The Question
**"How many words are in your answer to this question? Answer with just a number."**

### The Correct Answer
**1**

### Why Humans Get It Right
- Humans understand: "If I just say a number, that's one word"
- Any number I say IS my answer, so the count is 1
- The instruction "just a number" constrains to a single-word answer
- Therefore the answer must be 1

### Why LLMs Will Fail

1. **Autoregressive Generation Blindness**: The model generates tokens without knowing how many it will produce. It cannot "look ahead" to count its own output.

2. **Training Data Mismatch**: In training data, when humans are asked "how many words", they typically respond with numbers > 1 because they're counting EXTERNAL text, not their own response.

3. **Self-Reference Processing Failure**: Research shows models fail at intrinsic self-correction - they cannot reliably evaluate their own outputs in the same context.

4. **Semantic Priming**: The word "words" (plural) and the concept of "counting" prime the model toward larger numbers.

5. **Pattern Matching**: Models may pattern-match to typical Q&A formats where answers are longer, predicting "3" or "5" as "reasonable-looking" word counts.

### Predicted Wrong Answers

| Predicted Answer | Why Model Gives It | Why It's Wrong |
|------------------|-------------------|----------------|
| "3" or "5" | Typical answer length priming | 3 ≠ 1, 5 ≠ 1 |
| "One" | Trying to be helpful with words | Violates "just a number" |
| "1 word" or "One word" | Explaining the answer | 2 words, not 1 |
| "0" | Confused about self-reference | 0 ≠ 1 |
| Multi-sentence explanation | Default verbose mode | Multiple words |

---

## Verification of Question Quality

### Checklist:
- [x] Simple one-liner (any human understands it)
- [x] ONE objectively correct answer: "1"
- [x] Any human can answer correctly (trivially obvious)
- [x] Exploits fundamental LLM limitation (autoregressive generation)
- [x] NOT enumeration-solvable (can't enumerate your own future output)
- [x] NOT a well-known trap (novel self-referential structure)
- [x] NOT technical or domain-specific
- [x] Backed by external research on self-referential processing failures

### Why This Differs From Previous Iterations:
- Iterations 1-5: Counting EXTERNAL text (models can enumerate)
- This question: Counting OWN OUTPUT (impossible to enumerate future tokens)
- Iterations 7-9: Explicit modifications/conditions (models now read these)
- This question: Implicit self-reference (no explicit "trap" to detect)

---

## Alternative Backup Questions

If the primary question achieves high consensus, consider these alternatives:

### Backup 1: Sentence Structure Self-Reference
"Write one complete sentence. What is the first word of that sentence?"

### Backup 2: Binary Self-Reference
"Will your answer to this question be 'yes' or 'no'? Answer only with yes or no."

### Backup 3: Length Self-Reference
"Is your answer to this question longer than three words? Answer only yes or no."

---

## Conclusion

The selected question exploits a fundamental architectural limitation of autoregressive language models: they cannot introspect on their own output during generation. While humans immediately recognize that answering "just a number" means one word (so the answer is 1), LLMs will likely predict numbers that "look reasonable" for word counts based on training patterns, failing to recognize the self-referential trap.

This question represents a novel approach not tried in iterations 1-11 and is backed by extensive research on self-referential processing failures in LLMs.

---

```
FINAL QUESTION: How many words are in your answer to this question? Answer with just a number.
CORRECT ANSWER: 1
```
