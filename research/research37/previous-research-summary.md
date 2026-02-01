# Previous Research Summary (Iterations 35-36)

## What We Tried and Failed

### Iteration 35: Character Counting
- **Question**: "How many times does the letter 's' appear in the word 'possess'?"
- **Score**: 100% (all models correct)
- **Why it failed**: Models enumerate letters one-by-one using chain-of-thought

### Iteration 36: Numeric Comparison
- **Question**: "Which of these numbers is the smallest: 3.9, 3.11, or 3.7?"
- **Score**: 100% (all models correct)
- **Why it failed**: Models align decimal places and compare correctly

## Critical Insight

**Both tokenization tricks AND numeric comparison tricks are NOW SOLVED by 2026 frontier models when they use explicit chain-of-thought reasoning.**

The models:
1. Enumerate letters one by one for counting
2. Convert decimals to same precision for comparison
3. Show their work explicitly, avoiding pattern-matching errors

## What We Need: Failures That Bypass Chain-of-Thought

We need questions where:
1. The explicit step-by-step method ITSELF leads to wrong answer
2. OR the question requires something that can't be "reasoned through"
3. OR there's a perceptual/visual element that text can't capture

## Promising New Directions

### 1. QUESTIONS WHERE REASONING REINFORCES WRONG ANSWER
- Questions where careful analysis leads AWAY from the right answer
- The more you think, the more wrong you get

### 2. AMBIGUOUS VISUAL PATTERNS
- Questions about letter shapes, symmetry, visual patterns
- These require "seeing" not "reasoning"

### 3. VERY LONG COUNTING TASKS
- 50+ items where enumeration is tedious and error-prone
- Errors accumulate over long sequences

### 4. UNUSUAL TOKENIZATION EDGE CASES
- Made-up words, unusual character combinations
- Things tokenizers haven't seen before

### 5. QUESTIONS WITH MISLEADING CONTEXT
- The setup primes the wrong answer
- Semantic interference is so strong it overrides computation

## The 5-Year-Old Test Still Applies
Any question must still be trivially answerable by a human child.
