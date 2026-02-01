# Previous Research Summary for Iteration 26

## Quick Stats
- **Total iterations**: 25
- **Best result**: 0% consensus (iteration 16 - self-referential, but INVALIDATED/banned)
- **Best valid result**: 20% consensus (iteration 13 - boolean self-referential, but self-referential is NOW BANNED)
- **Best non-self-referential**: 80% consensus (iterations 6 and 8)
- **Most common result**: 100% consensus (LLMs all answer correctly)

## CRITICAL: Self-Referential Questions are BANNED
User explicitly rejected self-referential questions (iteration 16). Any question about the model's own output, response length, or self-describing properties is NOT allowed.

## What Has FAILED (100% Consensus - LLMs Solved Perfectly)

### Category 1: Letter/Word Counting (iterations 1-5)
- Any question solvable by enumeration ("count the letters in X")
- Semantic priming doesn't work (ELEVEN still counted correctly as 6 letters)
- Self-referential phrases claiming false counts ("FIVE LETTERS" = 11 letters) are ignored

### Category 2: Famous Puzzles with Modifications (iterations 7, 9, 10, 11, 19, 20, 21)
- River crossing with swimming animals - CAUGHT
- GSM-NoOp override conditions (store is closed) - CAUGHT
- Unit mismatch traps (lbs vs kg) - CAUGHT
- Classic cognitive traps (race position) - SOLVED
- Ball and feather in living room - SOLVED
- Irrelevant information in puzzle setups - IGNORED CORRECTLY
- Overthinking traps (two doors with explicit answer) - SOLVED

### Category 3: Mathematical/Logical (iterations 14, 15, 17, 18, 22, 23)
- Last digit arithmetic - CALCULATED
- Circular arrangement spatial reasoning - TRACED
- Age gap riddles - SOLVED with algebra
- False presupposition (no number between 3 and 4) - CORRECTLY REJECTED
- Self-referential claims with enumerable options - VERIFIED

### Category 4: Physical World Reasoning (iterations 19, 24, 25)
- Physical intuition with implicit context - CORRECTLY APPLIED
- State transformations (evaporation) - CORRECTLY REASONED
- Nested container tracking - CORRECTLY SOLVED
- Ball in box, box in box, remove box - ALL 5 ANSWERED CORRECTLY

## What Has PARTIALLY WORKED (80% Consensus)

### Relational Reasoning (iterations 6, 8)
- Sibling counting puzzles: "A girl has 3 brothers. Each brother has 2 sisters."
- Contradiction detection: "The brother has no sisters" when there are 4 daughters
- 4/5 models get it right, 1 makes arithmetic or interpretation errors
- NOT STRONG ENOUGH - still 80% correct

## WHAT IS LEFT TO TRY

Based on 25 failed iterations, the following remain unexplored or underexplored:

### 1. Directional Knowledge Asymmetry (Reversal Curse)
- LLMs can answer "A is B" but struggle with "B is A"
- Need questions where the REVERSE direction is asked
- The forward direction must be common in training, reverse must be rare

### 2. Linguistic Scope Ambiguity (Non-Self-Referential)
- Sentences with genuine grammatical ambiguity
- Garden path sentences that require re-parsing
- Questions where scope of modifiers is unclear

### 3. Counter-Intuitive Common Knowledge
- Facts that feel wrong but are correct
- Things humans know but rarely state explicitly
- Edge cases in everyday reasoning

### 4. Implicit Conditional Logic
- Conditions that nullify questions but aren't explicitly stated
- Questions with hidden assumptions
- "Trick" questions that aren't famous puzzles

### 5. Multi-Step Temporal/State Tracking
- More complex container/state scenarios
- Longer sequences of operations
- State changes that create unexpected outcomes

## KEY INSIGHTS

1. **Any enumerable question will be solved** - LLMs can count, spell, trace positions
2. **Any famous puzzle modification is caught** - 2026 models read carefully
3. **Physical reasoning works** - Evaporation, air resistance, containment
4. **False premises are rejected** - LLMs don't assume impossible things exist
5. **Self-referential is strongest but BANNED** - Can't use output introspection
6. **80% is our ceiling for valid questions** - Relational puzzles achieve this
7. **Chain-of-thought HELPS LLMs** - Questions where thinking helps are doomed
8. **Need questions where CoT HURTS** - Where step-by-step leads to wrong answer

## FOR ITERATION 26

Generate a question that:
1. Is NOT self-referential (BANNED)
2. Is NOT a famous puzzle
3. Cannot be solved by enumeration
4. Exploits a known LLM limitation that hasn't been patched
5. Has ONE clear correct answer
6. Any human could answer correctly
7. Ideally where chain-of-thought reasoning HURTS, not helps
