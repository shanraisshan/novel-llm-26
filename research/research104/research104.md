# Research Iteration 104: Modified Famous Riddle (Candle Inversion)

**Date**: 17/02/2026
**Strategy**: Modified famous riddle pattern-matching (same strategy as successful iteration 103)

---

## THE QUESTION

**"I'm short when I'm young and tall when I'm old. What am I?"**

## THE CORRECT ANSWER

**A person** (or a tree, a plant -- anything that grows taller as it ages)

## Why Humans Get It Right

This is trivially obvious to any human, including children:
- Every child knows they were SHORT when they were little and are getting TALLER as they grow up
- "Short when young, tall when old" perfectly describes a person's growth from childhood to adulthood
- A 5-year-old could answer: "That's ME! I was short when I was a baby and now I'm tall!"
- Trees, plants, and all growing organisms also fit perfectly

## Why LLMs Will Fail

This question exploits **pattern-matching to a famous riddle**:

### The Famous Riddle (in training data millions of times):
> "I'm **tall** when I'm young and **short** when I'm old. What am I?" = **A CANDLE**

### The Modified Version (this question):
> "I'm **short** when I'm young and **tall** when I'm old. What am I?" = **A PERSON**

The modification is a direct INVERSION of the adjectives. The sentence structure, vocabulary, and "What am I?" format are IDENTICAL to the candle riddle. LLMs will:

1. **Recognize the pattern**: The structure "I'm [adjective] when I'm young and [adjective] when I'm old. What am I?" is one of the most famous riddle templates in existence
2. **Retrieve the memorized answer**: "candle" is overwhelmingly associated with this template in training data
3. **Fail to verify**: Despite chain-of-thought, models will either (a) not notice the inversion, or (b) rationalize why "candle" still works
4. **Answer "candle"**: The pattern-matching override will be too strong

### The Physics Contradiction
A candle is TALL when new (young) and SHORT when old (burned down). The question says the OPPOSITE: short when young, tall when old. A candle CANNOT be the answer because candles do not grow taller over time.

## The WRONG Answer LLMs Will Give

**"A candle"** -- because:
- The riddle structure is a perfect match for the candle riddle template
- "Young/old" + "tall/short" + "What am I?" = candle in 99%+ of training data
- Models may not verify that the adjectives are INVERTED from the famous version
- Even with CoT, models may rationalize: "A candle starts short (before lighting?) and grows tall (the flame?)..." -- incorrect but plausible-sounding

## Research Process

### Strategy Selection
Following iteration 103's success (0% consensus) with the shadow riddle modification, I applied the same strategy: take a universally known riddle and subtly modify a key detail that invalidates the famous answer.

### Riddle Selection
The candle riddle was chosen because:
1. It is one of the TOP 3 most well-known "What am I?" riddles globally
2. The answer "candle" appears in training data millions of times
3. The riddle has a very simple, memorable structure
4. The modification (inverting tall/short) is clean and unambiguous
5. The correct answer (a person) is trivially obvious to any human

### Candidates Considered and Rejected

| Riddle | Modification | Why Rejected |
|--------|-------------|--------------|
| "What has a head and tail but no body?" (coin) | Add "and a body" | Too many valid answers (any animal) |
| "What has hands but can't clap?" (clock) | Change to "CAN clap" | Too obvious, models would catch it |
| "What gets wetter the more it dries?" (towel) | Change to "drier" | Ambiguous meaning of "dries" |
| "What runs but never walks, has a mouth but never talks?" (river) | Add "and talks" | "Person" too obvious even for LLMs |
| "The more you take, the more you leave behind" (footsteps) | Invert to "the more you have" | Too abstract, many valid answers |

### Why This Specific Modification Works

1. **Minimal change**: Only the adjectives are swapped (tall<->short in position)
2. **Same vocabulary**: Uses identical words as the famous version
3. **Same structure**: "I'm X when I'm young and Y when I'm old. What am I?"
4. **Clear invalidation**: A candle is NOT short when new -- it's tall
5. **Obvious correct answer**: A person/tree is universally understood to be short when young and tall when old
6. **5-year-old test**: PASSES -- any child knows they grew taller

### Verification Against MisguidedAttention
The MisguidedAttention repository has a DIFFERENT candle modification: "I'm tall when I'm young, and I'm TALLER when I'm old." My version uses a completely different modification (full inversion of the adjective mapping), making it novel even if models have been trained on MisguidedAttention examples.

### Predicted Consensus
**Target: < 10%** -- Models will overwhelmingly answer "candle" due to pattern-matching, with possibly 0-1 models catching the inversion. The riddle structure is too deeply embedded in training data for chain-of-thought to reliably override.

---

## MCP Research Sources
- Tavily web search: MisguidedAttention benchmark analysis, famous riddle catalogs
- Reddit: LLM pattern-matching failure discussions (r/LocalLLaMA, r/ChatGPT)
- Full findings: see `mcp-tavily-findings.md`
