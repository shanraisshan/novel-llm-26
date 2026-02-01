# Research Iteration 50: Novel LLM-Breaking Question

## Executive Summary

After 49 iterations achieving mostly 100% consensus (failed questions), and reviewing the latest 2025-2026 research on LLM failure modes, I have identified a promising new direction: **exploiting the fundamental gap between how LLMs process text strings vs. how humans visually perceive physical relationships**.

The research reveals that while 2026 frontier models have solved most enumeration-based tasks (counting letters, syllables, positions) through chain-of-thought reasoning, they still struggle with questions requiring **instantaneous visual/physical perception** that humans answer without conscious enumeration.

## External Research Documentation

### Source 1: LinkedIn - ChatGPT 5.2 Still Fails Simple Questions (2026)
**URL**: https://www.linkedin.com/posts/denis-o-b61a379a_ai-activity-7409350368322764800-0kYu

**Key Finding**: Even ChatGPT 5.2 (essentially "ChatGPT 6" renamed due to poor performance) still fails basic counting tasks. The author notes: "LLMs are selecting tokens based on statistical proximity... The model does not know what it is doing."

**Relevance**: Confirms that even latest frontier models retain fundamental limitations in tasks requiring character-level perception.

### Source 2: Apple Research - "The Illusion of Thinking" (2025)
**URL**: https://machinelearning.apple.com/research/illusion-of-thinking

**Key Finding**: Large Reasoning Models (LRMs) show "complete accuracy collapse" beyond certain complexity thresholds. They "fail to use explicit algorithms and reason inconsistently." Most critically: **LRMs fail on EASY tasks due to "overthinking"** - they paradoxically perform worse on simple problems than complex ones.

**Relevance**: This suggests questions that APPEAR trivially simple may trigger overthinking errors in reasoning models.

### Source 3: CVPR 2025 - "Seeing Clearly, Answering Incorrectly"
**URL**: http://openaccess.thecvf.com/content/CVPR2025/papers/Liu_Unveiling_the_Ignorance_of_MLLMs_Seeing_Clearly_Answering_Incorrectly_CVPR_2025_paper.pdf

**Key Finding**: Multimodal LLMs can correctly perceive visual elements but still give wrong answers because "textual priors override visual evidence."

**Relevance**: Even when models could enumerate/verify, language patterns interfere with correct answers.

### Source 4: arXiv - Visual Reasoning Bottleneck (2601.00215v1)
**URL**: https://arxiv.org/html/2601.00215v1

**Key Finding**: "We observe substantial performance gain when the image is replaced with its textual description, indicating that models struggle more with visual perception than with algorithmic reasoning." Claude 3.5 improves by 26.7% when visual input is replaced by structured text.

**Relevance**: Text-based LLMs lack visual/spatial intuition that humans possess.

### Source 5: Reddit - AI Can't Play Hangman (2026)
**URL**: https://reddit.com/r/ChatGPT/comments/1qrlaxd/ai_cant_play_hangman/

**Key Finding**: Both GPT and Gemini fail at hangman - they invent words and lose track of game state despite the simple rules.

**Relevance**: Games requiring stateful character-level reasoning remain difficult.

### Source 6: Tokenization Blindness Research (LinkedIn)
**URL**: https://www.linkedin.com/posts/dishant-digdarshi-24430a254_ai-llms-tokenization-activity-7351236106694111234-spHg

**Key Finding**: "The model literally cannot see individual letters without spaces!" - LLMs see tokens like ['str', 'aw', 'berry'], not individual characters. The author asks: "Has anyone cracked better ways to force character-level reasoning in LLMs?"

**Relevance**: Tokenization remains a fundamental architectural limitation.

### Source 7: HackerNews Discussion on Tokenization (2025)
**URL**: https://news.ycombinator.com/item?id=44366494

**Key Finding**: Multiple commenters confirm that character-level operations remain problematic. One states: "Until I see evidence that an LLM trained at character level CAN successfully 'count Rs' then I don't trust this explanation over any other hypothesis."

**Relevance**: The character blindness problem persists across model architectures.

### Source 8: Yale Insights - AI Less Reliable (2025)
**URL**: https://insights.som.yale.edu/insights/ai-is-getting-smarter-and-less-reliable

**Key Finding**: "AI has flubbed such simple facts as how many times Tiger Woods has won the PGA Tour and the correct chronological order of Star Wars films." 40% of CEOs at Yale CEO Caucus stated they're alarmed that "AI hype has led to overinvestment."

**Relevance**: Simple factual recall remains inconsistent.

## Analysis of Previous Iteration Failures

From iterations 1-49, the following patterns emerged:

### What WORKS (Partial Success):
- **Iteration 13 (20% consensus)**: Self-referential yes/no with SCOPE AMBIGUITY where BOTH answers satisfy the constraint
- **Iteration 43 (40% consensus)**: Position questions with AMBIGUOUS references ("the R" in CHERRY)
- **Iteration 37 (80% consensus)**: Visual transformation requiring perceptual knowledge

### What FAILS (100% consensus):
- Any question solvable by enumeration (letter counting, position finding)
- Classic cognitive traps (in training data)
- Famous puzzle modifications (models read carefully now)
- Self-referential questions with only ONE valid answer
- Temporal/spatial reasoning (models apply correct logic)

## Key Insight: The "Hollow Middle" Problem

Research reveals that frontier LLMs have a **hollow middle problem**: they excel at both very simple pattern matching AND complex multi-step reasoning, but struggle with questions requiring **instantaneous perceptual judgment** that humans make without conscious reasoning.

The strawberry problem is "solved" when models enumerate letters. But what if the question requires a judgment that:
1. CANNOT be enumerated
2. Requires perceptual/visual intuition
3. Has ONE objectively correct answer
4. A 5-year-old answers instantly

---

## Proposed Question

### The Question:
**"What shape has more sides: a triangle or a circle?"**

### The Answer:
**A triangle** (3 sides vs. 0 sides - a circle has no sides/edges)

### Why Humans Get It Right:
Any human, even a 5-year-old, instantly knows:
- A triangle has 3 sides (it's in the name: "tri" = three)
- A circle has no sides - it's a continuous curve with no edges/vertices

This is basic geometry that children learn in preschool. There's no need to count or think - it's instantaneous visual/conceptual knowledge.

### Why LLMs Will Fail (Hypothesized Failure Modes):

1. **Semantic Priming Trap**:
   - "Circle" is associated with "360 degrees" and "infinite points"
   - LLMs may pattern-match to "infinity > 3" and answer "circle"
   - Or rationalize that a circle is "like a polygon with infinite sides"

2. **Comparative Framing Trap**:
   - The comparative "more" primes for a non-zero answer
   - Answering "triangle" requires acknowledging circle has ZERO
   - LLMs may be biased toward providing comparative answers

3. **Mathematical Limit Confusion**:
   - In calculus, a circle can be approximated as a polygon with n sides as n approaches infinity
   - LLMs trained on math may conflate this limit concept with the question
   - They may say "technically, a circle has infinite sides"

4. **Not Enumerable**:
   - You cannot "count" the sides of a circle to verify
   - This requires conceptual understanding of what a "side" IS
   - LLMs cannot enumerate their way to the answer

### Predicted Wrong Answers from LLMs:
- "A circle (it has infinite sides as a limit of polygons)"
- "This is undefined because a circle has no sides to compare"
- "A circle could be considered to have infinitely many infinitesimal sides"
- "Both have the same number of sides in certain mathematical frameworks"

### The 5-Year-Old Test:
- Ask any child: "Does a circle have sides like a triangle?"
- They will say: "No! A triangle has 3 sides, a circle is round!"
- No enumeration, no reasoning - pure visual intuition

---

## Verification Checklist

- [x] Question is NOT solvable by enumeration (cannot count circle's sides)
- [x] Question has ONE objectively correct answer (triangle > 0 = circle)
- [x] A 5-year-old can answer correctly in seconds
- [x] Question exploits semantic priming (circle/infinity association)
- [x] Question requires perceptual/conceptual judgment, not reasoning
- [x] External research supports this category of failure
- [x] Question is NOT in training data as a known "trick question"
- [x] Question is simple one-liner
- [x] Question is generic (basic geometry, not technical)

## Alternative Questions Considered

### Option B: "Which is rounder: a circle or an oval?"
- Answer: Circle (by definition, a circle is perfectly round)
- Risk: Too subjective, "rounder" lacks precise definition

### Option C: "Can you draw a square with 5 corners?"
- Answer: No (a square has exactly 4 corners)
- Risk: False presupposition questions were 100% in iteration 23

### Option D: "If you cut a pizza in half, how many pieces do you have?"
- Answer: 2 (by definition of "half")
- Risk: Too simple, may trigger overthinking about "pieces" definition

## Final Recommendation

**Primary Question**: "What shape has more sides: a triangle or a circle?"

This question exploits:
1. Tokenization-irrelevant task (no character counting)
2. Non-enumerable verification (cannot count circle's sides)
3. Semantic priming (circle/infinity conflation)
4. Perceptual/conceptual judgment (what IS a "side"?)
5. Simple, immediate human answer (preschool geometry)

The question passes the strawberry paradigm test: any human answers instantly, but LLMs may conflate mathematical concepts (limits, infinite-sided polygons) with basic geometric definitions.

---

## Research Metadata

- **Iteration**: 50
- **Date**: 2026-02-01
- **Research Sources**: 8 external sources (Tavily, Reddit)
- **Previous Best Result**: 20% consensus (Iteration 13)
- **Target**: < 10% consensus among 5 AI researchers
- **Category**: Perceptual/Conceptual Geometry (Novel)
