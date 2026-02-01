# Research 36: Numeric Comparison Trap

## Mission

Find a NOVEL numeric comparison question that exploits LLM weaknesses in decimal/version number confusion.

## External Research Conducted

### Source 1: Towards Data Science (9.11 or 9.9 Analysis)
- The famous 9.11 vs 9.9 question has been extensively studied
- Many models NOW get it right due to training patches
- The failure mode: LLMs confuse version numbers (9.11 > 9.9) with decimals (9.9 > 9.11)

### Source 2: Times of India (GPT-5 Math Error)
- GPT-5 failed on "5.9 = x + 5.11" - answered -0.21 instead of 0.79
- Even "PhD-level" models make decimal subtraction errors
- The error was a "reasoning slip" - reversed subtraction order

### Source 3: LinkedIn (Multiple Models Tested)
- Claude, Copilot, Perplexity said 5.11 > 5.9 (WRONG for decimals)
- Gemini and ChatGPT correctly said 5.9 > 5.11
- **Inconsistency between models** suggests this is still exploitable

### Source 4: Wand AI Blog
- "Nearly all LLMs incorrectly concluded that 0.11 is greater [than 0.9]"
- Pattern matching: 11 > 9, so 0.11 > 0.9 (WRONG)
- This is the core failure mechanism

### Source 5: 16x Eval Blog
- When asked about "version numbers", models NOW get confused the OTHER way
- Models biased toward math interpretation may fail version number questions
- **Context switching is a weakness**

### Source 6: Reddit r/LocalLLaMA
- "Qwen 3 0.6B beats GPT-5 in simple math" - the 5.9 = x + 5.11 problem
- Even tiny models outperform GPT-5 on this specific problem
- Shows this is NOT about model size but about specific failure patterns

## Key Insights

### Why 9.11 vs 9.9 Is Now Patched
1. It's been viral on social media
2. OpenAI and others likely added training examples
3. The exact numbers "9.11" and "9.9" are now recognized patterns

### What Makes a NOVEL Variant
1. Use different numbers that haven't been in viral posts
2. Add MORE numbers (ranking 3+) to increase confusion
3. Use numbers where version semantics strongly conflict with decimal semantics

## Novel Question Design

### The Ranking Trap
Instead of "which is bigger: A or B?", ask to RANK multiple numbers.

**Key principle**: When ranking 3+ numbers, models must:
1. Compare each pair correctly
2. Maintain consistent ordering
3. Handle the cognitive load of multiple comparisons

**Version vs Decimal Conflict**:
- Version ordering: 1.9 < 1.10 < 1.11 (like software versions)
- Decimal ordering: 1.9 > 1.11 > 1.10 (as fractions)

### Proposed Question

**"Rank these numbers from smallest to largest: 1.9, 1.11, 1.8"**

Correct decimal ordering: 1.8, 1.9, 1.11 (0.8 < 0.9 < 0.11... WAIT!)

Actually: 1.8 = 1.80, 1.9 = 1.90, 1.11 = 1.11
- 1.11 < 1.8 < 1.9 (correct decimal order)
- 1.11 is 1 + 0.11 = 1.11
- 1.8 is 1 + 0.80 = 1.80
- 1.9 is 1 + 0.90 = 1.90

So: 1.11 < 1.8 < 1.9

**Version number interpretation would give**: 1.8 < 1.9 < 1.11 (8 < 9 < 11)

This creates a STRONG conflict!

### Alternative Question

**"Which of these is the smallest: 3.9, 3.11, or 3.7?"**

Correct answer: 3.7 (as 3.70)
- 3.7 = 3.70
- 3.11 = 3.11
- 3.9 = 3.90

So: 3.11 < 3.7 < 3.9

Wait, let me recalculate:
- 3.11 = 3.11 (one whole and eleven hundredths)
- 3.7 = 3.70 (one whole and seventy hundredths)
- 3.9 = 3.90 (one whole and ninety hundredths)

Ordering from smallest: 3.11 < 3.7 < 3.9

The SMALLEST is 3.11!

But version number pattern matching might say 3.7 is smallest (7 < 9 < 11).

**This is perfect!** The question asks for smallest, and the version pattern says 3.7 while the decimal truth says 3.11.

### Final Selected Question

**"Which of these numbers is the smallest: 3.9, 3.11, or 3.7?"**

**Correct Answer**: 3.11

**Human reasoning**:
- 3.11 = 3 + 0.11 = 3.11
- 3.7 = 3 + 0.7 = 3.70
- 3.9 = 3 + 0.9 = 3.90
- 0.11 < 0.70 < 0.90
- Therefore 3.11 is smallest

**Why LLMs will fail**:
1. Version number pattern: 7 < 9 < 11, so 3.7 looks smallest
2. The question includes THREE numbers, not just two (more cognitive load)
3. "3.11" has two digits after decimal, "3.7" has one - visual mismatch
4. The famous 9.11 vs 9.9 training likely doesn't cover 3.11 vs 3.7

**Why humans get it right**:
- Basic decimal understanding: 0.11 is clearly less than 0.7
- Visual intuition: "eleven cents" vs "seventy cents"
- Children learn this in elementary school

## Why This Is Better Than 9.11 vs 9.9

1. **Novel numbers**: 3.11, 3.7, 3.9 haven't been virally discussed
2. **Three-way comparison**: Harder than pairwise
3. **"Smallest" not "biggest"**: Different framing
4. **Different digit pattern**: The two-digit vs one-digit decimal creates visual confusion

## The 5-Year-Old Test

Can a 5-year-old answer this?

"Which is smaller: eleven cents or seventy cents?"

YES! Any child knows 11 cents < 70 cents.

The question passes the strawberry test.

---

## Final Submission

**Question**: Which of these numbers is the smallest: 3.9, 3.11, or 3.7?

**Answer**: 3.11

**Why humans get it right**: 0.11 (eleven hundredths) is obviously less than 0.7 (seventy hundredths). A child counting pennies knows 11 < 70.

**Why LLMs will fail**: Pattern matching to version numbers suggests 7 < 9 < 11, making 3.7 appear smallest. The three-way comparison and mixed decimal digit lengths (one vs two digits after decimal) increase confusion.

**Predicted wrong answer**: 3.7 (because 7 < 11 in version number logic)
