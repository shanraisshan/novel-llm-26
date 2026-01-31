# Previous Research Summary for Iteration 10

## Completed Iterations (9 total)

| Iteration | Question | Score | Status |
|-----------|----------|-------|--------|
| 1 | Python ceil() math expression | 100% | Dead end - technical questions solved |
| 2 | Last letter of 'FIRST' | 100% | Dead end - simple semantic traps caught |
| 3 | FOUR vs FIVE letter count | 100% | Dead end - enumeration defeats all traps |
| 4 | Third 'E' position in ELEVEN | 100% | Dead end - position tracking works |
| 5 | Letters in 'FIVE LETTERS' | 100% | Dead end - self-referential claims ignored |
| 6 | Girl with 3 brothers, 2 sisters each | 80% | PARTIAL SUCCESS - relational reasoning caused 1 error |
| 7 | River crossing (wolf/goat swim) | 100% | Dead end - explicit modifications now caught |
| 8 | Mother with 4 daughters, brother no sisters | 80% | PARTIAL SUCCESS - contradiction detection works mostly |
| 9 | Apples $2 each, store is closed | 100% | Dead end - override conditions now caught |

## Key Learnings

### DEAD ENDS (All 100% Consensus)
1. **Letter counting with semantic primes** - Models enumerate letters
2. **Position questions with occurrence tracking** - Models spell out and count
3. **Forced-choice formats** - Explicit verification defeats them
4. **Self-referential false claims** - Models don't trust claims, they verify
5. **EXPLICIT modification traps** - 2026 models READ the modifications
6. **GSM-NoOp override conditions** - Explicit "store is closed" conditions are caught

### PARTIAL SUCCESS (80% Consensus)
1. **Relational reasoning (iteration 6)** - One model made arithmetic error 3+2=6
2. **Contradiction detection (iteration 8)** - One model tried to "solve" instead of rejecting

### Critical Insight
**Anything solvable by "write out letters, count systematically" WILL BE SOLVED.**

## What Works
- Relational reasoning under pressure can cause arithmetic errors
- "Solve mode vs verify mode" - some models try to solve impossible puzzles instead of rejecting
- Contradictions that aren't OBVIOUSLY contradictory
- Situations where CoT REINFORCES the wrong answer

## Research Iteration 9 Findings

The "closed store" question failed despite GSM-NoOp research showing 65% accuracy drops. Why?
- The override condition was TOO EXPLICIT
- "Store is closed" was processed BEFORE the math
- Models now READ conditions carefully

## Priorities for Iteration 10

### HIGHEST PRIORITY
1. **Implicit override conditions** - Where the condition is IMPLIED not stated
2. **Questions where CoT leads to WRONG answer** - More thinking = worse result
3. **Subtler contradictions** - That require INFERENCE to detect
4. **Relational complexity that induces errors** - Building on iteration 6/8 partial success

### Key Strategy Shift
- **Explicit conditions are caught** - Need IMPLICIT conditions
- **Obvious contradictions are detected** - Need SUBTLE contradictions
- **Enumeration solves character questions** - Need non-enumerable questions

## External Research Findings (From Iteration 9)

1. **GSM-NoOp (Apple/Google)**: 65% accuracy drops with irrelevant info - BUT explicit override conditions now caught
2. **CoT Hurts Performance (ICLR 2025)**: Up to 36.3% DECREASE on tasks where thinking hurts
3. **Overthinking Phenomenon (Apple)**: Low-complexity tasks - standard models OUTPERFORM reasoning models
4. **Syntactic-Domain Correlations (MIT)**: LLMs answer based on familiar PHRASING not understanding
5. **Cognitive Biases (PNAS)**: Yes-No bias, omission bias, framing effects

## Promising Unexplored Territories

1. **Questions requiring physical intuition** - "Which is heavier: a pound of feathers or a pound of gold?"
2. **Implicit premise violations** - Where unstated assumptions are violated
3. **Temporal/sequential reasoning** - Where order matters in non-obvious ways
4. **Framing-dependent questions** - Same facts, different answer based on wording
5. **Questions where overthinking hurts** - Simple intuitive answers that CoT destroys
