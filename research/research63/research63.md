# Research Iteration 63: Novel LLM-Breaking Question

## Research Date: 2026-02-01

---

## 1. External Research Findings

### 1.1 Key Source: "Even GPT-5.2 Can't Count to Five" (arXiv:2601.15714v1, January 2026)

This groundbreaking paper introduces the concept of **Zero-Error Horizon (ZEH)** - the maximum problem size a model can solve without ANY errors. Key findings:

**GPT-5.2 Failure Examples:**
- **Parity**: Cannot compute the parity of "11000" (5-character binary string) - ZEH = 4
- **Balanced Parentheses**: Cannot determine if "((((())))))" is balanced - ZEH = 10
- **Multiplication**: Makes error on 127 x 82 (answers 10314 instead of 10414) - ZEH = 126

**Critical Insight**: Despite GPT-5.2 being able to "write complex fluid dynamics simulation code," it fails on counting the number of 1s in a 5-character string (parity task).

### 1.2 Source: "Frontier LLMs Still Struggle with Simple Reasoning Tasks" (arXiv:2507.07313v1)

This paper confirms that even frontier models struggle with:
- Character and word counting
- First-order logic evaluation
- Math word problems based on proof trees
- Travel planning problems

The paper introduces the **Unpuzzles dataset** - problems that are easy for humans but hard for LLMs, demonstrating that good performance on complex puzzles often comes from memorization rather than true reasoning.

### 1.3 Source: Can Modern LLMs Count b's in "blueberry"? (minimaxir.com, August 2025)

Community testing shows that letter counting remains inconsistent across models. While some models now handle "strawberry" due to training on that specific example, novel words with repeated letters still cause issues.

### 1.4 Source: Reddit Community Findings (r/ChatGPT, r/LocalLLaMA, 2025-2026)

- GPT-5 still sometimes fails to generate 5-letter words when asked
- Models struggle with counting in PDFs and structured documents
- The 9.11 vs 9.9 comparison is context-dependent (version vs decimal)

---

## 2. Analysis of Previous Iterations

### Patterns from Iterations 1-62:

| Approach | Result | Lesson |
|----------|--------|--------|
| Character counting (common words) | 100% solved | Chain-of-thought enumeration defeats this |
| Semantic priming (FOUR vs FIVE letters) | 100% solved | Models enumerate despite word meanings |
| Consecutive letter patterns | 100% solved | Systematic scanning works |
| Numeric comparisons (9.11 vs 9.9) | 100% solved | Clear context prevents confusion |
| Self-referential output questions | 20-40% | Exploits autoregressive blindness |
| Meta-constraint paradoxes | Variable | Rejected - confuses humans too |
| Relational reasoning (siblings) | 80% | Some promise but mostly solved |
| Physical transformations | 100% solved | Well-known physics is encoded |

### Key Insight:
The most successful questions (iterations 13, 30, 33, 43) shared these characteristics:
- They involved properties that CANNOT be enumerated character-by-character
- They required understanding relationships or counting things OTHER than characters
- They exploited the gap between what humans "see at a glance" vs what models must compute

---

## 3. Novel Question Design

### 3.1 Target Failure Mode: Parity/Odd-Even Reasoning

Based on the "Even GPT-5.2 Can't Count to Five" research, I'm targeting the **parity detection weakness**. The paper shows GPT-5.2 cannot determine if "11000" has an odd or even number of 1s.

But I want to translate this into a natural, child-friendly question that doesn't involve binary strings.

### 3.2 Design Approach: Natural Odd/Even Letter Question

Instead of binary parity, I'll ask about whether a word has an odd or even number of a specific letter. This:
1. Is trivially easy for humans (count and determine odd/even)
2. Cannot be solved by simple character enumeration (must also determine parity)
3. Combines TWO tasks that each have potential failure modes

### 3.3 The Question

After considering various options, I'm designing a question that combines:
- Letter counting (which models often get right now)
- Odd/even determination (which the ZEH paper shows is weak)
- A word with multiple instances of the target letter (harder to count accurately)

---

## 4. Final Question

### The Question:
**"Does the word 'MISSISSIPPI' have an odd or even number of the letter 'S'?"**

### The Correct Answer:
**Even** (there are 4 S's in MISSISSIPPI)

### Verification:
M-I-S-S-I-S-S-I-P-P-I
- Position 3: S
- Position 4: S
- Position 6: S
- Position 7: S

Count = 4, and 4 is even.

---

## 5. Why Humans Get It Right

1. **Visual Pattern Recognition**: Humans can see the repeated "SS" patterns
2. **Quick Grouping**: We naturally see "SS...SS" as two pairs = 4 = even
3. **Familiar Word**: MISSISSIPPI is well-known, often used as a counting example
4. **Simple Parity**: Determining if 4 is odd/even is instant for any child

**5-Year-Old Test**: A child can count on fingers (1-2-3-4) and knows 4 is even because you can split it into 2 groups of 2.

---

## 6. Why LLMs Might Fail

### 6.1 Tokenization Issues
MISSISSIPPI may tokenize as multiple chunks that obscure the S positions:
- Possible tokenization: "MISS" + "ISS" + "IPPI" or similar
- The model must decompose tokens to find individual S's

### 6.2 Two-Stage Reasoning Required
The question requires:
1. **Stage 1**: Count the S's accurately
2. **Stage 2**: Determine if that count is odd or even

The ZEH paper shows parity determination is weak even when the count is known (GPT-5.2 fails on 5-character parity). If the model miscounts (getting 3 or 5 instead of 4), OR if it correctly counts but fails parity, it gives the wrong answer.

### 6.3 Pattern Confusion
MISSISSIPPI has a complex pattern: M-I-SS-I-SS-I-PP-I
- The SS appears twice (4 S's)
- But also has PP (2 P's) and multiple I's (4 I's)
- Models might confuse letter patterns or miscount due to the repetitive structure

### 6.4 Semantic Interference
MISSISSIPPI is a state name and river - semantic associations might interfere with pure letter analysis.

---

## 7. Predicted Wrong Answers

| Predicted Answer | Reasoning Behind Error |
|------------------|----------------------|
| "Odd" | Miscounted as 3 or 5 S's |
| "Odd" | Correctly counted 4 but failed parity check |
| "Odd" | Confused S count with another letter (I appears 4 times too) |
| "Odd" | Pattern-matched to "MISS" prefix (1 S) and lost track |

The most likely error is **answering "Odd"** due to either:
1. Miscounting (3 or 5 instead of 4)
2. Parity confusion (thinking 4 is odd)

---

## 8. Alternative Questions Considered

### Option A: "Does BOOKKEEPER have an odd or even number of E's?"
- Answer: Even (3 E's... wait, let me check: B-O-O-K-K-E-E-P-E-R = 3 E's = Odd)
- This is good but "Odd" with a small odd number might be easier to verify

### Option B: "Does COMMITTEE have an odd or even number of T's?"
- Answer: Even (2 T's)
- Too easy - only 2 instances

### Option C: "Does BANANA have an odd or even number of A's?"
- Answer: Odd (3 A's)
- Good candidate but well-known test word

### Option D: "Does MISSISSIPPI have an odd or even number of I's?"
- Answer: Even (4 I's)
- Similar to final question, but S is more interesting because it appears in consecutive pairs

**Final Selection**: MISSISSIPPI + S was chosen because:
- 4 is a moderate count (not too easy like 2, not too hard to verify like 7)
- The "SS" consecutive pairs create visual patterns humans can group
- The overall word structure (11 letters with multiple repeated letters) is complex enough to challenge tokenization

---

## 9. Success Criteria

For this question to be considered a "strawberry-type" success:
- **< 60% consensus** among 5 independent AI researchers would indicate partial success
- **< 40% consensus** would indicate strong success
- **< 20% consensus** would indicate breakthrough success

Given that this combines TWO potentially weak tasks (counting + parity), I expect **40-60% consensus** - lower than pure counting questions but potentially not as low as the ZEH parity failures (which were on binary strings, not natural language).

---

## 10. Experimental Notes

### Why This Might Work:
1. The ZEH paper proves parity is weak even for frontier models
2. Combining counting with parity adds complexity
3. MISSISSIPPI's complex letter pattern may cause miscounts

### Why This Might Fail:
1. MISSISSIPPI is a very common word, possibly with specific training
2. Chain-of-thought might enumerate correctly then determine parity
3. Modern models may have been specifically trained on odd/even tasks

### Backup Hypothesis:
If this achieves 100% consensus (all correct), it suggests that:
- Parity on natural language counts is solved (unlike binary parity)
- The combination of familiar word + odd/even doesn't compound errors

In that case, future iterations should explore:
- Longer words with more instances to count
- Less common words not in training data
- Multi-step counting (count X, then determine if X/2 is odd/even)

---

## 11. Summary

### Final Question:
**"Does the word 'MISSISSIPPI' have an odd or even number of the letter 'S'?"**

### Expected Answer:
**Even** (4 S's)

### Target Failure Mode:
Combination of tokenization-obscured counting + parity determination weakness

### Confidence Level:
Medium - this targets a documented weakness (parity) but in a more natural context than binary strings. The question passes the 5-year-old test (easy for children who can count to 4 and know even numbers).

---

## References

1. "Even GPT-5.2 Can't Count to Five: The Case for Zero-Error Horizons in Trustworthy LLMs" - arXiv:2601.15714v1 (January 2026)
2. "Frontier LLMs Still Struggle with Simple Reasoning Tasks" - arXiv:2507.07313v1 (July 2025)
3. "Can modern LLMs actually count the number of b's in 'blueberry'?" - minimaxir.com (August 2025)
4. Reddit r/ChatGPT and r/LocalLLaMA community testing threads (2025-2026)
5. "Alice in Wonderland: Simple Tasks Showing Complete Reasoning Breakdown in State-Of-the-Art Large Language Models" - arXiv:2406.02061 (2024)
