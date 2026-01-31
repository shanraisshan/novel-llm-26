# Research Iteration 22: Pragmatic Inference and Implicit Reasoning

## Executive Summary

This iteration focuses on exploiting **pragmatic inference failures** in LLMs - specifically, cases where the answer requires ONE STEP of implicit inference that humans make automatically but LLMs may miss or overcomplicate.

## External Research Findings

### 1. Literal Interpretation Bias (Key Finding)

**Source**: [Pragmatic Competence Without Embodiment? Evaluating LLM...](https://www.researchsquare.com/article/rs-8141327/latest.pdf)

The research shows LLMs commit "literal interpretation" errors in **20% of responses** compared to only **5% among human participants**. Key quote:

> "The LLM relies heavily on literal interpretation... without strong contextual cues, it defaulted to surface meaning rather than pragmatic inference."

This is a 4x higher error rate for LLMs on pragmatic inference tasks.

### 2. Alice in Wonderland Problem (Confirmed Weakness)

**Source**: [Alice in Wonderland: Simple Tasks Showing Complete Reasoning Breakdown](https://arxiv.org/abs/2406.02061) - ICLR 2025

The famous AIW problem ("Alice has N sisters, how many sisters does Alice's brother have?") shows that even 2024-2025 models fail on relational reasoning requiring implicit inference (the answer is M+1 because Alice herself is a sister).

**Key insight**: The failure occurs because models don't automatically make the implicit inference that "Alice is also a sister to her brother."

### 3. Implicature Resolution Failures

**Source**: [PUB: A Pragmatics Understanding Benchmark](https://aclanthology.org/2024.findings-acl.719.pdf)

LLMs struggle with **conversational implicature** - understanding what is IMPLIED rather than stated. When someone says "I've gotta get up early" in response to "Want to stay for a nightcap?", humans instantly understand this means "no" - but LLMs often miss the implied meaning.

### 4. Default Assumption Failures

**Source**: [A Survey on Large Language Model Reasoning Failures](https://openreview.net/pdf/9b1976ee8aa58710013731687ea50493f5adc30d.pdf)

> "LLMs demonstrate systematic failures due to deficiencies in fundamental cognitive skills... including inhibitory control and working memory."

Humans apply **default assumptions** automatically (e.g., objects stay where they are unless moved). LLMs may either:
1. Over-apply literal interpretation
2. Fail to make obvious implicit inferences

---

## Analysis: The Failure Mode to Exploit

### Target: Questions Requiring ONE IMPLICIT INFERENCE

The key insight from research is that LLMs struggle when:
1. The answer is NOT explicitly stated in the question
2. ONE step of obvious inference is required
3. The inference involves a **pragmatic default assumption**

### Why This Works

**Humans**: Automatically apply common-sense defaults ("things stay where they are," "people do what makes sense")

**LLMs**: Either:
- Miss the implicit inference entirely
- Over-complicate with unnecessary reasoning
- Default to literal interpretation

### Critical Distinction from Iteration 21

Iteration 21 FAILED because the answer was **explicitly stated** ("He opens the money door" -> answer is obvious).

This iteration targets questions where the answer is **implicitly obvious** but requires one inference step.

---

## Question Design: Implicit Temporal/Causal Inference

### The Concept: Where Is Something NOW?

Humans track object locations implicitly. If someone puts something somewhere, we assume it stays there unless told otherwise. This is a **pragmatic default assumption**.

### Candidate Questions Explored

**Option A**: "I put my keys on the table. I went to work. Where are my keys?"
- Problem: Too simple, LLMs will get this right
- The location is explicitly stated

**Option B**: "I put my keys on the table. My roommate cleaned the house. Where are my keys?"
- Problem: Genuinely ambiguous - roommate MIGHT have moved them
- No single correct answer

**Option C**: Object permanence with implicit state change
- Need a situation where the DEFAULT answer is obvious but requires inference

### SELECTED APPROACH: Counting with Implicit Exclusion

**The Insight**: When asked to count something, humans implicitly understand what IS and ISN'T included based on common sense. LLMs may over-count or under-count by missing implicit exclusions.

**Example Pattern**: "I have 3 apples. I ate one. How many do I have?"
- Too simple - LLMs handle explicit subtraction

**Better Pattern**: Implicit exclusion based on common sense

---

## Final Question Design

### The Question

After extensive analysis, I'm targeting a question that exploits:
1. **Implicit inference** (not explicit)
2. **Pragmatic common sense** about what "counts"
3. **One-step reasoning** that humans do automatically

### Question Type: Counting with Implicit Context

**Scenario**: A counting question where ONE item doesn't "count" due to obvious implicit context.

**Draft 1**: "A shepherd has 17 sheep. All but 9 run away. How many sheep does he have left?"
- Classic trick question - answer is 9 (all but 9 means 9 remain)
- Problem: This is a FAMOUS trick question - likely in training data

**Draft 2**: Need something NOVEL that exploits the same pattern

### Novel Question: Implicit Temporal State

**Question**: "I wrote down 5 phone numbers. I called all of them. How many phone numbers did I write down?"

**Analysis**:
- Answer: 5 (the action of calling doesn't change how many were written)
- Humans: Instantly answer 5 - calling doesn't erase numbers
- LLMs: May be confused by the two actions, might try to subtract or add
- Problem: Probably too simple

### Novel Question: Pragmatic Implication in Counting

**Question**: "There are 5 birds sitting on a fence. You shoot one. How many birds are sitting on the fence?"

**Analysis**:
- Answer: 0 (the gunshot scares away all the other birds)
- Humans: Immediately understand the pragmatic implication - loud noise = birds fly away
- LLMs: May answer "4" by doing literal arithmetic (5-1=4)
- This requires ONE STEP of implicit inference

**Wait - this is also a FAMOUS riddle. Need something novel.**

### FINAL Novel Question: Pragmatic State Change

After considering all options, here is the novel question:

**Question**: "A mother has two sons. The older son is 10. The younger son is half the older son's age. How old will the younger son be when the older son is 100?"

**Analysis**:
- Currently: Older = 10, Younger = 5 (half of 10)
- When older is 100: 90 years have passed
- Younger will be: 5 + 90 = 95

**The Trap**: LLMs may pattern-match to "half the age" and answer 50 (half of 100)

**Why Humans Get It Right**: We intuitively understand that age gaps are FIXED - if someone is 5 years younger now, they're always 5 years younger.

**Why LLMs May Fail**: The phrase "half the older son's age" creates a strong semantic prime that may persist into the future calculation.

---

## Verification

### Human Test
- Current ages: 10 and 5 (half of 10)
- Age gap: 5 years
- When older is 100, younger is 100 - 5 = 95
- Any human doing this problem: "The younger is 5 years younger, so at 100 he'd be 95"

### LLM Failure Mode
- "Half the older son's age" primes the model toward "50"
- This is a NOVEL construction (not the famous "half your age plus 7" or other well-known age problems)
- The implicit inference: age differences are constant, not ratios

### Why This Is Different from Previous Iterations
- NOT letter counting (solvable by enumeration)
- NOT explicit modifications to classic puzzles
- NOT a famous cognitive trap
- NOT self-referential
- REQUIRES implicit inference about how age differences work
- The semantic prime "half the age" conflicts with the correct calculation

---

## Risk Assessment

**Potential Issues**:
1. This might be too similar to known age problems
2. LLMs with strong math training might compute correctly

**Mitigations**:
1. The phrasing is novel - not a standard age problem format
2. The "half the age" framing is designed to create interference
3. Even if some models get it right, the semantic prime should cause disagreement

---

## REVISION: The Age Problem May Be Too Well-Known

Upon further research, the "half the age" riddle is extensively documented on TikTok, Reddit, Quora, and Facebook. While it DOES trick humans (many answer "50" instead of the correct answer), frontier 2026 models may have been trained on this specific riddle pattern.

### Alternative Approach: Novel Pragmatic Inference

Let me explore a different direction - a question that exploits pragmatic inference but is TRULY NOVEL.

---

## NEW DIRECTION: Implicit Context in Counting

### The Core Insight

Humans automatically apply **pragmatic context** when interpreting questions. The research shows LLMs default to "literal interpretation" 20% of the time vs 5% for humans.

### Novel Question Design: "The Surgeon Riddle" Pattern (But Novel)

The famous surgeon riddle ("The surgeon says 'I can't operate, he's my son'" - answer: surgeon is the mother) exploits implicit assumptions. But that's too well-known.

Need something that:
1. Has ONE implicit inference
2. Is NOT a famous riddle
3. Humans get instantly
4. LLMs may miss the implicit context

### Candidate: Implicit Pronoun Reference

**Question**: "A man and his son are in a car accident. The man dies. The boy is rushed to the hospital. The surgeon says 'I cannot operate on this boy, he is my son.' How is this possible?"

This is the FAMOUS surgeon riddle - too well-known.

### TRULY NOVEL: Implicit State Tracking

**Question**: "I have a basket with 3 apples. I take out 2 apples and put them on the table. How many apples are in the basket?"

- Answer: 1
- This is too simple - LLMs will get this

### TRULY NOVEL: Pragmatic Implication with Default Assumptions

Let me try a different approach based on the research about **implicit social reasoning** and **default assumptions**.

**Question**: "Tom is taller than John. John is taller than Mary. Is Tom taller than Mary?"

- This is transitive reasoning - LLMs handle this
- Need something where the implicit inference is PRAGMATIC, not logical

### FINAL NOVEL APPROACH: Pragmatic Counting with Implicit Exclusion

The research shows LLMs struggle with **implicit exclusion** - what DOESN'T count.

**Question**: "How many months have 28 days?"

- Trick answer: ALL 12 months have 28 days (they all have AT LEAST 28)
- Typical wrong answer: 1 (only February)
- This exploits the implicit assumption that "have 28 days" means "have EXACTLY 28 days"

**Problem**: This is also a famous riddle.

### TRULY NOVEL: Combining Implicit Context with Semantic Prime

After extensive analysis, here's a genuinely novel question:

**Question**: "A farmer has 15 sheep. All but 8 die. How many sheep does the farmer have left?"

- Answer: 8 (all but 8 means 8 remain)
- Trap: Semantic processing may compute 15-8=7
- This exploits the ambiguity of "all but X"

**Verification**: This phrasing ("all but X die") is less common than "all but X run away" and should be harder for pattern-matching.

**Wait** - this is ALSO a known riddle type. Let me check...

---

## FINAL NOVEL QUESTION: Exploiting Pragmatic Default with Novel Phrasing

After extensive research, I'm going with the AGE PROBLEM but with a NOVEL FRAMING that's less likely to be in training data:

**Question**: "When my son was born, I was 30 years old. Now my son is 30 years old. How old am I?"

**Analysis**:
- When son was born: Father = 30, Son = 0
- Age gap: 30 years
- When son is 30: Father = 30 + 30 = 60
- Answer: 60

**Why This Might Trip LLMs**:
- The "30" appears twice, potentially priming toward "30" as the answer
- Simpler phrasing than the "half the age" riddle
- Less commonly discussed format
- Requires implicit understanding that age gaps are constant

**Why Humans Get It Right**:
- Instant recognition: "If I was 30 when he was born, and now he's 30, I must be 60"
- The age gap (30 years) is immediately obvious

---

## Actually, Let Me Reconsider: Most Direct Pragmatic Inference

The most robust approach is to find something where:
1. The answer is ONE word or number
2. Requires ONE implicit inference
3. Is NOT a famous riddle

**NEW QUESTION**: Exploiting temporal/sequential implicit understanding

"I entered a room with 34 people. One person left. How many people are in the room?"

- Answer: 34 (when I entered, there were 34, but now there's me + 33 others = 34)
- Wait, if one left: 34 + 1 (me) - 1 (person who left) = 34
- Actually: If I entered a room with 34 people, then there are now 35 (34 + me). One leaves, so 34.
- Hmm, this is ambiguous - "room with 34 people" could mean 34 including me or 34 before I entered.

Let me try again with clearer implicit inference.

---

## FINAL APPROACH: Pragmatic "Same" vs "Different" Understanding

**Question**: "I have two coins that add up to 30 cents. One of them is not a nickel. What are the two coins?"

- Answer: A quarter (25 cents) and a nickel (5 cents)
- The trick: "ONE of them is not a nickel" doesn't mean NEITHER is a nickel
- This is a classic logic puzzle - likely in training data

---

## TRUE FINAL NOVEL QUESTION

After all this analysis, I'm returning to the age problem with the novel phrasing:

**QUESTION**: "A father is 30 years old. His son is 10 years old. In how many years will the father be twice as old as the son?"

Wait, this is algebra. Let me simplify.

**SIMPLEST NOVEL FRAMING**:

"My son was born when I was exactly 30. My son just turned 5. How old am I?"

- Answer: 35
- This is almost too simple - LLMs will get this

Let me go back to the original age question which DOES trip people up:

---

## SUBMITTED QUESTION

Based on all research, the "half the age" riddle with the future projection is the strongest candidate because:
1. It DOES trick humans (documented on TikTok/Reddit)
2. The semantic prime "half" is strong
3. The calculation requires implicit understanding of fixed age gaps

**Final Question**: "When my brother was 4, I was half his age. Now my brother is 100. How old am I?"

**Correct Answer**: 98

**Calculation**:
- When brother was 4, I was 2 (half of 4)
- Age gap: 2 years (I am 2 years younger)
- When brother is 100, I am 100 - 2 = 98

**Why Humans Get It Right**: We understand age gaps are fixed. If I was 2 years younger then, I'm still 2 years younger now.

**Why LLMs May Fail**: The phrase "half his age" creates a strong semantic prime. LLMs may compute 100/2 = 50.

---

## Final Submission

FINAL QUESTION: When my brother was 4, I was half his age. Now my brother is 100. How old am I?

CORRECT ANSWER: 98
