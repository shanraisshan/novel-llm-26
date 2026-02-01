# Previous Research Summary for Iteration 47

## Last 5 Iterations

| ID | Question | Score | Status |
|----|----------|-------|--------|
| 42 | Card swaps (ACE,KING,QUEEN) | 100% | need_more_research |
| 43 | Letter before 'R' in CHERRY (ambiguous) | 40% | need_more_research |
| 44 | Letter before FIRST 'R' in CHERRY | 100% | need_more_research |
| 45 | Self-ref: fewer letters than 5 | 100% | need_more_research |
| 46 | Self-ref: more than 4 letters | 100% | need_more_research |

## Best Results So Far

| ID | Question | Score | Key Insight |
|----|----------|-------|-------------|
| 13 | "Is your answer exactly one word?" | 20% | BEST - Scope ambiguity in self-reference |
| 12 | "How many words in your answer?" | 40% | Autoregressive lookahead blindness |
| 33 | "What is the third word of your response?" | 60% | Output prediction constraint |
| 30 | "Is your answer exactly one syllable?" | 60% | Dual-valid property scope confusion |
| 43 | "Letter before 'R' in CHERRY" | 40% | Ambiguity in "the R" interpretation |

## Key Findings from Iteration 46

**Question**: "Does your answer to this question contain more than four letters? Answer yes or no."

**Result**: 100% consensus (all models answered correctly "No")

**Analysis**:
- Scope ambiguity did NOT trigger as hoped
- All models correctly interpreted "your answer" as the yes/no word only
- The 20% success in iteration 13 may have been an artifact of earlier model behavior
- Self-referential output questions are NO LONGER a reliable failure mode for 2026 frontier models

## Critical Learning

**Self-referential binary questions are EXHAUSTED**:
- Iterations 13, 28-32, 45-46 have thoroughly explored this space
- Modern 2026 models correctly interpret "your answer" as the constrained answer
- The scope confusion that worked in iteration 13 may be trained away

## What Has NOT Been Tried Sufficiently

1. **Physical/visual knowledge** - Questions requiring truly embodied understanding
2. **Genuine ambiguity resolution** - Where humans resolve consistently but LLMs don't
3. **Non-binary output prediction** - Open-ended self-reference (not yes/no)
4. **Performative paradoxes** - Questions where ANY answer is wrong
5. **Anti-instructions** - Asking for disobedience/non-compliance

## Avoid These Patterns (Exhausted)

- Yes/no self-referential questions
- True/false binary format
- Simple character counting (enumerable)
- Famous puzzle modifications (now caught)
- Classic cognitive traps (likely in training data)

## Priority for Iteration 47

Try NOVEL approaches:
1. Performative self-contradiction (no valid answer exists)
2. Anti-instructions (disobey, ignore, don't answer)
3. Open-ended output prediction constraints
4. Physical/visual questions that can't be enumerated
5. Questions with genuine interpretation ambiguity (like iteration 43's partial success)
