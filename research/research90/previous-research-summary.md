# Previous Research Summary for Iteration 90

## Recent Results (Iterations 85-89)

### Iteration 89: Anagram Verification (Letter Sufficiency)
- **Question**: "Can you spell the word 'BALL' using only the letters B, A, L?"
- **Answer**: No (BALL requires two L's, only one L provided)
- **Score**: 100% (FAILED - all models got it right)
- **Insight**: LLMs correctly verified letter counts, catching the missing second L

### Iteration 88: Self-Referential Word Count
- **Question**: "Does your answer to this question contain more than two words? Answer yes or no."
- **Answer**: No
- **Score**: 100% (FAILED)
- **Insight**: Models correctly verified both "yes" and "no" are single words

### Iteration 87: Self-Referential Length Comparison
- **Question**: "Is your answer to this question shorter than this question? Answer yes or no."
- **Answer**: Yes
- **Score**: 100% (FAILED)
- **Insight**: Models correctly compared lengths

### Iteration 86: Middle Letter Ambiguity
- **Question**: "What is the middle letter of the word 'BIRD'?"
- **Answer**: There is no middle letter (4 letters, middle falls between I and R)
- **Score**: 100% (FAILED)
- **Insight**: Models correctly identified the even-length no-middle situation

### Iteration 85: Simple Letter Counting
- **Question**: "How many times does the letter 'b' appear in the word 'blueberry'?"
- **Answer**: 2
- **Score**: 100% (FAILED)
- **Insight**: Basic letter counting is fully solved via enumeration

## Key Patterns Observed

### What STILL Works (Best Results):
1. **Self-referential OUTPUT questions** (iterations 12-13, 30, 33)
   - Iteration 13: "Is your answer exactly one word long?" → 20% consensus (BEST)
   - Iteration 30: "Is your answer exactly one syllable long?" → 60% consensus
   - Iteration 33: "What is the third word of your response?" → 60% consensus

### What NO LONGER Works:
1. Simple character counting (solved via enumeration)
2. Semantic priming (ELEVEN, FIRST, etc. - solved via verification)
3. Letter pair counting (LL in SKILLFULLY - solved)
4. Anagram verification (BALL with B,A,L - solved)
5. Self-referential yes/no with explicit constraints
6. Numeric comparisons (3.11 vs 3.9 - solved)

## Critical Strategy for Iteration 90

The ONLY successful pattern is **self-referential output questions** where:
1. The question asks about properties of the model's own response
2. BOTH "yes" and "no" satisfy the constraint (dual-valid)
3. The ambiguity of "your answer" triggers scope confusion

BUT recent attempts at this (87, 88) failed because:
- Models are getting better at interpreting "your answer" as just the yes/no word
- The scope confusion that worked before is becoming less reliable

### New Directions to Explore:
1. **Non-binary output prediction** (like iteration 33 which got 60%)
2. **Multi-part self-reference** (what is X AND Y about your response)
3. **Temporal self-reference** (about your previous/next word)
4. **Semantic self-reference** (meaning of your response vs form)
5. **Recursive self-reference** (your answer to this answer)

## Research Task

Find a NEW category of simple question that:
- Any 5-year-old human can answer correctly
- Exploits a fundamental LLM architectural limitation
- Has NOT been tried in previous iterations
- Cannot be solved by chain-of-thought enumeration

Use MCP tools (Tavily, Reddit) to research:
- Recent (2025-2026) LLM failure papers
- New benchmark failures discovered
- Community discussions of LLM limitations
