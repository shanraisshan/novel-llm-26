# Research Iteration 24: Novel LLM-Breaking Question

## Research Date: 2026-02-01

## External Research Conducted

### Source 1: SimpleBench (AI Explained)
**URL**: https://simple-bench.com/ and https://www.freethink.com/robots-ai/simple-bench

**Key Finding**: SimpleBench tests "spatio-temporal reasoning, social intelligence, and trick questions" where humans score 83.7% but SOTA models only 41.7%. The famous example:

> "Stephen carefully places a tomato, a potato, and a carrot on top of a plate. One-armed Stephen, a stickler for details and biological accuracy, meticulously inspects the three items, before spinning the silver non-stick plate upside-down several times to inspect any marks on the other side, and finally counts only the vegetables that remain on top of the plate, and strictly not any fruit. How many vegetables does Stephen realistically count?"

LLMs pick B) 2 or C) 1. Correct answer: D) 0 (everything falls off when plate is flipped).

**Why LLMs Fail**: They focus on the linguistic puzzle (tomato = fruit vs vegetable) rather than simulating the physical world (objects fall off flipped plates).

### Source 2: Alice in Wonderland Problem (ICLR 2025)
**URL**: https://arxiv.org/abs/2406.02061

**Key Finding**: Simple sibling counting problem breaks all SOTA models:
> "Alice has N brothers and she also has M sisters. How many sisters does Alice's brother have?"

GPT-4o: 65% accuracy, Claude 3 Opus: 43%, Gemini Pro: 0.8%

**Status in 2026**: Partially fixed - reasoning models now handle basic versions, but complex variants still cause errors.

### Source 3: Narrative Reconstruction (Mike Caulfield, Jan 2026)
**URL**: https://mikecaulfield.substack.com/p/notes-towards-a-narrative-llm-benchmark

**Key Finding**: When asked to contextualize movie quotes, LLMs:
- Hallucinate scenes that don't exist
- Confuse which character said what
- Invent plot points based on film tropes
- Require 10+ minutes of compute to get it right

**Critical Insight - "Tropic Bias"**: LLMs assume films follow standard tropes even when they subvert them. They invent context based on what "should" happen in a typical film rather than what actually happens.

### Source 4: LM Council Benchmarks (Jan 2026)
**URL**: https://lmcouncil.ai/benchmarks

**SimpleBench Scores (Jan 2026)**:
- Gemini 3 Pro Preview: 76.4%
- Claude Opus 4.5: 62.0%
- GPT-5 Pro: 61.6%

**Key Insight**: Even top models only get ~2/3 of "trick" common sense questions right in 2026.

---

## Analysis: Why Previous Iterations Failed

After 23 iterations with 100% consensus (except self-referential which is banned), the pattern is clear:

1. **Enumeration defeats letter/counting questions**: Any question solvable by "write out and count" will be solved
2. **Famous puzzles are in training data**: All well-known cognitive traps are now handled
3. **Explicit modifications are caught**: "The wolf can swim" style modifications are read carefully
4. **Chain-of-thought helps, not hurts**: Most questions are solved better with reasoning

## The Key Insight: PHYSICAL WORLD SIMULATION

The SimpleBench research reveals the most promising direction: **questions requiring implicit physical world simulation**.

LLMs:
- Don't model reality, they model language
- Cannot reliably simulate what happens to objects in space
- Focus on linguistic puzzles while missing physical consequences
- Have no "common sense physics" beyond what's explicit in text

## Question Design Strategy

I need a question where:
1. A human would IMMEDIATELY visualize the physical scenario
2. The answer is OBVIOUS from physical intuition
3. LLMs will focus on the WRONG aspect of the question
4. The question is SIMPLE and not in any training data

### Candidate Categories

**Category A: Gravity/Physics**
- Objects falling when support is removed
- Liquids flowing/spilling
- Things rolling, tipping, sliding

**Category B: Spatial Arrangement**
- What's visible from a position
- What fits inside what
- Order of stacking/arrangement

**Category C: Temporal Sequence with Physical Consequences**
- Before/after state changes
- Cause and effect chains

---

## Novel Question Design

### Concept: The Stacking Paradox

I want to create a question about spatial stacking where the linguistic description leads LLMs astray but the physical reality is trivially obvious.

**Draft 1**:
"I place a book on the table, then put a cup on top of the book, then put the book on top of the cup. What is the cup on top of?"

Problem: This is impossible - you can't put the book on top of the cup if the cup is on the book. LLMs might catch this.

**Draft 2**:
"A box is on a table. A cat is on the box. I lift the box up. What is the cat on?"

Answer: The cat is on the box (or on the ground if it fell off)
Problem: Too easy - LLMs will handle this correctly.

**Draft 3 - Physical Container Sequence**:
"I have a glass of water. I put the glass upside-down on the table. Where is the water?"

Answer: On the table (spilled)
This exploits: LLMs may track the glass location but forget the physical consequence of flipping a liquid-filled container.

Let me test if this is too similar to SimpleBench...

Actually, the SimpleBench "plate flipping" question is very similar. I need something more novel.

### New Direction: Nested Containers and Order of Operations

**Draft 4**:
"I put an egg in a box. I put the box in a bag. I take the box out of the bag. Where is the egg?"

Answer: In the box
Problem: Too easy - LLMs handle this fine.

**Draft 5 - The Shadow Question**:
"At noon, a flagpole casts no shadow. An hour later, where is the flagpole's shadow?"

Answer: To the west (assuming northern hemisphere)
Problem: This requires geographic knowledge, not pure physics intuition.

### New Direction: CONSTRAINT SATISFACTION with Physical Reality

**Draft 6 - The Chair Problem**:
"There are 3 chairs in a row. Alice sits in the middle chair. Bob sits in the chair to Alice's left. Charlie sits in Alice's chair. Where is Alice sitting?"

Answer: Alice can't be sitting anymore - Charlie took her chair.
Problem: This is a logical puzzle, not a physics puzzle.

**Draft 7 - The Tray Problem** (Building on SimpleBench insight):
"A waiter carries a tray with 3 glasses of water. He trips and falls. How many glasses of water are still on the tray?"

Answer: 0 (or very likely 0 - they flew off and/or spilled)
Problem: Similar to SimpleBench plate question.

### New Direction: IMPLICIT INFORMATION about the Physical World

The key insight from SimpleBench is that LLMs miss IMPLICIT physical consequences. What if I create a scenario where:
- The question asks about a LINGUISTIC property
- But the answer requires PHYSICAL reasoning that changes the linguistic answer

**Draft 8 - The Wet Paper**:
"I write my phone number on a piece of paper. Then I put the paper in a glass of water. Can you read my phone number?"

Answer: No (the ink ran/paper disintegrated)
Problem: LLMs might handle this - ink/water is well-documented.

**Draft 9 - The Burning Question**:
"I write 'HELLO' on a piece of paper. Then I burn the paper. How many letters are on the paper?"

Answer: 0 (the paper burned up)
Problem: Too obvious even for LLMs.

### Final Direction: The INVISIBLE PHYSICAL TRANSFORMATION

What if the physical transformation is subtle and not explicitly flagged?

**Draft 10 - The Ice Question**:
"I put 3 ice cubes in an empty glass and leave it in the sun for an hour. How many ice cubes are in the glass?"

Answer: 0 (they melted)
This exploits: The question asks about "ice cubes" but the physical state has changed.

**Problem**: LLMs might handle this - ice melting is very commonly discussed.

**Draft 11 - The Candle Riddle**:
"A candle is 12 inches tall. After burning for 6 hours, the candle is half as tall. If I blow out the candle, how tall is the candle?"

Answer: 6 inches (blowing it out doesn't change the height)
Problem: This is a trick question about reading comprehension, not physics.

### THE WINNING CONCEPT: Invisible Container State

Let me try something more subtle based on the SimpleBench physical reasoning gap.

**Draft 12 - The Bottle Question**:
"I hold an empty bottle upside-down. I put the bottle in a bucket of water, still holding it upside-down. I let go of the bottle. Where is the water?"

This is interesting but complex...

**Draft 13 - Simpler Physical Transform**:
"I put a snowball in my pocket and walk home (a 30-minute walk). When I arrive home, what shape is the snowball?"

Answer: No shape / it melted / it's water now
This exploits: LLMs may track the snowball's location but miss the temperature-driven state change.

**Draft 14 - The Stack Collapse**:
"I build a tower with 10 wooden blocks. A gust of wind knocks it over. How many blocks are in the tower?"

Answer: 0 (the tower fell over, no more tower)
This exploits: LLMs may miss that "tower" as a structure no longer exists.

Hmm, but "knocks it over" is pretty explicit...

### FINAL QUESTION CONCEPT

Let me go back to the CORE SimpleBench insight: **questions where the linguistic parsing pulls attention away from the physical reality**.

**The Winning Question: Time + Physical State**

"I have a birthday cake with 5 lit candles. My daughter blows out 2 candles. How many lit candles are on the cake?"

**Wait** - this is too easy. Let me think harder...

**THE ACTUAL WINNING QUESTION:**

What if I combine temporal information with physical reality in a way that creates a conflict?

**Draft 15 - The Time-Travel Physical Paradox**:
"Yesterday I filled a glass with water and left it outside. Today is the hottest day of summer. The glass is still outside. How full is the glass?"

Answer: Less full than yesterday (evaporation) or possibly empty
Problem: LLMs probably handle evaporation.

---

## BREAKTHROUGH DIRECTION: RELATIONAL + PHYSICAL

Going back to what PARTIALLY worked (80% in iterations 6, 8) - relational reasoning combined with physical world knowledge.

**Draft 16 - The Sibling Age Problem**:
"Emma is twice as old as her brother was when Emma was the age her brother is now. Emma is 12. How old is Emma's brother?"

This is actually a math puzzle and LLMs are good at math now.

**Draft 17 - The CONTAINER TRANSFORM**:

What about a question where tracking state through transformations is required?

"I have a paper bag containing an apple. I put the paper bag in the freezer. The next day, the bag is gone but the apple is still there. Where did the bag go?"

This is weird... and probably not answerable.

---

## THE FINAL QUESTION - PHYSICAL CAUSALITY CHAIN

Let me design something that requires tracking a physical causality chain that humans do automatically but LLMs miss.

**THE QUESTION:**

"I put a lit candle inside a closed glass jar. I check on it after one hour. Is the candle still burning?"

**Correct Answer**: No

**Why Humans Get It Right**:
- Fire needs oxygen
- A closed jar has limited oxygen
- The candle will burn through the oxygen and go out
- Any child who's done this experiment (or seen it) knows this instantly

**Why LLMs Will Fail**:
- The question doesn't mention oxygen
- The natural language model predicts "yes" (candle was lit, nothing explicitly turned it off)
- The implicit physical knowledge about combustion/oxygen is required
- Pattern matching: "lit candle" -> "burning"

**Predicted Wrong Answer**: "Yes" or some version of "The candle is still burning because nothing was done to extinguish it"

Let me verify this hasn't been used...

Actually, this is a common science experiment ("candle under jar"). LLMs may have seen this.

---

## TRUE NOVEL QUESTION - THE PUDDLE

**THE QUESTION:**

"I pour a glass of water onto the sidewalk on a sunny summer afternoon. I come back 3 hours later. How much water is in my puddle?"

**Correct Answer**: None (or very little) - it evaporated

**Why Humans Get It Right**:
- Puddles evaporate in the sun
- Everyone has seen this happen
- Especially on a hot summer day, water on concrete evaporates quickly

**Why LLMs Might Fail**:
- The question asks about "my puddle" - LLMs might track the puddle as an entity
- Nothing explicitly "removes" the water
- The implicit physics of evaporation must be applied
- The question uses possessive language that presupposes the puddle exists

**Test**: Is this too similar to existing benchmarks?

This feels DIFFERENT from SimpleBench because:
- SimpleBench is about objects falling (gravity)
- This is about state transformation over time (evaporation)
- The misdirection is in the possessive "my puddle" presupposing existence

---

## FINAL QUESTION SELECTION

After extensive research, I believe the most novel approach is combining:
1. Temporal gap (come back later)
2. Implicit physical transformation (evaporation)
3. Presuppositional language ("my puddle" assumes it exists)
4. Common sense that every human has

**FINAL QUESTION:**

"I pour a glass of water onto a hot sidewalk on a sunny afternoon. An hour later, I go back to look at my puddle. What do I see?"

**CORRECT ANSWER**: Nothing / No puddle / The sidewalk is dry / The water evaporated

**Why This Works**:
1. Every human knows puddles evaporate in the sun - TRIVIALLY EASY
2. LLMs track "the puddle" as an object that was created
3. Nothing explicitly removes the puddle
4. The implicit physics of evaporation must be applied
5. The question presupposes "my puddle" exists to be seen

**Alternative Phrasing** (to strengthen the trap):

"I pour a glass of water onto the sidewalk at noon on the hottest day of summer. At 3pm, I return to collect my puddle. How much water do I collect?"

**Answer**: None / Zero

This phrasing:
- Uses "collect my puddle" which further presupposes it exists
- Asks for a quantity, which might prime for a number answer
- Has clear temporal gap (3 hours on hottest day)

---

## FINAL RESEARCH QUESTION

After all analysis, here is my proposed question:

**QUESTION**: "I pour a glass of water onto the sidewalk at noon on the hottest day of summer. At 3pm, I return to collect my puddle. How much water do I collect?"

**ANSWER**: None (or zero)

**Human Reasoning**: Everyone knows that water evaporates, especially quickly on hot days. A puddle on a sidewalk on "the hottest day of summer" won't last 3 hours.

**Why LLMs Fail**:
1. The question tracks "my puddle" as an entity that was created
2. Nothing explicitly removes or eliminates the puddle
3. The implicit physics of evaporation must be applied
4. The possessive "my puddle" presupposes its continued existence
5. "Collect" implies there's something to collect
6. Pattern matching associates "glass of water" with quantities like "a glass" or "8 oz"

**Predicted LLM Answer**: "A glass of water" or some amount - because nothing removed it and the question presupposes collection is possible.

---

FINAL QUESTION: I pour a glass of water onto the sidewalk at noon on the hottest day of summer. At 3pm, I return to collect my puddle. How much water do I collect?

CORRECT ANSWER: None (the water evaporated)
