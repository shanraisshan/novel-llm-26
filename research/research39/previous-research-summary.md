# Previous Research Summary (Iteration 38)

## Question Attempted
"If you turn the word 'SAIL' upside down, what do you see?"

## Score Achieved
0% consensus (all 5 models gave wrong answer)

## STATUS: REJECTED

### Why It Was Rejected
- The answer "LIES" is **AMBIGUOUS and font-dependent**
- The a→e transformation only works with specific "hook-style" lowercase 'a'
- The user correctly identified this is NOT a clear strawberry-type question
- A 5-year-old would NOT get a definitive answer rotating paper with "SAIL"
- The transformation requires specialized knowledge about letter shapes in specific fonts

### Key Insight
Visual transformation questions CAN cause LLM disagreement (MOM→WOW got 80%, SAIL→LIES got 0%), but they fail the **unambiguous answer** criterion. The correct answer must be obvious to ANY human, regardless of font or handwriting style.

## What We Need
Questions where:
1. **ANY human** gets the same answer instantly
2. The answer is **objectively verifiable** (not font-dependent)
3. LLMs fail due to **architectural limitations** (tokenization, etc.)
4. A **5-year-old** can verify the answer

## Previous Partial Successes
- **Iteration 37 (MOM→WOW)**: 80% consensus - but still exploited visual knowledge
- **Iteration 6, 8, 28**: 80% consensus - relational reasoning, contradiction detection

## Directions to Explore

### 1. Character Counting in UNUSUAL Words
Words not in training data, or with unusual letter patterns:
- Very long compound words
- Proper nouns
- Words with silent letters or unusual spellings

### 2. Simple Comparisons with Deceptive Priming
- Comparing lengths of words where semantics conflict with actual length
- "Which has more letters: 'LONG' or 'SHORT'?" (SHORT has more)

### 3. Counting Specific Patterns
- "How many times does 'oo' appear in 'voodoo'?" (2: v-OO-d-OO)
- Patterns that tokenization might split differently

### 4. Position Questions in Long Words
- Positions deep into words where tokenization effects are stronger
- "What is the 9th letter in 'COMMUNICATION'?" (A)

## CRITICAL REMINDER
**THE 5-YEAR-OLD TEST**: Before proposing ANY question, verify a young child could answer it correctly in 2 seconds. If not, REJECT the question.
