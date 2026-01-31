# Previous Research Summary for Iteration 9

## Overview
8 research iterations completed. All achieved 80-100% consensus (FAILURE to break LLMs).

## Key Findings from Previous Iterations

### Iterations 1-5: Letter/Character Questions (100% Consensus - DEAD END)
- Simple letter counting with semantic primes: SOLVED
- Position questions with occurrence tracking: SOLVED
- Forced-choice formats: SOLVED
- Semantic contradiction alone: SOLVED
- Self-referential phrases ("FIVE LETTERS"): SOLVED

**Lesson**: Any question solvable by "write out letters, count systematically" WILL BE SOLVED.

### Iteration 6: Sibling Puzzle (80% Consensus - PARTIAL PROGRESS)
- **Question**: "A girl has 3 brothers. Each brother has 2 sisters. How many children are in the family?"
- **Result**: 4/5 models got it right (5 children). One model made arithmetic error (3+2=6).
- **Insight**: Relational reasoning CAN cause disagreement but most models still solve correctly.

### Iteration 7: Modified River Crossing (100% Consensus - DEAD END)
- **Question**: Wolf/goat/cabbage with "wolf can swim, goat can swim, cabbage floats"
- **Result**: All 5 models correctly processed the modifications.
- **Insight**: EXPLICIT modification traps are now caught by 2026 frontier models.

### Iteration 8: Contradiction Detection (80% Consensus - PARTIAL PROGRESS)
- **Question**: "A mother has 4 daughters. Each daughter has 1 brother. The brother has no sisters. How many children?"
- **Result**: 4/5 models correctly identified logical impossibility. 1 model tried creative resolution.
- **Insight**: Most models enter "verification mode" and correctly identify impossibility. BUT one model (20%) tried to creatively "solve" the unsolvable.

## Critical Strategy Insights

### DEAD ENDS (Proven Ineffective):
1. Letter counting with semantic primes
2. Position/occurrence questions
3. Self-referential claims
4. EXPLICIT modification traps (2026 models read modifications carefully)
5. Simple relational puzzles (most models solve with CoT)
6. Obvious contradictions (most models detect them)

### PROMISING DIRECTIONS (from external research):
1. **IMPLICIT modifications** (not explicitly stated, require inference)
2. **Questions where CoT makes things WORSE** (overthinking leads to wrong answer)
3. **Compositional reasoning** (combining two simple tasks causes accuracy collapse)
4. **Pattern matching to riddle templates** (e.g., Candle Test - models answer "candle" despite just confirming candles get shorter)
5. **Framing that triggers systematic biases** (Yes-No bias, omission bias)
6. **Subtler contradictions** that are hidden in complex phrasing

### Key External Research (Iteration 8):
1. **Apple's "Illusion of Thinking"**: LLMs hit complexity cliffs and collapse entirely
2. **PNAS Yes-No Bias**: LLMs flip answers based on question wording
3. **CoT Hurts Performance**: In medical diagnosis, 86.3% of models performed WORSE with CoT
4. **Candle Test**: Pattern matching to riddle templates overrides explicit prior knowledge
5. **Compositional Failure**: Combining math + commonsense drops accuracy from 90% to 55%

## Next Research Direction

Focus on:
1. Questions with IMPLICIT constraints that LLMs miss
2. Questions where systematic reasoning CONFIRMS the wrong answer
3. Questions that trigger cached riddle templates
4. Questions requiring inference beyond the text
5. Subtler contradictions hidden in multi-step reasoning

**Target**: < 10% consensus (at least 4 different answers from 5 models)
