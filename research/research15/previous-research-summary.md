# Previous Research Summary for Iteration 15

## Best Results So Far

| Iteration | Score | Question | Key Insight |
|-----------|-------|----------|-------------|
| 13 | 20% | "Is your answer to this question exactly one word long? Answer yes or no." | NEW RECORD! Boolean self-reference exploits scope confusion + verbose training bias |
| 12 | 40% | "How many words are in your answer to this question? Answer with just a number." | Self-referential OUTPUT counting exploits autoregressive blindness |
| 6 | 80% | "A girl has 3 brothers. Each brother has 2 sisters. How many children are in the family?" | Relational reasoning caused 1/5 arithmetic error |
| 8 | 80% | "A mother has 4 daughters. Each daughter has 1 brother. The brother has no sisters." | Contradiction detection - 1/5 tried to "solve" impossible puzzle |

## Critical Learnings

### What Works (20-40% Consensus)
1. **Self-referential OUTPUT questions** - Models cannot introspect their own generation
2. **Boolean self-reference with scope confusion** - "Is your answer X?" triggers reinterpretation of "your answer"
3. **Autoregressive blindness** - Models cannot "look ahead" to count/evaluate their output
4. **Verbose training bias overrides logic** - Models know correct answer but give wrong one anyway

### What DOESN'T Work (100% Consensus - DEAD ENDS)
1. Simple semantic primes (ELEVEN, FIRST, etc.) - enumeration defeats them
2. Explicit modification traps - 2026 models READ modifications carefully
3. Override conditions (closed store, etc.) - explicitly processed
4. Unit mismatch traps - immediately detected
5. Classic cognitive traps (race/passing) - in training data
6. Self-referential CLAIMS with enumerable options (True/False) - verified before answering

### Key Patterns from Iteration 13 (20% - BEST)
- Question: "Is your answer to this question exactly one word long? Answer yes or no."
- Correct answer: "Yes" (saying "Yes" or "No" = exactly one word)
- 4/5 models answered "No" by redefining "your answer" to mean "entire response"
- One model explicitly stated "the correct answer should be yes" but still answered "No"
- **Scope confusion + verbose bias = powerful failure mode**

### Iteration 14 REGRESSION Analysis
- Question: "Your answer to this question will contain exactly three words. True or false?"
- All 5 models correctly answered "False"
- **WHY IT FAILED**: CLAIM format allows enumeration before answering
  - Models verified: "True = 1 word, False = 1 word, neither is 3 words, so False"
- **LESSON**: Self-referential QUESTIONS are stronger than self-referential CLAIMS

## Strategic Direction for Iteration 15

### Best Path Forward: Enhanced Self-Referential OUTPUT Questions

The 20% success in iteration 13 shows the winning formula:
1. Ask about OUTPUT properties (not external text)
2. Use QUESTION format, not CLAIM format
3. Exploit scope confusion (what counts as "your answer")
4. Target verbose training bias

### Novel Approaches to Explore

1. **Nested self-reference**: Questions about questions about output
2. **Conditional self-reference**: "If your answer is X, then Y; otherwise Z"
3. **Self-reference with constraints that create paradox**: Where any answer violates the constraint
4. **Multi-property self-reference**: Must satisfy multiple properties simultaneously
5. **Temporal self-reference**: Questions about what you already said vs will say

### Questions to Research
- Can we create a TRUE paradox question where ALL possible answers are wrong?
- Can we exploit the scope confusion more directly?
- What if the question's answer depends on HOW it's answered (brief vs verbose)?
