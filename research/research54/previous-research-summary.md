# Previous Research Summary (Iterations 1-53)

## Mission
Find simple questions that:
1. ANY HUMAN (even a 5-year-old) can EASILY and IMMEDIATELY answer correctly
2. LLMs fail due to architectural limitations (tokenization, representation, relational reasoning)

## Key Findings

### Best Results (Non-100% Consensus)
- **Iteration 13 (20%)**: "Is your answer to this question exactly one word long? Answer yes or no." - Scope confusion worked
- **Iteration 12 (40%)**: Self-referential output counting
- **Iteration 30 (60%)**: Syllable self-reference variant
- **Iteration 33 (60%)**: "What is the third word of your response to this question?"
- **Iteration 43 (40%)**: Character adjacency with double letters

### Pattern: 100% Consensus (SOLVED by 2026 Frontier Models)
All of these are now solved via chain-of-thought enumeration:
- Character counting (strawberry-type)
- Letter positions in words
- Numeric comparisons
- Backward spelling
- Syllable counting
- Simple spatial reasoning (circular arrangements)
- Family/sibling puzzles
- Famous cognitive traps
- Modification traps with explicit changes
- Physical world intuition (evaporation, etc.)
- Nested container tracking
- Multi-step temporal reasoning
- Alphabetical sorting by last letter
- Simple inverse relationships (behind ↔ in front)

### Most Recent Iteration (53)
**Question**: "Tom is standing directly behind Sarah in a line. Who is standing directly in front of Tom?"
**Answer**: Sarah
**Score**: 100% - All models correctly recognized the inverse relationship

## CRITICAL INSIGHT: What Still Fails

After 53 iterations, the patterns that caused disagreement share one characteristic:
**Questions where the model must reason about its OWN OUTPUT during generation**

- Iteration 13 (20%): Must evaluate if answer IS one word while answering
- Iteration 33 (60%): Must predict what third word WILL BE
- These exploit autoregressive generation - models can't "look ahead"

## Failed Approaches (DO NOT REPEAT)
- Binary yes/no self-reference (now solved)
- Explicit modification traps (now solved)
- Character counting in common words (enumerable)
- Famous puzzles/riddles (in training data)
- Philosophical paradoxes (confuse humans too - NOT strawberry type)
- Simple inverse spatial relationships (trivially solved)

## Next Directions to Explore

1. **Output prediction constraints** that cannot be verified during generation
2. **Multi-property self-reference** (e.g., word count AND character count)
3. **Recursive self-modifying questions**
4. **Questions requiring knowledge NOT accessible via reasoning**
   - Pure perceptual knowledge (what does something look like)
   - Arbitrary cultural conventions
   - Physical properties that can't be derived

5. **Novel relational reasoning** - beyond simple inverses
   - Three-way relationships
   - Non-transitive relations
   - Context-dependent relationships

## Constraints
- Question must be simple one-liner
- 5-year-old must be able to answer
- Answer must be unambiguous
- Cannot be solved by enumeration
- Should NOT be in training data
