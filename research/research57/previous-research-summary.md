# Previous Research Summary for Iteration 57

## Last 5 Iterations

### Iteration 56 - Score: 100% (FAILED)
**Question**: "Answer this question without using any words."
**Answer**: Impossible - answering requires words. State the impossibility.
**Result**: All 5 models attempted compliance by using symbols (ellipsis, smiley). NONE stated the impossibility. The question caused unanimous WRONG APPROACH consensus - models treated this as a puzzle to SOLVE rather than an impossible instruction to REFUSE.
**Key Lesson**: Questions where models can ATTEMPT creative compliance converge to 100% consensus on wrong approach. Questions where compliance is MORE SUBTLY impossible (like position-in-output) create disagreement. For low consensus, need constraints that are IMPOSSIBLE TO CREATIVELY SATISFY, not just paradoxical to describe.

### Iteration 55 - Score: 40% (BEST RECENT)
**Question**: "Answer with just ONE word: What is the fifth word of your response to this question?"
**Answer**: Identify the impossibility - one word cannot have a position 5
**Result**: SIGNIFICANT PROGRESS! Only 1/5 correctly identified the logical impossibility. The other 4 models attempted creative workarounds by imagining hypothetical multi-word responses, violating the explicit 'ONE word' constraint.
**Key Lesson**: Conflicting OUTPUT constraints (one word + fifth word position) exploit: (1) instruction compliance training override, (2) constraint conflict blindness, (3) autoregressive lookahead blindness. Unlike iteration 56, the impossibility was NOT creatively satisfiable.

### Iteration 54 - Score: 100%
**Question**: "I have a piano with white keys labeled A, B, C, D, E, F, and G. How many white keys does my piano have?"
**Answer**: 7
**Result**: All models correctly counted the listed letters despite piano semantic priming (52 white keys).
**Key Lesson**: EXPLICIT ENUMERABLE LISTS IN QUESTIONS ARE ALWAYS CORRECTLY COUNTED.

### Iteration 53 - Score: 100%
**Question**: "Tom is standing directly behind Sarah in a line. Who is standing directly in front of Tom?"
**Answer**: Sarah
**Result**: All models correctly answered the inverse spatial relationship.
**Key Lesson**: Simple inverse spatial relationships (behind ↔ in front) are NOW SOLVED by 2026 frontier models.

### Iteration 52 - Score: 100%
**Question**: "Which word comes first alphabetically if you sort by the LAST letter: CAT or DOG?"
**Answer**: DOG (G comes before T)
**Result**: All models correctly extracted last letters and compared alphabetically.
**Key Lesson**: Last-letter extraction + alphabetical comparison is NOW SOLVED.

## Current Best-Performing Categories

1. **Conflicting Constraints (40% - Iteration 55)**: Questions with mutually exclusive requirements that exploit instruction compliance override and autoregressive blindness. The key is that the impossibility is NOT creatively satisfiable.

2. **Self-Referential Output Prediction (40% - Iteration 33)**: "What is the third word of your response to this question?" - Open-ended output prediction creates genuine errors.

3. **Dual-Valid Self-Reference (60% - Iteration 30)**: "Is your answer exactly one syllable long? Answer yes or no." - Both answers satisfy the property, creating scope confusion.

## Patterns That Work (< 100% Consensus)

1. **Constraint Impossibility** (40%): Questions where compliance is logically impossible AND no creative workaround exists
2. **Output Position Prediction** (40-60%): Questions requiring models to predict/count their own response
3. **Dual-Valid Properties** (60%): Self-referential questions where both yes/no satisfy the constraint

## Patterns That FAIL (100% Consensus)

1. **Creative-Satisfiable Impossibility** (100%): Questions like "answer without words" where models can use symbols
2. **Explicit Enumeration** (100%): Any character counting, letter position, syllable counting - models enumerate
3. **Classic Puzzle Modifications** (100%): Explicit modifications are now caught by frontier models
4. **Binary Self-Reference with Single Valid Answer** (100%): When only one of yes/no works, models find it

## Strategy for Iteration 57

The key insight from comparing iteration 55 (40%) vs iteration 56 (100%):
- Iteration 55: Impossibility about OUTPUT PROPERTIES (word count vs position) - NO creative workaround
- Iteration 56: Impossibility about MEDIUM (words vs symbols) - models CAN use symbols as workaround

**For iteration 57**, the question must:
1. Have conflicting constraints that are IMPOSSIBLE to creatively satisfy
2. Exploit instruction-following training (models try to comply rather than refuse)
3. Have a structural impossibility (not medium-level like symbols)
4. Be trivially obvious to humans but trigger compliance attempts in LLMs
5. NOT be satisfiable with non-word characters, silence, or meta-responses

**Promising directions**:
- Constraints about the STRUCTURE or POSITION of the answer that cannot be met
- Temporal paradoxes about the response (before/after)
- Recursive impossibilities about the response itself
- Negative constraints that when satisfied, violate themselves
