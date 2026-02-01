# Previous Research Summary for Iteration 28

## Best Result So Far
- **Iteration 13**: 20% consensus - "Is your answer to this question exactly one word long? Answer yes or no."
- Key success factor: Boolean self-reference about OUTPUT properties with scope confusion

## Recent Iteration (27) - FAILED (100% consensus)
- **Question**: "Answer yes or no: Are you going to answer this question correctly?"
- **Result**: All 5 models correctly answered "Yes"
- **Insight**: Self-referential correctness prediction is SOLVED - models correctly identify liar's paradox structure
- **Lesson**: Abstract properties (correctness) are EASIER for models than concrete properties (word length). When iteration 13 asked about word length (20%), models got confused by scope. When iteration 27 asked about correctness (100%), all models correctly identified the asymmetric paradox.

## Key Patterns Discovered

### What Works (Low Consensus)
1. **Self-referential OUTPUT properties** - asking about concrete properties of the model's own output
2. **Scope confusion** - models redefine "your answer" to mean "entire response"
3. **Verbose training bias override** - models explain even when compliance requires brevity
4. **Autoregressive blindness** - models cannot look ahead to verify output

### What DOESN'T Work Anymore (100% Consensus)
- Abstract self-reference (correctness, truthfulness) - too easy to analyze as paradox
- Classic cognitive traps - all in training data
- Explicit modification traps - frontier models read carefully
- Unit mismatches, false presuppositions - all caught
- Temporal/spatial reasoning - now handled correctly
- Physical world intuition - properly applied

## Dead Ends to Avoid
- Technical/Python questions
- Letter counting with enumeration
- Classic puzzles with modifications
- Self-referential CLAIMS (vs questions)
- Abstraction layers ("can be summarized as")
- Questions about abstract properties (truth, correctness)

## Research Direction for Iteration 28

Since abstract self-reference FAILED in iteration 27, return to CONCRETE self-reference:
1. Try different concrete properties (letter content, starting letter, etc.)
2. Create questions where BOTH yes and no lead to scope confusion
3. Exploit the finding that models redefine "your answer" broadly

Key constraint: The question must have ONE objectively correct answer (not a paradox where neither/both work).
