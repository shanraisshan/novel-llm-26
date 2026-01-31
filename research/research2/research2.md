# Research 2: Generic LLM-Breaking Questions

## Mission

Create a **simple, generic question** that any human could easily answer, but that will break modern LLMs and cause AI researchers to disagree. The question must be like the famous "strawberry problem" - one-liner, no technical jargon, yet exploiting fundamental LLM limitations.

---

## Research Process

### Phase 1: Understanding What Makes "Strawberry" Work

The "How many r's in strawberry?" question succeeded because:

1. **Tokenization blindness**: "strawberry" tokenizes as ['str', 'aw', 'berry'] - the model never sees individual letters
2. **Overconfidence**: The question seems trivially easy, so models don't slow down
3. **Pattern matching failure**: No exact training example for this specific word
4. **Clear wrong answer**: Models consistently said "2" instead of "3"

**Key insight**: The question exploits the gap between what humans SEE (letters) and what LLMs SEE (tokens).

### Phase 2: Exploring Candidate Categories

#### Category A: Semantic Interference + Counting

These questions use number words where the semantic meaning interferes with the actual task.

| Question | Semantic Trap | Correct Answer | LLM Likely Answer |
|----------|---------------|----------------|-------------------|
| "How many e's in 'seventeen'?" | 17 | 4 | 2 or 3 |
| "How many letters in 'one hundred'?" | 100 | 10 | May say 100 |
| "What's the 5th letter of 'EIGHT'?" | 8 | T | May be confused |

**Problem**: Modern models have learned to slow down for letter-counting tasks.

#### Category B: Visual/Spatial Character Questions

These require "seeing" the text, which LLMs cannot do.

| Question | Correct Answer | Why LLMs Fail |
|----------|----------------|---------------|
| "Which letters in COOKBOOK appear twice in a row?" | O (as in 'OO') | Must visually scan |
| "In 'BANANA', how many letters are the same as the first letter?" | 3 (A, A, A) | Pattern matching |
| "What letter appears immediately before the 'T' in 'BUTTER'?" | T | Must see TT pattern |

**Most promising**: These require visual inspection that LLMs cannot perform.

#### Category C: Word Counting with Semantic Traps

| Question | Semantic Trap | Correct Answer |
|----------|---------------|----------------|
| "How many words in 'I have ten words in this sentence'?" | 10 | 8 |
| "Count the words: 'One Two Three Four Five'" | Sum = 15 | 5 |

**Problem**: Models can count words fairly reliably now.

#### Category D: Position and Adjacency Questions

These require understanding spatial relationships in text.

| Question | Correct Answer | Why Hard |
|----------|----------------|----------|
| "What's the middle letter of 'SEVEN'?" | V | 7 interference |
| "In 'TWELVE', which letter is 2 positions after 'W'?" | V | Position reasoning |
| "Which letter in 'TOMORROW' appears three times in a row?" | Trick - none do (only RR) | Visual scanning |

---

## Deep Dive: The Winning Candidate

### The Question

> **"In the word 'ASSESSMENT', how many times does the letter 'S' appear in a row?"**

### Analysis

**The Correct Answer**: **2** (the double-S: "SS")

Wait - let me reconsider. "How many times does S appear in a row" is ambiguous. Let me refine.

---

## Revised Candidate Questions

### Candidate 1: Double Letter Counting

**Question**: "How many double letters are in the word 'MISSISSIPPI'?"

**Correct Answer**: 4 (SS, SS, PP, II... wait, let me count)

M-I-S-S-I-S-S-I-P-P-I
- SS at positions 3-4 (one double)
- SS at positions 6-7 (one double)
- PP at positions 9-10 (one double)

**Correct Answer**: **3** double letter pairs (SS, SS, PP)

**Why humans get it right**: We visually scan and see the pairs.

**Why LLMs fail**:
1. Tokenization: "MISSISSIPPI" may tokenize as ['MISS', 'ISS', 'IPPI'] or similar
2. The repeated S's create confusion about where pairs are
3. Semantic priming: Mississippi = river, state, not letter pattern

**Predicted LLM answer**: 4 or 2 (miscounting the SS pairs)

**Problem**: This is somewhat known territory.

---

### Candidate 2: Self-Referential Word Count

**Question**: "How many words in this sentence have exactly four letters?"

**Sentence**: "This is a test of four-letter word counting ability today."

Hmm, this requires showing the sentence. Not a pure one-liner.

---

### Candidate 3: The "Consecutive Identical Letters" Question

**Question**: "In the word 'BALLOON', which letter appears twice consecutively?"

**Correct Answer**: L (the LL) and O (the OO) - wait, does "which" expect one answer?

Let me verify: B-A-L-L-O-O-N
- LL (yes, consecutive)
- OO (yes, consecutive)

**Problem**: Ambiguous - "which letter" suggests singular.

**Better version**: "In 'BALLOON', how many different letters appear twice in a row?"

**Correct Answer**: 2 (L and O)

---

### Candidate 4: Position-Based With Semantic Interference

**Question**: "What is the middle letter of the word 'TWELVE'?"

**Correct Answer**:
TWELVE has 6 letters: T-W-E-L-V-E
With even length, there's no single middle letter. Positions 3 and 4 are E and L.

**Problem**: Ambiguous for even-length words.

**Better version**: "What is the middle letter of the word 'SEVEN'?"

**Correct Answer**:
SEVEN has 5 letters: S-E-V-E-N
Middle letter (position 3) is **V**

**Why humans get it right**: We see SEVEN, count to the middle, find V.

**Why LLMs fail**:
1. Semantic priming: "seven" activates number 7, not letter pattern
2. May try to find "position 7/2 = 3.5" and get confused
3. Token processing doesn't facilitate positional analysis

**Predicted LLM answer**: E (the most common letter), or confusion about "middle"

---

### Candidate 5: Adjacent Letter Question

**Question**: "In the word 'FIFTY', what letter comes immediately after the 'I'?"

**Correct Answer**: F-I-F-T-Y, so after I is F...

Wait: F(1), I(2), F(3), T(4), Y(5)
After the I (position 2) comes F (position 3).

**Answer**: F

**Why LLMs fail**:
1. "FIFTY" activates number 50
2. Must understand "immediately after"
3. Token boundaries may obscure position

**Problem**: Too simple, models might get this.

---

### Candidate 6: The "Same Letter" Counting Question

**Question**: "How many times does the same letter that starts 'ELEVEN' also appear elsewhere in the word?"

**Parsing**:
- ELEVEN starts with E
- How many other E's are there? E-L-E-V-E-N
- E appears at positions 1, 3, 5
- "Elsewhere" means not the first one, so: 2 additional E's

**Correct Answer**: 2

**Why LLMs fail**:
1. ELEVEN primes for 11
2. Complex reference ("the same letter that starts")
3. Must count excluding the first occurrence

**Predicted LLM answer**: 3 (counting all E's) or 11-related confusion

---

### Candidate 7: The Visual Symmetry Question

**Question**: "Which letters in 'NOON' would look the same if you flipped the word horizontally?"

**Analysis**: NOON flipped is NOON (it's a palindrome)
But "horizontally" - if we mirror each letter:
- N mirrored = backwards N (not same)
- O mirrored = O (same, circle)

**Problem**: Requires visual understanding of letter shapes.

**Better version**: "Is 'NOON' spelled the same forwards and backwards?"

**Answer**: Yes (it's a palindrome)

**Problem**: Too easy, models know palindromes.

---

### Candidate 8: The Double-Meaning Position Question

**Question**: "In the word 'EIGHT', what is at position 4?"

**Correct Answer**:
E-I-G-H-T
Position 4 = H

**Semantic trap**: "EIGHT" suggests 8, and "position 4" might trigger math thinking.

**Predicted LLM answer**: Could correctly get H, or could be confused by 8.

**Problem**: Maybe not tricky enough.

---

### Candidate 9: The Ordinal Interference Question

**Question**: "What is the third letter of the word 'FIRST'?"

**Correct Answer**:
F-I-R-S-T
Third letter = R

**Semantic trap**: "FIRST" suggests position 1, "third" is in direct conflict.

**Predicted LLM answer**: Might say F (first letter) due to semantic interference.

---

### Candidate 10: The Double-Double Question

**Question**: "In 'COFFEE', does any letter appear exactly twice in a row?"

**Analysis**: C-O-F-F-E-E
- FF appears (twice in a row)
- EE appears (twice in a row)

**Answer**: Yes (both F and E appear twice in a row)

**But wait**: "Exactly twice in a row" could mean "appears as a pair" or "appears 2 times consecutively and no more."

In COFFEE: FF is exactly twice, EE is exactly twice.

**Answer**: Yes

---

## THE FINAL CANDIDATE

After deep analysis, I propose:

---

# The Question

> **"What is the last letter of the word 'FIRST'?"**

---

## Analysis

### The Correct Answer

**T**

F-I-R-S-T: The last letter is T.

### Why Humans Get It Right

Any human reads "FIRST", looks at the end, and sees "T". The task is trivially simple - just look at the last character.

### Why LLMs Will Fail

1. **Semantic Priming (Primary)**: The word "FIRST" strongly activates the concept of "1" or "beginning." When asked for "the last letter of FIRST", there's a direct cognitive conflict:
   - "FIRST" = beginning, position 1
   - "Last" = end, final position
   - This creates interference in the model's token representations

2. **Tokenization**: "FIRST" may tokenize as a single token or ['FIR', 'ST'], obscuring the individual letters.

3. **Contradictory Semantics**: The question asks for the "last" thing about something that means "first." This semantic contradiction can cause models to:
   - Output "F" (the first letter, due to semantic leakage)
   - Get confused about what "last" means in this context
   - Process "FIRST" as a position marker rather than a word to analyze

4. **Pattern Matching Confusion**: Training data has many examples where "first" relates to beginnings, not endings. The novel request to find the "last" of something called "FIRST" may not have clear training parallels.

### The Wrong Answer LLMs Will Give

Most likely: **"F"**

The semantic pull of "FIRST" toward the beginning/first position is so strong that models may output the FIRST letter instead of the LAST letter. This is analogous to how "strawberry" made models count wrong due to tokenization - here, semantic meaning overrides the actual task.

Alternative wrong answers:
- "S" (second-to-last, confused about boundaries)
- A confused explanation about "first" vs "last"

---

## Alternative Strong Candidates

### Alternative 1: "What is the second letter of 'SECOND'?"

**Answer**: E (S-E-C-O-N-D)

**Trap**: "SECOND" primes for position 2, but the SECOND letter is E, not related to 2.

### Alternative 2: "What is the first letter of 'LAST'?"

**Answer**: L

**Trap**: Asks for "first" of something meaning "last" - inverse of my main question.

### Alternative 3: "What is the third letter of 'TWENTY'?"

**Answer**: E (T-W-E-N-T-Y)

**Trap**: "TWENTY" = 20, "third" = 3, heavy numeric interference.

---

## Why "Last letter of FIRST" Is Optimal

1. **Maximum Semantic Conflict**: "Last" and "FIRST" are antonyms - direct opposition maximizes interference.

2. **Simple Structure**: One-liner that a child understands.

3. **Clear Correct Answer**: "T" is unambiguous.

4. **Plausible Wrong Answer**: "F" (the first letter) is a believable mistake.

5. **Not Technical**: No Python, no specifications, no domain knowledge.

6. **Novel**: This specific question is not a famous test case (unlike "strawberry").

7. **Testable**: We can clearly verify if models say "T" or something else.

---

## Experimental Predictions

| Model | Predicted Answer | Reasoning |
|-------|------------------|-----------|
| GPT-5.2 | F or T | May self-correct with CoT |
| Claude Opus 4.5 | T (likely) | Strong reasoning, may catch the trap |
| Grok | F | May fall for semantic priming |
| Gemini 3 | Mixed | Depends on reasoning approach |
| DeepSeek | F or confusion | May not catch semantic trap |

**Expected Consensus**: ~40-60% (significant disagreement due to semantic interference)

---

## Backup Questions (Ordered by Strength)

1. **"What is the last letter of 'FIRST'?"** - Primary candidate

2. **"What is the second letter of 'SECOND'?"** - Strong alternative

3. **"What is the middle letter of 'SEVEN'?"** - Numeric + position interference

4. **"In the word 'ELEVEN', how many times does the letter 'E' appear?"** - Count with numeric interference (Answer: 3)

5. **"What letter comes right before the last letter in 'EIGHT'?"** - Position + numeric interference (Answer: H)

---

## Conclusion

The question **"What is the last letter of the word 'FIRST'?"** exploits the fundamental LLM limitation of semantic priming overriding literal task execution. While humans easily see "T" at the end of F-I-R-S-T, LLMs may conflate the meaning of "FIRST" (beginning) with the task of finding the "last" element, potentially outputting "F" instead.

This question requires:
- Zero domain knowledge
- No technical specifications
- Simple one-sentence format
- Clear, unambiguous answer

It succeeds by creating maximum cognitive/semantic conflict between the word's meaning and the requested operation - the same class of failure that made "strawberry" famous, but through semantic channels rather than tokenization.

---

## Appendix: Full Exploration Log

### Rejected Candidates and Reasons

| Question | Why Rejected |
|----------|--------------|
| "How many e's in seventeen?" | Models now slow down for counting |
| "What's the 5th letter of EIGHT?" | Not enough semantic conflict |
| "How many words in 'ten words'?" | Word counting is reliable now |
| "Which letters in BALLOON are doubled?" | Ambiguous phrasing |
| "Is NOON a palindrome?" | Too easy, well-known concept |
| "What position is X in the alphabet?" | Requires memorization, not LLM weakness |

### Key Insight

The most effective LLM-breaking questions create **direct semantic conflict** between:
- What the word MEANS (e.g., "first" = beginning)
- What the task REQUIRES (e.g., find the last letter)

This conflict causes the model's semantic activation patterns to interfere with task execution, similar to how the Stroop effect causes humans to struggle when word meaning conflicts with word color.

---

*Research conducted: January 31, 2026*
*Researcher: Claude Opus 4.5 (Meta-note: I am aware of the irony)*
