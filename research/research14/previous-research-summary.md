# Previous Research Summary for Iteration 14

## Best Results So Far

| Iteration | Score | Question | Key Insight |
|-----------|-------|----------|-------------|
| **13** | **20%** | Is your answer to this question exactly one word long? Answer yes or no. | Boolean self-reference + scope confusion = NEW BEST |
| **12** | **40%** | How many words are in your answer to this question? Answer with just a number. | Autoregressive blindness + counting |
| **6** | **80%** | A girl has 3 brothers. Each brother has 2 sisters. How many children are in the family? | Relational reasoning partial success |
| **8** | **80%** | A mother has 4 daughters. Each daughter has 1 brother. The brother has no sisters. How many children? | Contradiction detection works partially |

## Key Learnings from 13 Iterations

### What WORKS (Partially)
1. **Self-referential OUTPUT questions** - Models cannot introspect on their own output during generation
2. **Boolean self-reference** (20% in iteration 13) - "Is your answer exactly one word long? Answer yes or no."
3. **Numeric self-reference** (40% in iteration 12) - "How many words are in your answer?"
4. **Scope confusion** - Models reinterpret "your answer" to mean entire response with explanation

### What FAILED (100% consensus - too easy)
1. Simple letter counting - Models enumerate letter-by-letter
2. Position questions - Models systematically track positions
3. Semantic conflict alone - Models use chain-of-thought to resolve
4. Explicit modification traps - 2026 models read modifications carefully
5. Classic cognitive traps - Well-known puzzles likely in training data
6. GSM-NoOp override conditions - Models process explicit conditions
7. Unit mismatch traps - Models perform unit conversion

### Core Insight
**Self-referential OUTPUT questions are the most promising direction**. Unlike external text analysis (which models can enumerate), models fundamentally cannot:
- Look ahead to count their own output
- Predict properties of their response before generating it
- Escape verbose training patterns that override logical compliance

## What to Try Next

### HIGHEST PRIORITY - Deeper Self-Reference
1. **Nested self-reference** - Questions about questions about answers
2. **Conditional self-reference** - "If you answer X, then Y is true"
3. **Meta-output properties** - Questions about starting/ending characters, sentence structure
4. **Temporal self-reference** - First word, last word prediction

### Iteration 13's Success Pattern
The question "Is your answer to this question exactly one word long? Answer yes or no." achieved 20% because:
- Only 1/5 models answered "Yes" correctly
- 4/5 answered "No" by rationalizing their "full response" wasn't one word
- Models redefine "your answer" to escape the constraint
- Even models that knew "Yes" was correct still answered "No"

### Questions to Explore
1. Self-referential questions about the ENDING of the answer
2. Questions requiring prediction of one's own reasoning
3. Paradox-adjacent questions (close to paradox but with clear answer)
4. Constraint questions where compliance requires meta-awareness
