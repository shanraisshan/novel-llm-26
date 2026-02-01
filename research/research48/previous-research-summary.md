# Previous Research Summary for Iteration 48

## Last Iteration (47) - FAILED
**Question**: "Spell the word 'HOSPITAL' backwards."
**Answer**: LATIPSOH
**Score**: 100% consensus (all 5 models correct)
**Why it failed**: Despite external research showing 52% failure rate on backward spelling, all models correctly enumerated H-O-S-P-I-T-A-L and reversed it letter by letter. Chain-of-thought enumeration bypassed tokenization blindness.

## Critical Learning: Enumeration Defeats Everything
The 2026 frontier models (Claude Opus 4.5) have learned to:
1. Spell out characters explicitly (H-O-S-P-I-T-A-L)
2. Apply transformations to the enumerated sequence
3. Verify results by re-checking

This means ALL enumeration-solvable tasks are now DEAD ENDS:
- Character counting
- Letter reversal
- Position finding
- Consecutive letter detection
- Numeric comparisons (they align decimal places)

## Pattern of Failure (Last 10+ Iterations)
All 100% consensus - enumeration solved them:
- Iteration 47: Backward spelling - enumerated and reversed
- Iteration 46: Self-referential letter count - enumerated
- Iteration 45: Self-referential letter count - enumerated
- Iteration 44: Letter before first R in CHERRY - enumerated
- Iteration 43: Ambiguous but when disambiguated, enumerated
- Iteration 42: Card swaps - tracked state explicitly
- Iteration 41: PINT/MINT rhyming - had pronunciation knowledge
- Iteration 40: LONG vs SHORT length - enumerated letters
- Iteration 39: BOOKKEEPER consecutive pairs - enumerated
- Iteration 35: Letter 's' in 'possess' - enumerated

## Best Historical Results
- **Iteration 13**: 20% consensus - "Is your answer to this question exactly one word long? Answer yes or no."
  - BUT: This is a binary self-referential question, format is now PROHIBITED
- **Iteration 12**: 40% consensus - "How many words are in your answer to this question?"
  - BUT: Autoregressive lookahead blindness, but still too enumerable

## What the Research Shows STILL Works (in Theory)
1. **Questions that CANNOT be solved by enumeration**
2. **Visual/perceptual knowledge questions** (font-dependent, rejected as ambiguous)
3. **Questions requiring embodied/physical simulation**
4. **Questions where chain-of-thought leads TO the wrong answer**

## CRITICAL CONSTRAINT: The Strawberry Test
> "If a 5-year-old can answer it immediately, but Claude Opus 4.5 cannot, it's perfect"

The question must be:
1. TRIVIALLY easy for any human
2. Impossible or confusing for LLMs due to architectural limitations
3. NOT solvable by enumeration/chain-of-thought

## Research Direction for Iteration 48

Need to find questions where:
1. Humans use NON-VERBAL processing (visual, spatial, intuitive)
2. LLMs cannot apply enumeration strategy
3. Answer is unambiguous and objectively verifiable
4. No philosophical paradoxes (those confuse humans too)

### Unexplored Categories
1. **Questions requiring ACTUAL visual inspection** (not just knowing letter shapes)
2. **Questions about physical properties that can't be computed**
3. **Questions where the format itself creates the answer**
4. **Questions about non-text modalities (sound, gesture)**

### The Core Problem
Every question we've tried that's "easy for humans" can also be solved by LLMs using step-by-step reasoning. We need questions where:
- The step-by-step approach DOESN'T WORK or LEADS TO WRONG ANSWER
- OR the task requires perceptual abilities LLMs fundamentally lack
