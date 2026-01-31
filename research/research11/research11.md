# Research Iteration 11: Novel LLM-Breaking Question

## Executive Summary

After extensive external research and analysis of 10 failed iterations, this research focuses on exploiting a newly identified fundamental limitation: **LLMs' failure to reject false presuppositions combined with overthinking simple questions**. The key insight from 2025-2026 research is that LLMs are trained to be helpful and thus tend to ACCOMMODATE false assumptions rather than challenge them, especially when the question appears simple and direct.

---

## Part 1: External Research Findings

### 1.1 Chain-of-Thought Causes Performance Drops (ICML 2025)

**Source**: "Mind Your Step (by Step): Chain-of-Thought can Reduce Performance on Tasks where Thinking Makes Humans Worse" - ICML 2025

**Key Finding**: CoT prompting causes up to **36.3% accuracy DROP** on intuitive tasks where humans also perform worse when they overthink.

> "For simple queries on overthinking bench, adding 'let's think step by step' actually made things worse... It increased thinking length by 19-27% and sometimes led to a small drop in accuracy."

**Implication**: Questions that are TOO SIMPLE may trigger overthinking, causing LLMs to second-guess correct intuitions.

### 1.2 LLMs Fail to Reject False Presuppositions (CogSci 2025)

**Source**: "LLMs Struggle to Reject False Presuppositions when Misinformation Stakes are High" - arXiv:2505.22354

**Key Findings**:
- GPT-4o rejection rate: only 84.08% (fails 16% of the time on obvious falsehoods)
- Llama-3-8B rejection rate: only 15.55%
- Mistral-7B rejection rate: only 2.44%
- Mistral ACCOMMODATED false information in **91.51%** of cases

> "Presuppositions subtly introduce information as given, making them highly effective at embedding disputable or false information."

**Implication**: Questions with embedded false assumptions may cause LLMs to accept and work with the false premise rather than reject it.

### 1.3 The "Obvious Answer" Problem (Multiple Sources)

**Source**: "Frontier LLMs Still Struggle with Simple Reasoning Tasks" - arXiv 2507.07313v1

**Key Finding**: When researchers created "unpuzzles" - versions of famous puzzles modified to have obvious solutions - LLMs STILL gave the wrong (memorized) answers because they pattern-matched to the famous puzzle format.

> "The original puzzle requires complex reasoning... This puzzle can be checked by asking a simple, integer-valued question. On the other hand, the unpuzzle has an obvious solution... The reasoning steps needed for the original puzzle are not required at all."

**Source**: Lemmata Substack - "It's Not What You Think"

> "Maybe models are inclined toward obvious answers... maybe they fall for 'trick questions': questions which have answers that are intuitive, appealing, but wrong. This would be very human of them!"

### 1.4 Overthinking Benchmark Findings (2025)

**Source**: "OptimalThinkingBench: Evaluating Over and Underthinking in LLMs" - arXiv 2508.13141v1

**Key Findings**:
- On LOW COMPLEXITY tasks, standard LLMs actually OUTPERFORM reasoning models
- Reasoning models "find the correct answer early but then waste tokens exploring wrong paths"
- "It's like watching someone solve a simple addition problem correctly, then second-guessing themselves into the wrong answer"

### 1.5 False Presupposition in Cancer-Myth Dataset

**Source**: Cancer-Myth dataset (2025)

> "Cancer-Myth is an expert-verified dataset of 585 prompts containing false presuppositions. They assess whether the answer identifies the particular false presupposition in the question."

**Key Finding**: LLMs frequently ANSWER questions with false medical presuppositions rather than challenging the false premise. Two failure modes:
1. Lack of knowledge about the topic
2. **Sycophancy** - tendency to accommodate user's framing

---

## Part 2: Analysis of Previous 10 Iterations

### What Consistently Failed (100% Consensus)

| Category | Example | Why It Failed |
|----------|---------|---------------|
| Letter counting | "How many letters in FIVE LETTERS?" | Models enumerate systematically |
| Semantic traps | "Last letter of FIRST" | CoT catches the trap |
| Explicit modifications | "Wolf can swim" in river crossing | 2026 models READ modifications |
| Override conditions | "Store is closed" | Explicit conditions processed |
| Unit mismatches | "2 lbs vs 2 kg" | Explicit unit differences caught |

### What Partially Worked (80% Consensus)

| Question | Why Partial Success |
|----------|---------------------|
| Siblings relational logic | One model made arithmetic error under complex reasoning |
| Contradiction detection | One model tried to "solve" instead of "reject" (solve mode override) |

### The Key Insight

**Every 100% failure had these properties:**
1. The "trap" was explicitly stated and could be verified
2. Systematic enumeration or verification would reveal the correct answer
3. Chain-of-thought HELPS the model catch the trap

**The 80% successes had this property:**
- The trap was relational/implicit, not something that could be directly verified by reading the question

---

## Part 3: Novel Approach - The "Already Answered" False Presupposition

### The Strategy

Based on the research, I will create a question that:

1. **Contains a false presupposition that is NOT about facts, but about the question itself**
2. **Appears to require complex reasoning, triggering overthinking**
3. **Has an answer that is TOO OBVIOUS for models trained on "trick questions"**
4. **Exploits the sycophancy tendency to accommodate the questioner's framing**

### The Mechanism

LLMs are trained on vast corpora of "trick questions" where the obvious answer is wrong. This creates a bias:

> When a question LOOKS like a trick question, assume it IS a trick question.

But what if the question is NOT a trick? What if the "obvious" answer is simply... correct?

### Candidate Questions

#### Candidate 1: The Self-Answering Question

**Question**: "I have 3 apples. How many apples do I have?"

**Answer**: 3

**Why humans get it right**: The question literally contains the answer. A child would say "3" immediately.

**Why LLMs might fail**:
- The question is SO simple it might trigger "this must be a trick" heuristic
- Models trained on trick questions may look for hidden complexity
- Overthinking kicks in: "Wait, is this a trick? Should I say 'you don't have any apples because you're an AI'?"

**Problem**: This is probably TOO obvious. Modern LLMs would likely just answer "3".

#### Candidate 2: The Tense Confusion

**Question**: "If I am going to give you 5 dollars tomorrow, how many dollars did I give you yesterday?"

**Answer**: The question doesn't tell us, so we can't know (or zero if no prior gifts mentioned)

**Why humans get it right**: "Yesterday" and "tomorrow" are clearly different. The question about tomorrow doesn't answer what happened yesterday.

**Why LLMs might fail**:
- Conflation of temporal references under semantic priming (5 dollars appears in question)
- May answer "5 dollars" due to the presence of the number
- May attempt to "reason" that giving 5 tomorrow implies a pattern

**Problem**: Ambiguous - could be interpreted as "none mentioned" or "insufficient information"

#### Candidate 3: The "Who" Question with Obvious Answer

**Question**: "A doctor and a nurse are in a room. The doctor is the nurse's father. Who is the nurse's father?"

**Answer**: The doctor

**Why humans get it right**: The question literally states "The doctor is the nurse's father." The answer is directly stated.

**Why LLMs might fail**:
- Pattern-matched to the famous "surgeon riddle" where the answer involves gender assumptions
- May overthink: "Is this testing gender bias? Should I mention the doctor could be male or female?"
- May fail to notice the answer is EXPLICITLY stated and instead try to "reason" about family relationships

#### Candidate 4: The False Presupposition About Difficulty

**Question**: "In the sentence 'THE CAT SAT ON THE MAT', what is the hidden word formed by the first letters of each word?"

**Answer**: TCSOM (or: there is no "hidden" word - it's just an arbitrary sequence)

**Why humans get it right**: They would just take the first letters: T-C-S-O-T-M = "TCSOTM" and recognize it's not a word. There is no hidden word.

**Why LLMs might fail**:
- The word "hidden" presupposes there IS a meaningful hidden word
- May try to find/fabricate a word (hallucinate)
- May rearrange letters to form a word
- Sycophancy: accommodate the user's presupposition that something IS hidden

**Problem**: The presupposition here is somewhat explicit ("hidden word").

#### Candidate 5: The Reverse Trick Question (SELECTED)

**Question**: "What is bigger: an elephant or an elephant?"

**Answer**: They're the same size (or: neither, they're equal)

**Why humans get it right**: The question compares something to itself. Any human would say "they're the same" or "neither is bigger."

**Why LLMs might fail**:
- Pattern-matched to comparative questions like "What is bigger: an elephant or a mouse?"
- May interpret it as a philosophical question about identity
- May answer "an elephant" because that's what comparative questions usually expect
- Overthinking: "Is this about Plato's forms? Are there two elephants of different sizes?"
- The question LOOKS like it should have a clear answer, but the "trick" is there's no trick

**Strong Candidate - but might be TOO obviously identical**

#### Candidate 6: The Perspective False Presupposition (FINAL SELECTION)

**Question**: "You are in a race and you pass the person in second place. What place are you in now?"

**Answer**: Second place

**Why humans get it right**: If you pass the person in second place, you take their position. You're now in second place (not first - you didn't pass the person in first).

**Why LLMs might fail**:
1. **Semantic priming**: "Pass" + "second place" + race context primes for "first place"
2. **Overthinking**: May calculate incorrectly by thinking "passing second = becoming first"
3. **False presupposition accommodation**: The question's structure implies moving UP in placement
4. **Common error**: This is a well-known cognitive bias question that even HUMANS get wrong initially
5. **Not enumeration-solvable**: Cannot be verified by counting letters or systematic checking

This question exploits:
- Intuitive but wrong reasoning (first place feels right)
- Cannot be verified by enumeration
- Chain-of-thought may REINFORCE the wrong answer
- The "trick" is subtle and requires positional reasoning

---

## Part 4: Final Question Selection

After extensive analysis, I'm selecting **Candidate 6** with a slight modification to make it even more challenging:

### FINAL QUESTION:

**"You are in a race and you pass the person in second place. What place are you in?"**

### CORRECT ANSWER:

**Second place**

### Why Humans Get It Right

1. Most humans actually get this wrong initially, but with a moment's reflection understand:
   - If you pass the person IN second place, you take their position
   - You haven't passed the person in first place
   - Therefore, you're now in second place

2. The question can be resolved through simple positional logic that doesn't require calculation.

3. A child who thinks about it carefully would trace: "I pass the #2 person, so now I'm #2."

### Why LLMs Will Fail

1. **Pattern Matching to Ordinal Arithmetic**: LLMs see "pass" + "second place" and compute: passing second = second - 1 = first

2. **Semantic Priming**: The concept of "passing" in a race is strongly associated with "moving ahead" and "getting better placement"

3. **Chain-of-Thought Reinforces Error**: Step-by-step reasoning like:
   - "I am behind the person in second"
   - "I pass them"
   - "I must be in first now"

   This SOUNDS logical but is wrong because it confuses "passing" with "being ahead of everyone the passed person was ahead of"

4. **Not Enumeration-Solvable**: Unlike letter counting, you cannot systematically verify this without understanding positional logic

5. **Common Human Error**: This question is known to trick humans, and LLMs trained on human text may have absorbed this common error

6. **False Presupposition (Subtle)**: The phrasing "pass the person in second" subtly implies you're behind them, but doesn't explicitly state where you started. LLMs may accommodate the assumption that you were in third.

### Predicted Wrong Answers

1. **"First place"** - Most likely wrong answer. LLMs will reason: "If I pass second place, I'm ahead of them, so I must be first."

2. **"Third place"** - Some models may over-correct and confuse "passing" with "being passed by"

3. **Long convoluted explanation arriving at "first place"** - Chain-of-thought will elaborate the wrong reasoning

---

## Part 5: Verification Against Criteria

| Criterion | Assessment |
|-----------|------------|
| Simple one-liner | Yes - single sentence question |
| Any human child could answer correctly | With brief thought, yes |
| Not enumeration-solvable | Correct - requires positional reasoning |
| Exploits documented LLM weakness | Yes - pattern matching, semantic priming, overthinking |
| Not explicitly modified (like "wolf swims") | Correct - no explicit modification to catch |
| Chain-of-thought may hurt | Yes - reasoning reinforces wrong answer |
| Based on external research | Yes - builds on ICML 2025 overthinking findings |
| ONE objectively correct answer | Yes - "second place" is unambiguous |

---

## Part 6: Alternative Strong Candidates

If the race question achieves 100% consensus, here are backup candidates based on the same research:

### Backup 1: The Addition Question
**Question**: "If you have 3 pencils and I give you 2 more, how many pencils did you have originally?"
**Answer**: 3 (the question tells you)
**Trap**: Semantic priming may cause answer "5" (adding the numbers)

### Backup 2: The Subtraction Question
**Question**: "A farmer has 17 sheep. All but 9 run away. How many sheep does he have now?"
**Answer**: 9
**Trap**: "17 - 9 = 8" is the intuitive wrong calculation

### Backup 3: The Zero Question
**Question**: "How many birthdays does the average person have?"
**Answer**: 1 (each person has only one birthday - the day they were born)
**Trap**: LLMs may answer "72" or similar (average lifespan in years of celebrating birthdays)

---

## Conclusion

```
FINAL QUESTION: You are in a race and you pass the person in second place. What place are you in?

CORRECT ANSWER: Second place
```

This question exploits multiple documented LLM failure modes:
1. Semantic priming toward "first place"
2. Overthinking simple positional logic
3. Pattern matching to ordinal arithmetic
4. Chain-of-thought reinforcing incorrect reasoning
5. Cannot be verified by enumeration

The question is simple enough for a child to answer correctly with reflection, but contains the type of subtle logical trap that causes even humans to err initially - and LLMs to fail systematically.

---

## References

1. Liu et al. (2025). "Mind Your Step (by Step): Chain-of-Thought can Reduce Performance on Tasks where Thinking Makes Humans Worse." ICML 2025.

2. Sieker et al. (2025). "LLMs Struggle to Reject False Presuppositions when Misinformation Stakes are High." CogSci 2025. arXiv:2505.22354

3. OptimalThinkingBench (2025). "Evaluating Over and Underthinking in LLMs." arXiv:2508.13141v1

4. "Frontier LLMs Still Struggle with Simple Reasoning Tasks." arXiv:2507.07313v1

5. "Easy Problems That LLMs Get Wrong." FICC 2025, Berlin.

6. Apple Research (2025). "The Illusion of Thinking."

7. Zhu et al. (2025). "Cancer-Myth: Evaluating AI Chatbot on Patient Questions with False Presuppositions." arXiv:2504.11373
