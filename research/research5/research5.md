# Research Iteration 5: Novel LLM-Breaking Question

## Executive Summary

After four consecutive failures where LLMs achieved 100% consensus through systematic enumeration, this iteration pivots to a fundamentally different attack vector: **self-referential semantic contradiction**. The question "How many letters are in 'FIVE LETTERS'?" exploits the tension between a phrase's semantic claim about itself and the actual count.

---

## The Question

**"How many letters are in 'FIVE LETTERS'?"**

---

## The Answer

**11**

### Verification

```
F - I - V - E - (space) - L - E - T - T - E - R - S
1   2   3   4             5   6   7   8   9  10  11

FIVE = 4 letters
LETTERS = 7 letters
Total = 11 letters (spaces are not letters)
```

---

## Why Humans Get It Right

1. **Visual counting**: A child points and counts: "F, I, V, E, L, E, T, T, E, R, S" = 11
2. **Ignore semantic content**: Humans naturally separate "what the phrase says" from "counting the letters in it"
3. **Simple finger counting**: Each letter gets a finger tap
4. **No confusion about the task**: The task is to count letters, not interpret the phrase's meaning

---

## Why LLMs Will Fail

### Primary Mechanism: Self-Referential Semantic Override

This question is unique because **the phrase makes a false claim about itself**:

- "FIVE LETTERS" semantically asserts: "I contain five letters"
- The actual count contradicts this: 11 letters
- LLMs must override the phrase's self-description to answer correctly

### The Cognitive Trap

When an LLM processes "FIVE LETTERS", it encounters:

1. **Token sequence**: "FIVE", "LETTERS" (or similar tokenization)
2. **Semantic activation**: "FIVE" activates the number 5
3. **Self-referential interpretation**: The phrase appears to describe itself
4. **Confirmation bias**: "FIVE" + "LETTERS" = "5 letters" feels self-consistent

The phrase is **semantically coherent as a description** even though it's factually wrong:
- "FIVE LETTERS" sounds like a statement: "There are five letters"
- This creates pressure to confirm rather than contradict

### Why This Differs From Previous Failures

| Iteration | Question Type | Why 100% Consensus |
|-----------|---------------|-------------------|
| 1 | Python technical | Well-trained on code |
| 2 | FIRST/last semantic | Simple contradiction, easy to verify |
| 3 | FOUR vs FIVE comparison | Explicit enumeration works |
| 4 | ELEVEN position + occurrence | Systematic tracking works |
| **5** | **Self-referential claim** | **The phrase asserts its own count** |

Previous questions had semantic interference, but the phrases didn't claim to describe themselves. "ELEVEN" doesn't say "I have 11 letters." But "FIVE LETTERS" literally says "there are five letters (here)."

### The Innovation: Meta-Level Semantic Trap

This question operates at a meta-level:
- It's not just about word meaning interfering with counting
- It's about a **phrase that makes a counterfactual claim about itself**
- The LLM must recognize: "This phrase claims to have 5 letters, but actually has 11"

### Tokenization Blindness Compounds the Problem

"FIVE LETTERS" likely tokenizes as:
- ["FIVE", " LET", "TERS"] or similar
- The model never "sees" 11 individual characters
- It sees a phrase that semantically screams "5"

---

## Predicted Wrong Answers

| Wrong Answer | Reasoning |
|--------------|-----------|
| **5** | Most likely. Direct semantic interpretation of "FIVE LETTERS" as a self-describing phrase. The phrase "says" it has five letters. |
| **4** | Counting only "FIVE" and ignoring "LETTERS" |
| **7** | Counting only "LETTERS" and ignoring "FIVE" |
| **12** | Including the space as a character |
| **2** | Counting the number of words instead of letters |

**Primary prediction: LLMs will answer "5"** because the phrase appears to self-describe.

---

## Full Research Documentation

### Strategic Pivot: Why Self-Reference

The accumulated research findings showed a critical pattern:

> **KEY INSIGHT**: Any question solvable by "write out letters, count systematically" WILL BE SOLVED

Four iterations proved that:
- Semantic priming doesn't override enumeration
- Position/occurrence tracking works
- Even dual interference mechanisms are defeated

**The solution**: Create a question where the semantic content **directly contradicts** the correct answer at a self-referential level.

### Why "FIVE LETTERS" Is Different

Previous semantic traps:
- ELEVEN: word means 11, but has 6 letters (no claim about itself)
- FIRST: word means beginning, asking for end (positional contradiction)
- FOUR vs FIVE: numbers prime, but comparison is straightforward

"FIVE LETTERS" trap:
- The phrase **appears to describe its own letter count**
- It's a **performative utterance** that asserts something about itself
- The assertion is FALSE, but feels TRUE

### The Performative Paradox

Consider these phrases:
- "Three words" (but it's 2 words) - makes a false self-claim
- "Six characters" (but it has 13) - makes a false self-claim
- "FIVE LETTERS" (but it has 11) - makes a false self-claim

These phrases **perform** a claim about themselves that is objectively false.

Humans easily see through this because we:
1. Don't take phrases at their word
2. Can independently verify by counting
3. Recognize the humor/irony in self-contradicting phrases

LLMs might:
1. Trust the semantic content
2. Have difficulty contradicting explicit claims
3. Be primed by the phrase structure to accept its self-description

### Alternative Questions Considered

| Question | Why Rejected/Selected |
|----------|----------------------|
| "How many words in 'TWO WORDS'?" | Answer is 2, which matches! No trap. |
| "How many words in 'THREE WORDS'?" | Answer is 2, trap exists. But "words" vs "letters" - letters is harder to verify for LLMs |
| "How many letters in 'TEN LETTERS'?" | 10 letters exactly! TENLETTERS = 10. No trap. |
| "How many letters in 'FOUR LETTERS'?" | FOURLETTERS = 11 letters. Similar trap but "FIVE" is a stronger number prime |
| **"How many letters in 'FIVE LETTERS'?"** | **SELECTED. 11 letters, strong 5 prime, clear contradiction** |

Wait, let me verify "FOUR LETTERS":
- FOUR: F-O-U-R = 4
- LETTERS: L-E-T-T-E-R-S = 7
- Total: 11

And "TEN LETTERS":
- TEN: T-E-N = 3
- LETTERS: L-E-T-T-E-R-S = 7
- Total: 10

Interesting! "TEN LETTERS" actually HAS ten letters! That's accidentally self-consistent.

This confirms "FIVE LETTERS" (11) is a good choice - it's clearly self-contradicting.

### The Irony Stack

The question has multiple layers of irony:

1. **Surface level**: Count the letters in this phrase
2. **Semantic level**: The phrase says "FIVE LETTERS"
3. **Reality level**: The phrase has ELEVEN letters
4. **Meta level**: The word "FIVE" contributes 4 letters, making the claim even more false

The word FIVE, in claiming there are five letters, adds 4 letters toward a total of 11.

### Why This Might Finally Work

1. **Self-referential**: Unlike previous questions, this phrase claims to describe itself
2. **Direct contradiction**: The claim (5) directly conflicts with reality (11)
3. **Semantic coherence of the trap**: "FIVE LETTERS" sounds like a valid phrase describing something
4. **No obvious enumeration trigger**: The phrase doesn't obviously require counting - it "tells you" the answer
5. **Misdirection**: The word "LETTERS" appears to be the noun being counted, not part of the count

### Potential Failure Mode

A careful LLM might:
1. Recognize this as a counting task
2. Enumerate: F-I-V-E-L-E-T-T-E-R-S
3. Count: 11
4. Note the irony that "FIVE LETTERS" doesn't have five letters

If models do this, they'll get it right. The bet is that the self-referential semantic claim short-circuits the enumeration habit.

---

## Success Criteria Assessment

| Criterion | Assessment |
|-----------|------------|
| Simple one-liner | Yes - 8 words |
| Child could answer correctly | Yes - just count the letters |
| Unambiguous single answer | Yes - 11 letters |
| Not technical/domain-specific | Yes - basic counting |
| Exploits fundamental LLM limitation | Yes - self-referential semantic override |
| Different from previous attempts | Yes - first self-describing phrase trap |

---

## Confidence Assessment

**Confidence that this will achieve <100% consensus: Medium (55%)**

Reasons for optimism:
- Novel self-referential mechanism not previously attempted
- The phrase "FIVE LETTERS" strongly suggests the answer is 5
- No obvious trigger to "slow down and count"
- The phrase appears to answer its own question

Reasons for caution:
- Modern LLMs might have seen similar puzzles
- CoT reasoning might say "let me verify by counting"
- The word "LETTERS" might trigger letter-counting behavior
- 11 is not outrageously different from 5 (not like 11 vs 100)

---

## Appendix: Manual Verification

**Question**: "How many letters are in 'FIVE LETTERS'?"

**Step-by-step solution**:
1. Identify the phrase: FIVE LETTERS
2. List all letters (excluding space): F, I, V, E, L, E, T, T, E, R, S
3. Count: 11 letters
4. Note: The phrase semantically suggests "5" but actually contains 11

**Answer: 11**

---

## Appendix: Related Self-Referential Puzzles

For future research, other self-referential phrases:

| Phrase | Actual Count | Claimed Count | Difference |
|--------|--------------|---------------|------------|
| FIVE LETTERS | 11 | 5 | +6 |
| FOUR LETTERS | 11 | 4 | +7 |
| THREE LETTERS | 12 | 3 | +9 |
| TWO LETTERS | 10 | 2 | +8 |
| ONE LETTER | 9 | 1 | +8 |
| SIX LETTERS | 10 | 6 | +4 |
| SEVEN LETTERS | 12 | 7 | +5 |
| EIGHT LETTERS | 12 | 8 | +4 |
| NINE LETTERS | 11 | 9 | +2 |
| TEN LETTERS | 10 | 10 | 0 (self-consistent!) |
| ELEVEN LETTERS | 13 | 11 | +2 |
| TWELVE LETTERS | 12 | 12 | 0 (self-consistent!) |

Interestingly, "TEN LETTERS" and "TWELVE LETTERS" are accidentally self-consistent!

The maximum misdirection is "THREE LETTERS" (claims 3, has 12) but "FIVE" is a stronger semantic prime than "THREE."
