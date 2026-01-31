# Research Iteration 19: Novel LLM-Breaking Question

## External Research Findings

### Source 1: "Evaluating Over and Underthinking in LLMs" (arXiv 2508.13141, 2025)
**Key Finding**: Reasoning models exhibit "overthinking" on simple queries where non-thinking models achieve high accuracy. The paper introduces benchmarks showing that thinking models yield "similar or even lower scores despite generating hundreds of thinking tokens."

**Relevant Insight**: LLMs fail on EASY tasks by overthinking. Simple questions that humans answer immediately can trip up models that apply excessive reasoning.

### Source 2: "The Illusion of Thinking" (Apple Research, 2025)
**Key Finding**: Large Reasoning Models (LRMs) "excel at medium-complexity tasks but paradoxically fail on both easy tasks (due to overthinking) and hard tasks." The research shows LRMs use "sophisticated pattern matching, not generalizable reasoning."

**Relevant Insight**: Pattern matching fails on novel combinations. Questions that don't match training patterns cause failure.

### Source 3: "Missing Premise exacerbates Overthinking" (arXiv 2504.06514, 2025)
**Key Finding**: When questions have missing information or implicit premises, reasoning models "display an explosive increase in response length" and fail to recognize that the question is unanswerable or requires clarification.

**Relevant Insight**: Questions with implicit information that humans naturally fill in but models don't recognize as implicit can cause divergent reasoning.

### Source 4: Reddit r/LocalLLaMA - "Qwen 3 0.6B beats GPT-5 in simple math" (2025)
**Key Finding**: Users discovered that GPT-5 fails simple arithmetic like "5.9 = x + 5.11" while smaller models succeed. The issue: overthinking and reasoning loops on trivial problems.

**Relevant Insight**: Frontier models can fail where simpler models succeed due to excessive reasoning infrastructure.

---

## Novel Question Design

### Strategy: Implicit Temporal/Physical World Knowledge

The research shows that:
1. LLMs overthink simple questions
2. LLMs pattern-match rather than reason
3. LLMs struggle with implicit premises

I will create a question that exploits **implicit physical world knowledge** that any human child understands but requires models to make unstated inferences. The question should be trivially obvious to humans but require models to either:
- Pattern-match to the wrong answer, OR
- Overthink and produce divergent reasoning, OR
- Miss the implicit physical constraint

### The Question

**"If I drop a ball and a feather at the same time in my living room, which hits the ground first?"**

### Why This Question

1. **Implicit Context**: The question says "in my living room" - humans immediately know this means normal Earth conditions with air. But models might:
   - Pattern-match to "ball and feather" physics problems (often taught in vacuum context)
   - Overthink by considering "well, it depends on the ball/feather properties..."
   - Miss that "living room" implies air resistance

2. **Famous Pattern Interference**: The "ball and feather" combination is FAMOUS in physics education for demonstrating that in a vacuum, they fall at the same rate. Models may pattern-match to this educational context.

3. **Simple for Humans**: Any child who has dropped things knows heavier/denser objects fall faster in air. The feather floats slowly.

4. **Physical World Intuition**: Humans have direct experience with this. Models must infer from text-based training.

---

## Final Question

**"If I drop a ball and a feather at the same time in my living room, which hits the ground first?"**

### The Correct Answer

**The ball hits the ground first.**

### Why Humans Get It Right

- Direct physical experience: Everyone has seen feathers float slowly
- Implicit understanding that "living room" = normal air conditions
- No need to invoke physics formulas or Galileo's experiments
- A 5-year-old knows feathers float and balls fall fast

### Why LLMs Will Fail

1. **Pattern Matching to Famous Physics Problem**: The "ball and feather" pairing is a famous physics demonstration showing that in a vacuum, they fall at the same rate. This is heavily represented in training data.

2. **Galileo's Experiment Interference**: LLMs may recall Galileo's thought experiment or Apollo 15's famous demonstration (in vacuum) and pattern-match to "they hit at the same time."

3. **Overthinking the Variables**: Models may start considering:
   - What if it's a very light ball?
   - What if it's a lead feather?
   - Need to know the masses and drag coefficients...

4. **Missing the Implicit "Air" Context**: "Living room" implicitly means air resistance is present. Humans know this instantly. Models may not privilege this implicit constraint.

5. **Educational Bias in Training Data**: Physics education heavily emphasizes the "counterintuitive" result that objects fall at the same rate regardless of mass (in vacuum). This creates a training bias toward the "same time" answer.

### Predicted Wrong Answers LLMs Will Give

1. **"They hit at the same time"** - Pattern matching to vacuum physics demonstrations
2. **"It depends on [mass/size/type of ball/feather]"** - Overthinking with unnecessary variables
3. **"In the absence of air resistance, they would hit simultaneously, but with air resistance the ball would hit first"** - Hedging that acknowledges both scenarios (shows awareness but doesn't commit to the obvious answer)

### Why This Exploits Fundamental LLM Limitations

1. **Training Data Bias**: Physics education materials disproportionately discuss the vacuum case to teach the counterintuitive principle. The "obvious" everyday case is rarely documented because it's... obvious.

2. **Pattern Matching Over Common Sense**: The word pair "ball" + "feather" + "drop" strongly activates physics-education patterns, not everyday experience patterns.

3. **Implicit Context Processing**: The phrase "in my living room" should immediately signal "normal Earth conditions with air" to a human, but models may not weight this implicit context appropriately.

4. **Overthinking Simple Questions**: Per Apple's research, this is exactly the type of simple question where reasoning models fail by applying too much analysis.

---

## Success Criteria

- Consensus score < 10% (ideally diverse answers)
- Humans answer immediately: "The ball"
- LLMs give hedged, overthought, or factually wrong answers

---

## Research Notes

This question targets the intersection of:
1. **Physical world intuition** (human advantage)
2. **Training data bias** (physics education patterns)
3. **Implicit context processing** (air resistance from "living room")
4. **Overthinking** (documented LLM failure mode on easy tasks)

Unlike previous iterations, this does NOT involve:
- Self-reference (rejected by user)
- Letter counting (solved by enumeration)
- Simple arithmetic (models reduce and solve)
- Explicit modifications (models read carefully)
- Circular arrangements (models use position arithmetic)

This IS:
- A simple one-liner a child understands
- Exploiting implicit physical world knowledge
- Targeting training data patterns that pull toward wrong answers
- Testing common sense over pattern matching
