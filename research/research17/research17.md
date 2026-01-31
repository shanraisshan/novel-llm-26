# Research Iteration 17

## Question Type: Mathematical (Last Digit Computation)

This is a concrete, simple mathematical question like "How many R's in strawberry?"

## Novel Question

**Question**: "What is the last digit of 37 x 43?"

**Correct Answer**: 1

**Why Humans Get It Right**:
- Humans only need to multiply the last digits: 7 x 3 = 21
- The last digit of 21 is 1
- This takes <3 seconds mentally
- No need to compute 37 x 43 = 1591

**Why LLMs Will Fail**:
According to research (Survey on LLM Reasoning Failures):
- LLMs paradoxically fail MORE at determining the last digit than the first digit
- This is the OPPOSITE of computational difficulty (last digit is easier)
- LLMs cannot isolate the last-digit computation
- They try to compute full multiplication, then extract the last digit
- Attention patterns focus on first/leading digits

**Predicted Wrong Answers**:
- Wrong computation of 37 x 43
- Correct computation (1591) but wrong digit extraction
- Focus on first digit (1) instead of last digit (1) - might get right by accident

## Research Evidence

Source: Survey on Large Language Model Reasoning Failures (2025)

Quote: "LLMs fail at simpler tasks (determining the last digit) but succeed in harder ones (first digit). This digit-position asymmetry reveals that LLMs do not perform true arithmetic computation."

## Human Verification

Mental math shortcut:
- Last digit of A x B = Last digit of (last digit of A) x (last digit of B)
- Last digit of 37 = 7
- Last digit of 43 = 3
- 7 x 3 = 21
- Last digit of 21 = 1

Answer: **1**
