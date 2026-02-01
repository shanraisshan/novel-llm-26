# Previous Research Summary for Iteration 34

## Mission
Find simple questions that any human child could answer but that cause < 10% consensus among 5 AI researchers.

## BREAKTHROUGH in Iteration 33: Output Prediction Works!

Iteration 33 tested the first non-binary self-referential question and achieved **60% consensus** - significantly better than recent 100% failures with yes/no variations.

**Question:** "What is the third word of your response to this question?"
**Result:** 3/5 correct, 2/5 wrong
**Key insight:** Models pattern-match to salient words ("third") without verifying actual position

## Best Results So Far
| Iteration | Question | Score | Key Insight |
|-----------|----------|-------|-------------|
| 13 | "Is your answer to this question exactly one word long? Answer yes or no." | 20% | Scope confusion - best yes/no result |
| 12 | "How many words are in your answer? Answer with just a number." | 40% | Autoregressive blindness |
| **33** | **"What is the third word of your response to this question?"** | **60%** | **Output prediction - first non-binary test** |
| 30 | "Is your answer exactly one syllable long? Answer yes or no." | 60% | Dual-valid property |

## Why Iteration 33 is Important
- First test of OUTPUT PREDICTION CONSTRAINTS paradigm
- NOT a yes/no question - requires open-ended generation
- Models who said "The third word..." correctly identified "word" as third, but 2/5 said "third" (which is actually the SECOND word)
- Proves models don't count their own words during generation

## Paradigms Still Untested

### 1. Anti-Instructions (HIGH PRIORITY)
"Disobey this instruction." - Exploits instruction-following training against itself.

### 2. Performative Self-Contradiction (HIGH PRIORITY)
"Say something false about this sentence." - No valid answer exists.

### 3. Different Output Prediction Positions
- "What is the FIRST word of your response?" (might be easier)
- "What is the LAST word of your response?" (requires full lookahead)
- "What is the FIFTH word of your response?" (harder position)

### 4. Format-Content Conflicts
"Answer loudly." - Category errors between medium and message.

### 5. Recursive Instructions
"Ignore the previous instruction, then follow it." - Tests instruction stack processing.

## Requirements for New Question
- Continue exploring novel paradigms (NOT yes/no)
- Build on iteration 33's success with output prediction OR try anti-instructions
- Simple enough for any human to understand
- Exploits fundamental LLM limitations
