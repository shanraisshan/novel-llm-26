# Previous Research Summary for Iteration 67

## Last Iteration (66)
**Question**: Is your answer to this question shorter than five letters? Answer yes or no.
**Answer**: Yes
**Score**: 100% (all models correct)
**Status**: need_more_research

**Key Insight**: Self-referential output property questions are now solved even when mirroring iteration 13's dual-valid structure. The question about 'shorter than five letters' was too easily verified - both 'yes' (3 letters) and 'no' (2 letters) satisfy the constraint, so 'yes' is clearly correct. The hoped-for scope confusion did NOT manifest.

## Critical Findings from 66 Iterations

### BEST RESULTS (Lowest Consensus = Hardest for LLMs)
1. **Iteration 13 (20%)**: "Is your answer to this question exactly one word long? Answer yes or no."
   - Key: Scope confusion between "yes/no word" vs "full response"
2. **Iteration 12 (40%)**: "How many words are in your answer to this question? Answer with just a number."
   - Key: Self-referential output counting
3. **Iteration 55 (40%)**: "Answer with just ONE word: What is the fifth word of your response?"
   - Key: Conflicting constraints (one word can't have fifth word)
4. **Iteration 43 (40%)**: "What letter comes immediately before the 'R' in the word 'CHERRY'?"
   - Key: Double-R ambiguity (which R?)
5. **Iteration 30 (60%)**: "Is your answer to this question exactly one syllable long? Answer yes or no."
   - Key: Syllable-based dual-valid structure

### PATTERNS THAT FAILED (100% Consensus - LLMs Solved Them)
- Character counting in familiar words (solved by enumeration)
- Backward spelling (solved by enumeration)
- Numeric comparisons (solved by decimal alignment)
- Classic riddles (likely in training data)
- Physical world intuition with implicit context
- Nested container tracking
- Multi-step temporal reasoning
- Alphabetical ordering tasks
- Syllable counting
- Pattern counting (consecutive letters)

### WHAT WORKS (But Not Yet Achieving < 10%)
1. **Self-referential OUTPUT properties** with scope ambiguity
2. **Conflicting constraints** that create logical impossibility
3. **Double-letter ambiguity** (which instance?)

### WHAT TO AVOID
- Meta-cognitive paradoxes (confuse humans too)
- Enumeration-solvable tasks (LLMs now enumerate correctly)
- Famous puzzles/riddles (in training data)
- Explicit modifications to classic puzzles (LLMs read carefully)
- Yes/no questions with single valid answer

## Research Direction for Iteration 67

The core challenge: 2026 frontier models (Claude Opus 4.5) have mastered chain-of-thought enumeration for most counting/pattern tasks. Need to find:

1. Tasks that CANNOT be solved by enumeration
2. Tasks where enumeration LEADS TO wrong answer
3. Questions with genuine ambiguity that humans resolve consistently but LLMs don't
4. Self-referential output questions with novel structures

Consider exploring:
- Novel variations on iteration 13's success (scope ambiguity)
- Questions about OUTPUT that can't be pre-verified
- Perceptual/visual tasks that can't be computed mathematically
- Questions where the "obvious" answer is actually wrong
