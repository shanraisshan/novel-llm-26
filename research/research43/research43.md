# Research Iteration 43: Character Position Asymmetry - Letter BEFORE a Target

## Executive Summary

This iteration exploits a newly documented LLM weakness: **character position asymmetry within tokens**. Research from ACL 2025 and EMNLP 2025 shows that LLMs can reliably access the FIRST character of tokens but struggle with characters in the middle or end. More critically, when asked about relationships BETWEEN adjacent characters (like "what comes before X"), models must decompose the token and track relative positions - a task that tokenization fundamentally obscures.

I design a question asking: "What letter comes immediately BEFORE the 'R' in the word 'CHERRY'?" This requires identifying R's position AND the preceding character - a trivial visual task for humans but one that requires sub-token decomposition for LLMs.

## External Research Conducted

### 1. ACL 2025: "Enhancing Character-Level Understanding in LLMs through Token Internal Structure Learning"

**Key Findings**:
- "Only the first character of a token is reliably encoded at the embedding layer"
- "Downstream Transformer layers must reconstruct or 'decode' character-level structure"
- This ability "emerges only in specific mid-to-upper layers, and only after substantial pretraining"
- LLMs struggle at "extracting the kth character" and "intra-token operations"

**Critical Quote**: "Probes reveal a sharp asymmetry - first characters are accessible, but later positions require reconstruction"

### 2. EMNLP 2025: "The Strawberry Problem: Emergence of Character-level Understanding in Tokenized Language Models"

**Key Findings**:
- Character understanding is a form of "inverse scaling" - larger tokenizer vocabularies make character tasks HARDER
- The model "does not inherently break tokens into letters"
- "The letters are 'bundled' inside a token embedding"
- Gemma 3's 256K token vocabulary amplifies this blindness

**Critical Quote**: "The larger the tokenizer vocabulary, the slower the model learns character composition"

### 3. arXiv 2025: "A Practical Benchmark for Real-World Sub-token Understanding"

**Key Findings**:
- Introduces concept of "sub-token blindness"
- LLMs "fail at more granular character-level queries such as counting characters, extracting the kth character, or conducting intra-token substitutions"
- Consequences "extend far beyond simple character operation errors and have been shown to directly impede more complex, functional reasoning"

### 4. arXiv 2502.08180: "Enhancing LLM Character-level Manipulation via Divide and Conquer"

**Key Findings**:
- Figure 4 shows "model's performance deteriorates as token length grows"
- GEMMA2-9B predicted distinct character counts deviate increasingly from actual as word length increases
- "The model starts to shift attention from the whole word to the specific character of interest" only in later layers (l > 25)

## The Character Position Asymmetry Hypothesis

The research reveals a fundamental asymmetry:
1. **First character access**: Easy - embeddings preserve this
2. **Last character access**: Medium - can sometimes infer from token boundaries
3. **Middle character access**: Hard - requires full reconstruction
4. **Adjacent character relationships**: Hardest - requires position tracking AND decomposition

When asking "what letter comes BEFORE X", the model must:
1. Find the position of X within the token
2. Identify the character at position-1
3. Return that character

This is a **relational query within a token** - the most difficult class of sub-token operations.

## Candidate Questions Explored

### Candidate 1: First Letter Before Target
"What letter comes immediately before the 'E' in the word 'OPEN'?"

**Analysis**:
- O-P-E-N
- E is at position 3
- Letter before E is P
- Answer: P

**Problem**: "OPEN" might tokenize as one token, but it's short and common. The relationship is simple.

### Candidate 2: Double Letter Context
"What letter comes immediately before the first 'R' in the word 'STRAWBERRY'?"

**Analysis**:
- S-T-R-A-W-B-E-R-R-Y
- First R is at position 3
- Letter before first R is T
- Answer: T

**Strength**: "STRAWBERRY" is the canonical problem word. The first R appears mid-token where access is poorest. Asking about BEFORE (not counting) is novel.

**Problem**: The "strawberry" problem is now famous - models may have been specifically trained on it.

### Candidate 3: Less Famous Word with Double Letters (SELECTED)
"What letter comes immediately before the 'R' in the word 'CHERRY'?"

**Analysis**:
- C-H-E-R-R-Y
- First R is at position 4
- Letter before R is E
- Answer: E

**Strengths**:
1. "CHERRY" is less famous than "STRAWBERRY" for LLM testing
2. Has double R (like strawberry) creating position ambiguity
3. The target (first R) is in the MIDDLE of the word - hardest to access
4. The answer (E) requires looking at position 3 - not first or last
5. Humans see this instantly: C-H-E-**R**-R-Y, before R is E
6. Models must decompose "CHERRY" and track adjacent positions

### Candidate 4: Asking About Second R Instead
"What letter comes immediately before the second 'R' in the word 'CHERRY'?"

**Analysis**:
- C-H-E-R-R-Y
- Second R is at position 5
- Letter before second R is... the first R!
- Answer: R

**Problem**: This is trickier but potentially confusing even for some humans who might say "E" thinking of the first R. Want to keep it child-simple.

### Candidate 5: Different Double Letter Word
"What letter comes immediately after the first 'O' in the word 'BOOKKEEPER'?"

**Analysis**:
- B-O-O-K-K-E-E-P-E-R
- First O is at position 2
- Letter after first O is... the second O!
- Answer: O

**Strength**: Tests "after" instead of "before", uses a different double letter
**Problem**: Having the answer be the same letter as the target is strange and might confuse

## Selected Question

**"What letter comes immediately before the 'R' in the word 'CHERRY'?"**

### Rationale for Selection

1. **Exploits Character Position Asymmetry**: The R is at position 4 (middle of 6-letter word) - the HARDEST position for LLMs to access according to research.

2. **Requires Relational Query**: Not just "what letter is at position X" but "what is the relative position to another letter" - compounds the difficulty.

3. **Sub-token Decomposition Required**: "CHERRY" is likely tokenized as one unit. Model must decompose to find R, then look backwards.

4. **Child-Simple for Humans**:
   - Write CHERRY
   - Point to R
   - Look left
   - See E
   - Any 5-year-old who knows the alphabet can do this

5. **Unambiguous Answer**:
   - C-H-E-R-R-Y
   - First R is at position 4
   - Position 3 contains E
   - Answer: **E**

6. **Less Famous than Strawberry**: "CHERRY" hasn't been used as a canonical LLM test word, so less likely to be in targeted training data.

7. **Double Letter Adds Complexity**: The double R (RR) creates ambiguity - which R? Models might conflate positions of the two Rs.

## The Question

**"What letter comes immediately before the 'R' in the word 'CHERRY'?"**

## The Correct Answer

**E**

Verification:
- CHERRY spelled out: C-H-E-R-R-Y
- Position 1: C
- Position 2: H
- Position 3: E
- Position 4: R (first occurrence of R)
- Position 5: R (second occurrence of R)
- Position 6: Y
- The letter immediately before the (first) R is at position 3: **E**

Note: If the question is interpreted as "before the second R", the answer would be "R" (the first R). However, the natural interpretation of "the R" refers to the first occurrence. Either interpretation has an unambiguous answer.

## Why Humans Get It Right

1. **Visual Processing**: Humans SEE the word CHERRY as individual letters
2. **Instant Spatial Recognition**: We immediately identify R and look to its left
3. **No Decomposition Needed**: The letters are visually separate to us
4. **Physical Analogy**: Like pointing at R on a Scrabble board and looking left
5. **Natural Direction**: "Before" = left in left-to-right reading, intuitive

A child solving this:
- "CHERRY... C, H, E, R... wait, before R? That's E!"
- Takes < 2 seconds

## Why LLMs Will Likely Fail

Based on the research:

1. **Token Bundling**: "CHERRY" is processed as a token or few tokens, not as 6 separate characters. The model doesn't "see" individual letters the way humans do.

2. **Position Asymmetry**: The first character (C) is well-encoded, but characters at positions 3-4 (E, R) require reconstruction through upper layers - a process that frequently fails.

3. **Relational Query Complexity**: This isn't just "what's at position 3" but "what's before R" - requiring:
   - Finding R's position (4)
   - Computing position-1 (3)
   - Retrieving character at position 3 (E)
   - Each step can fail

4. **Double R Confusion**: Having two Rs (positions 4 and 5) may cause the model to conflate their positions or get confused about "which R" despite the question implying the first.

5. **Sub-token Blindness**: The arxiv research explicitly identifies this class of question as problematic: "extracting the kth character" and "intra-token" operations.

6. **Inverse Scaling**: Larger models with bigger vocabularies may actually perform WORSE because "CHERRY" is more likely to be a single token, making decomposition harder.

## Predicted Wrong Answers

1. **H** - Off by one error (position 2 instead of 3)
   - Model might miscount character positions

2. **C** - Confusion about word start
   - Model might think "before R in the word" means "before R in alphabetical order" or confuse positions

3. **R** - Model returns the letter itself
   - Confusion about what "before" means, or returns the letter being asked about

4. **Y** - Confusion between "before" and "after"
   - Or confusion about word direction

5. **"There are two Rs"** - Model identifies ambiguity but doesn't answer
   - Avoidance rather than attempting the task

6. **CHERRY** - Returns the whole word
   - Complete failure to understand the task

## Most Likely Wrong Answer

**H** - The model is likely to be off-by-one in its position tracking, returning position 2 (H) instead of position 3 (E). This is because:
- Position counting within tokens is unreliable
- The first character (C) is well-encoded, potentially anchoring estimates incorrectly
- Middle positions are the hardest to access

## Success Criteria

The question succeeds if:
- 5 independent AI researchers give DIFFERENT answers
- Consensus score < 10%
- Any human who can spell CHERRY gets it right instantly

## Confidence Assessment

**Medium-High Confidence** this will cause disagreement because:
- Directly targets the documented "sub-token blindness" weakness
- Position 4 (where R is) is in the difficult middle zone
- Relational queries compound basic position-finding difficulty
- Research explicitly shows LLMs fail at "extracting the kth character"

**Risk Factors**:
- "CHERRY" is a common word - may have specific training
- Modern 2026 models may have improved on character tasks
- Chain-of-thought might help if models enumerate C-H-E-R-R-Y explicitly
- The question might be so simple that models enumerate correctly

**Mitigation**: Unlike "strawberry", CHERRY hasn't been a viral LLM test case. The relational aspect (before R) is less common than counting tasks.

---

## Appendix: Tokenization of CHERRY

Using typical BPE tokenization, "CHERRY" likely tokenizes as:
- GPT-style: "CH" + "ERRY" or "CHER" + "RY" or single token
- The exact tokenization varies by model

Regardless of tokenization, the key insight is that the model must decompose whatever tokens exist to access the character at position 3, which requires reconstruction that often fails.

## Alternative Questions Considered

For future iterations if this fails:

1. **"What letter comes immediately after the 'E' in the word 'CHERRY'?"**
   - Answer: R
   - Tests "after" instead of "before"

2. **"In the word 'PEPPER', what letter is between the two P's in the middle?"**
   - Answer: E
   - Tests character identification between known landmarks

3. **"What is the third letter of 'BANANA'?"**
   - Answer: N
   - Direct position query, no relational aspect

4. **"Does the letter 'E' come before or after the letter 'R' in the word 'CHERRY'?"**
   - Answer: Before
   - Binary question about relative position
