# Previous Research Summary for Iteration 101

## Mission Reminder
Generate a **SIMPLE, GENERIC question** that:
- Any human child could answer correctly
- Modern frontier LLMs consistently fail
- Results in < 10% consensus among 5 independent AI researchers

## Recent Results (Last 20 Iterations)

| Iteration | Question | Score | Status |
|-----------|----------|-------|--------|
| 81 | In the list 'second, fourth, first, third', which word comes second? | 100% | need_more_research |
| 82 | If you write the numbers one, two, three, four, five, how many letters did you write? | 100% | need_more_research |
| 83 | Which word comes LAST alphabetically: 'AND' or 'AN'? | 100% | need_more_research |
| 84 | How many times does the letter pair 'LL' appear in the word 'SKILLFULLY'? | 100% | need_more_research |
| 85 | How many times does the letter 'b' appear in the word 'blueberry'? | 100% | need_more_research |
| 86 | What is the middle letter of the word 'BIRD'? | 100% | need_more_research |
| 87-98 | Various self-referential and meta questions | 100% | need_more_research |
| 99 | If I alphabetize ONE, TWO, THREE, FOUR, FIVE by spelling, which is in the middle? | 100% | need_more_research |
| 100 | Basket with 5 apples, take 2 out - how many did I take? | 100% | need_more_research |

## Exhausted Paradigms (All Achieving 100% Consensus)

### 1. Character/Letter Counting
- "How many r's in strawberry?" - SOLVED via chain-of-thought enumeration
- Double letters, repeated patterns - all solved

### 2. Self-Referential Output Properties
- "Is your answer exactly one word?" - Initially 20% but now 100%
- Scope confusion no longer works reliably

### 3. Semantic Interference
- Number words (ELEVEN letters), position words (FIRST/LAST)
- All solved via explicit verification

### 4. Alphabetization/Ordering
- Sorting words by spelling - solved even with 5+ words
- Semantic meaning doesn't interfere

### 5. Physical/Spatial Reasoning
- Clock positions, container tracking, evaporation
- All solved via physics knowledge application

### 6. Classic Riddles with Modifications
- "All but 9 sheep" - now recognized and solved
- River crossing modifications - solved

### 7. Math Word Problems
- Explicit vs implicit answers - solved
- "How many did I take?" (answer is stated) - still 100%

## Best Results So Far

| Iteration | Score | Question Type |
|-----------|-------|---------------|
| 13 | 20% | Self-referential word count (scope confusion) |
| 43 | 40% | Character adjacency ambiguity |
| 55 | 40% | Conflicting constraints (but NOT child-friendly) |
| 30 | 60% | Self-referential syllable count |

## Key Insight from Iteration 13 (20% Success)

**Question**: "Is your answer to this question exactly one word long? Answer yes or no."

**Why it worked**:
- BOTH "yes" and "no" are valid answers (both are one word)
- Models confused "your answer" (the yes/no word) with "your full response"
- Scope ambiguity caused disagreement

**Why it stopped working**:
- Models now correctly narrow scope to just the constrained answer
- Explicit "Answer yes or no" clarifies what "your answer" means

## What Has NOT Been Tried Yet

1. **Questions where chain-of-thought LEADS to wrong answer**
   - The enumeration/verification strategy defeats most traps
   - Need questions where verifying step-by-step produces errors

2. **Truly novel question structures**
   - Not in any training data format
   - Can't be pattern-matched to known problems

3. **Questions exploiting autoregressive generation limits**
   - Models can't look ahead during generation
   - Iteration 33 (60%) showed some promise here

4. **Compound questions with interdependent parts**
   - Where answering one part correctly makes another impossible

5. **Questions about relationships between words/concepts**
   - Not the words themselves, but how they relate

## Critical Constraints

1. **MUST be simple** - A 5-year-old can answer it
2. **MUST be unambiguous** - ONE clear correct answer
3. **MUST NOT be technical** - No programming, specs, or domain knowledge
4. **MUST NOT be a paradox** - Humans should easily solve it
5. **MUST exploit LLM architectural limits** - Tokenization, autoregression, pattern-matching

## Recommended Exploration Areas

1. **Autoregressive generation blindness** (most promising)
   - Questions about the model's own output during generation
   - Models cannot "look ahead" to verify

2. **Counter-intuitive simple facts**
   - Things humans know immediately but LLMs over-reason

3. **Relational logic with misdirection**
   - Iteration 6 got 80% with sibling relationships
   - More complex relationships might work

4. **Visual/spatial letter properties**
   - Iteration 37 got 80% with MOM upside down
   - Letter symmetry, visual patterns

## Warning: Avoid These Approaches

- Philosophical paradoxes (confuse humans too)
- Technical/specification questions (LLMs are trained on these)
- Questions requiring obscure knowledge
- Ambiguous questions with multiple valid answers
- Questions that are "tricky" rather than "simple"
