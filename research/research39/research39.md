# Research Iteration 39: Novel LLM-Breaking Question

## Research Summary

### External Research Conducted

**Tavily Search Results:**
1. **arXiv paper "Why Do Large Language Models Struggle to Count Letters?"** - Key finding: LLMs struggle most when the same letter appears multiple times. The difficulty is in **tracking and counting multiple occurrences**, not in letter recognition. Tokenization is NOT the main problem; the issue is the computational process of tracking multiple instances.

2. **LinkedIn/Substack articles on tokenization** - Character blindness causes failures on simple tasks. LLMs see chunks like "blue" + "berry" rather than individual letters.

3. **PromptLayer research** - The primary challenge lies in tracking multiple instances of the same letter, rather than letter recognition.

4. **MIT News (2025)** - LLMs can learn to mistakenly link certain sentence patterns with specific topics.

**Reddit Research:**
- r/LocalLLaMA and r/ChatGPT discussions confirm that character-level counting remains a weak point for LLMs, particularly when patterns need to be tracked across words.

### Key Insight from Research

The arxiv paper's most important finding is that LLMs fail at **tracking multiple instances** of the same character/pattern. This suggests that questions requiring:
1. Pattern matching across character positions
2. Counting consecutive occurrences
3. Tracking where specific patterns appear

...would be more likely to cause failures than simple letter counting.

### Why Previous Approaches Failed

Looking at the 38 previous iterations:
- **Letter counting (iterations 1-5, 35):** 100% consensus - models now enumerate carefully
- **Position questions (iteration 4):** 100% - models track positions systematically
- **Visual transformations (iteration 37-38):** 80% or rejected - ambiguous, font-dependent
- **Self-referential (iterations 12-13, 28-33):** 20-60% but now explicitly forbidden

The pattern shows that:
1. Simple enumeration tasks are now solved by CoT
2. Self-referential questions work but are forbidden
3. Visual/spatial transformations are ambiguous
4. What remains unexplored: **consecutive pattern counting**

### New Direction: Consecutive Pattern Counting

**Core Concept:** Ask about consecutive identical letters (double letters) in a word. This requires:
- Character-by-character comparison
- Tracking adjacent positions
- Counting distinct occurrences of the pattern "XX" where both X's are the same

This is fundamentally different from:
- Counting a specific letter (which models now do via enumeration)
- Counting total letters (trivial with CoT)
- Position questions (systematic enumeration)

### Candidate Questions Evaluated

1. **"How many times does 'ana' appear in 'banana'?"**
   - Answer: 2 (overlapping at positions 1-3 and 3-5)
   - Risk: "Overlapping" concept might confuse humans too

2. **"How many pairs of double letters are in 'MISSISSIPPI'?"**
   - Answer: 3 (SS at pos 2-3, SS at pos 5-6, PP at pos 8-9)
   - Risk: MISSISSIPPI is famous for letter patterns, likely memorized

3. **"How many pairs of consecutive identical letters are in 'BOOKKEEPER'?"**
   - Answer: 3 (OO, KK, EE)
   - Pros: Clear pattern, not overly famous, verifiable by child
   - Selected as final candidate

4. **"How many pairs of double letters are in 'COMMITTEE'?"**
   - Answer: 3 (MM, TT, EE)
   - Also good but "committee" might be more common

---

## The Question

**"How many pairs of consecutive identical letters are in the word 'BOOKKEEPER'?"**

---

## The Answer

**3**

Verification:
- BOOKKEEPER = B-O-O-K-K-E-E-P-E-R (10 letters)
- Position 1-2: OO (pair 1)
- Position 3-4: KK (pair 2)
- Position 5-6: EE (pair 3)
- Position 7-8: EP (not a pair)
- Position 8-9: ER (not a pair)

---

## Why Humans Get It Right

A human (including a 5-year-old) can:
1. Look at the word BOOKKEEPER
2. Visually scan for places where the same letter appears twice in a row
3. Point to OO, KK, and EE
4. Count: 1, 2, 3

This is a visual pattern recognition task that requires no specialized knowledge - just the ability to see when two adjacent things are the same.

---

## Why LLMs Will Fail

1. **Tokenization Interference:**
   - BOOKKEEPER might be tokenized as "BOOK" + "KEEPER" or "BOO" + "KK" + "EEPER" etc.
   - The double letters might be split across token boundaries

2. **Adjacent Comparison Difficulty:**
   - Comparing position N with position N+1 is not a native operation for transformers
   - They predict next tokens, not compare adjacent positions

3. **Pattern vs Letter Confusion:**
   - Unlike "count how many E's" (single letter counting), this requires recognizing a **pattern** (same-same)
   - Models might confuse this with other letter-counting tasks

4. **Multiple Instance Tracking:**
   - The arxiv research found this is the core weakness: tracking multiple instances of a pattern
   - Here we have 3 instances of the "double letter" pattern

---

## Predicted Wrong Answers

1. **2** - Missing one of the pairs (most likely KK which is less visually obvious)
2. **4** - Counting E separately because it appears again at position 9
3. **1** - Only recognizing the most obvious pair (OO or EE)
4. **5** - Confusion about what counts as a "pair"
5. **0** - Complete failure to understand the question

---

## The 5-Year-Old Test

**Test:** Show a child the word BOOKKEEPER written on paper and ask:
"Can you find where the same letter is next to itself?"

**Expected Response:** Child points to:
- "O and O here" (OO)
- "K and K here" (KK)
- "E and E here" (EE)

**Counting:** "How many times did you find that?" - Child: "Three times!"

This is simple visual pattern matching that any child who knows letters can perform.

---

## Why This Question Is Novel

Compared to previous iterations:
- **Not letter counting:** We're not asking "how many E's" - we're asking about a pattern
- **Not position tracking:** We're not asking "where is the third E" - we're counting pattern occurrences
- **Not self-referential:** The question is about external text, not the model's own output
- **Not visual transformation:** No rotation or ambiguous interpretation needed
- **Objectively verifiable:** The answer is 3, period. No font-dependence or opinion.

---

## Research Quality Checklist

- [x] External research conducted (Tavily + Reddit)
- [x] Question exploits documented failure mode (multiple instance tracking)
- [x] Question is NOT enumeration-solvable in the simple sense
- [x] Human answer is trivially obvious (visual pattern matching)
- [x] Clear, unambiguous correct answer (3)
- [x] 5-year-old can verify
- [x] Not similar to any of iterations 1-38
- [x] Not self-referential
- [x] Not yes/no format
- [x] Not visual transformation/rotation

---

## Confidence Assessment

**Confidence that LLMs will fail:** Medium-High (65%)

Reasoning:
- The arxiv research strongly suggests tracking multiple pattern instances is a core weakness
- However, 2026 frontier models (Opus 4.5, GPT-5, etc.) may have improved on this
- The word BOOKKEEPER is not famous for double letters like MISSISSIPPI
- The question requires a different cognitive operation than simple counting

**Predicted consensus score:** 60-80% (hoping for lower than 60%)

If this gets 100%, it means models have learned to do adjacent comparison, which would be significant progress. The next direction would be **overlapping patterns** like "ana" in "banana".
