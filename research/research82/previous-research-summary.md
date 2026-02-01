# Previous Research Summary for Iteration 82

## Last Question (Iteration 81)
- **Question**: "In the list 'second, fourth, first, third', which word comes second?"
- **Answer**: "fourth"
- **Score**: 100%
- **Status**: need_more_research
- **Insight**: The semantic interference from ordinal word meanings did NOT cause failure - models enumerated positions correctly

## Recent Pattern Analysis (Iterations 77-81)

### Pattern: Semantic-Position Interference Tests
| ID | Question Type | Score | Outcome |
|----|--------------|-------|---------|
| 77 | "In 'Two three four five', position of 'four'?" | 100% | Cardinal numbers - no interference |
| 78 | Mirror/perspective (right hand appearing on left) | 100% | Spatial reasoning works |
| 79 | Overlapping sequences ('11' in '11111') | 100% | Pattern counting works |
| 80 | Decimal comparison ($9.9 vs $9.11) | 100% | Numeric comparison works |
| 81 | Ordinal position paradox (shuffled ordinals) | 100% | Even ordinal words enumerated correctly |

## Key Insights from 81 Iterations

### What ALWAYS Works (Models Solve These):
1. **Character/letter counting** - Models enumerate letter-by-letter
2. **Position finding in text** - Models count positions systematically
3. **Semantic priming with numbers** - "ELEVEN has how many letters?" = 6 (correct)
4. **Classic riddles** - In training data
5. **Simple arithmetic** - Even with distractors
6. **Circular/spatial arrangements** - Reduced to position math
7. **Physical intuition questions** - Models apply physics correctly
8. **Contradiction detection** - Models identify impossibilities
9. **Age gap problems** - Models track constant differences
10. **Ordinal word position questions** - NEW: Even shuffled ordinals don't cause errors

### What Has Shown Promise (< 100% Scores):
1. **Self-referential OUTPUT questions** (iteration 12-13): 20-40% consensus
   - "How many words are in your answer?" achieved 40%
   - "Is your answer exactly one word long?" achieved 20%
   - Key: Models cannot introspect their own output during generation

2. **Relational reasoning** (iterations 6, 8): 80% consensus
   - Family puzzles with implicit constraints
   - Contradiction questions

### The 20% Floor (Best Result)
- Iteration 13: "Is your answer to this question exactly one word long? Answer yes or no."
- Score: 20% (only 1/5 correct)
- Key failure mode: Models reinterpret "your answer" to mean entire response

## Directions NOT Yet Fully Explored

### 1. Self-Referential Output (Most Promising)
The only category achieving < 40% consensus. Core insight: Models cannot predict properties of their own output because generation is autoregressive.

**Variations to try:**
- Questions about character count of the answer
- Questions about specific letters in the answer
- Questions about the LENGTH of the response

### 2. Constraint Impossibility (Achieved 80%)
Questions where the constraint makes the answer impossible, but models try to solve anyway.

### 3. Visual/Spatial That Can't Be Reduced to Math
Most spatial questions get converted to position arithmetic. Need questions requiring true visualization.

### 4. Counter-Intuitive Simple Questions
Questions so simple that overthinking leads to wrong answers.

## Recommendation for Iteration 82

Focus on **self-referential output properties** - this is the ONLY category that has achieved < 40% consensus. The key is exploiting the autoregressive generation limitation.

**Target**: Create a self-referential question where:
1. The answer is unambiguous
2. A 5-year-old understands the concept
3. The model cannot pre-compute the answer before generating it
4. Answering correctly requires knowing the output before producing it

## Constraints Reminder
- Must be simple one-liner (5-year-old can understand)
- Must have ONE unambiguous correct answer
- Must NOT be technical or domain-specific
- Must NOT be a known puzzle
- Target: < 10% consensus (currently best is 20%)
