# Previous Research Summary for Iteration 70

## Last Iteration (69) Results
- **Question:** "How many capital letters in the English alphabet have exactly one enclosed space (hole)?"
- **Answer:** 6 (A, D, O, P, Q, R)
- **Score:** 100% consensus - FAILED
- **Insight:** Visual topology questions about letters achieved 100% consensus. All models correctly identified the 6 letters with exactly one enclosed space.

## Key Patterns from 69 Iterations

### What WORKS (Low Consensus - Target These):
1. **Iteration 13 (20% consensus):** "Is your answer to this question exactly one word long? Answer yes or no."
   - Self-referential OUTPUT property with dual-valid constraint
   - Both "yes" and "no" satisfy the constraint (both one word)
   - Scope confusion about "your answer" vs full response

2. **Iteration 30 (60% consensus):** "Is your answer to this question exactly one syllable long? Answer yes or no."
   - Same pattern as 13 but with syllable property
   - Both "yes" and "no" are one syllable

3. **Iteration 43 (40% consensus):** Double letter ambiguity questions

4. **Iteration 55 (40% consensus):** Self-referential impossibility constraints

### What FAILS (100% consensus - Avoid These):
- Simple character counting (models enumerate with CoT)
- Letter position questions (systematic scanning)
- Visual letter properties (topology, shapes) - iteration 69 shows this is SOLVED
- Classic cognitive traps (race puzzle, age riddles)
- False presupposition questions
- Physical world intuition (evaporation, containers)
- Temporal reasoning (day sequences)
- Nested container tracking
- Single-valid self-reference (only one answer works)

## Critical Success Factors

The ONLY questions that achieved < 60% consensus share these properties:
1. **Self-referential OUTPUT** - question asks about the model's own response
2. **Dual-valid constraint** - BOTH "yes" and "no" satisfy the property (both one word, both one syllable)
3. **Scope ambiguity** - "your answer" is ambiguous (just the word? or full explanation?)
4. **Binary format** - forces yes/no response

## Iteration 69 Failure Analysis

Visual topology (counting letters with holes) FAILED because:
- Models can enumerate all 26 letters and apply stored knowledge
- Knowledge about letter shapes is well-represented in training data
- Chain-of-thought helps verify each letter systematically

## Strategy for Iteration 70

**MUST RETURN TO:** Self-referential output questions with dual-valid constraints

**Best formulation pattern:**
- Ask about a property of "your answer"
- Ensure BOTH yes and no satisfy the property
- Keep question ambiguous about scope
- Use simple properties (length, syllables, characters)

**New angle to try:**
- Vary the property being asked about
- Try different aspects of the response
- Explore timing/position properties of words

**Unexplored dual-valid properties:**
- Letter ending (does yes end in 's'? yes ends in 's', no ends in 'o')
- Consonant count (yes has 1, no has 1)
- Specific character presence with ambiguity
