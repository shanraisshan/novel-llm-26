# Research Iteration 37: Visual Letter Symmetry

## Date: 2026-02-01

## Research Context

After 36 iterations, we have discovered that:
- Character counting with chain-of-thought is now reliable (iteration 35: 100%)
- Numeric comparison is now reliable (iteration 36: 100%)
- Self-referential output questions remain our best success (iteration 13: 20% consensus)
- Explicit modifications to puzzles are caught by 2026 models

## External Research Summary

### Key Finding 1: MLLMs Are "Shape-Blind"
Source: arXiv:2502.15969 - "Forgotten Polygons: Multimodal Large Language Models are Shape-Blind"

> "While LLM backbones possess strong geometric knowledge, vision encoders remain the primary bottleneck, forcing MLLMs to rely on System 1 thinking instead of System 2 reasoning."

> "Even with strong LLM backbones, this limitation persists, reflecting broader challenges in vision-language mathematical benchmarks."

### Key Finding 2: Lower-Grade Problems Harder for VLMs
Source: MathArena Kangaroo 2025 evaluation

> "State-of-the-art VLMs perform significantly worse on problems from lower grades (ages up to 12) than on ones from higher grades (ages 13+)... lower-grade problems rely more on basic visual and spatial skills such as shape recognition and 2D/3D visualization."

This is a manifestation of **Moravec's Paradox**: high-level reasoning is easier for AI than basic perceptual skills.

### Key Finding 3: Text-Only LLMs Cannot "See" Letter Shapes
Text-only LLMs process tokens, not visual representations. They have learned FACTS about letters (like "O is round") but cannot actually perceive visual properties that haven't been explicitly encoded in training data.

### Key Finding 4: Semantic Priming in LLMs
Source: CLiC-it 2025 - "Semantic Priming in GPT"

LLMs exhibit semantic priming similar to humans - preceding context activates related concepts. However, unlike humans, LLMs cannot override this priming with visual verification.

## Hypothesis

**Visual symmetry questions** should cause LLM disagreement because:
1. LLMs cannot "see" letters - they only know facts about letters
2. Visual symmetry (especially horizontal vs vertical) may not be well-encoded in training
3. The question requires perceptual judgment, not reasoning

## Question Design

### Direction: Letter Symmetry

Humans can instantly "see" which letters look the same when flipped. LLMs must rely on memorized facts, which may be incomplete or inconsistent.

### Candidate Question Analysis

**"Which letters in OHIO are symmetric?"**

Problem: Too easy - all letters in OHIO (O, H, I, O) have vertical symmetry. LLMs likely know this.

**"Which uppercase letter in the word 'TOMATO' looks the same upside-down?"**

Analysis:
- T: Has vertical symmetry but NOT 180-degree rotational symmetry (upside-down T looks different)
- O: Has rotational symmetry (O upside-down is still O) - CORRECT
- M: Upside-down M looks like W - NOT symmetric
- A: Upside-down A looks like a strange character - NOT symmetric
- T: Same as first T
- O: Same as first O - CORRECT

Answer: O (the letter O looks the same upside-down)

But this might be too easy - O is an obvious symmetric letter.

**Better: "Which uppercase letter in TOMATO would look the same if you held it up to a mirror?"**

This asks about horizontal (mirror) symmetry:
- T: Yes - T in a mirror looks like T (vertical axis of symmetry)
- O: Yes - O in a mirror looks like O
- M: Yes - M in a mirror looks like M (it has vertical symmetry)
- A: Yes - A in a mirror looks like A (it has vertical symmetry)

Hmm, they ALL have vertical symmetry. This won't work.

**New Direction: Which letter DOESN'T have symmetry?**

**"Which uppercase letter in the word 'STAR' has NO line of symmetry?"**

- S: No vertical or horizontal symmetry - CORRECT
- T: Has vertical symmetry (line down the middle)
- A: Has vertical symmetry
- R: No vertical or horizontal symmetry - CORRECT

Wait, both S and R lack symmetry. Need a word with exactly one asymmetric letter.

**"Which uppercase letter in 'MATH' has no line of symmetry?"**

- M: Has vertical symmetry
- A: Has vertical symmetry
- T: Has vertical symmetry
- H: Has vertical symmetry

None! MATH is all symmetric.

**"Which uppercase letter in 'FLAG' has no line of symmetry?"**

- F: No symmetry - CORRECT
- L: No symmetry - CORRECT
- A: Has vertical symmetry
- G: No symmetry - CORRECT

Multiple answers.

**"Which is the only uppercase letter in 'SHAPE' that has a vertical line of symmetry?"**

- S: No symmetry
- H: Has vertical symmetry - CORRECT
- A: Has vertical symmetry - ALSO CORRECT
- P: No symmetry
- E: Has horizontal symmetry (maybe, depending on font)

Hmm, multiple answers again.

### Better Approach: Specific Visual Property

**"In the word 'NOON', which letter appears twice in a row?"**

- N-O-O-N
- O appears twice in a row (positions 2-3)
- Answer: O

This is visual pattern recognition that requires "seeing" the word structure.

Wait - this is character counting which we know works.

### Final Direction: Ambiguous Visual Questions

What if we ask about something where visual perception matters but LLMs have incomplete training data?

**"Looking at the uppercase letters R, B, and P - which one has the most enclosed spaces (holes)?"**

- R: 1 hole (the loop at top)
- B: 2 holes (top and bottom loops)
- P: 1 hole (the loop)

Answer: B (with 2 holes)

A 5-year-old can see this instantly. But do LLMs know this?

Let me think about what makes this hard:
- LLMs may have learned "enclosed spaces" as a concept
- But they may not have precise counts for each letter

### Alternative: Physical/Perceptual Intuition

**"If you write the word 'OOO' by hand, how many times does your pen lift off the paper?"**

For writing three O's:
- Write first O (no lift during, lift after) = 1 lift
- Write second O (no lift during, lift after) = 1 lift
- Write third O (no lift during) = 0 lifts at end

Total: 2 lifts (between letters)

But wait - this depends on handwriting style. Some people connect letters.

### BEST CANDIDATE: Double Letter Pattern

**"In the word 'BALLOON', how many different letters appear twice in a row?"**

B-A-L-L-O-O-N

Looking at consecutive pairs:
- B-A: different
- A-L: different
- L-L: SAME (L appears twice in a row)
- L-O: different
- O-O: SAME (O appears twice in a row)
- O-N: different

Answer: 2 (L and O each appear twice in a row)

This requires visual pattern scanning. A child looks at BALLOON and immediately sees the LL and OO.

But wait - we tested similar in iteration findings, and models can enumerate.

## New Insight: Semantic Priming Attack

What if the word meaning creates strong interference?

**"What is the first letter of the word 'SECOND'?"**

- Semantic priming: SECOND = 2nd position
- But the actual first letter is: S

This was already explored and failed (100% correct).

### STRONGEST CANDIDATE: Visual Hole Counting

**"How many holes does the letter B have?"**

- Humans SEE: 2 holes (top loop and bottom loop)
- LLMs must KNOW this fact
- This tests whether LLMs have encoded this visual property

A 5-year-old can look at B and count: "one, two" holes.

But LLMs might have this in training data...

### FINAL QUESTION SELECTION

After extensive analysis, I'm selecting a question that:
1. Requires visual perception (not reasoning)
2. Has an unambiguous answer
3. Any child can answer instantly
4. May not be well-represented in LLM training data

**THE QUESTION:**

**"How many closed loops (holes) are in the uppercase letter Q?"**

Analysis:
- Humans SEE: Q has exactly 1 closed loop (the circular part)
- The tail of Q is NOT a closed loop - it's open
- A child looks at Q and sees ONE circle with a tail

Answer: **1**

Why this might trip up LLMs:
- Q is unusual - it's often described as "O with a tail"
- LLMs might confuse the tail as adding complexity
- The specific question about "closed loops" requires visual verification
- Training data may be inconsistent about Q's properties

### ALTERNATIVE STRONG CANDIDATE:

**"If you rotate the uppercase letter N by 180 degrees, what letter do you get?"**

Analysis:
- N rotated 180 degrees is... N
- N has rotational symmetry (unlike Z which becomes N when rotated)
- Wait - is this true? Let me verify:
  - N = two vertical lines connected by diagonal from top-left to bottom-right
  - Rotated 180: diagonal goes from bottom-left to top-right
  - That's still N! (N has 180-degree rotational symmetry)

Answer: **N**

Hmm, but some people might think it becomes Z. Let me reconsider...

Actually, looking carefully:
- Regular N: / goes from top-left to bottom-right
- Rotated 180: the diagonal goes from bottom-left to top-right
- That's still an N! The letter N has point symmetry.

But wait - this might confuse humans too. Not a good strawberry question.

### FINAL SELECTION

I'll go with the closed loops question but make it clearer:

**"How many enclosed spaces (holes) are in the uppercase letter B?"**

This is:
- Instantly answerable by a child: "1, 2... TWO!"
- Unambiguous: B clearly has exactly 2 holes
- Visual: requires seeing the letter shape
- Potentially hard for LLMs: they must have encoded this specific fact

Answer: **2**

## Reconsidering the Question

The "holes in B" question might be too well-known - it's a classic typography/topology question that likely appears in training data.

Let me think about what TRULY requires visual perception...

### New Direction: Relative Visual Position

What about questions where the answer depends on visually comparing positions within text?

**"In the word 'apple', which letter has a part that goes below the line?"**

Analysis:
- a: sits on baseline
- p: has DESCENDER (the tail goes below the baseline) - CORRECT
- p: same as above - CORRECT
- l: sits on baseline (and ascends up)
- e: sits on baseline

Answer: **p** (lowercase p has a descender)

A child can see this - the p's "tail" goes below where other letters sit.

But wait - this is font-dependent! In some fonts, lowercase 'a' could have a descender. Too ambiguous.

### Better: Cross Letter Counting

**"In the word 'TOOTH', how many times does a letter touch itself?"**

This is confusing. Let me try again.

### FINAL APPROACH: Double Letter Visual Pattern

Let me try the simplest possible visual question:

**"In the word 'COFFEE', which letter appears three times?"**

C-O-F-F-E-E

- C: 1 time
- O: 1 time
- F: 2 times
- E: 2 times

Wait - no letter appears 3 times! The question is a trick.

Answer: **None** / No letter appears three times

Hmm, this is just counting which models can do...

### THE INSIGHT

What we need is a question where:
1. The visual/perceptual answer is OBVIOUS to humans
2. The question CANNOT be reduced to enumeration
3. There's potential for semantic interference

**EUREKA: Word meaning vs. letter counting interference!**

**"How many letters are in your first name?"**

Wait, LLMs don't have names...

Let me try:

**"Spell the word 'CAT' backwards. How many letters are in your answer?"**

Backwards: TAC
Letters: 3

But this is trivially solvable.

### FINAL FINAL APPROACH: Semantic Number Interference

The strongest attack vector from our research has been where word meaning creates interference.

**"Count the letters: ONE HUNDRED"**

Semantic interference: The phrase "ONE HUNDRED" means 100
Actual letter count: ONE(3) + HUNDRED(7) = 10 letters

Answer: **10** (or 11 with the space)

But wait - should we count the space? Let's be precise:

**"How many letters (not spaces) are in 'ONE HUNDRED'?"**

Answer: **10**

### Analysis

This exploits:
1. **Semantic priming**: "ONE HUNDRED" strongly primes the number 100
2. **Simple counting**: Any child can count to 10
3. **The interference is STRONG**: 100 is a round, memorable number

Predicted LLM failure modes:
- Answer "100" due to semantic activation
- Get confused between 10 (letters) and 100 (meaning)
- Try to be clever and say "10 or 100 depending on interpretation"

## Final Question

**"How many letters (not spaces) are in 'ONE HUNDRED'?"**

**Answer: 10**

## Why This Should Work

### Human Perspective
A child counts: O-N-E (1, 2, 3) H-U-N-D-R-E-D (4, 5, 6, 7, 8, 9, 10). Done. 10 letters.

### LLM Perspective
The phrase "ONE HUNDRED" creates MASSIVE semantic activation of the number 100. The LLM must:
1. Recognize this is a letter-counting task
2. Override the strong semantic prime (100)
3. Actually enumerate letters
4. Report the correct count (10)

### Key Advantage Over Previous Attempts
Unlike iterations 1-5 where we tried similar semantic interference:
- "ELEVEN" (iteration 4) - 6 letters vs semantic 11 - ALL SOLVED
- "FIVE LETTERS" (iteration 5) - 11 letters vs semantic 5 - ALL SOLVED

Those failed because:
1. The word/phrase didn't DESCRIBE a quantity (ELEVEN is just a number)
2. Models learned to enumerate carefully

**"ONE HUNDRED" is different because:**
1. The phrase is LONGER (10 letters) - more to count
2. The semantic prime is STRONGER (100 is 10x larger discrepancy than ELEVEN's 11 vs 6)
3. The interference ratio is 10:1 (100/10) - very confusing

## Verification

- A 5-year-old can answer this: YES (count to 10)
- One unambiguous correct answer: YES (10)
- Requires defeating semantic prime: YES
- Strong semantic interference: YES (100 vs 10)

## Risk Assessment

This MIGHT still be solved if:
- Models have been trained on this exact pattern
- Chain-of-thought defeats the interference (like previous attempts)

But the 10:1 ratio (100 vs 10) is our strongest semantic attack yet.

## WAIT - RECONSIDERATION

Iteration 5 tested "FIVE LETTERS" (11 letters vs semantic 5) and got 100% correct!

The models just enumerate: F-I-V-E-L-E-T-T-E-R-S = 11. Done.

**The enumeration strategy defeats semantic priming.**

I need something that CANNOT be enumerated.

### New Direction: Questions Requiring TRUE Visual Perception

What about questions where you need to actually SEE the text structure?

**"If you write 'WOW' in a mirror, what word do you see?"**

Analysis:
- W in mirror = W (W has vertical symmetry)
- O in mirror = O (O has vertical symmetry)
- W in mirror = W

So WOW in a mirror is... WOW! (same word)

But wait - the ORDER also reverses!
- WOW reversed = WOW (it's a palindrome)
- Each letter mirrored = WOW

So WOW in a mirror is still WOW.

Answer: **WOW**

This requires understanding:
1. Mirror reversal of letter order
2. Mirror symmetry of individual letters

A child can visualize this. But can an LLM?

### ALTERNATIVE: Upside-down words

**"If you turn the word 'MOM' upside down, what word do you see?"**

Analysis:
- M upside down = W
- O upside down = O
- M upside down = W

So MOM upside down = WOW

Answer: **WOW**

This is BEAUTIFUL because:
1. A child can visualize flipping the word
2. It requires knowing M->W transformation
3. It requires knowing O stays O
4. The answer is a real word

### Potential Issues

Do LLMs know that:
- M upside down = W?
- O upside down = O?

This is visual/topological knowledge that MAY not be well-encoded.

### FINAL QUESTION SELECTION

**"If you turn the word 'MOM' upside down, what do you see?"**

**Answer: WOW**

## Why This Should Work

### Human Perspective
A child can imagine (or actually try) flipping "MOM":
- The M's become W's
- The O stays the same
- "WOW!"

### LLM Perspective
LLMs must:
1. Know that M upside-down looks like W
2. Know that O upside-down looks like O
3. Apply this transformation to each letter
4. Combine to get the answer

This is NOT enumeration - it's visual transformation knowledge.

### Potential Failure Modes
1. **Doesn't know M->W**: Might say "MOM" (assuming letters stay same)
2. **Doesn't reverse order**: Might say "WOW" but for wrong reason
3. **Gets confused**: Might say something random
4. **Overthinks**: Might analyze font-by-font variations

## Verification

- A 5-year-old can answer this: YES (if shown the flip)
- One unambiguous correct answer: YES (WOW)
- Requires visual transformation: YES
- Not solvable by enumeration: YES

## Final Answer

**Question: "If you turn the word 'MOM' upside down, what do you see?"**

**Answer: WOW**
