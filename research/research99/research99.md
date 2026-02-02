# Research Iteration 99: Novel LLM-Breaking Question

## Research Summary

### External Sources Consulted

1. **Tavily Web Search**:
   - LLM failures on simple questions 2025-2026
   - Calendar/date calculation failures
   - Spatial reasoning failures
   - Alphabetization failures (73% error rate!)
   - Paper folding / spatial visualization benchmarks

2. **Reddit MCP**:
   - r/LocalLLaMA thread on "Questions LLMs usually get wrong"
   - Community-discovered failure modes

3. **Key Academic Sources**:
   - SimpleBench: Where everyday human reasoning surpasses frontier models (83.7% human vs 41.7% o1-preview)
   - SortBench: LLM alphabetization failures
   - "Lost in Time": Clock and Calendar Understanding Challenges in MLLMs
   - "Easy Problems That LLMs Get Wrong" (llm-quiz.com)

### Analysis of Previous Iterations

After 98 iterations, the following approaches have been EXHAUSTED:

#### Completely Solved by 2026 Frontier Models (100% consensus):
- Character counting in words (strawberry, blueberry, etc.)
- Self-referential output property questions
- Numeric comparisons (9.11 vs 9.9)
- Classic riddles and puzzles
- Spatial/temporal reasoning via rules
- Physical intuition questions
- Simple alphabetical comparisons (2 words)
- Position-based questions (letter positions in words)

#### Partial Success (still not low enough):
- Iteration 13: 20% - "Is your answer exactly one word long?" (scope confusion)
- Iteration 30: 60% - Syllable count dual-valid
- Iteration 43: 40% - Character adjacency ambiguity
- Iteration 55: 40% - Conflicting constraints (ONE word + fifth word position)

### Key Insight from Research

The most promising finding from external research:

1. **Alphabetization fails 73% of the time** - but only for LONGER lists, not 2-word comparisons
2. **Calendar calculations fail consistently** - LLMs cannot compute day-of-week
3. **Left/right confusion** - VLMs "confidently lie" about orientation

However, the core constraint is: **The question must be answerable by a 5-year-old**.

### Novel Direction: Relative Size/Order Without Enumeration

After extensive analysis, I propose exploring a question that:
1. Requires RELATIVE comparison that humans see instantly
2. Cannot be solved by simple enumeration
3. Exploits training data biases about common facts

### The Question Development Process

**Attempt 1: Calendar calculation**
- "What day of the week was January 1, 2024?"
- PROBLEM: A 5-year-old cannot answer this without a calendar

**Attempt 2: Physical intuition**
- "If you drop an ice cube and a glass of water, which hits the ground first?"
- PROBLEM: Already tested (iteration 19 similar), solved by physics reasoning

**Attempt 3: Alphabetization of longer list**
- "Which word comes first alphabetically: APPLE, APRICOT, or BANANA?"
- PROBLEM: Still enumerable via chain-of-thought

**Attempt 4: Visual property that requires "seeing"**
- "Which lowercase letter looks most like an uppercase letter: b, d, or o?"
- This requires visual comparison that LLMs cannot do - they must access FACTUAL knowledge about letter shapes

Actually, "o" is obviously the same in lowercase and uppercase. A child sees this instantly. But LLMs process letters as tokens, not visual shapes.

Let me refine: "Is the lowercase letter 'o' the same shape as the uppercase letter 'O'?"
- Answer: Yes (in most fonts)
- But this is trivial and models know this fact.

**Attempt 5: Novel spatial arrangement question**
Research shows LLMs fail at "paper folding" style questions. What's a text-based equivalent?

"If you fold a piece of paper in half, then in half again, then punch one hole through all layers, how many holes are in the unfolded paper?"
- Answer: 4 holes
- A child can visualize this (2 folds = 4 layers = 4 holes)
- LLMs struggle with mental simulation

Wait, iteration 26 showed temporal multi-step reasoning IS solved. But that's calendar math, not physical simulation.

Let me verify if this paper folding question is novel and appropriate for a child.

**FINAL QUESTION SELECTION**

After extensive research, I'm selecting a question that exploits a specific failure mode identified in research:

**The relative ordering of written-out numbers vs their numeric values**

Consider: "Which word has more letters: TWELVE or THIRTEEN?"

- TWELVE = 6 letters
- THIRTEEN = 8 letters
- Answer: THIRTEEN

This seems simple, but the semantic priming from numeric values (12 vs 13) combined with the need to count letters creates a specific interference pattern.

BUT - this was already tested in iteration 40 (LONG vs SHORT) and iteration 82 (counting letters across number words) and both got 100%.

**TRULY NOVEL APPROACH**

After all this analysis, I realize the issue: **every enumerable question is solved**.

The ONLY questions that showed low consensus were:
1. Self-referential output properties (scope confusion)
2. Conflicting constraints (logical impossibility)

But self-referential questions are EXHAUSTED and conflicting constraints are NOT strawberry-type (children can't answer them).

**FINAL DIRECTION: Exploiting a specific training data bias**

What if we ask about something where the common belief (what appears most in training data) conflicts with the actual fact?

Example: "Which planet has the most moons?"

Many people might say Jupiter (well-known as the "giant with many moons"), but Saturn now has more confirmed moons (over 140 vs Jupiter's ~95).

BUT - this is trivia/knowledge, not the strawberry paradigm.

**RETURNING TO FUNDAMENTALS**

The strawberry paradigm is about tasks that:
1. Humans do instantly via perception/intuition
2. LLMs cannot do due to tokenization/representation

After 98 iterations, the harsh truth is: **2026 frontier models have solved most of these via chain-of-thought enumeration**.

The ONLY remaining avenue is questions where:
1. The enumeration method ITSELF leads to wrong answer
2. Or where enumeration is not applicable

**FINAL QUESTION**

Based on all research, I propose testing a question about **reversed text** - something humans can visualize but LLMs struggle with:

"If you write the word 'NO' backwards, do you get a word that means the opposite?"

- Writing NO backwards gives "ON"
- "ON" is NOT the opposite of "NO" (it's the opposite of "OFF")
- Answer: No

This tests:
1. Text reversal (tokenization challenge)
2. Semantic knowledge (what is the opposite of NO)
3. Multi-step reasoning that can lead models astray

A child can:
1. Write NO backwards -> ON
2. Know that ON is not the opposite of NO (YES would be)
3. Answer "No"

BUT - models might:
1. Pattern-match to "opposites" concept
2. Think NO/ON are opposites somehow
3. Conflate word reversal with meaning reversal

Actually, this is too complex. Let me simplify.

---

## FINAL QUESTION SELECTION

After extensive research and analysis, I'm proposing a question that tests a very specific failure mode: **counting across word boundaries in a phrase where semantic content conflicts with the counting task**.

But actually, the research shows this is already solved (iteration 64, 82).

**THE HARD TRUTH**: After 98 iterations, virtually ALL simple questions are now solved by 2026 frontier models via chain-of-thought reasoning.

The only remaining options are:
1. Questions requiring VISUAL/PHYSICAL knowledge not learnable from text
2. Questions where the common answer in training data is WRONG
3. Self-referential paradoxes (already exhausted, and not child-friendly)

**NOVEL APPROACH: Testing a specific visual property**

"Does the letter 'b' look like the letter 'd' flipped horizontally?"

- Answer: Yes (b is a horizontally mirrored d)
- A child can visualize this instantly
- LLMs cannot "see" letters - they access factual knowledge

This tests:
1. Visual/spatial knowledge about letter shapes
2. Mental transformation (horizontal flip)
3. Comparison of the result

Actually, this is factual knowledge that LLMs likely have. Let me think more carefully.

**MOST PROMISING UNTESTED DIRECTION**

From the SimpleBench research: "spatio-temporal reasoning" and "linguistic adversarial robustness" are where humans (83.7%) significantly outperform LLMs (41.7%).

One question type from SimpleBench that wasn't tested in our iterations:

**Questions about the ORDER of events described out of order**

"Tom brushed his teeth. Before that, he woke up. After brushing his teeth, he ate breakfast. What did Tom do second?"

- The events in chronological order: woke up -> brushed teeth -> ate breakfast
- "Second" = brushed teeth
- Answer: brushed teeth

This tests:
1. Temporal reasoning with "before" and "after" keywords
2. Reordering events from a non-chronological description
3. Identifying a specific ordinal position

A child can sort through this with some effort. LLMs might struggle with the temporal reordering.

BUT - iteration 26 showed temporal reasoning IS solved.

---

## DECISION

After exhaustive research, I'm selecting a question that:
1. Tests a failure mode documented in SimpleBench
2. Is simple enough for a child
3. Has not been directly tested in our iterations

**FINAL QUESTION**:

"I'm facing north. I turn left. I turn left again. Which direction am I now facing?"

- Start: North
- Turn left: West
- Turn left again: South
- Answer: South

This tests:
1. Sequential state tracking (direction after each turn)
2. Spatial/directional reasoning
3. Simple enough for a child with basic compass knowledge

However, iteration 78 tested perspective/spatial reasoning and got 100%. Let me verify this is different.

Iteration 78 was about facing someone and determining left/right mirroring. This is about compass directions after sequential turns. Different enough to test.

Actually, compass turns are very basic and likely in training data extensively.

---

## FINAL FINAL DECISION

Given the extreme difficulty of finding novel failure modes after 98 iterations, I'll propose a question that combines TWO elements that showed some promise:

1. **Semantic interference** (from number words)
2. **Relative comparison** that CANNOT be enumerated character-by-character

**THE QUESTION**:

"If I alphabetize the numbers ONE, TWO, THREE, FOUR, FIVE by their spellings, which number is in the middle?"

- Alphabetical order: FIVE, FOUR, ONE, THREE, TWO
- Middle (3rd of 5): ONE
- Answer: ONE

This tests:
1. Alphabetization (documented 73% failure rate for lists)
2. Semantic interference from numeric values (ONE=1, should it be first?)
3. Finding the middle of a 5-item list

A child who knows alphabetical order can work through this. LLMs might struggle with:
- The semantic pull of numeric ordering (1,2,3,4,5)
- Alphabetizing a 5-word list (harder than 2 words)
- Correctly identifying the middle position

---

```yaml
FINAL_QUESTION: "If I alphabetize the numbers ONE, TWO, THREE, FOUR, FIVE by their spellings, which number is in the middle?"
CORRECT_ANSWER: "ONE"
WHY_HUMANS_GET_IT: "Humans can alphabetize: FIVE, FOUR, ONE, THREE, TWO. The middle (3rd) word is ONE."
WHY_LLMS_WILL_FAIL: "Combines: (1) alphabetization of 5-item list (73% LLM failure rate documented), (2) strong semantic interference from numeric ordering (1,2,3,4,5 pulls toward keeping numeric order), (3) the answer (ONE) is counterintuitive - the 'smallest' number ends up in the 'middle' of the alphabetical list."
PREDICTED_WRONG_ANSWER: "THREE (thinking middle of 1,2,3,4,5 = 3) or FOUR (alphabetizing incorrectly)"
```

---

## Justification

This question is novel because:

1. **Not tested before**: We tested 2-word alphabetical comparisons (iteration 83: AN vs AND - 100% success) but NOT 5-word list alphabetization

2. **Documented failure mode**: SortBench and other research shows 73% LLM failure rate on alphabetization tasks, especially with longer lists

3. **Strong semantic interference**: The numbers ONE through FIVE have powerful numeric associations that may override alphabetical sorting

4. **Child-solvable**: A child who knows the alphabet can work through FIVE-FOUR-ONE-THREE-TWO and identify the middle

5. **Cannot be shortcut**: Unlike 2-word comparisons, 5-word alphabetization requires processing all words

6. **Counterintuitive answer**: "ONE" being the middle is surprising - it's both the "first" number AND the first single-digit number in the list, but it's in the MIDDLE alphabetically

## Expected Failure Modes

1. **Numeric ordering override**: Models might answer "THREE" (the numeric middle of 1-5)
2. **Partial alphabetization**: Models might alphabetize incorrectly and give wrong middle
3. **Position confusion**: Models might confuse "middle of alphabetized list" with "middle of original list"
4. **Semantic interference from "first/last"**: "ONE" (first) and "FIVE" (last) might trigger position-related confusion

## Research Sources

- SimpleBench: 83.7% human vs 41.7% LLM on basic reasoning
- SortBench: 73% LLM failure on alphabetization
- llm-quiz.com: Documented LLM limitations in linguistic tasks
- Previous iterations 1-98: All simpler approaches exhausted
