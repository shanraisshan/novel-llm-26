# Previous Research Summary (Research 3)

## Question Attempted
"Which word has more letters: 'FOUR' or 'FIVE'?"

## Score Achieved
100% consensus (all 5 researchers answered correctly)

## Key Insights

### What Was Tested
- **Semantic priming** with number words (FOUR=4, FIVE=5)
- **Forced choice format** ("Which A or B?") expecting "neither/same"
- **Meta-cognitive challenge** requiring premise rejection

### Why It Failed to Stump LLMs
1. Modern LLMs use chain-of-thought reasoning that explicitly counts letters
2. The "forced choice" trap was anticipated - models recognized equal lengths
3. The semantic priming (5>4) was not strong enough to override explicit counting
4. The question format was too simple - gave time for careful analysis

## What Worked
- The fundamental insight about semantic priming with number words is valid
- Exploiting gaps between word meaning and word properties is promising

## What Failed
1. **Simple comparison questions** - Too easy to verify by counting
2. **Forced choice with obvious "neither" option** - Models detect equality easily
3. **Single-step verification** - One quick count defeats the trap
4. **Questions where CoT helps** - Chain-of-thought reasoning catches the trick

## Lessons for Next Iteration

### Critical Observations from 3 Failed Attempts
- **Research 1**: Technical Python questions = extensively trained, 100% correct
- **Research 2**: Simple semantic contradiction (FIRST/last) = caught by CoT, 100% correct
- **Research 3**: Number word semantic priming = counting defeats it, 100% correct

### What We Need
1. **Questions where careful reasoning leads to WRONG answers**
2. **Multi-step tasks where errors compound**
3. **Counter-intuitive answers that feel wrong even when correct**
4. **Exploit pattern-matching training, not overcome it**

### Promising Unexplored Directions
1. **Temporal/causal reasoning paradoxes**
2. **Self-referential or recursive questions**
3. **Questions where the "obvious" careful approach fails**
4. **Exploit over-reliance on pattern matching from training data**
5. **Questions requiring genuine novelty vs. retrieval**

### The Key Insight
All 3 questions so far could be solved by:
1. Slow down
2. Apply careful step-by-step reasoning
3. Verify the answer

**We need questions where slowing down and being careful STILL leads to errors** - or where the correct answer contradicts strong training patterns.
