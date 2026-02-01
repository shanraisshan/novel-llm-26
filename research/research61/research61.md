# Research Iteration 61: Alphabetical Ordering with Numeric Semantic Priming

## Executive Summary

This iteration explores a **novel combination of alphabetical ordering and semantic priming** that exploits how LLMs process number words. The key insight from external research is that:

1. LLMs still struggle with the 9.11 vs 9.9 comparison (documented failure as recently as 2025)
2. Semantic priming from number words can override correct letter-by-letter analysis
3. Alphabetical ordering requires character-level processing that tokenization obscures

The research approach is to create a question where:
1. The answer requires simple alphabetical comparison
2. Number words create strong semantic interference
3. A child could answer it instantly by reciting the alphabet

---

## External Research Conducted

### Source 1: Tavily Search - "LLM fails comparing decimals 9.11 vs 9.9"

Key findings:
- **Reddit 2025 thread**: "It's 2025 already, and LLMs still mess up whether 9.11 or 9.9 is bigger"
- Multiple sources confirm this is STILL a problem in 2025-2026
- The failure stems from tokenization treating "9.11" and "9.9" as separate units
- LLMs may pattern-match to version numbers (where 9.11 > 9.9) instead of decimals

### Source 2: arXiv 2507.07313 - "Frontier LLMs Still Struggle with Simple Reasoning Tasks"

Key findings:
- "Researchers continue to uncover surprisingly simple reasoning problems that still confuse even the most advanced LLMs"
- Tasks include: **counting characters in words**, comparing numbers like 9.11 and 9.9
- "The Unpuzzles dataset... illustrates that good performance on original puzzles is at least in part a consequence of memorization"

### Source 3: NAACL 2025 - "A Linguistic and Math Expert's Struggle with Simple Word-based Counting"

Key findings:
- Word-based counting tasks reveal fundamental LLM limitations
- Different tokenization strategies do NOT fix the problem
- "There is no perturbation that benefits all studied models"

### Source 4: EMNLP 2025 - "The Strawberry Problem: Emergence of Character-level Understanding"

Key findings:
- Character-level tasks show "inverse scaling" - larger tokenizer vocabulary = slower learning
- The problem is fundamental to how LLMs process text
- Chain-of-thought can help but doesn't fully solve the problem

### Source 5: Reddit Thread - "Give me stupid simple questions that ALL LLMs can't answer"

Key findings:
- Community consensus: "This is a moving target" - what works today may not work tomorrow
- Character counting (strawberry) still mentioned as a baseline
- ARC Prize puzzles cited as examples of human-easy, LLM-hard tasks

---

## The Question Design Process

### Failed Approaches from Previous Research

Based on the accumulated findings from iterations 1-60:
- Simple letter counting (strawberry) - NOW SOLVED by CoT enumeration
- Numeric comparison (9.11 vs 9.9) - Still problematic but too well-known
- Classic riddles (sheep, bat/ball) - In training data
- Self-referential questions - Wrong direction (confuse humans too)

### Novel Approach: Alphabetical + Semantic Priming

The key insight is that **alphabetical ordering** requires:
1. Character-level access (first letter comparison)
2. Knowledge of alphabet sequence (memorized by all humans)
3. Ignoring semantic meaning of words

When combined with **number words**, this creates maximum interference:
- "ONE" vs "TWO" - semantically 1 < 2, but alphabetically O > T (O comes after T? No, actually O comes before T... wait, T comes before O? No - A B C D E F G H I J K L M N **O** P Q R S **T**... O comes BEFORE T)

Wait, let me verify: In the alphabet, O is the 15th letter, T is the 20th letter. So O comes BEFORE T in the alphabet. This means "ONE" comes BEFORE "TWO" alphabetically.

But semantically, 1 < 2, so the number meaning pushes toward "ONE is smaller/first."

**This is NOT a good trap because the semantic and alphabetical orderings ALIGN.**

Let me find a better example where they CONFLICT:

- "EIGHT" vs "NINE": E=5, N=14. E comes before N. So "EIGHT" is first alphabetically. But 8 < 9, so semantically EIGHT is also "smaller/first." ALIGNED - not useful.

- "EIGHT" vs "ELEVEN": E=5, E=5. Same first letter! Need to check second: I=9, L=12. I comes before L. So "EIGHT" is first alphabetically. 8 < 11 semantically. ALIGNED.

- "EIGHT" vs "FIVE": E=5, F=6. E comes before F. So "EIGHT" is first alphabetically. But 8 > 5 semantically! **CONFLICT!**

**This is promising!** A child would immediately know E comes before F in the alphabet, but the semantic meaning of the numbers (8 > 5) conflicts with this.

Actually wait - let me reconsider the question phrasing. "Which word comes first alphabetically" is too obvious. Let me think about what would create maximum confusion.

### The Core Insight

The question should:
1. Ask about **alphabetical** ordering (requires character comparison)
2. Use **number words** whose semantic values conflict with alphabetical order
3. Be trivially answerable by a child who knows the alphabet

**"Which word comes first in the dictionary: EIGHT or FIVE?"**

- Alphabetical answer: EIGHT (E < F)
- Semantic priming: FIVE (5 < 8)

A child would immediately know E comes before F, so EIGHT comes first in the dictionary.

But LLMs might be primed by the numeric meanings (5 < 8) to say FIVE comes first.

### Alternative: Even Stronger Conflict

What about "SIX" vs "SEVEN"?
- S=19, S=19. Same first letter.
- Second letter: I=9, E=5. E < I.
- So "SEVEN" comes before "SIX" alphabetically.
- But 7 > 6 semantically, so "SIX" would be "first" numerically.

**CONFLICT!** Semantically SIX should be first (6 < 7), but alphabetically SEVEN is first (SE < SI).

This is VERY strong because:
1. Both words start with S, so you MUST check the second letter
2. The second letters are E vs I - E comes before I
3. But 6 < 7, so semantic priming says SIX is "smaller/first"

### Final Question Selection

After analysis, the strongest candidate is:

**"Which word comes first in the dictionary: SIX or SEVEN?"**

**Answer: SEVEN**

Reasoning:
1. Both start with 'S'
2. Second letter of SEVEN is 'E' (position 5)
3. Second letter of SIX is 'I' (position 9)
4. E comes before I in the alphabet
5. Therefore SEVEN comes before SIX in the dictionary

**Why this might work:**
- Strong semantic priming: 6 < 7, so "SIX" feels like it should come "first"
- Requires actual character comparison beyond the first letter
- A 5-year-old who knows the alphabet can verify: S-E vs S-I, and E comes before I

---

## The Question

**Which word comes first in the dictionary: SIX or SEVEN?**

---

## The Answer

**SEVEN**

---

## Why Humans Get It Right

Humans approach this with a simple algorithm they learned in elementary school:

1. **Compare first letters**: Both are 'S' - tie
2. **Compare second letters**: 'E' (SEVEN) vs 'I' (SIX)
3. **Recall alphabet order**: A B C D **E** F G H **I** - E comes before I
4. **Conclusion**: SEVEN comes first

A 5-year-old who knows the alphabet song can answer this:
- "S...E comes before S...I because E comes before I"

The child does NOT need to know what "six" or "seven" mean numerically. They just compare letters.

---

## Why LLMs Will Fail

### Primary Failure Mode: Numeric Semantic Priming

When LLMs process "SIX" and "SEVEN", they activate:
- The concept of the number 6
- The concept of the number 7
- The relationship 6 < 7

The question asks "which comes FIRST" - this is strongly associated with "smaller" or "lower":
- "First" in a list (1, 2, 3...) means the smallest
- "First" in order often means "before" numerically

This semantic activation may override the correct alphabetical analysis.

### Secondary Failure Mode: Tokenization

- "SIX" is likely tokenized as a single token
- "SEVEN" is likely tokenized as a single token
- The model has no direct access to individual characters S-I-X vs S-E-V-E-N

To compare alphabetically, the model must:
1. Recognize this is an alphabetical task
2. Decompose tokens into characters
3. Compare character-by-character
4. Know E < I in the alphabet

This multi-step process may fail at any stage.

### Why Previous Iterations Didn't Try This

Previous iterations tested:
- Iteration 49: "Which letter comes earlier in the alphabet: the LAST letter of 'FIRST' or the FIRST letter of 'LAST'?" - 100% (too explicit about letters)
- Iteration 52: "Which word comes first alphabetically if you sort by the LAST letter: CAT or DOG?" - 100% (too direct)

This question is different because:
1. It uses number words (strong semantic priming)
2. It requires going beyond the first letter (both start with S)
3. The semantic and alphabetical orderings CONFLICT

---

## Predicted Wrong Answers

### Most Likely Wrong Answer: **SIX**

Reasoning path that leads here:
1. Process "SIX" - activate concept of 6
2. Process "SEVEN" - activate concept of 7
3. "Which comes first?" - associate "first" with "smaller/lower"
4. 6 < 7, so SIX comes "first"
5. Answer: SIX

### Alternative Wrong Answer: **"They're both under S, so they're equal"**

Reasoning path:
1. Both words start with S
2. Fail to continue character comparison
3. Conclude they would be at the "same place" or give an ambiguous answer

### Why "SIX" Is Most Likely

The semantic priming from number words is VERY strong. When humans hear "six" and "seven," they immediately think of 6 and 7, not the letters S-I-X and S-E-V-E-N.

LLMs, which are trained on vast amounts of text where "six" and "seven" appear in numeric contexts, will have even stronger activation of the numeric meanings.

---

## The 5-Year-Old Test

**Can a 5-year-old answer this correctly?**

YES - Any child who knows the alphabet can answer this. The test is:
1. "What's the first letter of SIX?" - "S"
2. "What's the first letter of SEVEN?" - "S"
3. "They're both S, so check the second letter. What's the second letter of SIX?" - "I"
4. "What's the second letter of SEVEN?" - "E"
5. "In the alphabet, does E come before I or after I?" - "Before"
6. "So which word comes first in the dictionary?" - "SEVEN"

**Is the answer unambiguous?**

YES - Standard dictionary order is strictly defined: compare character by character, earlier characters in the alphabet come first.

**Does it exploit LLM architectural limitations?**

YES - It exploits:
1. Tokenization that treats words as units rather than character sequences
2. Semantic priming from number word meanings
3. Association of "first" with numeric ordering (smaller = first)

---

## Comparison to Best Previous Results

| Iteration | Question Type | Score | Why It Worked/Failed |
|-----------|--------------|-------|---------------------|
| 13 | Self-referential output | 20% | Scope ambiguity |
| 30 | Self-referential syllable | 60% | Dual-valid property |
| 43 | Character adjacency | 40% | Interpretation ambiguity |
| 55 | Constraint impossibility | 40% | Meta-constraint (wrong direction) |
| 60 | Idiomatic phrase | 100% | Classic riddle in training data |

**This question (61)** targets:
- Semantic priming from number words (new approach)
- Alphabetical ordering requiring character decomposition
- Conflict between semantic and alphabetical "first"

---

## Hypothesis

Based on external research showing:
1. LLMs still fail 9.11 vs 9.9 comparisons (numeric processing issues)
2. Semantic priming can override task instructions
3. Character-level access requires explicit decomposition

**Predicted consensus**: 40-60%

Some models will:
- Correctly decompose words and compare letters: SEVEN
- Get primed by numeric meanings and answer: SIX

The conflict between semantic "first" (smaller number) and alphabetical "first" (earlier in alphabet) should create disagreement.

---

## Alternative Questions Considered

### Option 2: "EIGHT vs FIVE"
- E < F alphabetically, so EIGHT comes first
- But 8 > 5 semantically
- Problem: First letter comparison is too easy (E vs F)

### Option 3: "THREE vs TWO"
- T < T (same), then H < W, so THREE comes first
- But 3 > 2 semantically
- Problem: Similar to chosen question but less common word pair

### Option 4: "NINE vs EIGHT"
- E < N alphabetically, so EIGHT comes first
- But 8 < 9 semantically (aligned!)
- Problem: No conflict, so no trap

The SIX vs SEVEN question was selected because:
1. STRONG semantic conflict (6 < 7 but SEVEN < SIX alphabetically)
2. Requires going beyond first letter (both start with S)
3. Simple alphabet knowledge needed (E vs I)
4. Clear, unambiguous correct answer

---

## Summary

**Question**: Which word comes first in the dictionary: SIX or SEVEN?

**Answer**: SEVEN

**Human approach**: Compare letters: S=S, so check second letter: E < I, so SEVEN comes first

**LLM failure mode**: Semantic priming from numeric values: 6 < 7, so "SIX is first"

**Exploited limitation**: Semantic priming + tokenization hiding character-level structure

**5-year-old test**: PASS - any child who knows the alphabet can verify E comes before I

**Predicted wrong answer**: SIX

**Predicted consensus**: 40-60%
