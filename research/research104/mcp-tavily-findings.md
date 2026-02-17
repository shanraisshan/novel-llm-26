# Tavily Research Findings - Iteration 104

## Search 1: MisguidedAttention Repository
**Query**: "MisguidedAttention LLM famous riddle modification pattern matching failure"
**Key Findings**:
- MisguidedAttention benchmark (GitHub: cpldcpu/MisguidedAttention) tests LLMs on modified versions of famous riddles/puzzles
- Even in 2026, frontier models only score ~68.5% (Gemini 3 Flash leads)
- GPT-5.2 and Opus 4.5 still struggle with basic instruction following when riddle patterns are tweaked
- The benchmark confirms: "adding more reasoning tokens does not help much if the model is already overfitting to common patterns"
- Example modifications include: candle riddle ("I'm tall when I'm young, and I'm TALLER when I'm old"), river crossing variants, Monty Hall modifications, modified trolley problems

## Search 2: Famous Riddles and Their Answers
**Query**: "famous riddles everyone knows well-known answers classic riddles list"
**Key Famous Riddles Identified**:
1. "I'm tall when I'm young, short when I'm old" = **Candle** (extremely well-known)
2. "What has a head and a tail but no body?" = **Coin**
3. "What has keys but no locks?" = **Piano/Keyboard**
4. "What has hands but can't clap?" = **Clock**
5. "The more you take, the more you leave behind" = **Footsteps**
6. "What gets wetter the more it dries?" = **Towel**
7. "What has to be broken before you use it?" = **Egg**
8. "What can you hear but not see or touch?" = **Echo**
9. Sphinx riddle: "What walks on four legs, then two, then three?" = **A person** (baby, adult, elderly with cane)

## Search 3: Candle Riddle Verification
**Query**: "I'm tall when I'm young short when I'm old riddle candle answer"
**Finding**: The candle riddle is EXTREMELY well-established. Multiple sources confirm "candle" as THE standard answer. Some mention "pencil" as alternative. The riddle appears across Quora, Brainzilla, web2.0calc, Facebook, and many more - deeply embedded in training data.

## Search 4: Clock Riddle Verification
**Query**: "what has hands but can't clap what has a face but can't smile riddle clock answer"
**Finding**: "Clock" is the universally known answer to both "what has hands but can't clap" and "what has a face but can't smile." Extremely well-known across all sources.

## Search 5: Inverted Candle Riddle Check
**Query**: "short when young tall when old what am I riddle"
**Finding**: All results return the ORIGINAL candle riddle ("tall when young, short when old"). The INVERTED version ("short when young, tall when old") does NOT appear as a separate famous riddle. This means the inverted formulation is NOVEL and not in training data.

## Strategic Conclusion
The candle riddle ("tall when young, short when old") is one of the most deeply embedded riddle patterns in LLM training data. Inverting it to "short when young, tall when old" should trigger the candle pattern-match while the correct answer (a person/tree) is trivially obvious to any human. The MisguidedAttention benchmark confirms this approach works even against 2026 frontier models.
