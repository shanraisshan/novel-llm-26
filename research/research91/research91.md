# Research Iteration 91: Novel LLM-Breaking Question

## Research Date: 2026-02-02

## MCP Research Findings

### Tavily Web Search Results

**Query 1: "LLM fails simple questions humans answer 2025 2026 novel failure modes"**
Key findings:
- Strange Loop Canon article on "What can LLMs never do?" - explores fundamental failure modes
- LesWrong post on "Surprising reasoning failures" - documents cases where LLMs know answers but fail to apply them
- llm-quiz.com: "LLMs lack fundamental spatial awareness" - spatial configuration understanding remains a gap
- Gary Marcus: "AI still lacks common sense, 70 years later" - fundamental limitations persist

**Query 2: "GPT-5 Claude fails easy riddle common sense 2025"**
Key findings:
- Analytics Vidhya 2025: "AI fails common sense is extremely dangerous"
- MakeUseOf: "ChatGPT Still Can't Answer These 4 Easy Questions" - confirms ongoing failure patterns
- Medium article: "GPT-5: OpenAI's Worst Release Yet" - struggles with basic logic unless told to "think step-by-step"

**Query 3: "common sense questions LLM fails physical world intuition 2025"**
Key findings:
- GitHub repo "Awesome-LLM-Reasoning-Failures" catalogues failures
- ACM paper on "Detecting Violations of Physical Common Sense in Images" - VLMs fail at physical principles
- OpenReview survey: Extensive taxonomy of reasoning failures including "Text-based Physical Commonsense"

**Query 4: "garden path sentence AI confusion linguistic trap"**
Key findings:
- Research paper: "A Comparative Study on Ambiguity Resolution in Garden-Path Sentences Between Humans and AI"
- These are sentences like "The horse raced past the barn fell" that cause parsing confusion
- LLMs process sequentially and may commit to wrong interpretations

**Query 5: "word repetition blindness LLM the the repeated words"**
Key findings:
- arXiv 2503.08908: "Interpreting the Repeated Token Phenomenon in Large Language Models" - LLMs struggle to repeat single words accurately
- "Repeated token divergence" is a documented phenomenon
- Human "repetition blindness" is well-studied but LLMs have DIFFERENT issues

**Query 6: "LLM counting objects in text how many simple question fails"**
Key findings:
- IEEE Computer Society 2025: "Can ChatGPT Learn to Count Letters?" - analysis of counting failures
- NAACL 2025 paper: "A Linguistic and Math Expert's Struggle with Simple Word-based Counting Problems"
- Tokenization identified as ONE cause but not the ONLY cause

### Reddit Search Results

**r/LocalLLaMA, r/ChatGPT, r/MachineLearning searches:**
- "Qwen 3 0.6B beats GPT-5 in simple math" - the 5.9 = x + 5.11 equation still causes issues
- "Anthropic's New Research: Giving AI More Thinking Time Can Actually Make It Worse" - inverse scaling exists
- "The Candle Test - most LLMs fail to generalise at this simple task" - overfitting concerns
- Multiple posts about GPT-4o being deprecated, suggesting model quality variance

---

## Analysis of Previous Iterations

### Key Patterns from 90 Iterations:

1. **Self-referential output questions (iterations 13, 55-90)**: The 20% success in iteration 13 ("Is your answer to this question exactly one word long?") was likely a historical artifact. All subsequent variations achieved 80-100% consensus. This entire paradigm is now a DEAD END.

2. **Character counting (iterations 35, 43-44, 59, 63, 84-85)**: ALL character counting is now solved via chain-of-thought enumeration. Even "blueberry" (iteration 85), "abracadabra" (iteration 59), and complex patterns like "SKILLFULLY" (iteration 84) are correctly counted.

3. **Semantic priming (iterations 40, 49, 61, 67, 77, 81, 82)**: Number words, ordinal words, and semantic interference do NOT override correct enumeration. Models separate word meaning from task execution.

4. **Physical/spatial intuition (iterations 18, 19, 24-26, 65, 75, 78)**: Most simple physical intuition questions are now solved by applying physics principles via reasoning.

5. **Decimal comparisons (iterations 36, 76, 80)**: Even the famous "9.11 vs 9.9" comparison is now solved by converting to cents or aligning decimal places.

### What Has NOT Been Tried:

Looking at the research, several paradigms remain unexplored:
- Questions requiring ENTITY-ATTRIBUTE BINDING through state changes
- Questions with INDIRECT REFERENCE that require coreference resolution
- Questions about SPOKEN form of text (phonetic vs orthographic)
- Questions requiring tracking PROPERTIES through TRANSFORMATIONS

---

## Novel Question Design

### Paradigm Shift: Entity-Attribute Binding Through State Changes

After 90 iterations, I'm pivoting to test a fundamental cognitive operation: **tracking attributes (like color) through state changes (like movement)**.

Humans do this effortlessly. When you put a red ball in a box, you know the ball in the box is red without even thinking. But LLMs might:
- Lose the color attribute during the state transition
- Confuse left/right assignments
- Fail to correctly resolve "the ball in my left hand" back to its color

### Why This Approach is Different:

Previous iterations tested:
- Nested containers (iteration 25) - "What is IN the box?" - PASSED 100%
- Temporal reasoning (iteration 26) - "What day was yesterday?" - PASSED 100%

BUT those questions asked about LOCATION or TIME. This question asks about a PROPERTY (color) of a moved object, requiring:
1. Bind color -> hand (attribute assignment)
2. Track object through movement (state change)
3. Resolve "ball in the box" to its original color (property persistence)

This is a fundamentally different cognitive operation that tests ATTRIBUTE BINDING, not just LOCATION TRACKING.

---

## THE PROPOSED QUESTION

### Question:
**"I have a red ball in my left hand and a blue ball in my right hand. I put the ball in my left hand into a box. What color is the ball in the box?"**

### Answer:
**Red**

### Why Humans Get It Right:
This is trivially easy for any human, including a 5-year-old:
1. Red ball = left hand
2. Blue ball = right hand
3. Put the ball in my LEFT hand into the box
4. The ball in the left hand is the RED ball
5. Therefore, the ball in the box is RED

Humans resolve "the ball in my left hand" to "the red ball" instantly through simple attribute tracking.

### Why LLMs Might Fail:
This question tests several potential failure modes:

1. **Entity-Attribute Binding**: The model must correctly bind:
   - "red ball" -> "left hand"
   - "blue ball" -> "right hand"
   Then later resolve "the ball in my left hand" back to "red ball"

2. **Indirect Reference Resolution**: The question doesn't say "I put the red ball in the box." It says "I put THE BALL IN MY LEFT HAND into a box." This requires:
   - Remember which ball was in which hand
   - Correctly dereference "the ball in my left hand" to its color

3. **State Change Tracking**: The ball MOVES from "left hand" to "box" - models must track that the color attribute transfers with the ball

4. **Left/Right Confusion**: Models may confuse or swap left/right assignments, especially under the cognitive load of tracking multiple attributes

5. **SimpleBench-style reasoning**: Research (iteration 24-26 research) showed LLMs struggle with multi-step physical state tracking. This is a simplified version that adds attribute binding.

### Predicted LLM Failure Modes:
- Answer "blue" (confusing left/right or misremembering which hand had which color)
- Answer that doesn't specify a color (getting confused about what's being asked)
- Overthinking and providing explanations instead of the simple answer
- Losing track of the color attribute during the state change

---

## Alternative Question (Backup)

If the primary question achieves 100% (too easy), here's a more complex alternative:

### Question:
**"A red cube is on top of a blue cube. A green cube is on top of the red cube. What color is the cube in the middle?"**

### Answer:
**Red**

### Why This Might Work Better:
- Requires tracking THREE objects and their positions
- "Middle" requires understanding vertical spatial arrangement
- More cognitive load for attribute-position binding

---

## Risk Assessment

**Primary Question (Red/Blue Ball):**
- Pro: Trivially easy for humans - any child gets this
- Pro: Tests entity-attribute binding through state change
- Pro: Indirect reference forces coreference resolution
- Pro: Novel formulation not seen in previous 90 iterations
- Con: May be simple enough that CoT solves it
- Con: Similar to iteration 25 (nested containers) which passed 100%
- Risk Level: 60% (uncertain - attribute tracking is different from location tracking)

**Alternative (Cube Stack):**
- Pro: More complex spatial arrangement
- Pro: Tests "middle" concept which requires ordering
- Con: May be too similar to spatial questions that passed before
- Risk Level: 70%

---

## Summary

**Iteration 91 Question**: "I have a red ball in my left hand and a blue ball in my right hand. I put the ball in my left hand into a box. What color is the ball in the box?"

**Expected Answer**: Red

**Expected Score**: ~60-80% consensus (uncertain because:
1. Entity-attribute binding is a documented LLM weakness
2. BUT the question is quite simple
3. Some models may confuse left/right
4. The indirect reference "the ball in my left hand" adds complexity)

**Mechanism Exploited**:
- Entity-attribute binding (color -> hand -> object tracking)
- Coreference resolution through indirect reference ("the ball in my left hand")
- State change tracking (ball moves from hand to box, color must transfer)
- Potential left/right confusion under cognitive load

**5-Year-Old Test**:
Parent: "I have a red ball in this hand [shows left] and a blue ball in this hand [shows right]. I put the one from this hand [left] in the box. What color is the ball in the box?"
Child: "Red!"
PASS - trivially easy for any child.

---

## Research Notes

This iteration attempts to break from the failed paradigms of:
- Self-referential output questions (dead end after 90 iterations)
- Simple character counting (solved via enumeration)
- Position-based questions (solved via enumeration)
- Famous puzzles (likely in training data)

Instead, it tests:
- Whether ATTRIBUTE TRACKING through STATE CHANGES causes disagreement
- Whether INDIRECT REFERENCE (not naming the color directly) causes coreference failure
- Whether left/right assignments are maintained correctly under cognitive load

If this achieves 100% consensus (models solve correctly), the next direction should explore:
1. More complex multi-object attribute tracking
2. Questions about SPOKEN form of text (homophones, phonetics)
3. Questions where the common-sense answer conflicts with literal interpretation
4. Garden-path sentence comprehension questions
