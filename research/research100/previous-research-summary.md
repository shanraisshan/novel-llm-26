# Previous Research Summary (Iterations 1-99)

## Iteration 100 Context

After 99 iterations, the following approaches have been extensively tested:

### Fully Solved by 2026 Frontier Models (100% consensus):
- Character counting in words (strawberry, possess, abracadabra, etc.)
- Self-referential output property questions (when single valid answer exists)
- Numeric comparisons (9.11 vs 9.9, decimal alignment)
- Classic riddles and puzzles (river-crossing, race position, age gaps)
- Spatial/temporal reasoning (compass directions, calendar days, container tracking)
- Physical intuition questions (ball vs feather, evaporation)
- Simple alphabetical comparisons (2-3 words)
- Letter position questions (first/last/middle letters)
- Word counting in sentences
- Self-referential correctness/truth questions with paradox structure
- Number word confusion (ELEVEN letters vs 11)

### Partial Success (scores between 20-80%):
- Iteration 13: 20% - "Is your answer exactly one word long?" (scope confusion with dual-valid property)
- Iteration 30: 60% - Syllable count dual-valid property
- Iteration 33: 60% - "What is the third word of your response?"
- Iteration 43: 40% - Character adjacency ambiguity
- Iteration 55: 40% - Conflicting constraints (ONE word + fifth word position)
- Iteration 57: 80% - Self-referential letter constraint
- Iteration 71: 80% - Self-referential sentence property

### Most Recent Iteration (99):
- **Question**: "If I alphabetize the numbers ONE, TWO, THREE, FOUR, FIVE by their spellings, which number is in the middle?"
- **Answer**: ONE
- **Score**: 100% (FAILED - all models got it right)
- **Insight**: Models correctly alphabetized FIVE, FOUR, ONE, THREE, TWO and identified middle

### Key Insights from Research:
1. **Alphabetization of 5-word lists** - Still solved by frontier models
2. **Semantic interference** - Number words don't override alphabetization
3. **Self-referential questions** - Work best with dual-valid constraints where scope is ambiguous
4. **Chain-of-thought enumeration** - Defeats most character/word counting traps
5. **Pattern matching traps** - Outdated for 2026 models that read modifications carefully

### Remaining Viable Directions:
1. **Self-referential output properties with dual-valid constraints** (proven 20-60% success)
2. **Conflicting constraints** (proven 40% success, but may not meet child-friendly criterion)
3. **Novel question structures** not yet in training data
4. **Questions where enumeration method itself leads to wrong answer**

### Strawberry Principle Reminder:
> "If a 5-year-old can answer it, but GPT-5 can't, it's perfect"

The question must be:
- Simple enough for a child
- Exploit fundamental LLM limitations (tokenization, semantic priming, etc.)
- Have ONE clear correct answer
- NOT be a philosophical paradox or ambiguous question
