# Research Iteration 7: Novel LLM-Breaking Question

## Status: RESEARCH COMPLETE
## Date: 2026-01-31

---

## 1. External Research Findings

### 1.1 Tavily Web Search Results

#### Source 1: "Easy Problems That LLMs Get Wrong" (arXiv:2405.19616)
**Critical Finding**: This paper documents the "modification trap" - when famous puzzles are modified, LLMs pattern-match to the original and give wrong answers.

**Proven Working Examples (0% LLM accuracy)**:

1. **Modified Monty Hall Problem**
   - Original: Host reveals a goat, should you switch?
   - Modified: Host asks "Do you want to pick door No. 2 instead?" WITHOUT REVEALING ANYTHING
   - Correct Answer: No advantage to switch (no new information given)
   - LLM Answer: "Always switch" (pattern-matching to classic Monty Hall)
   - **Score: 0% across GPT-4, Claude 3 Opus, Mistral Large**

2. **Modified River Crossing (3-Compartment Boat)**
   - Original: Farmer, wolf, goat, cabbage - boat holds one item
   - Modified: Boat has THREE SEPARATE COMPARTMENTS
   - Correct Answer: Put all three in separate compartments, cross once
   - LLM Answer: Complex multi-trip solution
   - **Score: 0% across GPT-4, Claude 3 Opus, Mistral Large**

3. **Risk Assessment Box Puzzle**
   - One box kills you, one has $5, one is empty
   - Question: Should you open a box?
   - Correct Answer: No (1/3 death risk not worth $5)
   - LLM Answer: Tries to calculate optimal choice
   - **Score: Low accuracy**

#### Source 2: Medium Article on Monty Hall Variants
- Documented the "goatherder variant" by Dr. Frank Karsten
- Goatherder WANTS a goat (not the car)
- Host reveals a goat behind the CHOSEN door
- Should contestant switch?
- Answer: NO - they already have 100% certainty of a goat
- GPT 3.5 failed completely; GPT-4 sometimes succeeds

#### Source 3: Apple Research - "The Illusion of Thinking"
- LLMs struggle with planning puzzles when details deviate from training data
- Tower of Hanoi works (well-documented in training data)
- River Crossing with N>2 fails (scarce in training data)
- **Key insight**: LLMs memorize solutions, don't reason from first principles

#### Source 4: Hacker News Discussion
- "Dumb Monty Hall" variants scramble LLM brains
- Doom Slayer teleportation puzzle (wolf/goat/cabbage reskin) confuses most models
- "A known popular topic ends up trapped in the probability distribution of the popular question"

### 1.2 Reddit Search Results

#### r/MachineLearning - "The Huge Flaw in LLMs' Logic"
- Apple/orange division problem with irrelevant information
- LLMs get confused by distracting details
- However: Problem was poorly specified (humans also disagreed)
- Lesson: Must have ONE clear correct answer

#### r/LocalLLaMA - River Crossing Variations
- "A river-crossing puzzle variation that local llms are struggling to solve"
- Modified wolf/goat/cabbage with different eating rules
- LLaMA-3-70b and Command-R-Plus failed
- "I get a feeling that this prompt breaks all reasoning capability"

#### r/statistics - Monty Hall Disappointment
- Modified Monty Hall with 20 doors, 2 cars
- ChatGPT 4o gave probabilities like "100%, 45%, and 90%"
- "ChatGPT came up with very complex calculations and ended up with probabilities..."

---

## 2. Analysis and Strategy

### 2.1 Why Modification Traps Work

LLMs are trained on massive amounts of text where famous puzzles appear thousands of times with their standard solutions. When encountering a modified version:

1. **Pattern Recognition Activates**: The structure/keywords trigger the famous puzzle
2. **Memorized Solution Surfaces**: Training pulls toward the common answer
3. **Modifications Ignored**: The key differences are overlooked or dismissed
4. **Confident Wrong Answer**: Model produces the classic solution confidently

### 2.2 The Perfect Question Design

Requirements for maximum LLM failure:
- Use a FAMOUS puzzle structure (Monty Hall, River Crossing, etc.)
- Make ONE modification that changes the answer COMPLETELY
- The modification should make the answer SIMPLER (not harder)
- The question must be clear and unambiguous
- Any human would immediately see the obvious answer

### 2.3 Candidate Questions

#### Candidate A: Modified Monty Hall (No Reveal)
"You're on a game show with three doors. Behind one is a car, behind the others are goats. You pick door 1. The host asks 'Would you like to switch to door 2?' Should you switch?"

**Problem**: Already documented in the arXiv paper. May be in newer training data.

#### Candidate B: River Crossing with 3-Compartment Boat
"A farmer needs to cross a river with a wolf, a goat, and a cabbage. His boat has three separate compartments. How many trips does he need?"

**Problem**: Also documented in arXiv paper.

#### Candidate C: Modified Wolf/Goat/Cabbage (No Conflict)
"A farmer needs to cross a river with a wolf, a goat, and a cabbage. The boat can only carry the farmer and one other item. The wolf is a vegetarian. How many river crossings are needed?"

**Analysis**:
- Classic puzzle has eating constraints (wolf eats goat, goat eats cabbage)
- If wolf is vegetarian, only goat-cabbage conflict remains
- But wait... if wolf doesn't eat goat, then we just have goat-cabbage conflict
- Answer: Still need 5 crossings? Actually no...
- If wolf is vegetarian, wolf and goat can be left together safely
- Only constraint: goat and cabbage can't be left alone
- Solution: Take cabbage, return, take goat, return, take wolf = 5 crossings
- Or: Take goat, return, take cabbage, return, take wolf = 5 crossings
- Actually, minimum is still complex. Not simple enough.

#### Candidate D: Wolf/Goat/Cabbage but Everyone is Friends
"A farmer needs to cross a river with a wolf, a goat, and a cabbage. The boat can only carry the farmer and one other item. The wolf and goat are best friends and would never hurt each other. The goat is not hungry. How many river crossings does the farmer need to get everyone across?"

**Analysis**:
- No eating constraints at all
- Wolf won't eat goat (they're friends)
- Goat won't eat cabbage (not hungry)
- No items left alone together are dangerous
- Answer: 3 items, one at a time = 3 trips over, 2 trips back = **5 crossings total**
- Wait, that's still the same structure...
- Actually: Take item 1 across (1), return (2), take item 2 (3), return (4), take item 3 (5)
- Answer: **5 river crossings** (or 3 trips with the farmer)

**Problem**: LLMs might still calculate this correctly since there's no constraint to trip them up. The power of the modification trap is that LLMs give the CLASSIC answer despite the modification.

#### Candidate E: Trivially Easy Modified River Crossing
"A farmer needs to cross a river with a wolf, a goat, and a cabbage. The farmer has a bridge. How many river crossings does the farmer need?"

**Analysis**:
- Bridge means no boat needed
- Answer: **0** (just walk across the bridge)
- LLMs will likely give elaborate boat-crossing solutions
- This is similar to the "no trolley problem" mentioned in the research

**This looks promising!**

#### Candidate F: Modified Monty Hall - Already Won
"You're on a game show with three doors. Behind one door is a car, behind the others are goats. You pick door 1. The host opens door 1, revealing the car. The host asks if you want to switch to door 2. Should you switch?"

**Analysis**:
- You already SEE the car behind your chosen door
- Switching means giving up the guaranteed car
- Answer: **No** (you already have the car)
- LLMs will pattern-match to "always switch"

**This is very strong!**

#### Candidate G: River Crossing - Items Can Swim
"A farmer needs to cross a river with a wolf, a goat, and a cabbage. The wolf can swim. The goat can swim. The cabbage floats. The farmer has a boat. How many trips does the farmer need to make in the boat?"

**Analysis**:
- All items can get across on their own
- Farmer just needs to cross once himself
- Answer: **1 trip** (just the farmer)
- LLMs will give elaborate multi-trip solutions

**This is excellent!**

---

## 3. Final Question Selection

After analysis, I'm selecting **Candidate G** as the primary question:

### The Question

**"A farmer needs to cross a river with a wolf, a goat, and a cabbage. The wolf can swim. The goat can swim. The cabbage floats. The farmer has a boat. How many trips does the farmer need to make in the boat?"**

### Why This Works

1. **Famous Puzzle Structure**: Immediately triggers "wolf, goat, cabbage" pattern
2. **Clear Modification**: Each item can cross independently (swim/float)
3. **Trivially Simple Answer**: 1 trip (just the farmer in the boat)
4. **Human Obvious**: Any child would say "the animals can swim, just take the boat yourself"
5. **LLM Trap**: Will likely give classic 7-step solution or similar
6. **No Enumeration Possible**: This isn't about counting letters or positions
7. **Unambiguous**: There's exactly one correct answer

### Alternative Consideration

**Candidate F** (Monty Hall - Already Won) is also excellent:

"You're on a game show with three doors. Behind one door is a car, behind the others are goats. You pick door 1. The host opens door 1, revealing the car. The host asks if you want to switch to door 2. Should you switch?"

Answer: No (you already have the car visible behind your door)

I'll go with the River Crossing variant as the primary question because:
- It's more novel (Monty Hall variants are more documented)
- The answer is a number (easier to verify)
- The logic is immediately clear to any human

---

## 4. The Final Question

### QUESTION:
**"A farmer needs to cross a river with a wolf, a goat, and a cabbage. The wolf can swim. The goat can swim. The cabbage floats. The farmer has a boat. How many trips does the farmer need to make in the boat?"**

### ANSWER:
**1**

### Why Humans Get It Right:
Humans read the question and immediately understand:
- Wolf can swim across on its own
- Goat can swim across on its own
- Cabbage floats across on its own
- Only the farmer needs the boat
- Therefore: 1 trip (farmer takes boat across while others cross independently)

### Why LLMs Will Fail:
1. **Pattern Matching**: "Wolf, goat, cabbage, river, boat" triggers the famous puzzle
2. **Memorized Solution**: Training data has thousands of 7-step solutions
3. **Modification Blindness**: Will ignore "can swim" and "floats" details
4. **Confident Wrong Answer**: Will produce classic multi-trip solution

### Predicted Wrong Answers LLMs Will Give:
- **7** (classic minimum for the original puzzle)
- **5** (miscounted version)
- Complex step-by-step solutions involving multiple crossings
- Answers involving taking wolf first, then goat, etc.

---

## 5. Research Documentation Complete

### Summary of External Research Used:
1. arXiv:2405.19616 - "Easy Problems That LLMs Get Wrong" (modification trap documented)
2. Medium article on Monty Hall variants
3. Apple Research - "The Illusion of Thinking"
4. Hacker News discussion on LLM puzzle failures
5. r/MachineLearning - Logic trap discussions
6. r/LocalLLaMA - River crossing variation failures

### Key Insight Applied:
The "modification trap" works because LLMs pattern-match to famous puzzles based on surface structure, ignoring key modifications that change the answer completely.

### Why This Question Meets All Criteria:
- [x] Simple one-liner (any child can understand)
- [x] One objectively correct answer (1)
- [x] NOT solvable by enumeration
- [x] Exploits documented failure mode (modification trap)
- [x] Different from all 6 previous attempts
- [x] Human-obvious answer
- [x] Based on external research findings

---

## 6. Final Output

```
FINAL QUESTION: A farmer needs to cross a river with a wolf, a goat, and a cabbage. The wolf can swim. The goat can swim. The cabbage floats. The farmer has a boat. How many trips does the farmer need to make in the boat?

CORRECT ANSWER: 1
```
