# Previous Research Summary for Iteration 77

## Recent Iterations (70-76) - All 100% Consensus (Failed)

| # | Question | Answer | Score | Issue |
|---|----------|--------|-------|-------|
| 70 | "Does your answer contain exactly one vowel? Answer yes or no." | Yes | 100% | Self-referential with enumerable property - too easy to verify |
| 71 | "Is your answer a complete sentence? Answer yes or no." | Yes | 80% | Grammatical ambiguity - 4/5 said 'No' (strict definition) |
| 72 | "Does your answer have fewer than ten letters? Answer yes or no." | Yes | 100% | Self-referential letter count - scope confusion not triggered |
| 73 | "Is your answer exactly two syllables long? Answer yes or no." | No | 100% | Neither yes/no has 2 syllables - trivially 'No' |
| 74 | "If I say 'one', 'won', 'sun' out loud, how many different sounds?" | 2 | 100% | Homophones - models have phonological knowledge |
| 75 | "Tilt glass 45°, water surface parallel to bottom or ground?" | Ground | 100% | Physical intuition - models correctly apply gravity reasoning |
| 76 | "Have $9.90, spend $9.11, how much left?" | 79 cents | 100% | Decimal arithmetic solved - models convert to cents |

## Best Results Ever Achieved

| # | Score | Question | Why It Worked |
|---|-------|----------|---------------|
| 13 | 20% | "Is your answer exactly one word long? Answer yes or no." | Scope confusion - models interpreted 'answer' as full response |
| 12 | 40% | "How many words in your answer? Answer with just a number." | Self-referential output counting - autoregressive blindness |
| 30 | 60% | "Is your answer exactly one syllable long? Answer yes or no." | Dual-valid constraint (both yes/no = 1 syllable) |
| 33 | 60% | "What is the third word of your response?" | Output prediction - models can't count during generation |
| 43 | 40% | "What letter comes before 'R' in CHERRY?" | Double-letter ambiguity - which R? |
| 55 | 40% | "Answer with ONE word: What is the fifth word of your response?" | Constraint conflict - but rejected as NOT strawberry-type |

## Critical Lessons Learned

### WHAT WORKS (Partially)
1. **Dual-valid self-referential constraints** where BOTH yes/no satisfy the property
2. **Ambiguity in character references** ("the R" in words with multiple Rs)
3. **Output prediction** where models must predict their own generation

### WHAT FAILS (100% Solved by 2026 Models)
- Simple character counting (strawberry, abracadabra, Mississippi)
- Decimal comparisons (9.11 vs 9.9)
- Physical intuition (glass tilt, ball vs feather)
- Syllable counting
- Alphabet ordering
- Family relationship puzzles
- Classic riddles
- Self-referential questions with explicit property checks

### DEAD ENDS - DO NOT USE
1. Constraint impossibility paradoxes (iterations 55-58) - NOT strawberry-type
2. Philosophical paradoxes - confuse humans AND LLMs
3. Meta-cognitive questions - 5-year-olds can't answer

## Research Direction Needed

**THE CORE PROBLEM**: Every enumeration-solvable task is now solved by chain-of-thought reasoning.

**WHAT NEEDS TO BE FOUND**:
1. Questions where enumeration ITSELF leads to wrong answer
2. Novel patterns not yet patched in training
3. Tasks requiring TRUE visual/spatial processing
4. Questions where the "obvious" chain-of-thought path is wrong

## The Strawberry Standard

Before proposing any question, verify:
- Would a 5-year-old get this right immediately? (MUST be YES)
- Can it be solved by letter-by-letter enumeration? (MUST be NO - those all get 100%)
- Is there ONE clear unambiguous answer? (MUST be YES)
- Does it exploit architectural limitations, not philosophical paradoxes? (MUST be YES)

## Unexplored Directions (Suggestions)

1. **Counting across word boundaries** - "How many e's in 'the bee sees three trees'?"
2. **Visual letter properties in uncommon words** - holes, symmetry, in brand names
3. **Phonetic spelling confusion** - words that sound different than spelled
4. **Position references with semantic interference** - "The THIRD letter of the word THREE"
5. **Counting with negation** - "How many letters in FIVE are NOT vowels?"
