# Reddit Research Findings - Iteration 104

## Search: LLM fails modified riddle pattern matching
**Subreddits**: r/LocalLLaMA, r/ChatGPT, r/MachineLearning
**Relevant Findings**:

### 1. Apple Research Paper Discussion (r/ChatGPT, 984 upvotes)
- Title: "Apple Research Paper: LLM's cannot reason. They rely on complex pattern matching"
- Confirms our core thesis: LLMs pattern-match to memorized templates rather than reasoning from first principles
- This is exactly the failure mode we're exploiting with modified riddles

### 2. MisguidedAttention Benchmark Discussion (r/LocalLLaMA)
- Title: "Misguided Attention - challenging the reasoning ability of LLMs"
- Community discussion confirming that even simple modifications to well-known puzzles cause LLM failures
- Multiple users reported that models pattern-match to famous puzzle solutions without reading modifications

### 3. MisguidedAttention 2026 Results (r/singularity)
- Title: "Gemini 3 Flash tops the new Misguided Attention benchmark, beating GPT-5.2 and Opus 4.5"
- Key finding: Even in 2026, best model (Gemini 3 Flash) only scores 68.5%
- GPT-5.2 and Opus 4.5 STILL FAIL ~35% of modified riddle questions
- Quote: "adding more reasoning tokens does not help much if the model is already overfitting to common patterns"
- This confirms modified riddles remain an effective failure mode for ALL frontier models

### Strategic Implication
The Reddit evidence strongly supports our strategy of modifying famous riddles. The MisguidedAttention benchmark proves this approach works against 2026 frontier models with ~35% failure rates. Our specific candle riddle inversion should be particularly effective because the candle riddle is one of the most deeply embedded patterns in LLM training data.
