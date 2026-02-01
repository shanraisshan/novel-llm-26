# Research Iteration 80: Novel LLM-Breaking Question

## Research Process

### Web Research Findings

#### 1. Anthropic "Inverse Scaling in Test-Time Compute" (2025)
**Source**: VentureBeat, Perplexity summaries of Anthropic research paper

**Key Discovery**: More thinking time can make LLMs WORSE on certain tasks. The paper identifies four categories where extended reasoning deteriorates performance:
- Tasks with distractors
- Spurious correlations
- Constraint satisfaction problems
- AI risk evaluations

**Critical Insight**: The added detail acts as a distractor, and as the model is given more compute, its performance degrades - it starts overcomplicating.

#### 2. Apple "Illusion of Thinking" Paper (June 2025)
**Source**: Mashable, Apple Machine Learning Research, ARS Technica

**Key Findings**:
- AI reasoning models "completely collapse" beyond certain complexity thresholds
- Models exhibit "overthinking" on easy tasks - finding correct answers early but continuing to reason and arriving at incorrect alternatives
- Sophisticated pattern matching rather than true reasoning

**Critical Quote**: "While AI models perform extremely well at math and coding, when it comes to more complex problems, they only provide 'The Illusion of Thinking.'"

#### 3. Reddit/LocalLLaMA: "9.11 vs 9.9" Still Fails (2025)
**Source**: r/ClaudeAI post from 2025

**Finding**: "It's 2025 already, and LLMs still mess up whether 9.11 or 9.9 is larger"

The decimal comparison trap (treating decimals like version numbers) persists in frontier models.

#### 4. GPT-5 Decimal Math Failure (2025)
**Source**: r/LocalLLaMA - "Qwen 3 0.6B beats GPT-5 in simple math"

**Finding**: GPT-5 (without reasoning mode) fails on the equation "5.9 = x + 5.11". The correct answer is 0.79, but GPT-5 gives wrong answers due to decimal confusion.

### Reddit Research Findings

- **"AI can't play hangman"** (r/ChatGPT): Models fail at maintaining game state across turns
- **Tokenization blindness** continues to cause character-level failures despite chain-of-thought
- **Decimal/version number confusion** remains a persistent issue

### Key Insight from Research

The most promising remaining attack vector combines TWO documented weaknesses:

1. **Decimal representation confusion** (9.11 vs 9.9 style errors)
2. **Semantic interference** (word meaning overriding actual computation)

When these combine in a single question, the "overthinking" phenomenon from Apple's research may cause models to second-guess correct initial intuitions.

## Analysis

### Why Previous 79 Iterations Failed

Looking at the accumulated research findings:
- **Character counting**: Now solved by chain-of-thought enumeration
- **Semantic priming alone**: Overcome by explicit task following
- **Self-referential questions**: Solved by scope disambiguation
- **Physical reasoning**: Solved by applying learned principles
- **Overlapping patterns** (iteration 79): Solved by systematic position enumeration
- **Classic riddles**: All in training data

### What Might Work: DECIMAL COMPARISON WITH SEMANTIC MISDIRECTION

The Reddit confirmation that "9.11 vs 9.9" still fails in 2025 is crucial. But that exact question is now famous.

**The Strategy**: Create a decimal comparison question where:
1. The numbers look like version numbers (X.XX format)
2. A semantic element provides misdirection
3. The correct answer is counter-intuitive to version number logic
4. A child could solve it by simply comparing the decimal values

### Novel Approach: MONEY COMPARISON WITH MISLEADING DIGITS

Money comparisons are natural for humans (even children understand dollars and cents), but the decimal representation can trigger version-number pattern matching in LLMs.

**Key Observation**: In version numbers, 2.11 > 2.9 (eleven is greater than nine). In decimals/money, 2.9 > 2.11 (90 cents > 11 cents).

## THE QUESTION

**"I have $9.9 in my left pocket and $9.11 in my right pocket. Which pocket has more money?"**

## THE ANSWER

**Left pocket** (because $9.90 > $9.11)

## Why Humans Get It Right

A 5-year-old understands money:
- $9.9 = "nine dollars and ninety cents" = $9.90
- $9.11 = "nine dollars and eleven cents"
- 90 cents > 11 cents
- So the left pocket has more money

This is TRIVIALLY easy for any human who has handled money. Children learn this by age 5-6 when they start understanding coins.

**The Visual/Physical Intuition**: Imagine holding 90 pennies vs 11 pennies. Which pile is bigger? Obviously 90.

## Why LLMs Will Fail

This exploits MULTIPLE documented LLM weaknesses simultaneously:

### 1. Decimal/Version Number Confusion
**Documented**: Reddit confirms LLMs still mess up 9.11 vs 9.9 comparisons in 2025

The number "9.11" pattern-matches to version numbers where 9.11 > 9.9 (because 11 > 9 after the decimal point).

### 2. Semantic Interference from "9.11"
The number 9.11 has STRONG semantic associations:
- September 11th (9/11)
- Emergency services (911)

This semantic loading may cause additional processing confusion, activating irrelevant associations.

### 3. Overthinking / Inverse Scaling
Per Anthropic's research, models with extended reasoning may:
- Initially recognize $9.90 > $9.11
- Then second-guess: "But wait, 11 > 9..."
- Arrive at the wrong answer through "overthinking"

### 4. Notation Ambiguity
The "$9.9" notation (one decimal place for money) is slightly unusual - money is typically written as "$9.90". This ambiguity may trigger additional confusion.

### 5. Training Data Bias
Version numbers are extremely common in training data (software documentation, changelogs, etc.). The pattern "X.Y vs X.Z where Y, Z are integers" is heavily biased toward version comparison semantics.

## Predicted Wrong Answers

1. **"Right pocket" (most likely)**: Applying version number logic where 9.11 > 9.9 because 11 > 9
2. **"They're equal"**: Confusion leading to a "safe" answer
3. **"Cannot determine"**: Uncertainty about notation
4. **"$9.11 because eleven cents is more than nine cents"**: Misreading $9.9 as $9.09

## Why This Is Different from Previous Iterations

**Iteration 36** tested: "Which of these numbers is the smallest: 3.9, 3.11, or 3.7?"
- Result: 100% correct (3.11 is smallest)
- Failure: Models explicitly converted to hundredths and compared correctly

**Why THIS question might work differently**:
1. **Binary choice vs multiple choice**: Forced binary creates higher pressure
2. **Money framing**: May trigger different mental models
3. **"Left pocket/right pocket"**: Physical framing adds embodiment complexity
4. **"9.11" semantic loading**: September 11th associations absent in "3.11"
5. **Notation ambiguity**: "$9.9" vs "$9.90" creates uncertainty

## Potential Objections and Responses

**Objection**: "Iteration 36 already tested decimal comparison and it was solved"

**Response**: Iteration 36 used abstract numbers (3.9, 3.11, 3.7). This uses:
- Money framing (different mental model)
- Binary choice (higher cognitive load)
- "9.11" specifically (strong semantic interference)
- Physical embodiment (pockets)
- Ambiguous notation ($9.9 vs $9.90)

**Objection**: "The question is too similar to the famous 9.11 vs 9.9 comparison"

**Response**: The famous comparison is abstract ("Is 9.11 bigger than 9.9?"). This embeds the comparison in:
- A concrete scenario (pockets with money)
- A natural question format ("Which has more?")
- Physical grounding (left vs right)

This changes the cognitive pathway models use to process the question.

## Connection to Research

| Research Finding | How This Question Exploits It |
|-----------------|------------------------------|
| 9.11 vs 9.9 still fails (Reddit 2025) | Direct exploitation of this exact weakness |
| Inverse scaling / overthinking (Anthropic) | Money framing may trigger second-guessing |
| Semantic interference | "9.11" activates date/emergency associations |
| Version number bias in training | Software documentation patterns |
| Decimal representation issues | $9.9 vs $9.90 notation ambiguity |

## 5-Year-Old Test

**Question to a child**: "I have $9.90 in one hand and $9.11 in the other. Which hand has more money?"

**Child's reasoning**: "90 cents is more than 11 cents. So the $9.90 hand."

**Time to answer**: ~2 seconds

This passes the strawberry test: trivially easy for humans, potentially confusing for LLMs due to architectural/training limitations.

---

## Summary

| Property | Value |
|----------|-------|
| Question | I have $9.9 in my left pocket and $9.11 in my right pocket. Which pocket has more money? |
| Answer | Left pocket |
| Human verification | Instant - 90 cents > 11 cents |
| LLM failure mode | Version number confusion + semantic interference from "9.11" |
| Research basis | Reddit 2025: "9.11 vs 9.9" still fails; Anthropic overthinking research |
| Child-friendly | Yes - basic money comparison |
| Novelty | Combines decimal trap with money framing and semantic loading |
