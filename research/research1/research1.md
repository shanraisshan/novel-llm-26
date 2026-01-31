# Novel LLM-Breaking Questions for 2026 Models

A research exploration into creating simple, one-liner questions that expose fundamental limitations in Large Language Models, including frontier models like GPT-5.2, Claude Opus 4.5, Grok, Gemini 3 Pro, and DeepSeek DeepThink.

## Background

### How LLMs Work

LLMs are fundamentally **next-token predictors**. They generate text one token at a time, computing a probability distribution over all possible next tokens. This has profound implications:

- They don't "understand" in the human sense—they pattern-match
- They don't "compute"—they predict what computation results look like
- They don't "see" characters—they see tokens (chunks of text)

### The Strawberry Problem (2024)

The famous "How many r's are in strawberry?" question exposed that LLMs consistently answered "2" instead of "3". This happened because:

```
"strawberry" → tokenized as ["str", "aw", "berry"] → [496, 675, 15717]
```

The model never sees individual characters—only abstract token IDs. This was eventually "fixed" in models like OpenAI's o1 through chain-of-thought reasoning.

### The Challenge

Create a **simple, one-liner question** that:
- Cannot be solved by pattern matching from training data
- Cannot be solved by chain-of-thought reasoning alone
- Exploits fundamental computational limitations
- Has a compelling wrong answer that models gravitate toward

---

## The Core Problem

Modern LLMs (2025-2026) have been trained on vast datasets that include:
- Common "gotcha" questions and their solutions
- Floating-point arithmetic edge cases
- Character counting exercises
- Python-specific behaviors

This means **any well-known trick is likely in the training data**. We needed something truly novel.

---

## Fundamental LLM Limitations

### 1. Tokenization Blindness
LLMs process text as tokens, not characters. They cannot directly "see" individual letters without reasoning through them.

### 2. Semantic Priming
When a model sees "ELEVEN", the token activates neural pathways associated with the number 11, even when the task is to count letters (which would give 6).

### 3. Pattern Matching Over Computation
LLMs predict what answers "look like" rather than computing them. For novel computations not in training data, they fail.

### 4. Training Data Gaps
Obscure behaviors (like the ceiling + floating-point interaction) may not be well-represented in training data.

### 5. Compounding Errors
When multiple obscure operations are chained, the probability of error multiplies.

---

## Concepts Explored

### Concept 1: Semantic Priming + Character Counting

**Idea**: Use number words where the semantic meaning differs from the letter count.

| Word | Semantic Value | Letter Count |
|------|----------------|--------------|
| TWO | 2 | 3 |
| TEN | 10 | 3 |
| FOUR | 4 | 4 |
| FIVE | 5 | 4 |
| NINE | 9 | 4 |
| SEVEN | 7 | 5 |
| EIGHT | 8 | 5 |
| ELEVEN | 11 | 6 |
| TWELVE | 12 | 6 |
| FIFTEEN | 15 | 7 |
| THIRTEEN | 13 | 8 |

**Result**: Modern models handle simple counting correctly by slowing down.

### Concept 2: Nested Operations

**Idea**: Chain multiple operations so errors compound.

**Example**: "What is the word for the number of letters in the word for the number of letters in SEVEN?"

**Result**: Frontier models solve this with careful chain-of-thought.

### Concept 3: Floating-Point Arithmetic

**Idea**: Exploit IEEE 754 floating-point representation errors.

**Famous Example**: `0.1 + 0.2 = 0.30000000000000004` (not 0.3)

**Less Famous Examples**:
- `0.1 + 0.7 = 0.7999999999999999` (not 0.8)
- `sum([0.1] * 6) = 0.6000000000000001`
- `0.3 - 0.1 - 0.1 = 0.09999999999999998` (not 0.1)

**Result**: The famous `0.1 + 0.2` case is known, but subtraction errors are far less documented.

### Concept 4: Python-Specific Behaviors

**Banker's Rounding** (Python 3):
```python
round(0.5) = 0  # NOT 1!
round(2.5) = 2  # NOT 3!
```

**Negative Floor Division**:
```python
-5 // 2 = -3  # NOT -2! (floor, not truncation)
```

**XOR Operator**:
```python
5 ^ 3 = 6  # XOR, not exponentiation!
```

**Result**: Models trained on Python documentation often handle these correctly.

### Concept 5: String Representation Length

**Key Insight**: The string representation of floating-point errors has a SPECIFIC LENGTH.

```python
str(0.30000000000000004)  # 20 characters
str(0.7999999999999999)   # 18 characters
str(0.09999999999999998)  # 19 characters
```

**Result**: Some models began solving these after extensive testing.

### Concept 6: The Ceiling Trap

**The Discovery**: `math.ceil(N * 0.1 * 10) = N + 1` for SOME integers!

Only **3, 6, and 7** have this off-by-one error. All others are exact.

```python
>>> import math
>>> math.ceil(3 * 0.1 * 10)
4  # Should be 3!
>>> math.ceil(6 * 0.1 * 10)
7  # Should be 6!
>>> math.ceil(7 * 0.1 * 10)
8  # Should be 7!
```

This pattern is **virtually undocumented** anywhere on the internet.

---

## The Journey: Failed Attempts

### Attempt 1: Overlapping Substring Counting
**Question**: "How many times does 'aba' appear in 'ababababa'?"

**Result**: ❌ Modern models handle this with position-by-position reasoning.

### Attempt 2: Semantic Priming Alone
**Question**: "How many words in 'I have five fingers on each hand' have exactly five letters?"

**Result**: ❌ Models count carefully and get 0.

### Attempt 3: Banker's Rounding + Priming
**Question**: "If X is the number of letters in EIGHT, what is round(X / 2) in Python 3?"

**Result**: ❌ Frontier models know banker's rounding.

### Attempt 4: XOR + Nested Operations + Modulo
**Question**: "If X is the number of letters in EIGHT, what is (X ^ (X - 2)) % (round(X / 2)) in Python 3?"

**Result**: ❌ Opus 4.5 and GPT 5.2 solved it.

### Attempt 5: Floating-Point String Length
**Question**: "If X is the number of letters in TWO, what is len(str(X / 10 - 0.1 - 0.1)) in Python?"

**Answer**: 19

**Results**:
- GPT 5.2: ✅ Correct (19)
- Grok: ✅ Correct (19)
- Sonnet 4.5: ❌ Wrong (3)
- Opus 4.5: ❌ Wrong (20, then corrected to 19)

**Lesson**: Still not universal enough.

### Attempt 6: The Ceiling Trap
**Question**: "If X is the number of letters in TEN, and Y is the number of letters in NINE, what is math.ceil(X * 0.1 * 10) + math.ceil(Y * 0.1 * 10) in Python?"

**Answer**: 8

---

## Earlier Candidate Questions

### Question 1: String Length of Subtraction
```python
"If X is the number of letters in TWO, what is len(str(X / 10 - 0.1 - 0.1)) in Python?"
```
**Answer**: 19

**Partial Success**: GPT 5.2 and Grok solved it; Sonnet and Opus failed.

### Question 2: Boolean Ceiling Comparison
```python
"If X is the number of letters in TEN, what is int(math.ceil(X * 0.1 * 10) > X) in Python?"
```
**Answer**: 1

**Concept**: Asks "Is ceil(X) greater than X?" which should ALWAYS be False for integers, but is True for X=3 due to floating-point error!

### Question 3: Multiplied Difference
```python
"If X is the number of letters in TEN, what is (math.ceil(X * 0.1 * 10) - X) * 100 in Python?"
```
**Answer**: 100

**Concept**: Amplifies the off-by-one error to make it obvious.

---

## Implications

### For AI Safety

These questions demonstrate that LLMs can confidently give wrong answers on seemingly simple tasks. In critical applications (medical, financial, engineering), this is dangerous.

**Key Finding**: Different models have different gaps in their understanding of floating-point arithmetic.

### For AI Evaluation

Standard benchmarks don't capture these failure modes. We need evaluations that:
- Test novel computations not in training data
- Chain multiple obscure behaviors
- Require exact (not approximate) answers
- Exploit interactions between operations (like ceil + floating-point)

### For AI Development

To truly solve these problems, models need:
- Actual computation capabilities (not just prediction)
- Mandatory tool use for numerical questions (Python interpreter)
- Uncertainty quantification ("I should verify this with code")
- Training on edge-case interactions, not just individual behaviors

### For Users

When using LLMs for precise computation:
- **ALWAYS verify with actual code execution**
- Be skeptical of confident numerical answers
- Understand that "knowing about" a concept ≠ "correctly computing" with it
- Chain-of-thought reasoning is not sufficient for novel computations
