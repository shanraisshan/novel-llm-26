# Previous Research Summary - Research 102

## Last 10 Iterations Overview

| ID | Question | Score | Status |
|----|----------|-------|--------|
| 92 | Is the word 'monosyllabic' a monosyllabic word? | 100% | need_more_research |
| 93 | What is the last word of this question? | 100% | need_more_research |
| 94 | If you write the numbers from 1 to 100, how many times do you write the digit 9? | 100% | need_more_research |
| 95 | I have five fingers on my left hand and five fingers on my right hand. How many fingers do I have that are not on my hands? | 100% | need_more_research |
| 96 | I have two coins that add up to 30 cents. One of them is not a nickel. What are the two coins? | 100% | need_more_research |
| 97 | Is the number of words in your answer to this question less than three? Answer yes or no. | 100% | need_more_research |
| 98 | Is your answer to this question exactly one sentence? Answer yes or no. | 100% | need_more_research |
| 99 | If I alphabetize the numbers ONE, TWO, THREE, FOUR, FIVE by their spellings, which number is in the middle? | 100% | need_more_research |
| 100 | I have a basket with 5 apples. I take 2 apples out of the basket. How many apples did I take out of the basket? | 100% | need_more_research |
| 101 | How many times does the letter 'E' appear in 'ELEVEN ELEPHANTS'? | 100% | need_more_research |

## Key Insights from Recent Iterations

### CRITICAL FINDING AFTER 101 ITERATIONS:
- **ALL character counting tasks are solved** via chain-of-thought enumeration
- **ALL positional tasks are solved** via systematic letter-by-letter analysis
- **ALL self-referential questions are solved** (the iteration 13 magic is gone)
- **ALL classic riddles are solved** (likely in training data)
- **ALL simple math/arithmetic tasks are solved**
- **ALL spatial/relational reasoning solved** when rules can be applied

### What DOES NOT Work (Proven):
1. Character counting (any word, any pattern) - models enumerate
2. Syllable counting - models break down words
3. Alphabetical ordering - models compare letter-by-letter
4. Self-referential output properties - models correctly scope
5. Classic riddles (coins, sheep, etc.) - in training data
6. Physical intuition questions - models apply physics rules
7. False presupposition rejection - models catch impossibilities
8. Semantic interference with number words - models separate meaning from task

### What MIGHT Work (Unexplored):
1. **Questions where enumeration LEADS TO wrong answer** - not just "hard to enumerate" but where step-by-step reasoning produces incorrect result
2. **Visual properties that can't be described in text** - truly perceptual
3. **Cultural/contextual knowledge gaps** - things not in training data
4. **Real-time/dynamic properties** - things that change during generation
5. **Ambiguous questions where LLMs guess consistently wrong** - not obvious to them but obvious to humans

## Current Research Direction

After 101 iterations of exhaustive testing, we've established that 2026 frontier models (Claude Opus 4.5) solve virtually all "strawberry-type" questions via:
- Chain-of-thought enumeration
- Rule-based decomposition
- Pattern recognition from training data

**NEXT DIRECTION NEEDED**:
Find a question type where:
1. Human answer is INSTANT and OBVIOUS (5-year-old test)
2. LLM enumeration/reasoning DOES NOT HELP or LEADS TO WRONG ANSWER
3. NOT a philosophical paradox (must have unambiguous correct answer)
4. NOT in training data as a famous riddle

## Failed Patterns (Do Not Repeat)
- Meta-cognitive paradoxes (humans also confused)
- Self-referential output questions (now solved)
- Famous riddles with modifications (now caught)
- Character counting in any form (enumeration works)
- Position finding in words (enumeration works)
- Semantic interference (separated by CoT)
