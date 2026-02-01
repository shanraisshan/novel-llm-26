# Previous Research Summary for Iteration 61

## Recent Results (Last 5 Iterations)

| Iteration | Question | Score | Status |
|-----------|----------|-------|--------|
| 56 | "Answer this question without using any words." | 100% | need_more_research |
| 57 | "Answer with exactly ONE letter: What is the second letter of your response?" | 80% | need_more_research |
| 58 | "Answer with exactly THREE words: What is the fourth word of your response?" | 80% | WRONG_DIRECTION |
| 59 | "How many times does the letter 'a' appear in 'abracadabra'?" | 100% | need_more_research |
| 60 | "A farmer has 10 sheep. All but 9 run away. How many sheep does the farmer have left?" | 100% | need_more_research |

## Critical Course Correction (From Iteration 58)

**ABORT CONSTRAINT IMPOSSIBILITY PARADOXES** - Questions like "Answer with X words: what is word Y?" are NOT valid strawberry-type questions. They confuse BOTH humans AND LLMs.

**RETURN TO STRAWBERRY PARADIGM**: Questions that:
1. Any 5-year-old can answer INSTANTLY and CORRECTLY
2. LLMs fail due to TOKENIZATION, CHARACTER BLINDNESS, or NUMERIC REPRESENTATION

## Best Results Ever Achieved

| Iteration | Question | Score | Why It Worked |
|-----------|----------|-------|---------------|
| 13 | "Is your answer to this question exactly one word long? Answer yes or no." | 20% | Scope ambiguity in "your answer" |
| 55 | "Answer with just ONE word: What is the fifth word of your response?" | 40% | Constraint impossibility (but WRONG DIRECTION) |
| 43 | "What letter comes immediately before the 'R' in the word 'CHERRY'?" | 40% | Double-R ambiguity |

## What Has Been Tried and FAILED (100% Consensus)

### Character Counting (Solved by Enumeration)
- How many r's in strawberry
- Letter counting in common words
- Consecutive letter pairs (BOOKKEEPER)
- Backward spelling (HOSPITAL → LATIPSOH)
- Multiple occurrences (abracadabra, BANANA)

### Numeric Comparison (Solved by Alignment)
- Decimal comparison (3.11 vs 3.9)
- Version number patterns

### Semantic Priming Traps (Caught by CoT)
- "Which word is longer: LONG or SHORT?"
- "Half the age" riddles
- "All but 9" idiomatic phrases

### Visual/Spatial Reasoning (Solved by Position Math)
- Circular seating arrangements
- Container tracking
- Calendar day counting

### Physical World Questions (Correctly Applied)
- Ball vs feather in living room (air resistance)
- Water evaporation on hot day

### Classic Riddles (Now Solved)
- Race passing questions
- Family relationship puzzles
- Piano keys counting

## What Might Still Work

### 1. NOVEL Character Combinations
- Very unusual words not in training data
- Made-up/nonsense strings
- Very long words where enumeration is tedious

### 2. Questions Where Enumeration LEADS TO Wrong Answer
- Not yet explored

### 3. Ambiguity That Humans Resolve Consistently But LLMs Don't
- The CHERRY "which R?" achieved 40%

### 4. Questions Exploiting Tokenization on NOVEL Text
- Generated nonsense words
- Unusual character combinations

## Key Insights

1. **Chain-of-thought enumeration solves most character tasks** - Models explicitly spell out letters and count
2. **Famous riddles are in training data** - All classic puzzles are solved
3. **Constraint impossibility paradoxes are WRONG DIRECTION** - Not valid strawberry questions
4. **Scope ambiguity worked once (iteration 13)** but subsequent attempts failed
5. **2026 frontier models are MUCH better** than 2024-2025 research suggests

## Mission Reminder

> "If a 5-year-old can answer it, but GPT-5 can't, it's perfect"

The question MUST be:
- Simple (one-liner)
- Unambiguous (one correct answer)
- Easy for humans (instant recognition)
- Hard for LLMs (architectural limitation)
