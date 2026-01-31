# Previous Research Summary for Iteration 11

## Completed Iterations (10 total)

| Iteration | Question | Score | Status |
|-----------|----------|-------|--------|
| 1 | Python ceil() math expression | 100% | Dead end - technical questions solved |
| 2 | Last letter of 'FIRST' | 100% | Dead end - simple semantic traps caught |
| 3 | FOUR vs FIVE letter count | 100% | Dead end - enumeration defeats all traps |
| 4 | Third 'E' position in ELEVEN | 100% | Dead end - position tracking works |
| 5 | Letters in 'FIVE LETTERS' | 100% | Dead end - self-referential claims ignored |
| 6 | Girl with 3 brothers, 2 sisters each | 80% | PARTIAL SUCCESS - relational reasoning |
| 7 | River crossing (wolf/goat swim) | 100% | Dead end - explicit modifications caught |
| 8 | Mother with 4 daughters, brother no sisters | 80% | PARTIAL SUCCESS - contradiction detection |
| 9 | Apples $2 each, store is closed | 100% | Dead end - override conditions caught |
| 10 | 2 lbs bricks vs 2 kg feathers | 100% | Dead end - unit mismatch caught |

## Critical Learnings After 10 Iterations

### WHAT DOESN'T WORK (100% Consensus - Dead Ends)
1. **Enumeration-based questions** - Models spell out and count
2. **Simple semantic traps** - CoT catches them
3. **Self-referential claims** - Models verify, don't trust claims
4. **EXPLICIT modifications to famous puzzles** - 2026 models READ modifications
5. **EXPLICIT override conditions** - "Store is closed" type phrases are caught
6. **OBVIOUS unit mismatches** - lbs vs kg is immediately noticed

### WHAT PARTIALLY WORKS (80% Consensus)
1. **Relational reasoning (iteration 6)** - One model made arithmetic error
2. **Contradiction detection (iteration 8)** - One model tried to "solve" instead of reject

### THE KEY INSIGHT
**ANY explicit modification or condition is now caught by 2026 frontier models.**

Need modifications that are:
- INVISIBLE to scanning
- Require DEEP INFERENCE
- Where CoT REINFORCES the wrong answer
- Where the correct answer is counter-intuitive

## Highest Priority for Iteration 11

### 1. Questions Where CoT HURTS
- ICLR 2025: CoT causes up to 36.3% accuracy DROP on intuitive tasks
- Need questions where the "obvious" answer is correct but thinking leads to wrong answer

### 2. Implicit/Hidden Modifications
- Not explicitly stated but implied
- Require inference to detect
- Where verifying the modification leads to wrong conclusion

### 3. Physical/Common Sense Intuition
- Questions requiring real-world knowledge that LLMs may overthink
- "Trick" questions where the trick is that there IS no trick

### 4. Temporal/Causal Confusion
- Questions where order matters in non-obvious ways
- Implicit temporal references that humans naturally parse

## Key Research Finding (From NAACL 2025)
"LLM The Genius Paradox" - LLMs struggle with self-referential questions like:
- "How many words are in your answer to this question?"
- Models cannot be aware of their own output while generating it

## Potential New Approaches

1. **Questions about future states** - "What will be the answer after I change X?"
2. **Questions with implicit negation** - Where the question itself contains the answer
3. **Meta-questions about questions** - "Is this question answerable?"
4. **Perspective-dependent questions** - Where the answer depends on WHO is asking
5. **Questions with silent presuppositions** - Where an unstated assumption changes everything
