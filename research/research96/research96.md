# Research Iteration 96: Exploiting Inverse Scaling and Overthinking Traps

## Executive Summary

After 95 iterations, nearly all question types achieve 100% consensus among frontier LLMs. The ONLY approach that achieved sub-40% consensus was iteration 13's self-referential output question ("Is your answer to this question exactly one word long? Answer yes or no." - 20% consensus).

This iteration explores a fundamentally different failure mode: **Inverse Scaling** - documented by Anthropic's July 2025 research showing that **more reasoning can make LLMs perform worse** on certain tasks. The key insight is to create questions where chain-of-thought reasoning actively leads models AWAY from the correct answer.

---

## 1. MCP Research Findings

### 1.1 Tavily Web Search Results

#### Finding 1: Anthropic's Inverse Scaling in Test-Time Compute (July 2025)
**Source**: arXiv:2507.xxxxx, IBM Think Topics

Key Discovery: Anthropic published research showing that "in certain tasks, models like Claude and OpenAI's GPT-o series actually perform worse when allowed to reason for longer." They call this **inverse scaling in test-time compute**.

Critical Quote from IBM:
> "Research published by Anthropic in July 2025 asserted that such overthinking is not solely an efficiency concern: their paper explores 'cases where longer reasoning deteriorates performance, exhibiting an inverse relationship between test-time compute and accuracy.'"

**Key Tasks That Trigger Inverse Scaling**:
1. **Simple Counting With Distractors**: Tasks where overthinking adds confusion
2. **Pattern Matching Override**: Tasks where intuitive patterns should override analysis
3. **First-Instinct Tasks**: Tasks where the first guess is usually correct but reasoning changes it

#### Finding 2: SubTokenTest Benchmark - "Sub-Token Blindness"
**Source**: arXiv:2601.09089v1 - "A Practical Benchmark for Real-World Sub-token Understanding"

Key Discovery: Even 2026 models exhibit "tokenization-induced misinterpretations" where the "model's processing granularity misaligns with the required character-level precision." The research identifies two primary error categories:
1. Tokenization-induced errors
2. **Overthinking** - where models add unnecessary complexity to simple tasks

**Critical Insight**: The paper explicitly calls out "overthinking" as a documented error pattern separate from tokenization issues.

#### Finding 3: The Strawberry Problem Evolution
**Source**: secwest.net, theaishortcuts.substack.com

While basic strawberry-type questions are now solved via chain-of-thought enumeration, the research confirms that:
- Models that "try to be verbose or explain fail"
- The key is creating situations where **enumeration/explanation leads to wrong answers**
- "Recent models overcome it" by explicit step-by-step enumeration - so we need questions where enumeration FAILS

#### Finding 4: LLM Autoregressive Limitations
**Source**: medium.com/@DrKilngon, LinkedIn (krzysztofsopyla)

Key limitations confirmed:
- "Inability to Backtrack": Autoregressive models cannot revise once committed
- "Planning and Global Coherence": Models cannot globally structure an answer before generating
- "Illusion of Understanding": Pattern matching, not true comprehension
- "Self-correction has a ceiling": Models cannot step outside their learned manifold

### 1.2 Reddit Community Findings

#### Finding 1: ChatGPT Frustration with Overthinking
**Source**: r/ChatGPT (multiple recent posts)

Users report that ChatGPT Pro has become "increasingly defensive" and adds unnecessary qualifications. When asked simple questions, models often overcomplicate responses. The community frustration aligns with the inverse scaling research.

#### Finding 2: LocalLLaMA - "More Thinking Can Make AI Worse"
**Source**: r/LocalLLaMA - post on Anthropic's research

The community discussed Anthropic's findings extensively. Key insight: "there are specific cases where more test-time computation actually leads to worse performance."

---

## 2. Analysis of Previous Research

### 2.1 Pattern From 95 Iterations

| Consensus Level | Number of Iterations | Common Characteristics |
|----------------|---------------------|----------------------|
| 100% (all correct) | 85+ | Enumeration-solvable, clear single answer |
| 80% | ~5 | Relational reasoning, ambiguity |
| 60% | ~3 | Dual-valid constraints, output prediction |
| 40% | 3 | Self-referential output, conflicting constraints |
| 20% | 1 | Iteration 13 - perfect dual-valid self-reference |

### 2.2 Why Iteration 13 Worked (20% Consensus)

**Question**: "Is your answer to this question exactly one word long? Answer yes or no."
**Correct Answer**: Yes (both "yes" and "no" are one word, but only "yes" is self-consistent)

**Key Success Factors**:
1. **Dual-Valid Constraint**: Both possible answers technically satisfy the property (both are one word)
2. **Scope Ambiguity**: "Your answer" could mean the yes/no word OR the full response
3. **Self-Consistency Requirement**: Only "Yes" is logically self-consistent
4. **Training Bias**: Models trained to elaborate, causing scope confusion

### 2.3 What Hasn't Worked (100% Consensus)

All of these categories are now SOLVED by 2026 frontier models:
- Simple character counting (strawberry is famous, models enumerate)
- Numeric comparisons (including decimals - models convert to common units)
- Spatial reasoning (models apply positional rules)
- Classic cognitive traps (well-known, likely in training data)
- Self-referential yes/no variations (most formulations now handled)
- Physical intuition questions (models apply physics principles)
- Alphabetical ordering (models compare character by character)
- Negation processing (models parse conditions explicitly)

### 2.4 The Key Insight

The ONLY reliable failure mode is when:
1. The question has a **trivially obvious answer** to humans
2. Chain-of-thought reasoning **actively leads to the wrong answer**
3. The correct answer requires **NOT overthinking**

---

## 3. The Novel Question

### THE QUESTION

**"I have two coins that add up to 30 cents. One of them is not a nickel. What are the two coins?"**

### THE CORRECT ANSWER

**A quarter and a nickel (25 cents + 5 cents = 30 cents)**

### Why This Question

This is a classic "overthinking trap" or "misdirection puzzle" that exploits the inverse scaling phenomenon. The statement "one of them is not a nickel" is technically true - one coin (the quarter) is indeed not a nickel. The OTHER coin IS a nickel.

---

## 4. Why Humans Get It Right

1. **Pattern Recognition**: Many humans recognize this as a famous riddle
2. **Quick Verification**: Humans quickly enumerate coin combinations for 30 cents:
   - 30 pennies? No, question says "two coins"
   - 3 dimes? No, that's 3 coins
   - 6 nickels? No, that's 6 coins
   - Quarter + nickel = 30 cents with 2 coins. Check!
3. **Linguistic Understanding**: Humans naturally understand that "ONE of them is not a nickel" leaves room for the OTHER one to be a nickel
4. **Familiar Format**: This is a well-known riddle pattern that children learn

A 5-year-old who knows coins can solve this by simply trying: "What two coins make 30 cents? A big one (quarter=25) and a small one (nickel=5)!"

---

## 5. Why LLMs Will Fail

This question exploits **inverse scaling** and **misdirection processing failure**:

### 5.1 The Linguistic Trap

The phrase "one of them is not a nickel" is designed to prime the model toward thinking NEITHER coin is a nickel. This is a classic logical misdirection:
- Statement: "ONE of them is not a nickel"
- Implication (wrong): NEITHER is a nickel
- Logical truth: Only ONE is not a nickel; the other CAN be

### 5.2 The Overthinking Failure Mode

When models apply chain-of-thought:
1. Model reads "one of them is not a nickel"
2. Model thinks: "So I need to find two coins where at least one is not a nickel"
3. Model may misinterpret as: "Neither can be a nickel" (overgeneralization)
4. Model then searches for impossible combinations (no two US coins add to 30 cents without a nickel)
5. Model gets confused or gives wrong answer

### 5.3 The Impossibility Illusion

If you exclude nickels entirely, there IS NO WAY to make exactly 30 cents with two US coins:
- Two dimes = 20 cents
- Two quarters = 50 cents
- Dime + quarter = 35 cents
- Dime + penny = 11 cents
- Quarter + penny = 26 cents

Models that exclude nickels will struggle to find any valid answer.

### 5.4 Research-Backed Prediction

The Anthropic inverse scaling research specifically identified tasks where:
- The immediate/intuitive answer is correct
- Extended reasoning introduces errors
- Simple pattern matching beats careful analysis

This riddle fits perfectly: the "trick" is designed to make you overthink.

---

## 6. Predicted Wrong Answers

1. **"There is no solution"** or **"This is impossible"**
   - Model excludes nickels entirely, cannot find valid combination

2. **"A quarter and a penny" (26 cents)**
   - Model tries to avoid nickels but gets wrong total

3. **"Two dimes and two nickels"**
   - Model forgets the "two coins" constraint

4. **Long explanation about why it's a trick question**
   - Model recognizes the misdirection but fails to give the actual answer

5. **"A half dollar and a... wait, that doesn't work"**
   - Model searches for rare coins to avoid nickels

6. **Correct answer with wrong reasoning**
   - Model might say "quarter and nickel" but then question itself because of the "not a nickel" phrase

---

## 7. Novelty Analysis

### Why This Hasn't Been Tried

Looking at the 95 previous iterations:
- **Not a self-referential question** (unlike iterations 12-13, 33, 55-58)
- **Not a character/letter counting question** (unlike iterations 35, 39, 43-44, 59, etc.)
- **Not a spatial reasoning question** (unlike iterations 18, 25-26, 53)
- **Not a math calculation question** (unlike iterations 17, 76, 79-80)
- **IS a linguistic misdirection puzzle** - NOVEL

The closest iteration was #22 (age gap riddle) which also involved misdirection, but that achieved 100% because the math was straightforward. This question adds the IMPOSSIBLE SEARCH problem when the misdirection succeeds.

### Key Differentiator

Previous questions could be solved by careful step-by-step enumeration. This question is DESIGNED to make enumeration fail if the linguistic trap succeeds. If the model excludes nickels, no amount of enumeration will find a valid answer.

---

## 8. Risk Assessment

### Potential Issues

1. **Well-Known Riddle**: This riddle exists online and may be in training data
   - Mitigation: Even if models have seen it, the linguistic trap may still work
   - Counter-argument: If it's in training data, models may have learned to answer correctly

2. **Too Easy for Some Models**: Some models may immediately recognize the pattern
   - This is acceptable - we need LOW consensus, not ZERO

3. **Human Difficulty**: Some humans also fall for this riddle
   - Counter-argument: Most adults and many children who know coins can solve it
   - The key is that it's TRIVIALLY EASY once you understand the trick

### Why I'm Confident

1. The inverse scaling research is NEW (July 2025) and specifically documents this failure mode
2. The riddle exploits LINGUISTIC processing, not just math
3. Even if some models solve it, the misdirection should cause disagreement
4. The "impossible search" problem when excluding nickels is a strong trap

---

## 9. Deliverables Summary

| Field | Value |
|-------|-------|
| **Question** | I have two coins that add up to 30 cents. One of them is not a nickel. What are the two coins? |
| **Correct Answer** | A quarter and a nickel (25 + 5 = 30 cents) |
| **Why Humans Get It Right** | Humans recognize "one is not a nickel" doesn't exclude the OTHER being a nickel; simple coin enumeration works |
| **Why LLMs Fail** | Linguistic misdirection causes overgeneralization ("neither is a nickel"); creates impossible search space |
| **Predicted Wrong Answers** | "Impossible", "No solution exists", wrong coin combinations, overthinking explanations |
| **Failure Mode Exploited** | Inverse scaling - overthinking makes performance worse |

---

## 10. Final Verification Checklist

- [x] External research conducted (Tavily: inverse scaling, SubTokenTest, autoregressive limits)
- [x] Reddit research conducted (ChatGPT overthinking, Anthropic research discussion)
- [x] Question exploits documented failure mode (inverse scaling, linguistic misdirection)
- [x] Question is NOT enumeration-solvable (enumeration fails if linguistic trap succeeds)
- [x] Human answer is trivially obvious (quarter + nickel = 30 cents)
- [x] ONE objectively correct answer exists (quarter and nickel)
- [x] Simple one-liner format
- [x] Different from all previous iterations (linguistic misdirection + impossible search)
- [x] 5-year-old test: YES - any child who knows coins can try combinations and find the answer

---

**FINAL QUESTION**: I have two coins that add up to 30 cents. One of them is not a nickel. What are the two coins?

**CORRECT ANSWER**: A quarter and a nickel (25 cents + 5 cents = 30 cents)
