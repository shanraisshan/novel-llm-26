# Previous Research Summary for Iteration 55

## Last Iteration (54) Results
- **Question**: "I have a piano with white keys labeled A, B, C, D, E, F, and G. How many white keys does my piano have?"
- **Answer**: 7
- **Score**: 100% (FAILED - all models answered correctly)
- **Status**: need_more_research

## Key Insight from Iteration 54
MEMORIZATION BIAS OVERRIDE FAILED. Despite VLMBias research (ICLR 2026) showing VLMs achieve only 17% accuracy on counterfactual images due to memorization override, all 5 text-only models correctly answered '7' by counting the explicitly listed letters. The semantic priming from 'piano' + 'white keys' did NOT override the explicit list.

**Critical Lesson**: EXPLICIT ENUMERABLE LISTS IN QUESTIONS ARE ALWAYS CORRECTLY COUNTED. Even with strong semantic priming from domain knowledge, when the question explicitly lists items, models count the list rather than defaulting to memorized facts.

## Pattern Summary from 54 Iterations

### PROVEN DEAD ENDS (100% consensus - models solve correctly):
1. Character/letter counting - models enumerate via CoT
2. Numeric comparisons - models align decimal places
3. Visual transformations - models have letter shape knowledge
4. Pattern counting (consecutive letters) - systematic scanning works
5. Semantic priming (LONG vs SHORT) - doesn't override enumeration
6. Phonetic/rhyming traps - pronunciation knowledge is encoded
7. Multi-step state tracking - models trace explicitly
8. Classic puzzle modifications - frontier models READ modifications
9. GSM-NoOp override conditions - explicit conditions are caught
10. Unit mismatches - models notice and convert
11. Famous cognitive traps - likely in training data
12. False presupposition rejection - models catch obvious impossibilities
13. Physical state transformations - well-known physics applied
14. Nested container tracking - transitive relationships traced
15. Temporal reasoning - calendar day sequences traced
16. Self-referential correctness - paradox structure analyzed
17. Last-letter alphabetical sorting - decomposition works
18. Simple inverse relations - direct logical equivalence

### PARTIAL SUCCESS (40-80% consensus):
- Iteration 6: Sibling puzzle (80%) - arithmetic error caused disagreement
- Iteration 8: Contradiction detection (80%) - "solve mode" override
- Iteration 12: Self-referential output counting (40%) - autoregressive blindness
- Iteration 13: Boolean self-reference word count (20%) - BEST RESULT - scope confusion
- Iteration 30: Syllable count self-reference (60%) - dual-valid property
- Iteration 33: Third word prediction (60%) - output prediction constraint
- Iteration 43: Double-letter adjacency (40%) - interpretation ambiguity

### KEY FAILURE MECHANISMS THAT WORKED:
1. **Scope confusion** (iteration 13): "your answer" interpreted as full response vs just yes/no word
2. **Dual-valid constraints**: Properties where BOTH yes and no satisfy the constraint
3. **Autoregressive blindness**: Cannot look ahead to count own output during generation

## What to Try Next

Based on the guidance:
1. **DO NOT USE** yes/no or true/false format
2. **DO NOT USE** enumeration-solvable questions
3. **EXPLORE** performative paradoxes, anti-instructions, output prediction
4. Use external research (Tavily, Reddit MCP) to find NEW failure modes
5. Questions must be simple enough for a 5-year-old to understand
