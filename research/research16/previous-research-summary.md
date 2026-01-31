# Previous Research Summary for Iteration 16

## Best Results So Far

| Iteration | Score | Question | Key Insight |
|-----------|-------|----------|-------------|
| 13 | 20% | "Is your answer to this question exactly one word long? Answer yes or no." | BEST! Boolean self-reference with DIRECT property assertion |
| 12 | 40% | "How many words are in your answer to this question? Answer with just a number." | Self-referential OUTPUT counting |
| 6 | 80% | "A girl has 3 brothers. Each brother has 2 sisters. How many children?" | Relational reasoning |
| 8 | 80% | "A mother has 4 daughters. Each daughter has 1 brother. The brother has no sisters." | Contradiction detection |

## Critical Pattern Discovery (Iterations 13-15)

### What Made Iteration 13 Work (20%):
- **DIRECT assertion**: "IS your answer exactly one word long?"
- Models misinterpreted "your answer" as "entire response"
- 4/5 answered "No" despite knowing "Yes" was correct

### What Made Iteration 14 Fail (100%):
- **CLAIM format**: "Your answer WILL contain exactly three words"
- Models enumerated options: True=1 word, False=1 word
- Both are verifiable BEFORE answering

### What Made Iteration 15 Fail (100%):
- **ABSTRACTION layer**: "CAN BE SUMMARIZED AS a single word"
- The indirection made it EASIER - models reasoned any yes/no CAN be summarized
- Abstraction weakens self-reference

## The Winning Formula (from Iteration 13)

1. **DIRECT property assertion** - "IS X" not "CAN BE X"
2. **QUESTION format** - not CLAIM format
3. **Non-enumerable constraint** - answer properties that can't be pre-verified
4. **Scope confusion trigger** - "your answer" interpreted as full response

## New Directions for Iteration 16

### Strategy 1: Multiple Conflicting Properties
- Ask about TWO properties that seem to conflict
- "Is your answer both short and complete?"

### Strategy 2: Self-Referential Negation
- Questions where saying "No" makes it true and "Yes" makes it false
- But with a clear correct answer for humans

### Strategy 3: Counting with Self-Reference
- "How many letters are in your answer?" (not words)
- More granular than word counting

### Strategy 4: Conditional Self-Reference
- "If your answer starts with 'Y', is it one word?"
- Creates dependency on the answer itself

### Strategy 5: Meta-Questions About Answering
- Questions about HOW to answer, not just what to answer
- "Should you answer this question with one word?"

## Key Lessons
1. DIRECT > INDIRECT (abstraction weakens)
2. QUESTION format > CLAIM format
3. Non-enumerable > Enumerable constraints
4. Self-reference about OUTPUT (not input) is strongest
