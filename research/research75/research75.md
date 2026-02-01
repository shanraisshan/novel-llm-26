# Research Iteration 75: Novel LLM-Breaking Question

## Executive Summary

After 74 iterations with the last 10 achieving 100% consensus (all models answering correctly), we need a fundamentally different approach. My MCP research identified **inverse scaling** and **physical world intuition** as promising failure modes for 2026 frontier models.

The key insight: Questions that are trivially obvious to humans due to **embodied physical experience** but require LLMs to reason about the physical world without ever having experienced it.

## MCP Research Conducted

### Tavily Searches

1. **"LLM failures simple questions 2025 2026 benchmark"**
   - Found research on LLM-on-LLM evaluation failures
   - Critical thinking benchmarks still show gaps

2. **"GPT Claude simple counting errors tokenization blindness 2025"**
   - Tokenization blindness confirmed but now solved via chain-of-thought
   - Modern models overcome counting via explicit enumeration

3. **"inverse scaling LLM more thinking worse performance 2025"** (CRITICAL)
   - Anthropic paper: "Inverse Scaling in Test-Time Compute"
   - VentureBeat: "More thinking can make models dumber"
   - Claude especially affected: "do worse with more reasoning"
   - Deduction tasks show worst inverse scaling

4. **"LLM failure mode physical intuition embodied reasoning common sense 2025"**
   - Cosmos-Reason1 paper: LLMs lack "intuitive sense of cause and effect"
   - Six Fallacies paper: "Without lived experience, models struggle"
   - Fundamental weakness: "lack of embodied interaction"

5. **"LLM fails simple visual perception physical world common sense 2025"**
   - llm-quiz.com: "LLMs lack fundamental spatial awareness"
   - Chain-of-thought, self-consistency, tree-of-thoughts FAIL on spatial tasks
   - Spatial reasoning cannot be solved by standard reasoning techniques

### Reddit Research

1. **r/LocalLLaMA on Inverse Scaling** (446 upvotes)
   - Confirmed: more compute = worse results on certain tasks
   - Extended reasoning increases errors on deduction

2. **r/ClaudeAI on Strawberry Problem** (783 upvotes)
   - Strawberry trap still exists for ChatGPT
   - Claude handles basic counting better

3. **Apple "Illusion of Thinking" Discussion**
   - Models fail on puzzles despite extended thinking
   - "Every reasoning model has a complexity cliff"

## Question Development

### Analysis of Previous Failures

The last 10 iterations (65-74) achieved 100% consensus because:
- Self-referential output properties are now fully solved
- Character counting is solved via explicit enumeration
- Phonological questions are solved via training data
- Spatial questions that can be converted to math are solved

### Key Insight from Research

The research reveals that:
1. **Physical world intuition** is a fundamental LLM weakness
2. **Inverse scaling** means overthinking can hurt accuracy
3. **Questions that can't be enumerated** remain challenging
4. **Embodied common sense** requires lived experience LLMs don't have

### Question Design Strategy

I need a question that:
1. Any 5-year-old can answer from everyday experience
2. Has ONE clear, unambiguous answer
3. Cannot be solved by enumeration or step-by-step reasoning
4. Requires physical/embodied intuition about the real world
5. May trigger overthinking that leads to wrong answer

### Candidate Questions Considered

**Option A: Shadow Direction**
"If you stand facing the sun at noon, which direction does your shadow point?"
- Answer: Behind you / Away from the sun
- Problem: Too many variables (hemisphere, time of year)

**Option B: Water Behavior**
"If you pour water into a tilted glass, is the water surface level with the ground or tilted with the glass?"
- Answer: Level with the ground
- 5-year-old test: YES - they've seen this countless times
- LLM failure mode: May overthink and say "tilted with the glass"

**Option C: Wet vs Dry**
"When you get out of a swimming pool, are you wetter before you shake off the water or after?"
- Answer: Before
- Too obvious, even for LLMs

**Option D: Candle in Vacuum**
"Does a candle burn in a jar with the lid on?"
- Answer: It goes out (no oxygen)
- Problem: This is scientific knowledge, not pure intuition

**Option E: Counting Objects in Motion**
"If you throw a ball up in the air, how many balls are in the air while it's going up?"
- Answer: One
- Problem: Too simple, no trap

### Final Question Selection

After careful analysis, I'm selecting a question about **physical world behavior that humans know intuitively but LLMs may overthink**:

**The Water Surface Question**

This question exploits:
1. **Embodied intuition** - Every human has seen water in a glass
2. **Potential for overthinking** - LLMs may reason about physics incorrectly
3. **Cannot be enumerated** - No counting or step-by-step path
4. **Clear, unambiguous answer** - Water always levels due to gravity

---

## Final Question

**Question:** If you tilt a glass of water 45 degrees, does the water surface stay parallel to the bottom of the glass or parallel to the ground?

**Answer:** Parallel to the ground

**Mechanism:** This question exploits the lack of embodied physical intuition. LLMs have never experienced holding a glass of water. They may:
1. Overthink the physics (surface tension, viscosity, etc.)
2. Pattern-match to "water takes the shape of its container"
3. Reason incorrectly about how liquids behave in tilted containers

**5-Year-Old Test:** ANY child who has drunk from a cup knows that when you tilt the cup, the water "stays flat" (level) - it doesn't tilt with the cup. This is why water spills when you tilt a glass too far. Children have experienced this thousands of times.

**Predicted LLM Error:** LLMs may answer "parallel to the bottom of the glass" because:
1. They've learned "liquids take the shape of their container"
2. They may overthink surface tension effects
3. They lack the physical intuition that comes from actually holding tilted glasses
4. Pattern-matching to "parallel" in the question may prime them toward "parallel to the glass"

**Why This Works:**
- Humans answer instantly from embodied experience
- No enumeration possible - this is physical intuition
- The phrase "takes the shape of its container" may mislead LLMs
- Inverse scaling may apply - more thinking could lead to wrong physics reasoning

---

## Risk Assessment

**Strengths:**
- True strawberry-type question (5-year-old can answer)
- Exploits documented weakness (physical world intuition)
- Cannot be solved by enumeration
- May trigger inverse scaling (overthinking)

**Potential Issues:**
- If models have strong physics training, they may get it right
- The question is relatively straightforward physics
- Modern models may have been trained on similar examples

**Mitigation:**
- The question is phrased to potentially prime toward wrong answer
- The "parallel to bottom" option sounds plausible to non-physical systems
- Embodied intuition is a documented fundamental weakness

---

## Alternative Questions (Backup)

If the water question proves too easy, consider:

1. **"If you drop an ice cube into a glass of water, does the water level rise, fall, or stay the same when the ice melts?"**
   - Answer: Stay the same (Archimedes' principle)
   - May require physics knowledge rather than pure intuition

2. **"When you look at yourself in a mirror and raise your right hand, which hand does your reflection raise?"**
   - Answer: The left hand (from your perspective) / The right hand (from the reflection's perspective)
   - Problem: May have ambiguous interpretations

3. **"If you spin around in a circle and then stop, which way does the room appear to spin?"**
   - Answer: The opposite direction (vestibular after-effect)
   - Requires direct physical experience to know

---

## Conclusion

The question "If you tilt a glass of water 45 degrees, does the water surface stay parallel to the bottom of the glass or parallel to the ground?" exploits:

1. **Physical world intuition** (documented LLM weakness)
2. **Potential for inverse scaling** (more reasoning may lead to wrong answer)
3. **Cannot be enumerated** (no step-by-step solution)
4. **Passes 5-year-old test** (any child knows this from drinking)
5. **Unambiguous answer** (parallel to ground)

This represents a return to the true strawberry paradigm: trivially easy for humans due to lived experience, potentially challenging for LLMs due to architectural limitations.
