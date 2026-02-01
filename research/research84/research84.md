# Research Iteration 84

## Research Process

### Search Queries Executed

1. **Tavily Search**: "LLM failures simple questions humans answer correctly 2025 2026 research"
   - Found: ChatGPT 5.2 still fails strawberry counting, Apple's "Illusion of Thinking" paper on reasoning failures

2. **Tavily Search**: "novel adversarial prompts language models fail easy tasks 2025"
   - Found: Task-in-Prompt attacks, poetry-based jailbreaks, BlackboxNLP research on adversarial examples

3. **Reddit Search**: LLM fails simple question
   - Found: Discussions about reasoning vs next-token prediction, poetry jailbreaks

4. **Tavily Search**: "chain of thought fails LLM cannot solve simple puzzle 2025"
   - Found: arxiv paper "Frontier LLMs Still Struggle with Simple Reasoning Tasks" (2507.07313v1) - key finding that simple tasks like character counting, number comparison still cause issues

5. **Tavily Search**: Visual spatial reasoning LLM blind
   - Found: Research on spatial blindness in VLMs, ASCII art failures, text-priority bias

6. **Tavily Search**: Words with three same letter tokenization fails
   - Found: Strawberry problem analysis, tokenization blindness documentation

### Key Research Findings

#### Finding 1: Frontier Models Now Use Chain-of-Thought Enumeration
From the CanSecWest strawberry analysis and 2025 research:
- GPT-4 Turbo and o1 models now correctly count letters by "thinking in steps"
- They explicitly write out letters: S-T-R-A-W-B-E-R-R-Y and count
- This enumeration strategy bypasses tokenization blindness for common words

#### Finding 2: Character-Level Tasks Still Challenging for Novel Words
From the NAACL 2025 paper "A Linguistic and Math Expert's Struggle with Simple Word-Based Counting":
- Subword tokenization causes deficiency in word-based counting
- Performance varies based on word frequency in training data

#### Finding 3: The "Unpuzzles" Paradigm
From arxiv 2507.07313v1 "Frontier LLMs Still Struggle with Simple Reasoning Tasks":
- LLMs show good performance on original (difficult) puzzles due to memorization
- But they fail on "unpuzzles" - simplified versions that humans find trivial
- This suggests pattern-matching rather than true understanding

#### Finding 4: Enumeration Cannot Help When Question Structure Is Ambiguous
From iterations 1-83 findings:
- Almost ALL enumerable tasks are now solved (character counting, syllables, positions)
- The only partial successes were:
  - Iteration 13: Self-referential output (20%) - but now trained away
  - Iteration 43: Double-letter position ambiguity (40%) - due to interpretation not enumeration
  - Iteration 55: Conflicting constraints (40%) - but not strawberry-type

### Critical Insight: What Hasn't Been Tried

After 83 iterations, the patterns are clear:
1. **Enumerable tasks**: SOLVED by chain-of-thought
2. **Semantic priming**: SOLVED - models verify against semantic interference
3. **Self-reference**: TRAINED AWAY - models now correctly scope "your answer"
4. **Famous puzzles**: MEMORIZED - even modified versions often caught

**The gap**: Questions requiring **SIMULTANEOUS multi-step inference** where:
- Each step is trivial for humans
- But LLMs must track multiple constraints at once
- Enumeration of one aspect doesn't help with another aspect

## Analysis

### The Novel Direction: Compound Counting Across Word Boundaries

Consider: When counting letters across multiple words, humans process them visually as a continuous stream while maintaining word boundaries. LLMs tokenize each word separately and must integrate counts across token boundaries.

**Key insight from research**: The arxiv paper notes that LLMs struggle when "core character-level information" must be extracted across tokenized boundaries. The NAACL paper shows word-based counting is "caused by subword tokenization of LLMs."

### A Novel Approach: Cross-Word Repeated Letter Patterns

When a letter appears at the END of one word and the BEGINNING of the next, humans instantly see the "double letter" visually. For LLMs, these are in separate tokens.

Example: "MISS SALLY" - a human instantly sees the double S at the word boundary (MISS ends with S, SALLY starts with S). The question "How many S's in a row?" could be ambiguous - is it 3 (SS at end of MISS + S at start of SALLY) or 2 (just the SS in MISS)?

**Wait** - this introduces ambiguity which we want to avoid.

### Better Approach: Total Letter Count Across Multi-Word Phrase

Let me think about what humans do INSTANTLY that LLMs might struggle with even with CoT:

1. **Instant visual pattern recognition** - seeing "BOOKKEEPER" has three consecutive double letters (OO, KK, EE)
2. **Cross-word letter counting** - how many times does 'O' appear in "TOO GOOD TO GO"

The second is more promising because:
- Humans scan visually: TOO (2 O's) + GOOD (2 O's) + TO (1 O) + GO (1 O) = 6 O's
- LLMs tokenize: Each word separately, must aggregate across 4 separate counting operations
- Potential for off-by-one errors in aggregation

But wait - iteration 82 showed LLMs can count letters across "one, two, three, four, five" (19 letters total) correctly. So simple aggregation is solved.

### The Key: Semantic Interference + Counting

From iteration research, semantic priming alone doesn't work. But what about:

**A phrase where the semantic content DESCRIBES a count that conflicts with the actual count**

Example: "I HAVE TEN FINGERS"
- Semantic content suggests 10
- But if asked "How many letters in 'I HAVE TEN FINGERS'?" - it's 16 (I=1, HAVE=4, TEN=3, FINGERS=7, no spaces) or 19 with spaces
- Wait, this was tried in iteration 64 ("There are six words in this sentence") - LLMs got it right

### Novel Direction: Comparative Questions Without Direct Enumeration

What if the question requires COMPARISON but the items cannot be enumerated the same way?

**"Which has more syllables: the number of letters in 'FOUR' or the number of letters in 'THREE'?"**

Breaking it down:
- FOUR has 4 letters
- THREE has 5 letters
- 4 syllables: "one, two, three, four" vs 5 syllables: "one, two, three, four, five"
- Wait, that's not how syllables work for numbers

Let me reconsider...

**"Which number is larger: the number of letters in 'FIVE' or the number of letters in 'FOUR'?"**
- FIVE has 4 letters
- FOUR has 4 letters
- Answer: They're equal (both 4)

But wait - the semantic meanings (5 vs 4) create interference. The word FIVE represents a larger number but has the same letter count as FOUR.

Hmm, but this is still enumerable. Models will just count: F-I-V-E (4), F-O-U-R (4).

### The Real Challenge: Non-Enumerable Properties

The key finding from 83 iterations: **Anything that can be enumerated will be enumerated correctly by 2026 frontier models.**

What CANNOT be enumerated?
1. Visual patterns (but LLMs have memorized letter shapes as facts)
2. Sound/phonetics (but LLMs have memorized pronunciations)
3. Real-world physical properties (but LLMs have memorized physics)

**Genuine gap**: Questions where the answer depends on POSITION within a sequence of OPERATIONS, not just enumerating static content.

### Final Novel Question Design

After all this research, let me design a question that exploits a genuine limitation:

**The "Middle of Nothing" Problem**

Consider: "What letter is in the exact middle of the word 'EVEN'?"
- EVEN has 4 letters: E-V-E-N
- There IS no middle letter in an even-length word - the middle falls between V and E
- Correct answer: "None" or "There is no middle letter"

But this is a trick question - humans might also struggle.

**Better approach**: Use a word where semantic priming conflicts with letter position

**The Question: "In the word 'MIDDLE', what letter is in the middle position?"**

- MIDDLE has 6 letters: M-I-D-D-L-E
- With 6 letters, positions 3 and 4 are "middle-adjacent" (D and D)
- The word "MIDDLE" semantically suggests "center" but the question asks for THE middle position
- For even-length words, there is no single middle letter
- BUT the double-D at positions 3-4 are BOTH at the center!

Expected human response: "D" (instantly sees the DD at the center)
Expected LLM response: May say "D" but might also try to enumerate and realize there's no single middle in a 6-letter word, leading to "none" or confusion.

Actually, "D" is correct because BOTH middle positions contain D.

Let me simplify further:

**"What is the middle letter of the word 'CENTER'?"**

CENTER has 6 letters: C-E-N-T-E-R
- Positions: 1=C, 2=E, 3=N, 4=T, 5=E, 6=R
- Middle positions: 3 and 4 (N and T)
- There is NO single middle letter

Human response: A human looking at CENTER might say "N" or "T" or realize there's no single middle
Actually this is ambiguous - humans would also struggle.

### FINAL QUESTION DESIGN

Let me return to fundamentals. The goal is:
1. Child can answer instantly
2. LLMs disagree or fail
3. Answer is unambiguous

**The Question: "How many times does the sequence 'LL' appear in the word 'LLAMA'?"**

Analysis:
- LLAMA = L-L-A-M-A
- The sequence "LL" (two L's in a row) appears exactly ONCE (at the beginning)
- This is trivial for humans - they see "LL" at the start
- For LLMs, tokenization may split LLAMA differently, and counting OVERLAPPING patterns is known to be challenging

Wait - LLAMA probably tokenizes as a single token since it's a famous AI model name.

**Better word: "SKILLFULLY"**

SKILLFULLY = S-K-I-L-L-F-U-L-L-Y
- Contains "LL" twice: at positions 4-5 and 8-9
- Human instantly sees: skiLLfuLLy - two instances of LL

Let me verify: S(1)-K(2)-I(3)-L(4)-L(5)-F(6)-U(7)-L(8)-L(9)-Y(10)
- LL at positions 4-5: Yes
- LL at positions 8-9: Yes
- Answer: 2

## The Question

**Question**: "How many times does the letter pair 'LL' appear in the word 'SKILLFULLY'?"

**Correct Answer**: 2

## Why This Should Work

### Why Humans Get It Right
1. **Instant visual pattern recognition**: Humans look at "SKILLFULLY" and immediately see the two "LL" patterns - skiLLfuLLy
2. **No enumeration needed**: The double-L pattern visually "pops out" from the word
3. **A 5-year-old can do this**: Show a child the word and ask "where do you see two L's together?" - they point to both instances

### Why LLMs Might Fail

1. **Tokenization splits the word**: SKILLFULLY may tokenize as "SKILL" + "FULLY" or "SKILL" + "FUL" + "LY" or other splits
   - If split as SKILL|FULLY: The first LL is in SKILL, second LL spans FU-LLY
   - The model must track patterns ACROSS token boundaries

2. **Pattern matching vs counting**:
   - LLMs are trained to recognize patterns, but counting instances of a pattern requires different processing
   - The question asks "how many times" which requires enumeration, but the thing being counted (a pattern) isn't a simple character

3. **Double-letter aggregation**:
   - Unlike counting single letters (which CoT solves), counting PAIRS requires tracking adjacent positions
   - The model must simultaneously check: is position N an L? AND is position N+1 an L?

4. **Potential failure modes**:
   - **Undercounting**: Seeing SKILL + FULLY as two words, only counting LL in one
   - **Overcounting**: Counting each L in an LL pair separately (getting 4 instead of 2)
   - **Position confusion**: Miscounting where the L's actually are due to tokenization

### Verification of Human-Easiness

**The 5-year-old test**:
- Show child: S-K-I-L-L-F-U-L-L-Y
- Ask: "How many times do you see two L's next to each other?"
- Child response: Points to positions 4-5 and positions 8-9, says "two times"

**Unambiguous answer**:
- SKILLFULLY has exactly 10 letters: S(1) K(2) I(3) L(4) L(5) F(6) U(7) L(8) L(9) Y(10)
- LL appears at positions 4-5: YES
- LL appears at positions 8-9: YES
- No overlap between instances
- Answer is definitively 2

### Research Support for This Failure Mode

From the NAACL 2025 paper: "Deficiency in word-based counting is caused by subword tokenization of LLMs"

From CanSecWest strawberry analysis: Chain-of-thought helps for SINGLE character counting but doesn't address pattern counting across tokens.

From iteration findings: While LLMs now correctly count individual characters via enumeration (iterations 35, 39, 59), counting PATTERNS (adjacent pairs) has not been extensively tested.

## Alternative Questions (Backup)

If SKILLFULLY proves too easy due to common word familiarity:

1. **"How many times does 'EE' appear in 'BEEKEEPER'?"**
   - BEEKEEPER = B-E-E-K-E-E-P-E-R
   - EE appears at positions 2-3 and positions 5-6
   - Answer: 2
   - Note: BEEKEEPER may be memorized due to iteration 39 testing BOOKKEEPER

2. **"How many times does 'SS' appear in 'MISSISSIPPI'?"**
   - MISSISSIPPI = M-I-S-S-I-S-S-I-P-P-I
   - SS at positions 3-4 and positions 6-7
   - Answer: 2

3. **"How many times does 'OO' appear in 'VOODOO'?"**
   - VOODOO = V-O-O-D-O-O
   - OO at positions 2-3 and positions 5-6
   - Answer: 2

## Expected LLM Failure Predictions

**Prediction for SKILLFULLY question**:
- Some models may say "1" (only seeing the first LL)
- Some models may say "3" or "4" (overcounting individual L's)
- Some models may correctly say "2" via explicit enumeration

**Success criterion**: If 5 independent AI researchers give different answers (< 10% consensus), the question succeeds.

## Summary

This question targets the intersection of:
1. **Tokenization blindness**: Word likely splits across LL boundaries
2. **Pattern counting vs character counting**: Counting pairs is harder than counting individuals
3. **Instant human perception**: Humans see patterns visually without enumeration

The question passes the strawberry paradigm requirements:
- Simple one-liner that a child can answer
- Objectively correct unambiguous answer (2)
- Exploits genuine architectural limitation (pattern detection across token boundaries)