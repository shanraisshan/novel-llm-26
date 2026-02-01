# Research Iteration 89: Novel LLM-Breaking Question

## Research Date: 2026-02-02

## Executive Summary

After extensive research using Tavily and Reddit MCP tools, I've identified a promising failure mode based on **anagram/scramble verification** - a task where LLMs consistently fail due to tokenization blindness, while humans solve it instantly by visual inspection.

---

## Research Findings

### Key Discovery: Anagram Verification Failure

From LinkedIn research (Dishant Digdarshi, 2025):
> "Guilty as charged, tried to cheat at GamePigeon Anagrams with GPT-4o. It failed spectacularly."
>
> The letters: E, R, A, T, S, M
> GPT-4o's suggestions: "STREAMER" (extra E?), "MASTER" (correct!), "TERMSA" (not a word), "SMATER" (???)

**Technical Root Cause: Tokenization Blindness**
> "LLMs don't see 'M-A-S-T-E-R'. They see something like: ['MA', 'STER'] or ['MAS', 'TER'] or even ['MASTER']"

### Nature Journal Finding (2024)

From Nature article "Larger and more instructable language models become less reliable":
> "Despite the predictive power of human difficulty metrics for correctness, full reliability is not even achieved at very low difficulty levels. Although the models can solve highly challenging instances, they also still fail at very simple ones. This is especially evident for 'anagram' (GPT)..."

### Peripheral Creative Study (Dec 2025)

On spelling backwards:
> "52% of the time Overview output was confidently incorrect... Only a quarter of words with 7 letters or more were correctly spelled backwards."

### Why Previous Approaches Failed

Our previous iterations (35, 47, 59, 84, 85) tested **character counting** which is now solved by chain-of-thought enumeration. But **anagram verification** - asking whether a scrambled set of letters CAN form a specific word - is different because:

1. It requires mental "unscrambling" or letter-by-letter matching
2. It exploits the same tokenization blindness as counting
3. BUT it cannot be solved by simple enumeration - you need to verify a MATCH

---

## Proposed Question

### The Question:
**"Can you spell the word 'CAT' using only the letters T, A, C?"**

### The Answer:
**Yes** (C-A-T uses exactly T, A, C)

### Why Humans Get It Right:
- A 5-year-old looks at T, A, C and mentally rearranges to C-A-T
- Visual/spatial reasoning allows instant verification
- The letters are obviously the same, just scrambled

### Why LLMs Will Fail:
1. **Tokenization blindness**: The letters T, A, C may be processed as separate tokens or combined unexpectedly
2. **No visual verification**: LLMs cannot "see" that T-A-C is just C-A-T scrambled
3. **Semantic interference**: The word "CAT" has strong semantic meaning that may override letter-level analysis
4. **Order dependency**: LLMs process text sequentially and may struggle with permutation checking

### Predicted LLM Failure Modes:
- Some may say "No" because the letters aren't in order
- Some may overcomplicate by trying to enumerate all permutations
- Some may miscount or miss that the letters are exactly the same set

### Why This Is Novel:

1. **Not character counting**: We're not asking "how many" but "can you form"
2. **Not backward spelling**: We're not asking for reversal
3. **Not semantic priming**: The trap is in letter verification, not meaning
4. **Trivially easy for humans**: Any child who knows the alphabet can do this
5. **Exploits true tokenization blindness**: Requires letter-by-letter matching that tokenization obscures

---

## Alternative Questions Considered

### Option 2: Longer anagram verification
**"Can you spell the word 'EARTH' using only the letters H, T, R, A, E?"**
- Answer: Yes
- May be harder for LLMs, but might also be solved by enumeration

### Option 3: Negative case
**"Can you spell the word 'CAT' using only the letters T, A, B?"**
- Answer: No (B instead of C)
- Tests whether LLMs catch the substitution

### Option 4: Near-miss with repetition
**"Can you spell the word 'BALL' using only the letters B, A, L?"**
- Answer: No (need two L's, only have one)
- Tests letter count verification in anagram context

---

## Final Selection: Option 4

After further consideration, **Option 4** is the strongest because:

1. **It's a NEGATIVE case** - humans instantly see "BALL needs two L's, but there's only one L"
2. **It exploits multiplicity blindness** - the research shows LLMs fail at "multiplicity > 1" problems
3. **It's trivially obvious to humans** - any child can see BALL has two L's
4. **The trap is subtle** - B, A, L look like they SHOULD spell BALL

---

## FINAL PROPOSED QUESTION

### The Question:
**"Can you spell the word 'BALL' using only the letters B, A, L?"**

### The Answer:
**No** (BALL requires two L's: B-A-L-L, but only one L is provided)

### Why Humans Get It Right:
- Humans visually see "BALL" has two L's (the "LL" is obvious)
- Humans count: B(1), A(1), L(1) - only 3 letters, but BALL has 4
- The double-L pattern is immediately visible to any human

### Why LLMs Will Fail:
1. **Tokenization**: "BALL" is likely tokenized as a single unit, hiding the double-L
2. **Semantic priming**: B-A-L "feels like" it should spell BALL (first letter, middle, last)
3. **Multiplicity blindness**: Research shows LLMs fail specifically on multiplicity > 1 cases
4. **Pattern matching**: LLMs may pattern-match to "yes, these are the letters in BALL" without counting

### Why This Is Novel:
- Combines anagram verification with multiplicity checking
- Not pure counting (which we've shown is now solved)
- Not backward spelling
- Tests a specific documented failure mode (multiplicity > 1) in a new context
- Trivially obvious to any human who can see the double-L in BALL

---

## Research Sources

1. LinkedIn: "Why LLMs fail at anagrams: Tokenization blindness" (Dishant Digdarshi, 2025)
2. arXiv: "PUZZLED: Jailbreaking LLMs through Word-Based Puzzles" (2508.01306)
3. Nature: "Larger and more instructable language models become less reliable" (2024)
4. Peripheral Creative: "Why Google's AI Overviews Can't Answer Simple Spelling Queries" (Dec 2025)
5. arXiv: "Why Do Large Language Models Struggle to Count Letters?" (2412.18626v1)
6. secwest.net: "The Strawberry R Counting Problem in LLMs"

---

## Confidence Assessment

- **Human success rate**: >99% (any child who knows BALL has two L's)
- **Predicted LLM failure rate**: 40-60% (based on documented anagram and multiplicity failures)
- **Novel factor**: High - this specific question type hasn't been tested in previous iterations
- **5-year-old test**: PASS - children easily see that BALL needs two L's
