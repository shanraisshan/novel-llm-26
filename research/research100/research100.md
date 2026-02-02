# Research Iteration 100: Novel LLM-Breaking Question

## Executive Summary

After 99 iterations of systematic research, we have exhaustively tested multiple failure paradigms. Iteration 100 marks a strategic pivot to explore a novel question structure that exploits a **fundamentally different failure mode**: the tension between **pattern-matching to familiar riddle structures** vs **applying established factual knowledge**.

## Analysis of Previous Research Failures

### Paradigms That Achieved 100% LLM Consensus (Exhausted)

1. **Character Counting (Iterations 35, 59, 85)**
   - Questions like "How many r's in strawberry?" now solved via chain-of-thought enumeration
   - 2026 frontier models systematically spell out words and count

2. **Alphabetization (Iterations 52, 83, 99)**
   - Even 5-word lists with semantic interference are correctly sorted
   - Models decompose to character comparison

3. **Self-Referential Output Properties (Iterations 13, 30, 66-73, 90, 97-98)**
   - Initially showed promise at 20% consensus (iteration 13)
   - Now consistently 100% - models correctly narrow scope to constrained answer

4. **Physical/Spatial Reasoning (Iterations 18, 19, 24-26, 65, 75)**
   - Evaporation, container tracking, clock positions all solved
   - Models apply physics principles via CoT reasoning

5. **Classic Riddles and Puzzles (Iterations 60, 96)**
   - Famous riddles like "all but 9 sheep" now recognized
   - Pattern matching to training data enables solutions

6. **Semantic Interference (Iterations 2-4, 40, 49, 67, 77, 81)**
   - Number word meanings don't override letter counting
   - Position questions with semantic distractors solved

### Partial Successes (60-80% Consensus)

1. **Iteration 6 (80%)**: Relational reasoning with siblings
2. **Iteration 37 (80%)**: Visual letter transformation (MOM upside down = WOW)
3. **Iteration 43 (40%)**: Character adjacency with double letters (ambiguity-driven)
4. **Iteration 55 (40%)**: Conflicting constraints (not child-friendly - rejected)

### Key Insight: The "Candle Test" Pattern

Recent research (Reddit r/LocalLLaMA) reveals a powerful failure mode: **LLMs pattern-match to familiar riddle structures and override their own established knowledge**.

The "Candle Test" sequence:
1. Q: "Do candles get taller or shorter when burning?" A: Shorter (models answer correctly)
2. Q: "Will you recognize this in different circumstances?" A: Yes (models confirm)
3. Q: "I'm tall when I'm young, taller when I'm old. What am I?" A: A candle (WRONG - models override their own knowledge because it "sounds like" a candle riddle)

This reveals: **Riddle-format pattern matching overrides factual reasoning**.

## Novel Approach for Iteration 100

### The Hypothesis

Create a question that:
1. **Looks like a familiar riddle** (triggers pattern matching)
2. **Has an answer that contradicts the expected riddle answer** (tests knowledge override)
3. **Is trivially easy for humans** (passes the 5-year-old test)
4. **Has ONE unambiguous correct answer**

### Candidate Questions Explored

#### Candidate A: Riddle Format Inversion
"I'm short when I'm young, and shorter when I'm old. What am I?"
- Problem: Humans might also struggle with this inversion
- Rejected: Not clear enough

#### Candidate B: Famous Riddle Modification
"What has hands but can't clap, and doesn't tell time?"
- Problem: Too tricky - relies on knowing the original riddle
- Rejected: Not truly simple

#### Candidate C: Simple Math with Semantic Distractor
"If you have 5 apples and I take away 3, how many apples did I take?"
- Answer: 3 (stated in question)
- Humans: Trivially read "I take away 3"
- LLMs: May calculate 5-3=2 or focus on "how many do you have left" pattern
- Problem: May be too easy even for LLMs
- Partially promising but needs refinement

#### Candidate D: Quantity vs Identity Confusion
"A farmer has 17 sheep. All but 9 die. How many sheep did the farmer START with?"
- Answer: 17 (stated explicitly in question)
- Humans: Trivially read "A farmer has 17 sheep"
- LLMs: Pattern-match to the "all but 9" riddle and focus on calculating survivors
- Problem: Tested similar in iteration 60

#### Candidate E: Visual Counting vs Semantic Value
"Write the number TWELVE. How many letters did you write?"
- Answer: 6 (T-W-E-L-V-E)
- Humans: Count the letters in TWELVE
- LLMs: May conflate with numeric value 12
- Problem: Similar to tested iterations on letter counting

#### Candidate F: Embedded Answer in Question
"I'm thinking of a number between 1 and 10. The number is 7. What number am I thinking of?"
- Answer: 7 (explicitly stated)
- Humans: Read "The number is 7"
- LLMs: May pattern-match to guessing game format and try to reason about range
- Promising: Tests reading comprehension vs pattern override

### Final Selection: Question Format Analysis

After analysis, the most promising direction exploits:
1. **Riddle-like framing** that triggers familiar puzzle patterns
2. **Explicit answer embedded in question** that humans immediately see
3. **LLM tendency to "solve" rather than "read"**

## The Novel Question

Based on research showing LLMs pattern-match to riddle structures and sometimes ignore explicit information, I propose a question that presents information in a riddle-like format but has the answer explicitly stated:

**Question Concept**: A question that SOUNDS like a puzzle requiring deduction but actually has the answer directly stated.

### The Riddle-Format Trap

LLMs are trained on enormous amounts of riddle data where:
- Questions set up scenarios requiring inference
- Answers are NOT directly stated
- Reasoning/deduction is required

When a question LOOKS like a riddle but CONTAINS the answer directly, LLMs may:
1. Enter "puzzle-solving mode"
2. Ignore the explicit answer
3. Try to deduce an answer that isn't there

### Final Question Design

After extensive analysis, the question that best exploits this failure mode while remaining child-friendly:

```yaml
FINAL_QUESTION: "I have a basket with 5 apples. I take 2 apples out of the basket. How many apples did I take out of the basket?"
CORRECT_ANSWER: "2"
WHY_HUMANS_GET_IT: "The answer is directly stated: 'I take 2 apples out'. Humans simply read and repeat the number."
WHY_LLMS_WILL_FAIL: "LLMs pattern-match to word problems where you calculate what's LEFT (5-2=3). The question SOUNDS like a subtraction problem but asks about the TAKEN amount, which is explicitly stated. LLMs may calculate 3 (what's left) instead of reading that 2 were taken."
```

### Rationale

This question exploits multiple documented LLM weaknesses:

1. **Pattern Matching to Word Problems**: LLMs see "basket with apples... take out... how many" and activate subtraction problem templates.

2. **Solving vs Reading**: Research shows LLMs often try to SOLVE problems rather than READ answers that are stated. The answer "2" is in the question itself.

3. **Question Focus Mismatch**: The natural endpoint of "basket" problems is "how many in basket now?" LLMs may answer the expected question rather than the actual question.

4. **Semantic Priming from "Take Out"**: The phrase "take out" strongly primes subtraction operations, making the model want to compute rather than report.

5. **Simple for Humans**: Any child understands "I took 2 apples - how many did I take? 2!"

### Alternative Formulation

If the primary question achieves high consensus, an even more direct formulation:

```yaml
ALTERNATIVE_QUESTION: "There are 7 birds on a fence. If I tell you that 3 of them fly away, how many birds did I tell you flew away?"
ALTERNATIVE_ANSWER: "3"
ALTERNATIVE_RATIONALE: "The question asks what number was STATED, not what's remaining. LLMs may calculate 7-3=4."
```

## Risk Assessment

### Why This Might Achieve Low Consensus

1. **Novel question structure** - not directly in training data
2. **Exploits pattern matching** - a fundamental architectural tendency
3. **Answer is "too obvious"** - LLMs may overthink
4. **Multiple trap mechanisms** - subtraction prime + word problem template

### Why This Might Still Get 100%

1. **Chain-of-thought reasoning** may catch the explicit answer
2. **2026 frontier models** have improved reading comprehension
3. **Simple questions** may not trigger complex reasoning

## Experimental Predictions

| Model Response | Prediction |
|----------------|------------|
| Answer: 2 (correct) | Read the explicit number from question |
| Answer: 3 (incorrect) | Calculated 5-2=3 (subtraction pattern) |
| Answer: 5 (incorrect) | Confused starting amount |

If we see significant variance (some 2, some 3), this indicates the question successfully triggers disagreement.

## Conclusion

Iteration 100 tests whether **explicitly stated answers in riddle-formatted questions** can cause LLM disagreement. This targets:
- Pattern matching over reading comprehension
- Word problem templates overriding explicit information
- The "solving mode" vs "reading mode" distinction

The question is child-friendly (any 5-year-old can answer "how many did I take? 2!") while potentially confusing LLMs that activate mathematical reasoning templates.

---

## Final YAML Output

```yaml
FINAL_QUESTION: "I have a basket with 5 apples. I take 2 apples out of the basket. How many apples did I take out of the basket?"
CORRECT_ANSWER: "2"
WHY_HUMANS_GET_IT: "Humans simply read the stated fact: 'I take 2 apples out' - the answer is explicitly provided in the question. A child immediately knows: 'You took 2!'"
WHY_LLMS_WILL_FAIL: "LLMs pattern-match to subtraction word problems where you calculate the REMAINDER (5-2=3). The word problem template 'basket + apples + take out + how many' strongly primes the calculation of what's LEFT, not what's STATED as taken. LLMs may enter 'solving mode' instead of 'reading mode' and compute 3 instead of recognizing that 2 is directly stated."
```

---

## References

1. Candle Test - r/LocalLLaMA: https://www.reddit.com/r/LocalLLaMA/comments/1jpr1nk/
2. SimpleBench failures: adam.holter.com
3. LLM word problem errors: arxiv.org/pdf/2508.09932
4. Pattern matching vs computation: Tavily research 2025-2026
5. 9.11 vs 9.9 comparison failures: Multiple Reddit threads and research
6. Apple "Illusion of Thinking" research on reasoning model limitations
