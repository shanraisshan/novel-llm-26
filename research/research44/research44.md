# Research Iteration 44: Disambiguation of Character Adjacency Query

## Executive Summary

Iteration 43 achieved **40% consensus** with the question "What letter comes immediately before the 'R' in the word 'CHERRY'?" - a significant result. However, the verifier analysis revealed that the disagreement was NOT due to sub-token position blindness (as intended), but rather due to **interpretation ambiguity**: the word CHERRY contains two R's (C-H-E-R-R-Y), and some models interpreted "the R" as referring to the second R (preceded by the first R), while others interpreted it as the first R (preceded by E).

This iteration applies the clear lesson from iteration 43: **explicitly specify which occurrence of R we're asking about** to eliminate interpretation differences and test PURE sub-token position tracking.

## Key Insight from Iteration 43

From the verifier analysis:
- Answers 1 and 2: Answered "R" (interpreted "the R" as second R, which is preceded by first R)
- Answers 3 and 4: Answered "E" (interpreted "the R" as first R, which is preceded by E)
- Answer 5: Gave ambiguous answer, noting both interpretations

**Critical Observation**: All 5 models correctly identified the letter structure C-H-E-R-R-Y. The failure was NOT in character decomposition - it was in interpretation of the question. This means we need to test whether, given an UNAMBIGUOUS question, models can correctly track character positions.

## External Research (2025-2026)

### ACL 2025: Character Position Asymmetry
- "Only the first character of a token is reliably encoded at the embedding layer"
- "Downstream Transformer layers must reconstruct character-level structure"
- Middle positions (positions 3-4 in a 6-letter word) are HARDEST to access

### arXiv 2601.09089: SubTokenTest Benchmark
- Documents that "even token-free models still struggle with character-level tasks"
- "Keystroke Encoding Task requires decomposition into character-level typing"
- Character-level tasks remain a fundamental challenge

### EMNLP 2025: The Strawberry Problem
- "LLMs consistently fail at simple character-level tasks"
- Character understanding is a form of "inverse scaling" - larger vocabularies make it HARDER

## Question Design Rationale

### The Disambiguation Fix

**Original (Iteration 43)**: "What letter comes immediately before the 'R' in the word 'CHERRY'?"
- Problem: "the R" is ambiguous - which R?

**Improved (Iteration 44)**: "What letter comes immediately before the FIRST 'R' in the word 'CHERRY'?"
- Specifying "the FIRST R" removes all interpretation ambiguity
- The answer is unambiguously E (position 3 comes before position 4)

### Why This Tests Pure Sub-Token Position Tracking

With the ambiguity removed, any disagreement must come from:
1. **Position counting errors**: Miscounting which position is position 3
2. **Adjacency tracking failures**: Correctly finding R but failing to look "before"
3. **Token decomposition failures**: Unable to access middle characters at all
4. **Off-by-one errors**: Common in character position tasks

### Word Structure Analysis

```
CHERRY = C-H-E-R-R-Y
         1-2-3-4-5-6

Position 4: First R (the target)
Position 3: E (the answer - what comes BEFORE the first R)
```

The FIRST R is at position 4 - deep in the middle of the word, where research shows LLMs have the poorest character access.

## The Question

**"What letter comes immediately before the FIRST 'R' in the word 'CHERRY'?"**

## The Correct Answer

**E**

Verification:
- CHERRY spelled out: C(1) - H(2) - E(3) - R(4) - R(5) - Y(6)
- FIRST R is at position 4
- Position immediately BEFORE position 4 is position 3
- Position 3 contains: **E**

This answer is completely unambiguous. There is no interpretation where the answer could be anything other than E.

## Why Humans Get It Right

1. **Visual Scanning**: Humans see the letters C-H-E-R-R-Y laid out spatially
2. **Instant Identification**: We spot the first R immediately
3. **Directional Intuition**: "Before" means "to the left" in left-to-right reading
4. **No Computation Needed**: Just look at the letter to the left of the first R
5. **Child-Simple**: Any child who knows the alphabet can point to R and look left

A 5-year-old solving this:
- "CHERRY... C, H, E, R... the first R is after E... so before R is E!"
- Takes less than 3 seconds

## Why LLMs Will Likely Fail

Based on the research and the character position asymmetry findings:

### 1. Token Bundling
"CHERRY" is processed as a single token (or few tokens) in most tokenizers. The model doesn't "see" individual letters - they're bundled inside token embeddings.

### 2. Middle Position Inaccessibility
Position 4 (where the first R is) and position 3 (where E is) are both in the MIDDLE of the 6-letter word. Research shows first characters are well-encoded, but middle positions require "reconstruction through upper layers" - a process that frequently fails.

### 3. Relational Query Complexity
This isn't just "what's at position 3" but requires:
1. Finding the FIRST R (position 4)
2. Computing position-1 (position 3)
3. Retrieving the character at position 3 (E)

Each step can fail independently.

### 4. The Strawberry Legacy
Despite "CHERRY" being less famous than "STRAWBERRY" for LLM testing, both share the critical feature of having double letters (RR) which may cause position confusion even when specifying "FIRST R".

### 5. Positional Counting Errors
Even when models attempt systematic enumeration (C-H-E-R-R-Y), they may:
- Miscount which position is which
- Confuse "before" with "after"
- Return the first R itself instead of what precedes it

## Predicted Wrong Answers

### Most Likely: H (off-by-one error)
- Model might count to position 3 correctly but return position 2 instead
- Or might confuse "before" directionality

### Second Most Likely: R (returning the target itself)
- Model might misunderstand "before" as "at" or confuse the query
- Or might return the second R instead of what precedes the first R

### Third Most Likely: C (first character bias)
- The first character is best-encoded in token embeddings
- Model might default to this when uncertain about middle positions

### Fourth Most Likely: Y (before/after confusion)
- Model might confuse "before" and "after"
- Y is the last letter, potentially accessible as an endpoint

### Possible: "There are two Rs" (avoidance)
- Model might focus on the double-R pattern instead of answering
- Despite "FIRST R" specification, might still hedge

## Comparison with Iteration 43

| Aspect | Iteration 43 | Iteration 44 |
|--------|--------------|--------------|
| Question | "...before the 'R' in CHERRY" | "...before the FIRST 'R' in CHERRY" |
| Ambiguity | "the R" could mean first or second R | "FIRST R" is unambiguous |
| Correct answer | E (for first R) or R (for second R) | E only |
| Score | 40% (but due to interpretation, not position tracking) | Target: <40% (testing pure position tracking) |

## Success Criteria

The question succeeds if:
- Consensus score < 40% (better than iteration 43)
- Disagreements arise from POSITION TRACKING failures, not interpretation differences
- Any human who reads "FIRST R" gets it right instantly

## Confidence Assessment

**Medium Confidence** this will cause genuine position-tracking disagreement:

**Strengths**:
- Eliminates the interpretation ambiguity that explained iteration 43's disagreement
- Tests pure sub-token position access at position 3-4 (middle, hardest zone)
- Relational query compounds basic position-finding difficulty
- Research strongly supports character position failures

**Risks**:
- If iteration 43's models were ACTUALLY capable of position tracking (they just disagreed on interpretation), this might get 100% consensus
- Modern 2026 models may use chain-of-thought to enumerate C-H-E-R-R-Y correctly
- "CHERRY" is a common word - might have specific training coverage

**Key Test**: If we get 100% consensus with all models answering "E", it confirms that iteration 43's disagreement was purely interpretational and modern models CAN track character positions when unambiguous. If we get <40% consensus with varied wrong answers (H, R, C), it confirms position-tracking failures.

---

## Appendix: Alternative Questions for Future Iterations

If this iteration gets 100% (models can do position tracking when unambiguous):

1. **Longer word, deeper position**: "What letter comes immediately before the FIRST 'E' in the word 'NEVERTHELESS'?"
   - N-E-V-E-R-T-H-E-L-E-S-S
   - First E at position 2, answer: N
   - But middle E's are at positions 4, 8, 10 - harder to track

2. **Two-step relational query**: "In the word 'BOOKKEEPER', what letter comes two positions before the FIRST 'K'?"
   - B-O-O-K-K-E-E-P-E-R
   - First K at position 4, two before is position 2: O

3. **Different word with double letters**: "What letter comes immediately after the SECOND 'O' in the word 'BALLOON'?"
   - B-A-L-L-O-O-N
   - Second O at position 6, after is position 7: N

If this iteration gets varied wrong answers (position tracking IS the problem):
- Keep iterating on simpler words with explicit position specifications
- Try "What is the letter at position 3 in the word 'CHERRY'?" (direct, no relational aspect)
