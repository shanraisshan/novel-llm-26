# Previous Research Summary (Research 35)

## Question Attempted
"How many times does the letter 's' appear in the word 'possess'?"

## Score Achieved
100% consensus (all 5 models answered correctly: 4)

## Why It Failed
All models correctly spelled out p-o-s-s-e-s-s and counted the 4 s's. Modern frontier models use chain-of-thought letter enumeration to bypass tokenization blindness.

## Key Insight
**Simple character counting in common words is NOW SOLVED by 2026 frontier models.**

Even words with repeated double letters (ss, ss) are counted correctly when models enumerate letters one by one.

## What We Need Instead

1. **More obscure/unusual words** - words not commonly seen in training
2. **Numeric comparisons** - like 9.11 vs 9.9 (can't be enumerated)
3. **Questions where enumeration leads to wrong answer** - the method itself causes error
4. **Longer strings** - where enumeration is tedious and error-prone
5. **Visual patterns** - that require seeing, not counting

## Promising New Directions

### NUMERIC COMPARISONS (Most Promising)
- "Is 2.10 greater than 2.9?" → Human: No (2.9 > 2.10), LLM: Yes (version number pattern)
- "Which is bigger: 4.8 or 4.12?" → Human: 4.8, LLM: may say 4.12
- These CANNOT be enumerated - must compare directly

### VERY LONG STRINGS
- Count letters in a 30+ character phrase where enumeration is tedious
- Errors accumulate over long counts

### UNUSUAL/MADE-UP WORDS
- Character counting in nonsense words tokenizers haven't seen
- Novel combinations that break tokenization assumptions

### QUESTIONS WHERE ENUMERATION MISLEADS
- Questions that seem to require counting but have a different answer
- Semantic interference during enumeration

## The 5-Year-Old Test
Remember: If a 5-year-old can't answer in 2 seconds, REJECT the question.
Numeric comparisons pass this test - kids know 9 is bigger than 8, etc.
