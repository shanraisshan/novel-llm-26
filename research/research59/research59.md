# Research Documentation for Iteration 59

## Research Date: 2026-02-01

## Executive Summary

After iteration 58 was flagged as WRONG_DIRECTION (constraint impossibility paradoxes don't meet strawberry criteria), this research returns to the fundamental strawberry paradigm: simple counting questions that exploit tokenization blindness. We target a word with HIGH letter multiplicity (5 occurrences) that is child-friendly and NOT a famous LLM test case.

---

## External Research Conducted

### Tavily Web Search Findings

#### 1. Blueberry Research (minimaxir.com, August 2025)

Key findings from "Can modern LLMs actually count the number of b's in blueberry?":

- **GPT-5 Chat fails badly**: Only ~24% accuracy on blueberry letter counting
- **Most other models succeed**: Claude Opus 4.1, Claude Sonnet 4, Gemini models get ~100%
- **Strawberry is now "solved"**: Training data contamination means most models ace the strawberry test
- **Novel words still cause failures**: "blueberry" wasn't famous, and GPT-5 Chat hallucinated "3 b's" when there are only 2

Quote from research:
> "GPT-5 Chat is indeed wrong that often, and in spectacular ways... The checkmark emoji just makes its confident incorrectness funnier."

This confirms: **NOVEL words with letter counting can still cause LLM disagreement in 2026**.

#### 2. Character Counting Research (arxiv.org, 2024-2025)

Multiple academic sources confirm:
- LLMs struggle with "letters that have a multiplicity greater than one"
- "Most models being unable to correctly count words in which letters appear more than twice"
- Tokenization is the root cause: models see tokens like ["str", "aw", "berry"], not individual letters
- Double letters within tokens (like "rr" in "berry") are especially problematic

#### 3. LLM Counting Mechanisms (various sources)

- Chain-of-thought enumeration CAN solve simple counting (e.g., "possess" got 100%)
- BUT: This requires models to correctly identify each character, which tokenization makes difficult
- Longer words or words with scattered repeated letters are harder
- Words NOT in training data as test cases are more likely to cause errors

### Reddit MCP Findings

#### r/LocalLLaMA Discussions
- Confirmed tokenization as the root cause of counting failures
- Suggested that "strawberry" and "Mississippi" are now likely in training data as test cases
- Recommended using novel/uncommon words for testing

#### r/ChatGPT and r/OpenAI
- Multiple threads documenting ongoing counting failures even in 2026 models
- The blueberry failure was independently verified by community members
- Users report inconsistent results even with chain-of-thought prompting

---

## Analysis of Previous Iterations

### What WORKS (100% Consensus - FAILED as LLM-breaking questions)
- **Iteration 35**: "possess" (4 s's) - 100% correct via enumeration
- **Iteration 36**: Numeric comparison (3.9 vs 3.11) - 100% correct
- **Iteration 37**: Visual transformation (MOM upside down) - 80%
- **Iteration 39**: "BOOKKEEPER" consecutive pairs - 100%
- **Iteration 40**: "LONG vs SHORT" semantic prime - 100%
- **Iteration 47**: Backward spelling - 100%
- **Iteration 48**: Syllable counting - 100%
- **Iterations 55-58**: Constraint impossibility - WRONG_DIRECTION (not strawberry-type)

### Key Pattern
Chain-of-thought enumeration consistently solves:
- Simple letter counting in common words
- Position identification
- Pattern recognition

### What CAUSED Disagreement (<100%)
- **Iteration 43 (40%)**: Ambiguity ("the R" in CHERRY - which R?)
- **Iteration 37 (80%)**: Visual transformation requiring shape knowledge
- **Iteration 6 (80%)**: Relational reasoning (sibling puzzle)
- **Iteration 12-13 (20-40%)**: Self-referential output - NOT strawberry-type

### Strategic Insight

The blueberry research shows that **model-specific bugs** can cause failures even in 2026. While most models enumerate correctly, GPT-5 Chat specifically fails at blueberry despite succeeding at strawberry. This suggests:
1. Training data contamination fixes SPECIFIC words, not the general capability
2. Novel words with high multiplicity can still cause errors
3. Different models may have different tokenization vulnerabilities

---

## Novel Question Design

### Target Word: "ABRACADABRA"

The magical word "abracadabra" has unique properties:

#### Letter Analysis
```
a-b-r-a-c-a-d-a-b-r-a (11 letters total)

Position 1:  a (yes)
Position 2:  b
Position 3:  r
Position 4:  a (yes)
Position 5:  c
Position 6:  a (yes)
Position 7:  d
Position 8:  a (yes)
Position 9:  b
Position 10: r
Position 11: a (yes)

Letter 'a' appears: 5 times (positions 1, 4, 6, 8, 11)
```

#### Why This Word

1. **HIGH MULTIPLICITY (5)**: The letter 'a' appears 5 times - maximum we've found in a child-friendly word. Research shows "multiplicity greater than one" causes more errors, and 5 is significantly higher than previous tests.

2. **CHILD-FRIENDLY**: Every child knows "abracadabra" from magic shows, cartoons, and fairy tales. It passes the 5-year-old test easily.

3. **NOT A FAMOUS TEST CASE**: Unlike "strawberry" and "Mississippi", "abracadabra" has not been widely discussed as an LLM test case (verified via Tavily search).

4. **UNUSUAL PATTERN**: The 'a' appears in an almost-alternating pattern (positions 1, 4, 6, 8, 11). This scattered distribution may confuse models that try to recognize patterns.

5. **POTENTIAL TOKENIZATION ISSUES**: The word may be tokenized as ["ab", "rac", "ada", "bra"] or similar, hiding the 'a' distribution.

---

## The Question

**Question**: How many times does the letter 'a' appear in 'abracadabra'?

---

## The Correct Answer

**Answer**: 5

The word "abracadabra" is spelled: a-b-r-a-c-a-d-a-b-r-a

The letter 'a' appears at positions 1, 4, 6, 8, and 11.

---

## Why Humans Get It Right

A 5-year-old can answer this by:

1. **Visual Recognition**: Looking at the word and pointing at each 'a'
2. **Finger Counting**: Counting on fingers: a...a...a...a...a = 5
3. **Familiarity**: Children recognize this word from magic shows and can spell it out loud

The question requires no complex reasoning - just visual scanning and counting. Any child who has heard "abracadabra" can answer this in under 10 seconds.

---

## Why LLMs May Fail

### 1. Tokenization Blindness
The word "abracadabra" is likely tokenized as 2-3 subword tokens (e.g., ["ab", "rac", "ada", "bra"] or ["abra", "cada", "bra"]). The model never directly "sees" the individual letters, making accurate counting dependent on learned associations.

### 2. High Multiplicity Error
Research shows LLMs "concentrate most of their errors when counting letters that have a multiplicity greater than one." With 5 occurrences of 'a', this is well above the error-prone threshold.

### 3. Pattern Recognition Confusion
The near-alternating pattern of 'a' (positions 1,4,6,8,11) may trigger pattern-matching heuristics that produce incorrect counts. Models might recognize "a lot of a's" without accurately counting.

### 4. Statistical Bias
Most English words have letters appearing 0-2 times. The answer "5" is statistically unusual and may be underweighted in the model's output distribution.

### 5. Novelty Effect
Unlike "strawberry" which has been explicitly trained on, "abracadabra" as a letter-counting test is novel. The model cannot rely on memorized correct answers.

---

## Predicted Wrong Answers

LLMs may answer:

- **4**: Miscounting by missing one 'a' (most likely error)
- **6**: Overcounting by including the similar-looking 'b' positions
- **3**: Counting only visible 'a' patterns without full enumeration
- **"Several" or "Multiple"**: Hedging without committing to a specific number

The most likely wrong answer is **4** - missing one of the middle 'a's due to tokenization boundaries or enumeration errors in the scattered pattern.

---

## Verification Checklist

1. **5-year-old test**: YES - Children know "abracadabra" from magic shows
2. **Unambiguous**: YES - Exactly 5 a's, objectively verifiable
3. **Not philosophical**: YES - Simple counting question
4. **Exploits tokenization**: YES - 11-letter word with 5 scattered 'a's
5. **Novel**: YES - Not a famous LLM test case (verified via search)
6. **Simple format**: YES - One-liner question with a number answer

---

## Alternative Questions Considered

### Option A: "How many e's in 'excellence'?"
- Answer: 4
- Pro: Common word, high multiplicity
- Con: Lower multiplicity than abracadabra (4 vs 5)

### Option B: "How many e's in 'Tennessee'?"
- Answer: 4
- Pro: Common proper noun, interesting pattern
- Con: May have regional familiarity issues, only 4 vs 5

### Option C: "How many o's in 'onomatopoeia'?"
- Answer: 4
- Pro: Interesting word, scattered o's
- Con: May be too advanced for 5-year-old test

### Why "abracadabra" Wins
- Highest multiplicity (5) of any child-friendly word found
- Universal recognition among children
- Novel as an LLM test case
- Fun and memorable

---

## Research Hypothesis

**H1**: At least 1 of 5 frontier LLMs will answer incorrectly (4, 6, or other) due to high multiplicity and tokenization, achieving <100% consensus.

**H0**: All 5 LLMs will correctly enumerate and answer "5", achieving 100% consensus.

---

## Notes for Future Iterations

If this achieves 100% consensus (fails as LLM-breaking):
- Try longer words with even higher multiplicity (6+)
- Explore model-specific failure modes (GPT-5 Chat vs Claude)
- Consider made-up/nonsense words that definitely aren't in training data

If this achieves <100% consensus (success):
- Document which models failed and why
- Explore similar patterns with other high-multiplicity words
- Test variations with different letters

---

## Submission Summary

| Field | Value |
|-------|-------|
| **Question** | How many times does the letter 'a' appear in 'abracadabra'? |
| **Expected Answer** | 5 |
| **Category** | Character Counting / Tokenization Blindness |
| **Target Failure Mode** | High multiplicity letter counting |
| **5-Year-Old Test** | PASS - Children know this word from magic shows |
| **Novel Test Case** | YES - Not famous as LLM test |
