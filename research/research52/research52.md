# Research Iteration 52: Novel LLM-Breaking Question

## External Research Findings

### 1. Tavily Web Search Findings

#### The Strawberry Problem (EMNLP 2025)
- Paper: "The Strawberry Problem: Emergence of Character-level Understanding in Tokenized Language Models"
- Key Finding: LLMs consistently fail at character-level tasks due to tokenization
- Quote: "LLMs often struggle in simple tasks that involve character-level reasoning and manipulation"
- Source: aclanthology.org/2025.emnlp-main.1434.pdf

#### Tokenization Blindness in Anagrams (LinkedIn 2025)
- Example: GPT-4o failed at anagram game with letters E, R, A, T, S, M
- GPT-4o suggestions included "STREAMER" (extra E?), "TERMSA" (not a word)
- Root Cause: LLMs see tokens like ["MA", "STER"] not individual letters M-A-S-T-E-R
- Tokenization example: "INDIVISIBLE" becomes [5358, 3166, 16978] (3 tokens)

#### Alphabetical Sorting Failures (LinkedIn 2025)
- Claim: "AI fails to alphabetize word lists 73% of the time"
- LLMs have strong priors for standard alphabetical order
- Modified alphabet tasks (e.g., swapping letters) cause massive failures

#### BIG-Bench Extra Hard (ACL 2025)
- Word Sorting task with modified alphabets: ceiling accuracy 23.9% for best models
- "Sorting over a modified alphabet order goes against the strong prior of the model"
- Finding errors in sorting traces is extremely difficult for LLMs

### 2. Reddit Community Findings

#### r/LocalLLaMA - Simple Math Failures (2025)
- Post: "Qwen 3 0.6B beats GPT-5 in simple math" (1,295 upvotes)
- GPT-5 failed at: 5.9 = x + 5.11 (basic algebra)
- Pattern: Small models sometimes outperform large ones on simple tasks

#### r/ChatGPT - Confident Wrong Answers (2025)
- Post: "When ChatGPT confidently explains... the wrong answer" (858 upvotes)
- Users report LLMs being "100% confident" while being "absolutely wrong"
- Key insight: LLMs pattern-match to familiar structures rather than computing

---

## Question Design Rationale

### The Novel Mechanism: Last-Letter Alphabetical Comparison

**Why this hasn't been tried:**
- Previous iterations focused on letter counting (solved by enumeration)
- Previous iterations focused on position tracking (solved by enumeration)
- Previous iterations focused on semantic interference (not strong enough)

**Why this should work:**
1. **Requires character-level access**: Must identify the LAST letter of each word
2. **Requires alphabetical knowledge**: Must compare letters alphabetically
3. **Cannot be enumerated step-by-step**: Unlike counting, there's no "count each letter" approach
4. **Combines TWO tokenization-blind operations**:
   - Finding last letter (sub-token access)
   - Comparing alphabetically (ordering knowledge)

**The Key Insight:**
When comparing words alphabetically by their LAST letter:
- Humans instantly SEE the last letter visually
- Humans know alphabet order intuitively (A < B < C...)
- LLMs must decompose tokens, find last character, compare

**Target Words Selected:**
- CAT (last letter: T)
- DOG (last letter: G)

Human sees: T vs G, and knows G comes before T in the alphabet.
Answer: DOG comes first (G < T alphabetically)

But LLMs may:
- Pattern-match to standard word order (CAT, DOG - alphabetical by first letter)
- Confuse "first alphabetically" with first letter position
- Have difficulty accessing the last character of each token

---

## The Question

**Which word comes first alphabetically if you sort by the LAST letter: CAT or DOG?**

---

## The Answer

**DOG**

Explanation:
- CAT ends in T (20th letter of alphabet)
- DOG ends in G (7th letter of alphabet)
- G comes before T alphabetically
- Therefore, DOG comes first when sorted by last letter

---

## Why Humans Get It Right

1. **Visual Parsing**: Humans see CAT and DOG as complete visual units and can instantly identify the last letter (T and G)
2. **Alphabet Knowledge**: Every child knows G comes before T in the alphabet (ABC...G...T)
3. **Simple Rule Application**: "Sort by last letter" is a trivial rule to apply once you see the letters
4. **No Computation**: This is pure visual recognition + stored knowledge retrieval

A 5-year-old approach:
- "CAT ends in T"
- "DOG ends in G"
- "G comes before T in the alphabet song"
- "So DOG comes first"

---

## Why LLMs Will Fail

### 1. Tokenization Barrier
- "CAT" is likely a single token - the model doesn't "see" C-A-T
- "DOG" is likely a single token - the model doesn't "see" D-O-G
- Extracting the LAST character requires decomposing the token representation

### 2. Strong Prior for Standard Alphabetical Order
- LLMs have been trained extensively on standard alphabetical sorting
- "CAT, DOG" is the standard alphabetical order (C before D)
- The strong prior toward standard sorting may override the "by last letter" instruction

### 3. Conflating "First" Semantics
- "First alphabetically" typically means comparing first letters
- The phrase "comes first alphabetically" may trigger first-letter comparison
- Even with "sort by LAST letter", the word "first" may prime wrong behavior

### 4. No Direct Letter Access
Research shows LLMs cannot directly access individual characters in tokenized text. They must:
- Pattern-match to similar training examples (likely none for last-letter sorting)
- Attempt character-by-character enumeration (which requires knowing the letters)
- Guess based on statistical patterns

---

## Predicted Wrong Answers

### Most Likely Wrong Answer: CAT
**Reasoning**: LLMs will default to standard alphabetical order (C < D) and answer "CAT comes first" despite the "by last letter" instruction.

### Alternative Wrong Answer: "They're equal" or "Cannot determine"
**Reasoning**: Some models may recognize the unusual task and hedge rather than commit.

### Alternative Wrong Answer: CAT (with wrong reasoning)
**Reasoning**: Model might claim "T comes before G" (alphabetically backwards) or make up a justification.

---

## Verification Checklist

- [x] Question is a simple one-liner
- [x] Any 5-year-old can answer correctly in 2 seconds
- [x] Question exploits tokenization blindness (character access)
- [x] Question combines multiple LLM weaknesses (last letter + alphabetical comparison)
- [x] Answer is objectively verifiable (G=7th, T=20th, G<T)
- [x] NOT a yes/no or true/false format
- [x] NOT similar to iterations 13, 28-32 (self-referential)
- [x] NOT solvable by simple enumeration (requires letter identification + comparison)

---

## Summary

| Field | Value |
|-------|-------|
| **Question** | Which word comes first alphabetically if you sort by the LAST letter: CAT or DOG? |
| **Answer** | DOG |
| **Mechanism Exploited** | Tokenization blindness + last-letter access + alphabetical prior override |
| **Human Advantage** | Visual letter recognition + stored alphabet knowledge |
| **Predicted LLM Failure** | Pattern-match to standard alphabetical order (CAT before DOG) |
| **Strawberry Test** | PASS - any child knows G comes before T |
