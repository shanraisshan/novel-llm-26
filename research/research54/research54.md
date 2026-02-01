# Research Iteration 54: Novel LLM-Breaking Question

## External Research Findings

### Key Discovery 1: VLMs Are Biased - Memorization Override (ICLR 2026)
**Source**: vlmsarebiased.github.io, ICML 2025, arXiv:2505.23941

The most striking finding from external research:
- **State-of-the-art VLMs achieve 100% accuracy** on images of popular subjects (e.g., knowing Adidas logo has 3 stripes, dogs have 4 legs)
- **BUT only ~17% accuracy** on counterfactual images (e.g., counting stripes in a 4-striped Adidas-like logo or legs on a 5-legged dog)
- **75.70% of errors are "bias-aligned"** - models give the expected memorized answer rather than what they actually see
- Even instructing models to "double-check" or "rely exclusively on image details" improves accuracy by only +2 points

**Key Insight**: VLMs don't actually "see" - they rely on memorized knowledge instead of visual analysis. This applies to TEXT-ONLY LLMs too when asked about well-known facts.

### Key Discovery 2: Spatial Reasoning Failures
**Source**: GVGAI-LLM (arXiv:2508.08501), Hacker News discussions

- LLMs frequently misinterpret spatial layouts, reversing vertical orientation
- "Coordinate confusion" where models reverse up/down, left/right
- One researcher noted: "Most VLMs cannot reliably tell if a character is facing left or right"
- Models are "statistically literate but spatially blind"

### Key Discovery 3: Physical World Simulation Failures
**Source**: Gary Marcus's analysis, Apple's "Illusion of Thinking" paper

- LLMs fail to induce proper world models of anything
- "Everything they do is through mimicry, rather than abstracted cognition across proper world models"
- Chess video generation shows models moving pieces illegally because they don't understand the rules

### Key Discovery 4: The "Inverted Competence Profile" (Jan 2026)
**Source**: youssefh.substack.com (Important LLM Papers 01/2026)

- **44.4% absolute accuracy gap** between best-performing model (Gemini3-Pro at 49.7%) and adult humans (94.1%) on basic visual tasks
- Most frontier MLLMs perform **below the level of an average 3-year-old child** on visual primitives
- Four systemic bottlenecks identified:
  1. Loss of Fine-Grained Detail
  2. Loss of Manifold Identity (models "switch tracks" at crossings)
  3. Failure of Spatial Imagination
  4. Abstract Pattern Induction (fixate on spurious correlations)

---

## Question Design Rationale

### The Core Insight: Memorization Bias in Text-Only LLMs

While the VLMBias research focuses on vision-language models, the same principle applies to text-only LLMs: **they have memorized facts about well-known entities and will default to those facts even when the question asks about something different**.

### The Approach: Counterfactual Common Knowledge

We can create a PURE TEXT question that exploits the same "memorization override" phenomenon discovered in VLMs:
- Ask about a well-known fact that has a memorized answer
- But modify ONE parameter that changes the correct answer
- The modification should be OBVIOUS to any human reading carefully
- LLMs will pattern-match to the memorized fact and ignore the modification

### Why This Should Work

1. **Training data bias**: LLMs have seen "piano" + "keys" millions of times with the answer "88"
2. **Semantic priming**: The word "piano" activates the entire concept including "88 keys"
3. **Modification blindness**: Despite research on GSM-NoOp showing models now catch EXPLICIT overrides, we can use IMPLICIT counting that changes the answer
4. **Human advantage**: Humans don't need to know the memorized fact - they can just count

### The Question Category: Counterfactual Object Counting

This exploits the exact same mechanism as the VLMBias research but in pure text:
- Present a well-known subject with a strongly memorized property
- Ask to count something that contradicts the memorized property
- The counting is trivially easy for humans
- LLMs will default to the memorized answer

---

## The Question

**"I have a piano with white keys labeled A, B, C, D, E, F, and G. How many white keys does my piano have?"**

---

## The Answer

**7**

---

## Why Humans Get It Right

1. **Direct enumeration**: A human reads "A, B, C, D, E, F, and G" and simply counts: 7 items
2. **No external knowledge needed**: The answer is explicitly stated in the question
3. **Reading comprehension**: Humans naturally process the explicit list and count it
4. **A 5-year-old could count**: "A, B, C, D, E, F, G - that's 1, 2, 3, 4, 5, 6, 7!"

---

## Why LLMs Will Fail

### Primary Failure Mechanism: Memorization Bias Override

1. **Semantic activation**: The word "piano" + "white keys" activates the memorized fact: "A standard piano has 52 white keys (out of 88 total)"

2. **Pattern matching over reading**: LLMs are trained on millions of instances of "piano white keys = 52" or "piano keys = 88" - this statistical weight overwhelms the explicit information in the question

3. **Modification blindness**: The explicit list "A, B, C, D, E, F, G" should override the default, but just like VLMs fail to see that an Adidas logo has 4 stripes (not 3), LLMs may fail to process this explicit counterfactual

4. **No visual grounding**: Unlike counting letters in "strawberry" where enumeration helps, here the question structure primes the memorized answer BEFORE the model processes the list

### Secondary Failure Mechanism: Semantic Interference

1. The letters A-G are ALSO the musical note names for white keys on a piano
2. This creates a semantic trap: "labeled A, B, C, D, E, F, G" sounds like describing a piano octave
3. But a piano octave actually has multiple repetitions of these notes (about 7 complete octaves)
4. Models may conflate "keys labeled with note names" with "total white keys"

### Predicted LLM Reasoning Error

The model may think:
- "Piano white keys are labeled A through G" (TRUE)
- "A standard piano has 52 white keys" (TRUE for normal pianos)
- "Therefore the answer is 52" (WRONG for THIS piano)

OR

- "The question mentions A through G, which is one octave"
- "But a piano has multiple octaves, so there are many white keys"
- Answer: 52 or some other large number

---

## Predicted Wrong Answers LLMs Will Give

1. **52** - The number of white keys on a standard 88-key piano (most likely error)
2. **88** - The total number of keys on a standard piano (conflation error)
3. **49** or **44** - Smaller piano variants that models have in training data
4. **36** - A common small keyboard size
5. **Counts 8-10** - If models try to count but get confused by "and G" structure

---

## Why This Is Better Than Previous Attempts

### Comparison to Previous Iterations

| Iteration | Question Type | Result | Why It Failed/Succeeded |
|-----------|--------------|--------|------------------------|
| 35 | Character counting ('possess') | 100% | Models enumerate letters |
| 40 | Word length irony (LONG vs SHORT) | 100% | Models enumerate letters |
| 43 | Adjacency with ambiguity (CHERRY) | 40% | Ambiguity caused disagreement |
| 53 | Simple inverse relation (behind/in front) | 100% | Too simple, direct inversion |

### Why This Question Is Different

1. **Cannot be solved by character enumeration**: The list is explicit, not hidden in tokenization
2. **Exploits memorization bias**: Like VLMBias but for text
3. **Semantic interference**: "Piano" + "white keys" + "A-G" creates multiple misleading associations
4. **Explicit answer ignored**: Tests whether models READ or pattern-match
5. **5-year-old test**: Any child can count "A, B, C, D, E, F, G" = 7

### The Strawberry Paradigm Match

| Criterion | How This Question Meets It |
|-----------|---------------------------|
| Human child can answer | Yes - just count the letters |
| Simple one-liner | Yes |
| Unambiguous answer | Yes - exactly 7 |
| Exploits LLM limitation | Yes - memorization bias / semantic priming |
| NOT enumeration-solvable via CoT | The enumeration IS the answer, but priming may prevent it |

---

## Confidence Assessment

**Predicted Consensus Score**: 40-60%

**Reasoning**:
- If models fall for the memorization bias (like VLMs do ~83% of the time), they'll answer 52 or 88
- If models carefully read and count the explicit list, they'll answer 7
- The semantic priming from "piano" + "white keys" is VERY strong
- But 2026 frontier models are better at catching explicit modifications than 2024 models

**Risk Assessment**:
- If all models carefully read and count, we'll get 100% (failure)
- If the memorization bias is strong enough, we'll get low consensus (success)
- The question is designed to be in the "sweet spot" where reading comprehension competes with pattern matching

---

## Alternative Formulations (If This Fails)

If this achieves 100% consensus (all models answer correctly), try these variations:

1. **More implicit counting**: "My piano's white keys are labeled with letters A through G. How many white keys does my piano have?"

2. **Add distractor**: "I have a small piano with only the white keys labeled A, B, C, D, E, F, and G. A standard piano has 52 white keys. How many white keys does MY piano have?"

3. **Different domain**: "My company employs people named Alice, Bob, Carol, and Dave. The average company has 100 employees. How many employees does my company have?"

---

## Summary

This question targets the **memorization bias** failure mode documented in ICLR 2026's VLMBias research, adapted for pure text. It asks LLMs to count explicitly listed items while semantic priming from the domain (pianos) activates memorized facts (52 white keys) that may override careful reading.

A 5-year-old who doesn't know anything about pianos can count "A, B, C, D, E, F, G" = 7. But an LLM that has seen millions of piano facts may default to the memorized answer.
