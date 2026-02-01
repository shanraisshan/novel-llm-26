# Previous Research Summary for Iteration 65

## Last 5 Iterations Summary

### Iteration 64 (Most Recent)
- **Question:** "How many words are in this sentence: 'There are six words in this sentence.'"
- **Answer:** 7
- **Score:** 100% (all models correct)
- **Why it failed:** Self-referential semantic claim about word count was NOT enough to confuse models. All 5 models correctly enumerated: There(1) are(2) six(3) words(4) in(5) this(6) sentence(7) = 7

### Iteration 63
- **Question:** "Does the word 'MISSISSIPPI' have an odd or even number of the letter 'S'?"
- **Answer:** Even (there are 4 S's)
- **Score:** 100%
- **Why it failed:** Models correctly counted S's and determined 4 is even

### Iteration 62
- **Question:** "Is the word 'TEETH' singular or plural?"
- **Answer:** Plural
- **Score:** 100%
- **Why it failed:** Basic grammar question - too easy

### Iteration 61
- **Question:** "Which word comes first in the dictionary: SIX or SEVEN?"
- **Answer:** SEVEN
- **Score:** 100%
- **Why it failed:** Alphabetical comparison well-handled by models

### Iteration 60
- **Question:** "A farmer has 10 sheep. All but 9 run away. How many sheep does the farmer have left?"
- **Answer:** 9
- **Score:** 100%
- **Why it failed:** Classic riddle now in training data

## Key Patterns from 64 Iterations

### What DOESN'T Work (100% consensus):
1. **Character counting** - Models enumerate letter-by-letter correctly
2. **Simple semantic priming** - Models overcome with chain-of-thought
3. **Classic riddles** - In training data
4. **Self-referential claims about external text** - Models count anyway
5. **Numeric comparisons** - Models convert and compare correctly
6. **Physical reasoning** - Models apply common sense
7. **Spatial/temporal reasoning** - Simple cases handled
8. **False presupposition rejection** - Models catch obvious impossibilities

### What HAS Worked (Best scores):
1. **Iteration 13:** "Is your answer to this question exactly one word long? Answer yes or no." - **20% consensus** (BEST)
   - Key: Self-referential about OUTPUT properties
   - Key: BOTH yes and no satisfy the constraint (dual-valid)
   - Key: Scope confusion about "your answer"

2. **Iteration 55:** "Answer with just ONE word: What is the fifth word of your response to this question?" - **40% consensus**
   - Key: Constraint impossibility (one word can't have position 5)
   - BUT: Violated 5-year-old test (deemed not simple enough)

3. **Iteration 30:** "Is your answer to this question exactly one syllable long? Answer yes or no." - **60% consensus**
   - Key: Syllable count as dual-valid property

4. **Iteration 33:** "What is the third word of your response to this question?" - **60% consensus**
   - Key: Open-ended output prediction

## Critical Insight: Why Iteration 13 Worked

The ONLY question to achieve sub-20% consensus that met strawberry criteria was iteration 13:

**"Is your answer to this question exactly one word long? Answer yes or no."**

Why it worked:
1. **Dual-valid constraint:** BOTH "yes" and "no" are exactly one word long
2. **Scope ambiguity:** "Your answer" could mean:
   - Just the yes/no word (one word = TRUE)
   - The entire response including explanation (multiple words = FALSE)
3. **Training bias:** Models tend toward verbose explanations
4. **Self-fulfilling/defeating:** Both answers can be rationalized as correct

## Directions for Iteration 65

Based on the pattern, the most promising direction is:

### OUTPUT SELF-REFERENCE with DUAL-VALID PROPERTIES

Questions where:
1. The question asks about a property of the model's OWN response
2. BOTH possible answers (yes/no, or both answer options) satisfy the constraint
3. The property is HOLISTIC (word count, syllable count) not character-level
4. The question creates SCOPE AMBIGUITY about what "answer" means

### Specific Angles to Try:

1. **Different dual-valid properties:**
   - Number of syllables (worked at 60%)
   - Number of words (worked at 20%)
   - Length comparisons ("shorter than X words")

2. **Non-binary output prediction:**
   - "What is the Nth word of your response?" (worked at 60%)
   - Different positions or properties

3. **Combined constraints:**
   - Multiple self-referential properties
   - Nested self-reference

### AVOID:
- Character counting (solved by enumeration)
- Classic riddles (in training data)
- Explicit Python/technical specs (too easy)
- Philosophical paradoxes (fail 5-year-old test)
- Single-valid properties (easy to reason about)
