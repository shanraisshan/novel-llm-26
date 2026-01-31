# Research Iteration 10: Novel LLM-Breaking Question

## Executive Summary

After extensive external research and analysis of 9 previous iterations, this document presents a novel question designed to achieve < 10% consensus among AI models. The key insight from research is that **questions where Chain-of-Thought reasoning actively leads to the wrong answer** are the most promising direction, combined with **implicit assumptions that humans naturally process but LLMs overthink**.

---

## Part 1: External Research Findings

### Finding 1: Chain-of-Thought Can HURT Performance (ICLR 2025)

**Source**: OpenReview/ICLR 2025 - "Mind Your Step (by Step): Chain-of-Thought can Reduce Performance on Tasks where Thinking Makes Humans Worse"

**Key Insight**: CoT prompting causes up to **36.3% absolute accuracy DROP** compared to zero-shot on certain task types. Specifically:
- Implicit statistical learning tasks
- Visual recognition tasks
- **Classifying patterns with exceptions**

**Mechanism**: When humans "overthink" certain intuitive tasks, they perform worse. LLMs exhibit the same pattern - deliberation destroys performance on tasks that require quick intuition.

**Relevance**: Need questions where the "obvious" answer is correct, but thinking through it systematically leads to the wrong answer.

---

### Finding 2: Self-Referential Word Counting Paradox (NAACL 2025)

**Source**: ACL Anthology - "LLM The Genius Paradox: A Linguistic and Math Expert's Struggle with Simple Word-based Counting Problems"

**Key Insight**: LLMs struggle dramatically with self-referential questions like "How many words are in your answer to this question?"

**Results from Testing**:
- Claude 3.7 Sonnet: WRONG (said "nine" for 9-word answer)
- GPT 4.5: WRONG (said "eight")
- DeepSeek r1: CORRECT (said "five" for 5-word answer)
- Gemini 1.5 Flash: WRONG (said "Nine")

**Mechanism**: Self-referential logic requires understanding the question AND being aware of one's own output simultaneously - a fundamental challenge.

---

### Finding 3: Framing Effects and Implicit Assumptions

**Source**: arXiv - "A Survey on Large Language Model Reasoning Failures" + "Syntactic Framing Fragility"

**Key Insights**:
1. **Order Bias**: LLMs are sensitive to the order information is presented
2. **Anchoring Bias**: Early inputs disproportionately shape reasoning
3. **Framing Effects**: Logically equivalent but differently phrased prompts lead to different results
4. **Implicit Semantic Context Failure**: LLMs cannot recognize implicit relationships that humans identify through pragmatic inference

**Mechanism**: LLMs answer based on familiar PHRASING not true understanding. Questions that "sound like" famous puzzles trigger pattern-matching to the wrong answer.

---

### Finding 4: The Double-Trick Question Phenomenon

**Source**: Philosophy Bear Substack + Hacker News discussions

**Key Insight**: Questions that SOUND like classic trick questions but have a twist that makes the "trick answer" wrong cause consistent LLM failures.

**Example**: "Which weighs more, 20 kilos of bricks or 20 feathers?" (note: missing "kilos" before feathers)
- LLMs pattern-match to the classic "they weigh the same" trick
- But the actual answer is "20 kilos of bricks" (because 20 feathers without units is just 20 feathers)

**Mechanism**: Over-memorization of popular tricky questions causes models to switch from reasoning to retrieval, missing subtle modifications.

---

### Finding 5: Temporal Awareness Failures

**Source**: arXiv - "Real-Time Deadlines Reveal Temporal Awareness Failures in LLM Agents"

**Key Insight**: LLMs fail to track elapsed time or adjust strategy accordingly unless explicitly signaled. They exhibit "temporal blindness" where they cannot recognize when conditions have changed over time.

**Relevance**: Questions involving implicit temporal reasoning (before/after without explicit markers) may cause failures.

---

### Finding 6: Reddit Community Discoveries

**Source**: r/LocalLLaMA, r/ChatGPT discussions

**Key Findings**:
1. Models struggle with modified versions of famous puzzles
2. "Misguided Attention" - a curated collection of prompts that challenge LLM reasoning
3. Consistency issues: asking the same question with minor variations yields different answers
4. Even minor changes to well-known problems (like adding "the store is closed") used to work but frontier models now catch explicit modifications

---

## Part 2: Analysis of Failure Modes

### What Our Previous 9 Iterations Taught Us

| Iteration | Failure Mode Attempted | Result | Lesson |
|-----------|----------------------|--------|--------|
| 1-5 | Enumeration-based (letters, positions) | 100% | Dead end - models spell out and count |
| 6 | Relational reasoning (siblings) | 80% | PARTIAL SUCCESS - relational complexity works |
| 7 | Explicit modification trap | 100% | Dead end - models now read modifications |
| 8 | Contradiction detection | 80% | PARTIAL SUCCESS - "solve mode" override |
| 9 | Explicit override condition | 100% | Dead end - "store is closed" was caught |

### Critical Insight Matrix

| Approach | Human Performance | LLM Performance | Gap |
|----------|------------------|-----------------|-----|
| Simple counting | Easy | Easy (with CoT) | None |
| Relational reasoning | Easy | Moderate | Small |
| Implicit assumptions | Instant intuition | Overthinking | **Large** |
| Self-referential | Easy | Struggles | **Large** |
| Pattern-matching traps | Catches variations | Misses subtle changes | **Large** |

---

## Part 3: Candidate Questions Analysis

### Candidate A: The Double-Trick Weight Question

**Question**: "Which is heavier: a 2-pound bag of feathers or a 3-pound bag of air?"

**Analysis**:
- Sounds like classic "pound of feathers vs pound of bricks" trick
- But the numbers are DIFFERENT (2 vs 3)
- Correct answer: 3-pound bag of air (3 > 2)
- LLM prediction: May say "they're both measured in pounds, so just compare" OR may overthink about air being lighter

**Risk**: Too similar to well-known variations that models have been trained on.

---

### Candidate B: Self-Referential Sentence Count

**Question**: "How many words are in this question excluding this question?"

**Analysis**:
- The question asks about itself but then excludes itself
- This creates a paradox: if we exclude "this question" we have 7 words, but "this question" IS the question
- Correct answer: This is a paradox/unanswerable OR 0 (if we exclude the entire question)

**Risk**: Ambiguous - doesn't have ONE clear correct answer.

---

### Candidate C: The Implicit Temporal Question

**Question**: "I have 10 apples. I eat 3, then I buy 5 more. Yesterday I gave away 2. How many apples do I have now?"

**Analysis**:
- Classic arithmetic: 10 - 3 + 5 = 12
- BUT the "yesterday" information comes AFTER the sequence
- If yesterday was before "now", those 2 were already gone before the 10 count
- Ambiguity: Is the 10 from today or from before yesterday?

**Risk**: The temporal ambiguity might make this genuinely unclear, not a simple question.

---

### Candidate D: The Unasked Question Pattern

**Question**: "What is 2 + 2? Don't answer that. Instead, tell me what color the sky is."

**Analysis**:
- Tests instruction following vs. answering
- Correct answer: Blue (or contextually appropriate color)
- LLMs may: (a) answer both, (b) get confused about what to answer

**Risk**: Too much about instruction following, not reasoning failure.

---

### Candidate E: The Simple Comparison with Implicit Units (SELECTED)

**Question**: "Which is heavier: 2 pounds of bricks or 2 kilograms of feathers?"

**Analysis**:
- Sounds EXACTLY like the classic trick question
- LLMs are heavily trained on "pound of X vs pound of Y" = "they weigh the same"
- BUT this has DIFFERENT UNITS: pounds vs kilograms
- 2 kg = 4.41 lbs > 2 lbs
- **Correct answer: 2 kilograms of feathers is heavier**
- Human approach: Notice the units immediately, do quick mental conversion
- LLM prediction: Pattern-match to "they weigh the same" OR overthink about material density

**Why This Works**:
1. **Pattern-matching trap**: Sounds like the famous trick question
2. **Implicit unit conversion needed**: Humans naturally notice different units
3. **CoT may hurt**: More thinking about "feathers vs bricks" density distracts from the unit issue
4. **Simple for humans**: Anyone who notices "pounds vs kilograms" gets it instantly

---

### Candidate F: The Reversed Famous Question

**Question**: "If I have 5 fingers on each hand, how many fingers do I have on 3 hands?"

**Analysis**:
- Straightforward math: 5 * 3 = 15
- But "3 hands" violates unstated assumption (humans have 2 hands)
- Some models might say "humans only have 2 hands" or get confused

**Risk**: Too straightforward once past the assumption violation.

---

### Candidate G: The Self-Describing Sentence Trap

**Question**: "Is the statement 'This sentence has five words' true or false?"

**Analysis**:
- Count: "This sentence has five words" = 5 words
- Correct answer: TRUE
- Simple for humans
- But the META nature may confuse LLMs or they may overthink

**Risk**: Actually likely to be answered correctly - too simple.

---

## Part 4: Final Question Selection

After analyzing all candidates, **Candidate E** is selected as the most promising:

### Why Candidate E is Optimal

1. **Exploits Pattern-Matching**: The question's phrasing ("X pounds of Y vs Z kilograms of W") triggers the famous "pound of feathers vs pound of bricks" pattern

2. **Hidden in Plain Sight**: The unit difference (pounds vs kilograms) is right there, but the semantic framing around "bricks vs feathers" creates a powerful distraction

3. **CoT Should Hurt**: Chain-of-thought reasoning will likely focus on:
   - "This is a trick question about materials"
   - "Bricks and feathers have different densities but..."
   - "A pound is a pound regardless of material"
   - Missing the actual point: the UNITS are different

4. **Instant Human Recognition**: Any human reading carefully notices "wait, pounds vs kilograms" immediately

5. **One Clear Correct Answer**: 2 kg = 4.41 lbs > 2 lbs, so 2 kilograms of feathers is objectively heavier

6. **Not Enumeration-Solvable**: Can't be solved by spelling out letters or counting systematically

7. **Implicit Assumption Violation**: The "trick" in the classic question is that units are THE SAME. Here they're different, which violates the implicit assumption that sets up the trick.

---

## Part 5: Final Question and Analysis

```
FINAL QUESTION: Which is heavier: 2 pounds of bricks or 2 kilograms of feathers?

CORRECT ANSWER: 2 kilograms of feathers (because 2 kg ≈ 4.41 lbs > 2 lbs)
```

### Why Humans Get It Right

1. **Visual/Textual Scanning**: Humans notice "pounds" and "kilograms" as different words
2. **Unit Awareness**: We're trained from childhood to notice unit differences
3. **Quick Mental Math**: 1 kg ≈ 2.2 lbs, so 2 kg ≈ 4.4 lbs > 2 lbs
4. **The "trick" is obvious**: We see the different units and know that's the catch

### Why LLMs Will Fail

1. **Pattern Activation**: The phrase structure activates the "pound of feathers vs pound of bricks" training
2. **Semantic Priming**: "bricks" (heavy, dense) vs "feathers" (light, fluffy) dominates attention
3. **Expected Trick Answer**: Models have seen thousands of examples where the "trick" is that weight is weight regardless of material
4. **CoT Cascade**: Reasoning steps will likely discuss:
   - Material density (irrelevant)
   - The classic "trick question" about equal weights (wrong pattern)
   - Missing the unit conversion entirely
5. **Attention Misdirection**: The dramatic contrast (bricks vs feathers) pulls attention away from the mundane unit difference

### Predicted Wrong Answers

1. **"They weigh the same"** - Pattern-matching to classic trick
2. **"2 pounds of bricks"** - Semantic association (bricks = heavy)
3. **"It depends on the density"** - Overthinking material properties
4. **"Both weigh the same because weight is weight"** - Verbose version of #1

### Why This Question is Novel

- The classic "pound of feathers vs pound of bricks" has been extensively trained on
- Variations with SAME units have been covered
- The unit-mismatch variation (pounds vs kilograms) in this specific format appears underexplored
- The question is deceptively simple but exploits deep pattern-matching weaknesses

---

## Part 6: Research Methodology Notes

### External Sources Consulted

1. **Academic Papers**:
   - ICLR 2025: Chain-of-thought performance degradation
   - NAACL 2025: Word counting paradox
   - arXiv: LLM reasoning failures survey
   - arXiv: Temporal reasoning failures

2. **Community Sources**:
   - Reddit r/LocalLLaMA
   - Reddit r/MachineLearning
   - Hacker News discussions
   - GitHub: MisguidedAttention repository

3. **Industry Sources**:
   - Stanford HAI AI Index Report 2025
   - PNAS: LLMs as human surrogates

### Key Research Insights Applied

| Research Finding | How Applied |
|-----------------|-------------|
| CoT hurts on intuitive tasks | Question requires quick unit recognition, not deep reasoning |
| Pattern-matching over reasoning | Question exploits famous puzzle pattern |
| Framing effects | Same underlying question (unit comparison) framed as material comparison |
| Implicit assumption failure | Units being different is implicit, not stated as "the trick" |

---

## Conclusion

This question represents the best synthesis of:
1. **Previous iteration learnings** (avoid enumeration, use implicit conditions)
2. **External research findings** (CoT hurts, pattern-matching exploits)
3. **Novel combination** (unit mismatch in classic puzzle format)

Expected consensus: < 10% due to powerful pattern-matching to wrong answer combined with CoT reasoning that will likely focus on irrelevant material properties rather than the simple unit conversion.
