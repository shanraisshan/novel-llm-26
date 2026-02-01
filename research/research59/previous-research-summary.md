# Previous Research Summary for Iteration 59

## CRITICAL COURSE CORRECTION

**Iteration 58 was flagged as WRONG_DIRECTION**. The constraint impossibility paradox approach does NOT meet strawberry criteria:
- Questions like "Answer with exactly THREE words: What is the fourth word of your response?" are NOT easy for humans
- A 5-year-old cannot intuitively answer these
- We must RETURN to simple counting, math, and riddles

## What WORKS (Strawberry Criteria)
Questions that work meet ALL these criteria:
1. **A 5-year-old can answer it** - requires no complex reasoning
2. **Simple, one-liner format** - no meta-cognitive demands
3. **Exploits LLM tokenization or pattern-matching** - NOT philosophical paradoxes
4. **Clear, unambiguous answer** - no interpretation needed

## Successful Patterns from History

### Pattern 1: Character Counting (Original Strawberry)
- "How many r's in strawberry?" - Humans see letters, LLMs see tokens
- Score: Variable, but this is the GOLD STANDARD paradigm

### Pattern 2: Semantic Priming with Counting
- "How many letters in ELEVEN?" (answer: 6, not 11)
- Number words prime the wrong numeric value

### Pattern 3: Word Counting in Sentences
- "How many words in 'I have ten words in this sentence'?" (answer: 8, not 10)
- Self-referential FALSE claims about word count

### Pattern 4: Simple Math with Distractors
- Classic riddles where the obvious answer is wrong
- Family member puzzles (but these now score 80-100%)

## What DOES NOT Work

### Constraint Impossibility Paradoxes (WRONG DIRECTION)
- Iterations 55-58 explored: "Answer with X constraint: What is Y property of your response?"
- These are NOT easy for humans - require meta-reasoning
- A 5-year-old cannot answer "What is the fourth word of a three-word response?"
- These fail the strawberry criteria even if they confuse LLMs

### Self-Referential Output Questions
- Work sometimes (20-60% consensus) but are NOT strawberry-simple
- Questions about "your response" require understanding self-reference

## New Directions to Explore

### 1. Unusual Character Patterns
- Words with deceptive letter patterns
- Consecutive identical letters in unexpected places
- Words that "look" like they have more/fewer of a letter

### 2. Syllable/Sound vs Spelling Conflicts
- Words where pronunciation differs dramatically from spelling
- Silent letters, unexpected sounds

### 3. Simple Visual Comparisons
- "Which word is longer: CAT or ELEPHANT?" (visual, not semantic)
- "Which has more letters: YES or MAYBE?"

### 4. Simple Math with Number Words
- "What is TEN minus FOUR?" (numeric answer should be 6, but TEN=3 letters, FOUR=4 letters)
- Questions where word semantics conflict with character counts

### 5. Position Questions in Common Words
- "What is the 3rd letter of OCEAN?" (simple, but E vs A confusion possible)
- Words where position-counting is straightforward for humans but may trip tokenization

## Key Insight

The STRAWBERRY problem works because:
1. Humans SEE each letter visually
2. LLMs process tokens, not characters
3. The word "strawberry" becomes ['str', 'aw', 'berry'] - hiding the r's

We need questions that exploit THIS fundamental gap, not meta-cognitive paradoxes.

## Recommendation for Iteration 59

Return to the basics:
- Character counting in unusual words
- Visual letter patterns
- Simple one-liner format
- Something a 5-year-old could answer by looking/counting
