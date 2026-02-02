# Research Iteration 101: Novel LLM-Breaking Question

## Research Phase

### External Research Summary

#### Sources Consulted

1. **Tavily Web Search**: "LLM simple questions failure 2025 2026 strawberry problem tokenization"
   - Found: Towards Data Science article confirming tokenization still causes letter-counting issues
   - Found: NAACL 2025 paper "LLM The Genius Paradox" showing LLMs struggle with character-level tasks
   - Found: Medium article explaining how "strawberry" becomes ["straw", "berry"] tokens

2. **Tavily Web Search**: "LLM fails counting words reasoning cliff complexity collapse 2025"
   - Found: LinkedIn post about "LLM Reasoning Depth Collapse" - 2026 arXiv paper showing models "fall off a cliff" at complexity thresholds
   - Found: Apple's "Illusion of Thinking" research showing "complete accuracy collapse" on complex puzzles
   - Found: arxiv.org/html/2509.06332v1 "Probing the Elemental Limits of Numerical Reasoning" - both frontier models failed on high-complexity problems

3. **Tavily Web Search**: "LLM reverse order backwards spelling errors character level 2025"
   - Found: fast.ai article explaining why LLMs can't reverse strings due to tokenization
   - Found: arxiv.org "A Mousetrap" paper showing character manipulation as attack vector

4. **Reddit Search**: r/LocalLLaMA, r/ChatGPT
   - Found: Post showing Qwen 3 0.6B beats GPT-5 on simple math "5.9 = x + 5.11"
   - Found: Multiple posts about GPT-5 failures on simple tasks
   - Found: Discussion about LLMs still failing on "oreo spelled backwards" type questions

5. **Tavily Web Search**: "Frontier LLMs Still Struggle with Simple Reasoning Tasks"
   - Found: arxiv.org/html/2507.07313v1 showing LLMs still fail at:
     - Character and word counting
     - Comparing numbers like 9.11 vs 9.9
     - Simple family relationship inferences
     - Various arithmetic and logic problems

### Key Insights from Research

1. **Chain-of-thought enumeration now defeats most character counting** - Models have learned to spell out letters one by one, defeating the tokenization blindness for single words.

2. **Reasoning cliff phenomenon** - Models maintain high accuracy until a complexity threshold, then collapse entirely (not gradual degradation).

3. **Decimal comparison still problematic** - The "9.11 vs 9.9" style comparisons occasionally fail due to version number pattern matching.

4. **String reversal remains challenging** - Fast.ai confirms tokenization prevents proper character-level reversal.

5. **Multi-step aggregation can cause errors** - Questions requiring counting then counting again (two-stage reasoning) may expose weaknesses.

---

## Analysis of Previous Iterations

### What Has Been Exhaustively Tested (All 100%):
- Character counting in single words (strawberry, blueberry, etc.)
- Self-referential output properties (word count, letter count, syllables)
- Semantic interference with position words (FIRST/LAST)
- Physical reasoning (clocks, containers, evaporation)
- Classic riddles with modifications
- Alphabetization tasks
- Simple math word problems

### Best Results Historically:
- Iteration 13 (20%): Self-referential "exactly one word long?" - scope confusion
- Iteration 43 (40%): Character adjacency with ambiguity ("the R" in CHERRY)
- Iteration 30 (60%): Self-referential syllable count

### The Core Problem:
Modern 2026 frontier models have learned to:
1. Enumerate characters letter-by-letter
2. Narrow scope on self-referential questions
3. Verify their reasoning step-by-step

This defeats most previously successful approaches.

---

## Novel Direction: Unexplored Territory

### Hypothesis: Cross-Word Letter Comparison

Previous iterations tested:
- Counting letters in ONE word
- Finding positions in ONE word
- Comparing properties between words (length, alphabetical order)

**What hasn't been tested**: Asking about a letter that appears in MULTIPLE words and requires tracking across word boundaries.

### Specific Novel Question Design

**Target**: Questions about whether a specific letter appears in BOTH of two words.

**Why This Might Work**:
1. Requires processing two words simultaneously
2. Each word is tokenized separately, potentially hiding the common letter
3. Simple for humans - just visually scan both words
4. Not a standard benchmark format LLMs are trained on

### Question Candidate Analysis

**Candidate 1**: "Do the words 'CAT' and 'DOG' share any letters?"
- Answer: No
- Too simple - models can enumerate both easily

**Candidate 2**: "What letter appears in both 'APPLE' and 'BANANA'?"
- Answer: A
- This requires cross-word comparison
- Human: Immediately sees A is in both
- LLM: Must enumerate both words, track letter sets, find intersection

**Candidate 3**: "Do the words 'RHYTHM' and 'GYM' share the same vowel?"
- Answer: Yes (Y is the vowel in both - trick: Y as vowel)
- This adds complexity about what counts as a vowel
- May be too tricky/ambiguous

**Candidate 4**: "What letter appears exactly once in 'HELLO' but twice in 'BALLOON'?"
- Answer: L (appears once in HELLO at positions 3-4... wait, that's twice)
- This is getting too complex

**Candidate 5**: "Which letter appears in 'CAT', 'DOG', and 'PIG'?"
- Answer: None (no common letter)
- This tests set intersection across three words
- Human: Quick visual scan reveals no overlap
- LLM: Must enumerate all three, track letter sets

Wait - let me reconsider. The question should be TRIVIALLY easy for humans.

### Refined Approach: Letter Presence Across Words

**Final Candidate**: "Is the letter 'A' in both 'BANANA' and 'APPLE'?"

Analysis:
- Answer: Yes
- Human test: Instant visual scan - both words obviously contain 'A'
- A 5-year-old: "BANANA has A, APPLE has A, yes!"
- LLM challenge:
  - 'BANANA' tokenizes to something like ['BAN', 'ANA'] or ['BANA', 'NA']
  - 'APPLE' tokenizes to something like ['APP', 'LE'] or ['APPLE']
  - Model must decompose tokens to check for 'A' in each

However, this might be too easy because models can simply enumerate letters.

### Alternative Direction: Counting Shared Letters

**New Candidate**: "How many letters are shared between 'MOON' and 'NOON'?"

Analysis:
- MOON: M, O, O, N
- NOON: N, O, O, N
- Shared letters (as a set): O, N = 2 letters
- Answer: 2 (O and N appear in both)
- Human: Easy - "O is in both, N is in both, that's 2"
- LLM: Must compute set intersection, may confuse with counting total occurrences

But this might have ambiguity - does "shared" mean unique letters or total instances?

### Clearer Version: Specific Letter Counting Across Words

**Refined Candidate**: "How many times does the letter 'O' appear in total in the phrase 'GOOD FOOD'?"

Analysis:
- GOOD: G-O-O-D (2 O's)
- FOOD: F-O-O-D (2 O's)
- Total: 4 O's
- Answer: 4
- Human: Easy - count the O's: "G-O-O-D F-O-O-D" = 1,2,3,4
- LLM: Must count across both words, handle the space, aggregate

This is essentially a multi-word character counting task. Let me check if this was tested before...

Reviewing previous iterations:
- Iteration 82 tested "one, two, three, four, five" letter counting = 19 letters total - but this was LETTER counting, not specific character counting
- No iteration tested counting a SPECIFIC letter across multiple words

### The Key Insight: Multi-Word Specific Letter Counting

Looking back at iteration 59, counting 'a' in 'abracadabra' got 100% (5 a's correctly identified). But that was ONE word.

What if we use a phrase with the SAME repeated pattern across multiple words?

**Novel Question**: "How many times does the letter 'E' appear in 'ELEVEN ELEPHANTS'?"

Analysis:
- ELEVEN: E-L-E-V-E-N = 3 E's
- ELEPHANTS: E-L-E-P-H-A-N-T-S = 2 E's
- Total: 5 E's
- Answer: 5

Why this might cause disagreement:
1. "ELEVEN" has strong semantic priming (the number 11)
2. "ELEPHANTS" is a long word
3. Must count across the space between words
4. The double 'E' patterns (ELE- in both) may confuse tokenization

Human test: Easy - just scan and count: "E-L-E-V-E-N E-L-E-P-H-A-N-T-S" = 1,2,3...4,5 = 5 E's

5-year-old test: YES - "Can you find all the letter E's? Point to each one!" A child can do this.

### Validation Against Criteria

1. **Trivially easy for humans**: YES - visual scanning for a letter
2. **One unambiguous answer**: YES - exactly 5 E's
3. **Exploits LLM limitation**: POSSIBLY - tokenization across words + semantic priming from "ELEVEN"
4. **Not tested before**: YES - no multi-word specific letter counting in previous iterations
5. **Not technical**: YES - basic letter recognition
6. **Not a paradox**: YES - straightforward counting task

---

## Final Question Selection

After extensive analysis, I propose:

**Question**: "How many times does the letter 'E' appear in 'ELEVEN ELEPHANTS'?"

**Expected Answer**: 5

**Why Humans Get It Right**:
Visual scanning - humans see each letter individually and can point to and count each 'E'. A child who knows the alphabet can find all the E's by looking at each letter.

**Why LLMs Might Fail**:
1. **Semantic priming**: "ELEVEN" strongly activates the concept of 11, which may interfere with counting 3 E's
2. **Multi-word processing**: Must count across word boundaries
3. **Tokenization**: Each word tokenizes separately, potentially hiding character-level information
4. **Pattern confusion**: Both words have "ELE" pattern which may cause double-counting or under-counting
5. **Length**: 15 characters total is moderately long, increasing enumeration error probability

**Predicted LLM Errors**:
- May say 6 (double-counting one E)
- May say 4 (missing one E)
- May say 11 (semantic priming from ELEVEN)
- May say 3 (only counting ELEVEN's E's)

---

## Alternative Questions Considered

1. "How many O's in 'GOOD FOOD'?" - Answer: 4 - Simpler but less semantic interference
2. "How many A's in 'BANANA BANDANA'?" - Answer: 6 - More repetition
3. "How many I's in 'MISSISSIPPI RIVER'?" - Answer: 5 - Tested territory (MISSISSIPPI alone)

The "ELEVEN ELEPHANTS" question combines:
- Novel multi-word format
- Strong semantic interference (ELEVEN = 11)
- Moderate complexity (15 characters)
- Clear, unambiguous answer

---

```yaml
FINAL_QUESTION: "How many times does the letter 'E' appear in 'ELEVEN ELEPHANTS'?"
CORRECT_ANSWER: "5"
WHY_HUMANS_GET_IT: "Humans visually scan the phrase and count each E: E-L-E-V-E-N (3) + E-L-E-P-H-A-N-T-S (2) = 5. A child can point to each E and count."
WHY_LLMS_WILL_FAIL: "Three potential failure modes: (1) Semantic priming - 'ELEVEN' activates the number 11, which may override careful counting, (2) Multi-word tokenization - the phrase splits into separate tokens across two words, hiding character-level patterns, (3) Pattern confusion - both words contain 'ELE' which may cause counting errors. Models must resist semantic interference while performing cross-word character enumeration."
```
