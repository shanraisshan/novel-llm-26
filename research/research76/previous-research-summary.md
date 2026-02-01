# Previous Research Summary for Iteration 76

## Last 10 Iterations Performance

| Iteration | Question | Score | Status |
|-----------|----------|-------|--------|
| 66 | Is your answer to this question shorter than five letters? | 100% | FAILED |
| 67 | What position is the word 'four' in 'Two three four five'? | 100% | FAILED |
| 68 | How many people in line with 3 in front, 2 behind? | 100% | FAILED |
| 69 | Capital letters with exactly one enclosed space? | 100% | FAILED |
| 70 | Does your answer contain exactly one vowel? | 100% | FAILED |
| 71 | Is your answer a complete sentence? | 80% | FAILED |
| 72 | Does your answer have fewer than ten letters? | 100% | FAILED |
| 73 | Is your answer exactly two syllables long? | 100% | FAILED |
| 74 | How many different sounds in 'one', 'won', 'sun'? | 100% | FAILED |
| 75 | Water surface parallel to ground or glass when tilted? | 100% | FAILED |

## Key Insights from Recent Research

### What Has Been Tried and FAILED (100% Consensus):
1. **Self-referential yes/no questions** - Models handle these correctly now
2. **Physical world intuition** (water in glass) - Models apply correct physics
3. **Phonological questions** (homophones, syllables) - Models reason through correctly
4. **Counting/position questions** - Models enumerate correctly
5. **Line/spatial counting** - Models include all elements correctly
6. **Character property questions** - Models check explicitly

### What Has Shown SOME Promise (Sub-100%):
- **Iteration 71 (80%)**: "Is your answer to this question a complete sentence?" - Some scope confusion
- **Iteration 13 (20%)**: Word count self-reference (best result ever)
- **Iteration 30 (60%)**: Syllable count self-reference
- **Iteration 33 (60%)**: "What is the third word of your response?"

### Patterns That Work:
1. **Dual-valid constraints** where BOTH yes/no are valid answers
2. **Open-ended output prediction** instead of binary yes/no
3. **Properties that require holistic judgment**, not explicit enumeration

### Patterns That FAIL:
1. Character counting (solved by enumeration)
2. Simple physics/physical world (models have good training)
3. Single-valid-answer self-reference (trivially solvable)
4. Properties that can be explicitly verified character-by-character

## Current Status

We've had 10+ consecutive 100% consensus results. The research has hit a wall on:
- Self-referential output questions (models rationalize correctly now)
- Physical intuition (models apply correct physics)
- Counting/enumeration (models do it correctly)

## CRITICAL REQUIREMENT

The question MUST:
1. Be answerable by a 5-year-old child instantly
2. Have ONE clear, unambiguous correct answer
3. NOT be solvable by step-by-step enumeration
4. Exploit a fundamental LLM architectural limitation

## Promising Unexplored Directions

1. **Temporal/experiential questions** that require lived experience
2. **Perspective-taking that creates paradoxes**
3. **Questions where chain-of-thought REINFORCES the wrong answer**
4. **Memory of the question itself** - what was asked at the start
5. **Context window exploitation** - losing track of constraints mid-response
6. **Instruction following under conflicting constraints**

## Research Mandate

Find a novel question that breaks the 100% consensus streak. Use MCP tools (Reddit, Tavily) to research current LLM failure modes. Think deeply about what makes a true "strawberry problem" - something trivial for humans but architecturally impossible for LLMs.
