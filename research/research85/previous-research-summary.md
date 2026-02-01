# Previous Research Summary for Iteration 85

## Overview
After 84 iterations, all simple counting and enumeration tasks have been solved by modern LLMs using chain-of-thought reasoning. The last iteration (84) tested counting letter pairs ("LL" in "SKILLFULLY") - LLMs got it 100% correct.

## Key Patterns That NO LONGER WORK (Score: 100%)

### Category 1: Character/Letter Counting
- Simple letter counting (strawberry, abracadabra)
- Counting specific letters in words
- Letter pair counting (LL, EE patterns)
- Cross-word letter counting

### Category 2: Position-Based Questions
- Finding middle letters
- First/last letter operations
- Alphabetical ordering (first/last)
- Word positions in sentences

### Category 3: Classic Riddles & Traps
- "All but X" riddles (farmer/sheep)
- Self-referential answer questions
- Semantic interference (word counts in sentences)
- Syllable counting

### Category 4: Mathematical/Logical
- Money calculations
- Clock positions
- Shape properties
- Number comparisons

## The Fundamental Problem
Modern LLMs (2026 frontier models) have developed sophisticated Chain-of-Thought enumeration strategies. When asked ANY question, they:
1. Explicitly enumerate the elements
2. Apply step-by-step reasoning
3. Cross-verify their answer

This means: **If it can be enumerated, they will get it right.**

## What Remains Unexplored

The key insight is that we need questions where:
1. **Enumeration doesn't help** - the answer requires a different type of reasoning
2. **Human intuition succeeds** - humans get it instantly without enumeration
3. **Clear unambiguous answer** - no trick questions or ambiguity

### Potential Directions for Iteration 85:

1. **Temporal/Sequential Logic**: Questions about ORDER of operations or events where the semantic content conflicts with the actual sequence

2. **Spatial Relationships Expressed in Text**: Questions about left/right, above/below that humans visualize instantly but LLMs must parse

3. **Comparative Reasoning with Conflicting Cues**: Questions where multiple pieces of information suggest different answers

4. **Cross-Reference Questions**: Where the answer to one part determines how to interpret another part

5. **Meta-Linguistic Properties**: Questions about properties of language itself (pronunciation, spelling rules) that humans know intuitively

## Recent Partial Successes (Score < 100%)

- Iteration 55: Self-referential "fifth word" (40%) - now trained away
- Iteration 57-58: Constraint paradoxes (80%) - but marked as WRONG_DIRECTION (not human-easy)
- Iteration 71: Self-referential sentence (80%)

The pattern shows self-referential and meta-questions sometimes work, but must still be INSTANTLY answerable by a child.

## Recommendation

Focus on questions that exploit the difference between:
- **Human pattern recognition** (visual, intuitive, instant)
- **LLM sequential processing** (tokenized, step-by-step, aggregated)

The question should be something a 5-year-old answers by LOOKING, not by COUNTING.
