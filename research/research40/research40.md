# Research Iteration 40: Semantic Priming in Word Length Comparisons

## Research Date: 2026-02-01

## Executive Summary

This research iteration explores a novel question design that exploits **semantic priming conflicts** - where the MEANING of words directly contradicts their PROPERTIES. We test whether 2026 frontier LLMs can overcome semantic interference when comparing word lengths.

---

## External Research Conducted

### Academic Sources (Tavily Search)

1. **"Why Do Large Language Models Struggle to Count Letters?" (arXiv:2412.18626)**
   - Key finding: LLMs concentrate most errors on letters with multiplicity > 1
   - Tokenization breaks words into subword units, hiding character-level information
   - Models may fail to identify repeated letters within tokens (e.g., "berry" containing two 'r's)

2. **"The Strawberry Problem: Emergence of Character-level Manipulation" (arXiv:2505.14172)**
   - Character-level capabilities emerge "slowly, suddenly, and only late in training"
   - The problem is framed as "low mutual information" between tokens and characters
   - Percolation-based models explain the emergence patterns

3. **Semantic Priming Research (Springer, NIH)**
   - Semantic priming effects are well-documented in visual word recognition
   - Priming affects both perception and production of words
   - Strong semantic associations can interfere with task performance

4. **"The Failure of Instruction Hierarchies in LLMs" (arXiv:2502.15851)**
   - Even simple formatting conflicts (length requirements, capitalization) cause inconsistent behavior
   - Models show "highly inconsistent behaviors in choosing which instruction to follow"

### Community Findings (Reddit)

- r/ChatGPT thread on "Why ChatGPT Struggles to Count the r's in Strawberry" confirms tokenization as the root cause
- Community notes that 2026 models have largely overcome the strawberry problem via chain-of-thought
- BUT: Semantic interference in meta-cognitive tasks remains unexplored

---

## Previous Related Attempts

### Iteration 3: "Which word has more letters: 'FOUR' or 'FIVE'?"
- **Result**: 100% consensus (FAILED)
- **Why it failed**: Models correctly counted: FOUR=4 letters, FIVE=4 letters, answered correctly
- **Lesson**: Simple numeric semantic primes (4 vs 5) don't override letter counting

### Key Insight from Iteration 3

The question failed because:
1. Both words have equal letter counts (4 each), making the "correct" answer a tie
2. The semantic prime (4 vs 5) only matters if the answer DIFFERS from the count
3. Models used enumeration to verify: F-O-U-R vs F-I-V-E

---

## Novel Question Design

### The Core Idea: LONG vs SHORT

The words "LONG" and "SHORT" have an interesting property:
- **LONG** = 4 letters (semantic meaning: extended, lengthy)
- **SHORT** = 5 letters (semantic meaning: brief, abbreviated)

This creates **maximum semantic-property conflict**:
- The word meaning "long" is SHORTER than the word meaning "short"
- The word meaning "short" is LONGER than the word meaning "long"

### Why This Might Succeed

1. **Semantic Activation**: "LONG" activates concepts of extension, length, greatness
2. **Semantic Activation**: "SHORT" activates concepts of brevity, smallness, reduction
3. **The Irony**: The shorter word describes length; the longer word describes brevity
4. **Potential Confusion**: When asked "which is longer?", models may pattern-match to "LONG" as the answer because the question uses the word "longer" and "LONG" is semantically related

### The Human Test

A 5-year-old would:
1. Look at "LONG" and "SHORT" written on paper
2. Count (or visually see) that "SHORT" has more letters
3. Answer "SHORT" correctly

### Why LLMs Might Fail

1. **Semantic Priming**: The word "longer" in the question primes for "LONG"
2. **Word Association**: LONG is directly related to LENGTH/LONGER
3. **Pattern Matching**: Training data likely contains "LONG = more, SHORT = less"
4. **Enumeration May Not Help**: Even if models count, the semantic activation may still bias the final answer selection

---

## The Question

**Question**: Which word is longer: 'LONG' or 'SHORT'?

**Correct Answer**: SHORT (5 letters > 4 letters)

**Why Humans Get It Right**:
- Humans can visually see SHORT is longer
- Humans can count: L-O-N-G (4) vs S-H-O-R-T (5)
- Humans recognize the irony but answer based on the actual property

**Why LLMs May Fail**:
- The question contains "longer" which primes for "LONG"
- LONG is semantically associated with length, extension
- SHORT is semantically associated with brevity, smallness
- Pattern matching may override enumeration

**Predicted Wrong Answers**:
- "LONG" (semantic association with length)
- "They are equal" (confused by the semantic irony)

---

## Alternative Questions Considered

### Option A: "Which word has MORE letters: 'MORE' or 'LESS'?"
- MORE = 4 letters, LESS = 4 letters (equal - no trap)
- Not useful because there's no correct answer difference

### Option B: "Which word is SHORTER: 'SHORT' or 'LONG'?"
- Answer: LONG (4 < 5)
- Similar semantic conflict but inverted

### Option C: "Which word is longer: 'ABBREVIATION' or 'LONG'?"
- Answer: ABBREVIATION (12 letters)
- Interesting because ABBREVIATION means "to shorten"
- But may be too obviously different in length

### Why I Selected Option A (LONG vs SHORT)

1. **Maximum Semantic Conflict**: The words are antonyms on the length dimension
2. **Simple Question**: One-liner, any child understands
3. **Clear Answer**: SHORT objectively has more letters (5 vs 4)
4. **Strong Semantic Prime**: "longer" in question directly activates "LONG"

---

## Risk Assessment

### Why This Might Fail (100% Consensus)

1. **2026 Models Are Good at Counting**: If models spell out L-O-N-G and S-H-O-R-T, they will get it right
2. **Irony Detection**: Models may recognize the ironic contrast and still answer correctly
3. **Well-Known Question**: This exact question may exist in training data as a "trick question"

### Why This Might Succeed (<100% Consensus)

1. **Semantic Activation is Automatic**: The word "longer" primes "LONG" before enumeration occurs
2. **Fast-Thinking Bias**: Some models may answer from pattern-matching before careful counting
3. **Novel Framing**: Even if similar questions exist, the specific framing matters

---

## Research Hypothesis

**H1**: At least 1 of 5 frontier LLMs will answer "LONG" due to semantic priming, achieving <100% consensus.

**H0**: All 5 LLMs will correctly enumerate letters and answer "SHORT", achieving 100% consensus.

---

## Submission

**Question to test**: Which word is longer: 'LONG' or 'SHORT'?

**Expected answer**: SHORT

**Category**: Semantic Priming / Word-Property Conflict

**Target failure mode**: Semantic activation overriding property enumeration

---

## Notes for Future Iterations

If this fails (100% consensus), consider:

1. **Nested Semantic Priming**: Questions where multiple semantic primes stack
2. **Temporal Pressure Questions**: Where models must answer before enumeration completes
3. **More Obscure Word Pairs**: Where the irony is less likely to be in training data
4. **Multi-Word Comparisons**: "Which phrase is shorter: 'BRIEF SUMMARY' or 'LONG EXPLANATION'?"

If this succeeds (<100% consensus), iterate on:
1. Other antonym pairs with property conflicts
2. Different property dimensions (weight, speed, size)
3. Combining semantic priming with other failure modes
