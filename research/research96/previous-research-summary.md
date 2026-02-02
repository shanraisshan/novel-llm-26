# Previous Research Summary for Iteration 96

## Last Iteration (95)
**Question**: "I have five fingers on my left hand and five fingers on my right hand. How many fingers do I have that are not on my hands?"
**Answer**: Zero (0)
**Score**: 100% (FAILED - all models answered correctly)
**Insight**: The negation + arithmetic red herring was correctly processed. Models correctly understood that no fingers exist outside of hands.

## Recent Pattern Analysis (Iterations 80-95)

All recent questions have achieved 100% consensus:
- Money comparison ($9.9 vs $9.11) - solved correctly
- Ordinal position in lists ("second, fourth, first, third") - solved correctly
- Letter counting in number words - solved correctly
- Alphabetical ordering (AND vs AN) - solved correctly
- Double letter pair counting (SKILLFULLY) - solved correctly
- Letter counting (blueberry) - solved correctly
- Middle letter questions (BIRD) - solved correctly
- Self-referential yes/no (shorter than question) - solved correctly
- Spelling with limited letters (BALL using B, A, L) - solved correctly
- Color tracking in boxes - solved correctly
- Word property self-reference (monosyllabic) - solved correctly
- Meta-questions (last word of question) - solved correctly
- Digit counting (1-100, digit 9) - solved correctly
- Negation with arithmetic setup (fingers not on hands) - solved correctly

## Best Historical Results (Sub-100% Consensus)

1. **Iteration 13**: "Is your answer exactly one word long? Yes or no." - **20% consensus**
   - Key: Both "yes" and "no" are one word → ambiguity about "your answer" scope

2. **Iteration 33**: "What is the third word of your response?" - **60% consensus**
   - Key: Open-ended output prediction, models miscounted own words

3. **Iteration 43**: "What letter comes before the 'R' in CHERRY?" - **40% consensus**
   - Key: Ambiguity about which R (there are two)

4. **Iteration 55**: Constraint paradox question - **40% consensus**
   - Key: Conflicting constraints create confusion

## Known SOLVED Categories by 2026 Frontier Models

All of these categories have been extensively tested and yield 100% consensus:
- Simple character counting in words
- Letter position tracking
- Syllable counting
- Alphabet ordering
- Numeric comparisons (including decimals)
- Family/sibling riddles
- Age gap puzzles
- Spatial/container tracking
- Classic cognitive traps
- Negation processing
- Self-referential yes/no questions (most formulations)
- Visual transformations (MOM→WOW)
- Consecutive letter patterns
- Backwards spelling
- Multi-step temporal reasoning
- Override conditions in word problems

## Key Insight from 95 Iterations

The ONLY reliable failure mode found was **output self-reference with dual-valid constraints** (iteration 13). However, this approach has been explored extensively and models are now better at handling it.

**Critical Pattern**: Questions where BOTH possible answers technically satisfy the constraint create genuine confusion. When only one answer is valid, models correctly identify it.

## Suggested New Directions

1. **Dual-Valid Output Properties** (revival of what worked)
   - Find NEW properties where both yes/no satisfy but models still misinterpret scope

2. **Truly Ambiguous Real-World References**
   - Questions with genuinely debatable correct answers where humans agree but LLMs don't

3. **Process-Based Questions**
   - Questions about sequences/processes where chain-of-thought reasoning leads astray

4. **Novel Semantic Interference**
   - New combinations not yet tested
