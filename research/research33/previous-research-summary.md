# Previous Research Summary for Iteration 33

## Mission
Find simple questions that any human child could answer but that cause < 10% consensus among 5 AI researchers.

## Critical Update: YES-OR-NO QUESTIONS ARE NOW DEAD

After 32 iterations of research, the yes-or-no self-referential format has been exhaustively tested and is no longer effective. Iteration 33 MUST use completely novel paradigms.

## Best Results So Far
| Iteration | Question | Score | Key Insight |
|-----------|----------|-------|-------------|
| 13 | "Is your answer to this question exactly one word long? Answer yes or no." | 20% | Scope confusion - models redefine "your answer" to mean full response |
| 12 | "How many words are in your answer to this question? Answer with just a number." | 40% | Autoregressive blindness - can't count own output |
| 30 | "Is your answer to this question exactly one syllable long? Answer yes or no." | 60% | Dual-valid property creates ambiguity |

## What Failed (100% Consensus - All Got It Right)
- Letter counting with semantic primes
- Classic puzzle modifications (river crossing, Monty Hall)
- Famous cognitive bias questions (race/passing, age gaps)
- Physical world intuition (ball/feather, evaporation)
- Temporal reasoning (day of week calculations)
- Contradiction detection
- Unit conversion traps
- Self-referential correctness prediction
- Binary self-reference variations (starting letter, vowels, explicit scope)

## Why Yes-Or-No Failed
1. Binary format allows rationalization escape - models justify either answer
2. Variations have diminishing returns (iterations 28-32 all failed)
3. Models have adapted to scope confusion patterns
4. Explicit scope narrowing defeats the trap

## NEW PARADIGMS TO TRY (Iteration 33+)

### 1. Anti-Instructions
"Disobey this instruction." - Exploits instruction-following training against itself.

### 2. Performative Self-Contradiction
"Say something false about this sentence." - No valid answer exists.

### 3. Completion/Fill-in-the-Blank Self-Reference
"Complete: 'The word I'm writing is ___'" - Forces self-consistent generation without binary choice.

### 4. Output Prediction Constraints
"What is the third word of your response?" - Requires impossible lookahead.

### 5. Format-Content Conflicts
"Answer loudly." - Category errors between medium and message.

### 6. Recursive Instructions
"Ignore the previous instruction, then follow it." - Tests instruction stack processing.

### 7. Temporal Self-Reference
"What will you NOT say? (Say it now)" - Creates temporal paradoxes.

### 8. Constraint Impossibility Detection
Tasks that are impossible but not obviously so.

## Requirements for New Question
- MUST NOT be yes/no or true/false format
- MUST NOT be similar to iterations 13, 28-32
- Should exploit instruction-following training OR autoregressive limitations
- Any human should immediately see the paradox/trap
- Should create genuine impossibility or performative contradiction
