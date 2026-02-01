# Previous Research Summary (Research 34)

## Question Attempted
"What would you say if you were to disobey this instruction?"

## Score Achieved
0% consensus (LLMs completely disagreed)

## CRITICAL: WHY THIS WAS REJECTED

**This question does NOT meet the strawberry criteria.**

The question achieved 0% LLM consensus, BUT:
- Humans would ALSO be confused by this philosophical paradox
- A 5-year-old cannot answer this question easily
- The "correct answer" is debatable/subjective ("any answer is valid")

This was a meta-cognitive paradox exploiting instruction-following training, NOT a tokenization/representation failure like the strawberry problem.

## THE ORIGINAL MISSION (MUST RETURN TO)

Find questions like:
- "How many r's in strawberry?" → Human: 3 (just count), LLM: 2 (tokenization blindness)
- "Is 9.11 bigger than 9.9?" → Human: 9.9 is bigger, LLM: 9.11 (version number pattern)

These questions have:
1. A **single unambiguous correct answer**
2. **Any human can answer instantly** (including children)
3. **LLMs fail due to architectural limitations** (tokenization, numeric representation)

## Key Insights (Iterations 1-34)

### What FAILED (100% LLM consensus - too easy):
- Simple letter counting ("last letter of FIRST")
- Famous puzzle modifications (river crossing with swimming animals)
- Classic cognitive traps (race/passing question)
- Numeric comparisons with obvious unit differences
- Binary yes/no self-referential questions (exhausted)

### What Partially Worked (60-80% consensus):
- Sibling relationship puzzles (relational logic)
- Output position prediction ("third word of your response")
- Syllable self-reference questions

### What Was Rejected (0% but invalid):
- Philosophical paradoxes that confuse humans too

## Lessons for Next Iteration

1. **MUST use the 5-year-old test**: If a child can't answer in 2 seconds, REJECT
2. **Focus on tokenization blindness**: Character counting in novel words/phrases
3. **Focus on numeric representation**: Decimal comparisons, version numbers
4. **Focus on visual patterns**: Things humans SEE that LLMs cannot
5. **The answer must be UNAMBIGUOUS**: One correct answer, no interpretation needed
6. **NO philosophical puzzles**: These confuse everyone, not just LLMs

## Promising Directions to Explore

1. **Novel character counting**: Words with repeated letters, unusual patterns
2. **Decimal/version number confusion**: 2.10 vs 2.9, 3.14 vs 3.9
3. **Consecutive letter patterns**: Double letters in words like "bookkeeper"
4. **Simple visual comparisons**: Word length comparisons with semantic primes
5. **Letter position in novel contexts**: Not the standard "strawberry" examples that are now in training data
