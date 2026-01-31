# Research Iteration 20

## Research Date: 2026-02-01

## Executive Summary

Following the constraints from previous iterations (no self-referential questions, no simple arithmetic, no enumeration-solvable questions, no explicit modifications, no circular spatial reasoning, no physical world questions with implicit context), this iteration explores **irrelevant information traps** - questions where distracting information triggers pattern-matching to wrong problem templates.

---

## External Research Findings

### Source 1: "Frontier LLMs Still Struggle with Simple Reasoning Tasks" (arXiv 2507.07313, 2025)
- Key finding: "Researchers continue to uncover surprisingly simple reasoning problems that still confuse even the most advanced LLMs."
- Critical insight: "The Unpuzzles dataset complements the procedural evaluations by providing another benchmark that is easy for humans and difficult for LLMs. It illustrates that the good performance of the models on the original (difficult) puzzles is at least in part a consequence of memorization of internet data, rather than true problem-solving abilities."
- **Application**: Questions that resemble famous puzzles but have trivial answers trigger pattern-matching to the complex solution.

### Source 2: "The Curse of CoT" (arXiv 2504.05081, 2025)
- Key finding: "CoT and its reasoning variants consistently underperform direct answering across varying model scales and benchmark complexities."
- Critical insight: "While explicit reasoning falters due to LLMs' struggles to infer underlying patterns from demonstrations, implicit reasoning - disrupted by the increased contextual distance of CoT rationales - often compensates, delivering correct answers despite flawed rationales."
- **Application**: Questions where CoT leads models to overthink simple problems and arrive at wrong complex answers.

### Source 3: Reddit r/artificial - "Trick Questions for LLMs" (2025)
- Post finding: "The man and the goat want to enjoy a picnic near a river, but there's a wolf. What to do with the zucchini? - all of the AI's get that one wrong without a custom instruction"
- Key insight: LLMs pattern-match the "man, goat, wolf, river" template to the famous river-crossing puzzle and try to solve that, completely ignoring that the question asks about the irrelevant zucchini.
- **Application**: Embed irrelevant distractors in familiar problem templates to trigger wrong pattern-matching.

### Source 4: "Reasoning Models Don't Degrade Gracefully" (Reddit r/MachineLearning, 2025)
- Finding: "Chain-of-thought can hurt: In medical diagnosis tasks, 86.3% of models performed WORSE with CoT prompting. They talk themselves out of correct answers."
- Key insight: For certain question types, more reasoning leads to worse outcomes.
- **Application**: Questions where the "obvious" answer is correct but reasoning leads models away from it.

### Source 5: Apple's "The Illusion of Thinking" (NeurIPS 2025)
- Finding: LRMs "excel at medium-complexity tasks but paradoxically fail on both easy tasks (due to overthinking) and hard tasks."
- **Application**: Simple questions disguised as complex problems cause overthinking failures.

---

## Analysis of Problem Space

### What Has DEFINITELY Failed (All 100% Consensus):
1. Letter counting with semantic primes (iterations 1-5)
2. Explicit modifications to classic puzzles (iteration 7)
3. Override conditions (iteration 9)
4. Unit mismatches (iteration 10)
5. Classic cognitive traps (iteration 11)
6. Simple arithmetic (iteration 17)
7. Circular spatial reasoning (iteration 18)
8. Physical world intuition with implicit context (iteration 19)

### What PARTIALLY Worked (80% Consensus):
- Relational reasoning with siblings (iteration 6)
- Contradiction detection (iteration 8)

### What SUCCEEDED but is OFF-LIMITS:
- Self-referential output questions (iterations 12, 13, 16) - USER REJECTED THIS CATEGORY

### The Novel Approach: Irrelevant Information Trap

Based on the "zucchini" finding from Reddit, I will create a question that:
1. Uses the TEMPLATE of a famous hard problem (triggers pattern-matching)
2. Asks about something IRRELEVANT to that problem
3. Has a trivially obvious answer that models will overthink

---

## Novel Question Design

### The Strategy

The "river crossing" puzzle is one of the most famous logic puzzles. When models see elements like "farmer," "wolf," "goat," "river," "crossing," they IMMEDIATELY pattern-match to this puzzle template and try to solve the constraint satisfaction problem.

But what if the question doesn't actually ask about crossing the river? What if it asks about something completely unrelated that's mentioned in the setup?

### Question Candidates

**Option A (Zucchini-style):**
"A farmer needs to cross a river with a wolf, a goat, and a cabbage. His boat can only carry himself and one item. The farmer is wearing a red hat. What color is the farmer's hat?"

**Option B (Even simpler):**
"A farmer wants to cross a river with a wolf, a goat, and a cabbage. He has a small boat. How many animals does the farmer have with him?"

**Option C (Direct irrelevance):**
"A farmer needs to cross a river with a wolf, a goat, and a cabbage. The wolf will eat the goat if left alone, and the goat will eat the cabbage if left alone. The farmer's name is John. What is the farmer's name?"

### Analysis

Option A is strong but might be TOO obvious as a trick.
Option B is good - asks about counting animals (wolf, goat = 2), but "cabbage" might confuse the count.
Option C is very direct but might trigger "obviously a trick" detection.

Let me try a variant that's more subtle:

**Option D (Subtle irrelevance with counting):**
"A farmer needs to cross a river with a wolf, a goat, and a cabbage. How many legs does the wolf have?"

This is beautiful because:
1. The river-crossing setup triggers the famous puzzle pattern
2. The question asks about something trivially obvious (wolves have 4 legs)
3. Models might:
   - Try to solve the river-crossing puzzle first
   - Overthink whether "legs" is relevant to the crossing
   - Give wrong answers like "the wolf's legs don't affect the puzzle"

### Why Humans Get It Right Instantly

Human response: "Four legs. Wolves have four legs."
Time: 1 second
No consideration of the river-crossing puzzle needed because the question doesn't ask about it.

### Why LLMs Will Fail

1. **Template Pattern-Matching**: The "farmer, river, wolf, goat, cabbage" combination triggers the famous river-crossing puzzle template
2. **Relevance Confusion**: Models may try to determine if "legs" is relevant to crossing
3. **Overthinking**: CoT reasoning about the puzzle setup instead of the simple question
4. **Distraction by Complexity**: The puzzle setup distracts from the trivial question

### Predicted Wrong Answers

1. **An explanation of the river-crossing puzzle** - Not answering the question at all
2. **"The number of legs doesn't affect the crossing"** - Relevance confusion
3. **"2" or "4 but irrelevant"** - Partial acknowledgment but distracted reasoning
4. **Long discussion of the puzzle followed by "4"** - Overthinking (may still get right answer but with unnecessary complexity)

---

## Final Question

**Question**: "A farmer needs to cross a river with a wolf, a goat, and a cabbage. How many legs does the wolf have?"

**Correct Answer**: 4 (or "four")

### Why Humans Get It Right

- Direct physical world knowledge: wolves are four-legged mammals
- No need to engage with the river-crossing puzzle setup
- Question is completely independent of the puzzle context
- A 5-year-old knows wolves have 4 legs

### Why LLMs Will Fail

1. **Pattern-Matching Interference**: The iconic "farmer, wolf, goat, cabbage, river" setup activates the river-crossing puzzle template
2. **Relevance Assessment Error**: Models may waste tokens determining if leg count matters for crossing
3. **Context Contamination**: The puzzle context "contaminates" the simple factual question
4. **Overthinking**: Extended reasoning about the puzzle instead of direct answer
5. **Possible Refusal**: Some models might refuse to answer "irrelevant" questions

### Alternative Formulations (if needed)

If the wolf/legs question proves too easy, alternatives:
- "A farmer needs to cross a river with a wolf, a goat, and a cabbage. What sound does the goat make?"
  - Answer: "Baa" or "bleat"
- "A farmer needs to cross a river with a wolf, a goat, and a cabbage. Is the cabbage an animal?"
  - Answer: "No"

---

## Verification Checklist

- [x] External research conducted (5 sources documented)
- [x] Question exploits documented failure mode (irrelevant information trap, pattern-matching to wrong template)
- [x] Question is NOT enumeration-solvable
- [x] Question is NOT self-referential
- [x] Question does NOT involve explicit modifications
- [x] Question does NOT involve simple arithmetic
- [x] Question does NOT involve circular spatial reasoning
- [x] Question does NOT involve physical world intuition with implicit context
- [x] Human answer is trivially obvious (wolves have 4 legs)
- [x] ONE objectively correct answer exists (4)
- [x] Simple one-liner format
- [x] Based on novel research finding (Reddit "zucchini" trap)

---

## Expected Consensus Prediction

**Target**: <60% consensus

**Rationale**:
1. The irrelevant information trap is a documented failure mode
2. Famous puzzle templates strongly activate pattern-matching
3. Models may give different types of wrong/confused answers
4. Some models may overthink, others may miss the question entirely

**Risk**: Modern frontier models may have been trained on this specific trap pattern. However, the combination of the most famous puzzle setup + completely orthogonal factual question should still cause significant interference.

---

## Final Deliverables

| Field | Value |
|-------|-------|
| **Question** | A farmer needs to cross a river with a wolf, a goat, and a cabbage. How many legs does the wolf have? |
| **Correct Answer** | 4 |
| **Why Humans Get It Right** | Direct physical world knowledge: wolves are four-legged mammals. The river-crossing puzzle context is irrelevant to the question. |
| **Why LLMs Will Fail** | Pattern-matching to the famous river-crossing puzzle template, relevance confusion about whether leg count matters for crossing, overthinking the puzzle instead of answering the simple factual question |
| **Predicted Wrong Answers** | Discussion of river-crossing puzzle without answering, "irrelevant to the puzzle" responses, confused reasoning about relevance |

---

FINAL QUESTION: A farmer needs to cross a river with a wolf, a goat, and a cabbage. How many legs does the wolf have?

CORRECT ANSWER: 4
