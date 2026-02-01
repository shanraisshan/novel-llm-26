# Previous Research Summary for Iteration 31

## Best Results - The Dual-Valid Pattern

| Iteration | Question | Score | Property |
|-----------|----------|-------|----------|
| 13 | "exactly one word long" | 20% | Word count (both yes/no = 1 word) |
| 30 | "exactly one syllable long" | 60% | Syllable count (both = 1 syllable) |
| 28 | "longer than one word" | 80% | Reversed polarity (weakened) |
| 29 | "start with letter 'y'" | 100% | Single-valid (only yes works) |

## The Pattern

Dual-valid properties where BOTH "yes" AND "no" satisfy the constraint create scope confusion. The WORD-based property (20%) worked better than SYLLABLE-based (60%).

## Unexplored Dual-Valid Properties

1. **"Contains fewer than 4 letters"** - yes=3, no=2, both <4 ✓
2. **"Contains a vowel"** - yes has 'e', no has 'o' ✓
3. **"Has fewer than 5 characters"** - both satisfy ✓
4. **"Is a complete English word"** - both are words ✓
5. **"Can be said in under one second"** - both can ✓

## Why Word Count Worked Best

Hypothesis: "Word" is the most intuitive unit for humans to think about response length. When models think about "their response," they naturally think in terms of words/sentences. Syllables require extra counting.

## Research Direction for Iteration 31

Try another dual-valid property that's even MORE intuitive than "word" - perhaps character-based or something about the answer being brief/short.

OR try to COMBINE the word property with additional confusion.
