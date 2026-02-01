# Research Iteration 47: Novel LLM-Breaking Question

## The Question

**"Spell the word 'HOSPITAL' backwards."**

## The Answer

**LATIPSOH**

## Why Humans Get It Right

Humans can answer this question in seconds by:
1. **Visual processing**: We SEE the letters H-O-S-P-I-T-A-L as individual characters
2. **Simple reversal**: We can mentally or physically reverse the sequence
3. **Finger counting**: A child can point to each letter from end to beginning: L-A-T-I-P-S-O-H
4. **Writing it down**: Write the word, then read from right to left

This is trivially easy for any human who can read. A 5-year-old who knows the alphabet can do this by writing the word and reading backwards.

## Why LLMs Will Fail

This exploits **TOKENIZATION BLINDNESS** - the most fundamental architectural limitation of LLMs:

### The Mechanism

1. **LLMs process tokens, NOT characters**: The word "HOSPITAL" is likely tokenized as something like ["HOSP", "ITAL"] or ["HOS", "PIT", "AL"]
2. **Token reversal vs character reversal**: When asked to reverse, models may reverse tokens (giving "ITALHOSP") rather than characters ("LATIPSOH")
3. **No visual access**: LLMs cannot "see" individual letters - they're hidden inside tokens
4. **Character position uncertainty**: Models don't have reliable access to character positions within tokens

### External Research Evidence

**Peripheral Creative Study (December 2025)**:
- Analyzed 500 common English words for backward spelling
- **52% failure rate overall** for Google AI Overviews
- **Only 25% accuracy for words with 7+ letters** (HOSPITAL has 8)
- **Only 10% accuracy for words with 3+ syllables** (HOSPITAL has 3)
- Errors were often nonsensical, not just reversed-order tokens

**Why HOSPITAL is ideal**:
- 8 letters (longer words fail more often)
- 3 syllables (multi-syllable words have 10% accuracy)
- Not a famous test case like "strawberry" or "lollipop"
- Common enough that tokenizers have seen it, but reversal is likely not in training data

### The Tokenization Problem

From the research:
> "LLMs are next-word predictors, they use training data to understand what the most likely next word is in a sentence. This means that they process in chunks or tokens, rather than letters."

> "This means that they see words as multiple tokens rather than a sequence of letters, and therefore to reverse the word, they make an effort to reverse the tokens, which leads to errors."

## Predicted Wrong Answers LLMs Will Give

Based on the research, expect these error patterns:

1. **Token-reversal errors**: "ITALHOSP" or similar (reversing token chunks)
2. **Partial errors**: "LATPSIOH" or "LATIPOSOH" (missing or duplicated letters)
3. **Phonetic confusion**: Letters in wrong positions due to phonetic processing
4. **Random reordering**: Letters present but in wrong order (not pure reversal)
5. **Confident wrong answer**: The model will present its answer confidently

## Research Documentation

### External Research Conducted

#### 1. Peripheral Creative Study (Dec 2025)
- Source: https://www.peripheralcreative.com/news/ai-overviews-spelling-errors
- Key finding: 52% failure rate on backward spelling
- Longer words and multi-syllable words fail dramatically more often
- 7+ letter words: only 25% correct
- 3+ syllable words: only 10% correct

#### 2. PNAS Paper (2024) - "Embers of Autoregression"
- McCoy et al., cited by 147
- Documented LLM difficulty on "seemingly simple tasks such as counting words or reversing a list"
- Character-level operations are fundamentally hard for token-based models

#### 3. Reddit Community Evidence
- r/ChatGPT post "ChatGPT is unable to reverse words" (6,462 upvotes)
- Example: "lollipop" is broken into tokens (l, oll, ipop) and model reverses tokens instead of characters
- Andrew Ng's course explicitly covered this limitation

#### 4. arXiv: The Reversal Curse
- "LLMs trained on 'A is B' fail to learn 'B is A'"
- Demonstrates fundamental issues with reversed information processing

### Why This Beats Previous Attempts

| Previous Iteration | Why It Failed | Why This is Different |
|-------------------|---------------|----------------------|
| 35: Letter counting in 'possess' | Enumeration solved it | Reversal cannot be enumerated - requires actual manipulation |
| 43: Letter before 'R' in CHERRY | Ambiguity caused disagreement | No ambiguity - one correct answer |
| 44: First 'R' in CHERRY | Disambiguation let models solve | Reversal fundamentally harder than position finding |
| 39: Consecutive pairs in BOOKKEEPER | Pattern matching worked | Reversal requires transformation, not detection |

### Key Insight

**Counting and position-finding are NOW SOLVED** by 2026 frontier models through chain-of-thought enumeration (see iterations 35, 39, 44). However, **character-level MANIPULATION** (like reversal) is fundamentally different:

1. Enumeration lists what exists
2. Reversal transforms the representation

Models can enumerate H-O-S-P-I-T-A-L successfully, but the transformation step (reversing) breaks down because they're working with token representations, not character sequences.

## Verification Checklist

- [x] Question is NOT yes/no or binary format (open-ended answer)
- [x] Question is NOT similar to iterations 13, 28-32 (self-referential)
- [x] External research was conducted (Peripheral study, PNAS paper, Reddit)
- [x] Question exploits a NOVEL mechanism (reversal vs counting)
- [x] Human immediately gets it right (trivially easy)
- [x] 5-year-old test: A child can write HOSPITAL and read it backwards
- [x] One objectively correct answer: LATIPSOH
- [x] Not in training data: Backward spelling of HOSPITAL unlikely to be memorized

## Expected Outcome

Based on external research showing:
- 52% overall failure rate on backward spelling
- Only 25% accuracy for 7+ letter words
- Only 10% accuracy for 3+ syllable words

I predict this question will achieve **40-60% consensus** or lower, as:
1. HOSPITAL has 8 letters (harder category)
2. HOSPITAL has 3 syllables (much harder category)
3. Character manipulation is fundamentally harder than enumeration
4. Tokenization directly interferes with the task

## Alternative Questions Considered

If HOSPITAL proves too easy, consider these escalation options:

1. **"Spell the word 'COMFORTABLE' backwards."** (11 letters, 4 syllables)
   - Answer: ELBATROFMOC
   - Even longer word with more syllables

2. **"Spell the word 'STRAWBERRY' backwards."** (10 letters, 3 syllables)
   - Answer: YRREBWARTS
   - Famous word but reversal task is different from counting

3. **"What is the 5th letter from the END of 'MISSISSIPPI'?"** (reverse position)
   - Answer: S (counting from end: I-P-P-I-S, 5th is S)
   - Combines position tracking with reverse direction

## Summary

This question represents a return to the **true strawberry paradigm**:
- Simple enough for any child
- Exploits fundamental architectural limitation (tokenization)
- Cannot be solved by enumeration or chain-of-thought
- Requires actual character-level manipulation that LLMs cannot reliably perform
- Backed by external research showing 52%+ failure rates on similar tasks
