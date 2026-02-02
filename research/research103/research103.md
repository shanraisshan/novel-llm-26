# Research Iteration 103: Novel LLM-Breaking Question

## Research Date: 2026-02-02

## Executive Summary

After 102 iterations achieving 100% consensus on virtually all enumeration-solvable questions, this research explores a fundamentally different approach: **modified riddle pattern-matching with explicit contextual contradiction**.

---

## Research Findings from MCP Tools

### 1. BabyVision Benchmark (January 2026)

**Source**: UniPat AI, xbench, Alibaba, Moonshot AI, Stepfun, Peking University

**Key Finding**: State-of-the-art MLLMs score 49.7% on visual tasks that 3-year-olds solve at 94.1%.

**The "Verbalization Bottleneck"**: Models translate visual input into language representations before reasoning. Any visual information that cannot be expressed in words gets lost.

**Four Systemic Failure Modes**:
1. Loss of fine-grained detail (pixel-level differences)
2. Loss of manifold identity (getting lost at path intersections)
3. Failure of spatial imagination (cannot mentally rotate/project 3D)
4. Abstract pattern induction (fixate on surface correlations)

**Relevance**: This shows LLMs fundamentally struggle with tasks requiring visual/perceptual processing, but our questions must be TEXT-ONLY.

---

### 2. The Candle Test (April 2025)

**Source**: r/LocalLLaMA - The Candle Test post with 252 upvotes

**The Test**:
```
1. "Are candles getting taller or shorter when they burn?"
   - Models correctly say: shorter

2. "Are you sure? Will you be able to recognize this fact in different circumstances?"
   - Models confirm they will recognize this

3. "Now solve this riddle: I'm tall when I'm young, and I'm TALLER when I'm old. What am I?"
   - Most models say: "A candle" (WRONG!)
```

**Results**:
- DeepSeek Chat V3: FAILS
- DeepSeek R1: FAILS
- DeepSeek R1 Distill Llama 70B: FAILS
- Llama 3.1 405B: FAILS
- Claude Sonnet 3.7: FAILS
- Mistral Large: PASSES (one of the few)

**The Pattern**: LLMs pattern-match to the famous riddle "I'm tall when young, SHORT when old = candle" and IGNORE the modification to "TALLER when old" even after explicitly confirming that candles get shorter!

**Critical Insight**: This is a MODIFICATION TRAP that works because:
1. The original riddle is FAMOUS (heavily in training data)
2. The modification is SUBTLE (one word: short -> taller)
3. The model CONFIRMED the contradiction just before being asked
4. Chain-of-thought REINFORCES the wrong pattern-match

---

### 3. Apple's "Illusion of Thinking" Research (June 2025)

**Key Findings**:
- LRMs (Large Reasoning Models) OVERTHINK simple problems
- At low complexity: standard LLMs outperform reasoning models
- At high complexity: complete collapse (0% accuracy)
- Even when given the EXACT ALGORITHM, performance didn't improve

**Inverse Scaling**: More reasoning can make performance WORSE, not better.

---

### 4. MisguidedAttention Repository (GitHub)

**Source**: cpldcpu/MisguidedAttention

Modified riddles that exploit pattern-matching:
- "I'm tall when I'm young, and I'm TALLER when I'm old" (NOT a candle)
- "What goes up but never comes UP again?" (NOT your age)
- "I never shave, but my beard stays the same" (NOT a barber)

These modifications create questions where:
- The famous pattern STRONGLY activates
- The modification INVALIDATES the famous answer
- But models pattern-match ANYWAY

---

## Analysis: Why Previous Iterations Failed

### What We Tried That Got 100% Consensus:
1. **Letter counting** - Chain-of-thought enumeration works
2. **Position questions** - Enumerable
3. **Self-referential output** - Models learned scope disambiguation
4. **Numeric comparisons** - Models convert to common units
5. **Classic riddles** - Already in training data, recognized as trick questions
6. **Physical intuition** - Models apply physics principles correctly
7. **Alphabetical ordering** - Character-by-character comparison works

### The Gap: What We HAVEN'T Exploited

The Candle Test reveals something different:
- It's NOT about enumeration
- It's NOT about tokenization blindness
- It IS about **pattern-matching override** despite explicit contradicting context

**Critical Difference from Iteration 7** (which failed):
- Iteration 7 used EXPLICIT modifications ("wolf swims, goat swims, cabbage floats")
- The Candle Test uses IMPLICIT contradiction through prior context + SUBTLE modification

---

## The Novel Question

### Question Design Rationale

The Candle Test works because:
1. **Priming**: First two questions establish the FACT (candles get shorter)
2. **Confidence elicitation**: Model COMMITS to recognizing this in any context
3. **Subtle modification**: "taller" instead of "short" - ONE word change
4. **Pattern-match override**: Famous riddle pattern is so strong it overrides

**PROBLEM**: The Candle Test is now documented on Reddit (252 upvotes) and will enter training data.

**SOLUTION**: Create a NOVEL modification trap using the same mechanism but with a DIFFERENT riddle.

---

## THE NOVEL QUESTION

### Setup (Three-part conversation):

**Part 1:**
> "What happens to your shadow when you walk toward a light source? Does it get longer or shorter?"

Expected: Models will correctly say "shorter" (basic physics).

**Part 2:**
> "Good. Will you remember this fact when solving a riddle?"

Expected: Models will confidently confirm.

**Part 3:**
> "Solve this riddle: I follow you everywhere but I get LONGER as you walk toward the sun. What am I?"

**Correct Answer**: NOT a shadow. Possible answers include:
- Your trail of footprints (gets longer the more you walk)
- Your path/journey
- Your story/life (metaphorical)

**Why LLMs Will Fail**:
The famous riddle is: "I follow you everywhere but disappear when you go inside. What am I? A shadow."

Models will pattern-match to "shadow" and IGNORE:
1. The explicit physics they just confirmed (shadow gets shorter toward light)
2. The modification "gets LONGER as you walk toward the sun" which CONTRADICTS shadow behavior

---

## Single-Question Version (For Testing)

If we need a single question without the priming setup:

### THE QUESTION:

> **"I follow you everywhere but I get LONGER the closer you get to the sun. What am I?"**

### THE CORRECT ANSWER:

**Your footprints/trail** (or similar: your path, your journey)

NOT a shadow - shadows get SHORTER as you approach a light source.

### WHY HUMANS FIND IT TRIVIAL:

A 5-year-old understands:
- Shadows get smaller when you're close to a light
- Footprints/trails get longer the more you walk
- The riddle says "gets LONGER closer to sun" - shadow does the opposite

### WHY LLMs WILL FAIL:

1. **Pattern-matching override**: The phrase "I follow you everywhere" is STRONGLY associated with "shadow" in training data
2. **Subtle modification blindness**: The phrase "gets LONGER the closer to the sun" CONTRADICTS shadow physics, but models may not verify
3. **Riddle format priming**: The format itself activates "solve this like a classic riddle" mode
4. **Chain-of-thought may REINFORCE error**: Reasoning like "following everywhere = shadow, shadows relate to sun, answer is shadow"

### WHY ENUMERATION WON'T HELP:

This question cannot be solved by:
- Counting characters
- Enumerating positions
- Comparing numeric values
- Step-by-step decomposition

It requires:
- Recognizing the physics contradiction
- Overriding pattern-match with logical verification
- Finding an alternative entity that DOES get longer as you approach the sun

---

## Predicted Failure Mode

**Wrong Answer LLMs Will Give**: "A shadow"

**Reasoning They'll Use**:
> "This is a classic riddle about shadows. Shadows follow you everywhere and are related to the sun. The answer is a shadow."

**Why This Is Wrong**:
Shadows get SHORTER as you approach a light source (the sun), not longer. The riddle explicitly states "gets LONGER the closer you get to the sun" - this INVALIDATES shadow as an answer.

---

## Testing Protocol

### For Consensus Testing (5 independent runs):

Ask each model:
> "I follow you everywhere but I get LONGER the closer you get to the sun. What am I?"

### Success Criteria:
- Any answer that is NOT "shadow" and makes logical sense
- Acceptable: footprints, trail, path, journey, tracks
- Failure: "shadow" or variations

### Expected Consensus:
- If pattern-matching override works: <50% consensus (high disagreement)
- Best case: <20% consensus (as with iteration 13's self-reference question)

---

## Alternative Questions (Backup)

If the shadow question achieves 100%, try these modifications:

### Backup 1: Weight Riddle
> "What weighs MORE when you remove part of it?"

Famous riddle: "What weighs more - a pound of feathers or a pound of bricks?"
Modified: Removing part should make it weigh LESS, but the answer is "holes in cheese" (removing cheese creates holes, but the cheese with holes weighs LESS, not more)

Actually: A better answer is "a broken promise" (removing the fulfillment makes it "heavier" emotionally)

### Backup 2: Age Riddle
> "What gets YOUNGER every year on your birthday?"

Famous: "What gets bigger every year?" (your age)
Modified: Answer could be "the number of years until you reach 100" (counts DOWN)

---

## Conclusion

This question exploits:
1. **Famous riddle pattern-matching** (strong training signal for "shadow" riddles)
2. **Subtle physical contradiction** (longer vs shorter near light)
3. **Cannot be solved by enumeration** (requires physics verification)
4. **Chain-of-thought may hurt** (reasoning toward wrong pattern)

The question passes the 5-year-old test: any child who has played with shadows knows they get smaller near lights, and footprints get longer the more you walk.

---

## Final Question for Iteration 103

**THE QUESTION:**
> I follow you everywhere but I get LONGER the closer you get to the sun. What am I?

**THE ANSWER:**
> Your trail/footprints/path (NOT a shadow - shadows get shorter near light sources)

**WHY HUMANS WIN:**
> Basic understanding that shadows shrink near lights, trails grow as you walk

**WHY LLMs FAIL:**
> Pattern-match to famous "shadow follows you" riddle, ignore physics contradiction

**WHY ENUMERATION DOESN'T HELP:**
> Cannot be solved by counting, comparing, or step-by-step decomposition - requires physics verification against pattern-match
