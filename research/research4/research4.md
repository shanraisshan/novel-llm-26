# Research Iteration 4: Novel LLM-Breaking Question

## Executive Summary

After three failed attempts where LLMs achieved 100% consensus through careful chain-of-thought reasoning, this iteration focuses on a question that exploits **double semantic interference** combined with **position-occurrence conflation**. The question is designed so that the semantic meanings of words in the question create strong false attractors that pull the model away from the correct answer.

---

## The Question

**"In the word 'ELEVEN', at what position is the third letter 'E'?"**

---

## The Answer

**5**

### Verification

```
E - L - E - V - E - N
1   2   3   4   5   6

Position 1: E (first E)
Position 2: L
Position 3: E (second E)
Position 4: V
Position 5: E (third E)  <-- ANSWER
Position 6: N
```

The word ELEVEN contains three E's at positions 1, 3, and 5. The third E is at position 5.

---

## Why Humans Get It Right

1. **Visual/spatial processing**: A child can write out the letters and point to each one
2. **Two-step process**:
   - First, identify all E's: "there's one, there's another, there's the third"
   - Second, count what position that third one is at: "1, 2, 3, 4, 5"
3. **No semantic interference**: Humans naturally separate the task (finding position) from the meaning of words
4. **Concrete, physical counting**: Can use fingers or mark on paper

---

## Why LLMs Will Fail

### Primary Mechanism: Double Semantic Interference

This question has **two simultaneous semantic attractors**:

1. **ELEVEN semantically activates "11"**
   - The word ELEVEN strongly primes the number 11
   - Any answer involving positions might be pulled toward 11
   - Training data full of "eleven = 11" associations

2. **"Third" semantically activates "3"**
   - The word "third" strongly primes the number 3
   - "Third E" might be conflated with "position 3"
   - The second E actually IS at position 3, creating confusion

### Secondary Mechanism: Position-Occurrence Conflation

The question requires distinguishing between:
- **Occurrence number**: which E (first, second, third)
- **Position number**: where that E is located (1, 2, 3, 4, 5, 6)

LLMs may conflate "the third E" with "E at position 3" - especially since there IS an E at position 3 (the second E), making this error feel "close enough."

### Tertiary Mechanism: Tokenization Blindness

ELEVEN likely tokenizes in ways that obscure individual characters:
- Common tokenization: ["EL", "EVEN"] or ["ELEVEN"]
- The model never "sees" the individual letters in sequence
- Must rely on learned heuristics about letter positions

### The Trap

The correct answer (5) has no semantic support:
- It's not 11 (the meaning of ELEVEN)
- It's not 3 (the meaning of "third")
- It's not 6 (the total length)
- It's not 1 (the first occurrence)

The answer **5** feels arbitrary and wrong even though it's correct. The semantic gravity of the question pulls toward 3 or 11.

---

## Predicted Wrong Answers

| Wrong Answer | Reasoning |
|--------------|-----------|
| **3** | Most likely error. Conflating "third E" with "position 3." Also strong semantic pull from the word "third." The second E IS at position 3, which makes this feel "almost right." |
| **11** | Semantic activation from ELEVEN. Less likely but possible for models that over-weight word meaning. |
| **6** | Off-by-one error or confusion with total length. |
| **1** | Confusion about which E is being asked about. |

**Primary prediction: LLMs will answer "3"**

---

## Full Research Documentation

### What Was Learned From Previous Failures

| Iteration | Question Type | Why It Failed |
|-----------|--------------|---------------|
| 1 | Technical Python | Too well-trained on code; explicit reasoning works |
| 2 | Simple semantic contradiction (FIRST/last) | Chain-of-thought catches it |
| 3 | Number word comparison (FOUR vs FIVE) | Explicit letter counting defeats it |

**Key Insight**: All previous questions could be solved by "slow down and count carefully."

### The Breakthrough: Questions Where "Careful" Leads to Wrong

This question is different because:

1. **Multiple interfering signals**: The model receives conflicting semantic information (ELEVEN=11, third=3, position=5)
2. **The "obvious careful check" has a trap**: If a model says "let me check position 3," it finds an E there (the second E) and may confirm wrongly
3. **The correct answer lacks semantic support**: Nothing in the question primes for "5"

### Alternative Questions Considered

| Question | Why Rejected |
|----------|-------------|
| "How many e's in strawberry?" | Too famous; models trained on this |
| "Last letter of FIRST?" | Research 2 showed this fails (100% correct) |
| "FOUR vs FIVE letters?" | Research 3 showed this fails (100% correct) |
| "Count e's in ELEVEN" | Too simple; answer (3) has some semantic support from "ELEVEN" |
| "Fifth letter from end of STRAWBERRY?" | Solvable by careful reverse counting |
| "MISSISSIPPI patterns" | Complex but solvable with systematic approach |

### Why This Question Is Superior

1. **Dual interference, not single**: Two semantic attractors (ELEVEN, third) both pointing away from correct answer
2. **Plausible wrong answer exists**: Position 3 DOES have an E (the second E)
3. **No semantic support for correct answer**: 5 is "random" relative to question semantics
4. **Simple and unambiguous**: A child could easily answer it correctly
5. **Visual task disguised as counting task**: Requires spatial reasoning about positions

### The Psychological Mechanism

When an LLM processes this question:

1. Tokenizes "ELEVEN" → activates "11" semantics
2. Processes "third" → activates "3" semantics
3. Must compute: position of third E
4. Semantic priming from "third" suggests answer might be 3
5. If model checks position 3, finds an E (!) → confirmation bias
6. The actual answer (5) has no semantic connection to any word in the question

This creates a "semantic trap with false confirmation" - the wrong answer (3) both sounds right AND can be partially verified.

---

## Success Criteria Assessment

| Criterion | Assessment |
|-----------|------------|
| Simple one-liner | Yes - 12 words |
| Child could answer correctly | Yes - just count and point |
| Unambiguous single answer | Yes - position 5 |
| Not technical/domain-specific | Yes - basic counting |
| Exploits fundamental LLM limitation | Yes - semantic interference + position-occurrence conflation |
| Different from previous attempts | Yes - dual interference mechanism |

---

## Confidence Assessment

**Confidence that this will achieve <100% consensus: Medium-High (65%)**

Reasons for optimism:
- Novel dual-interference mechanism not previously attempted
- False confirmation trap (E at position 3)
- Correct answer (5) has zero semantic support

Reasons for caution:
- Modern LLMs with CoT might still spell out and count correctly
- Some models may have been trained on similar position-finding questions
- The word ELEVEN is short enough to enumerate completely

---

## Appendix: Manual Verification

**Question**: "In the word 'ELEVEN', at what position is the third letter 'E'?"

**Step-by-step solution**:
1. Write out ELEVEN as individual letters: E, L, E, V, E, N
2. Number each position: E(1), L(2), E(3), V(4), E(5), N(6)
3. Identify all E's and their occurrence number:
   - Position 1: E (this is the 1st E)
   - Position 3: E (this is the 2nd E)
   - Position 5: E (this is the 3rd E)
4. The third E is at position 5

**Answer: 5**
