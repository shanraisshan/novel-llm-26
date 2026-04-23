# Reddit MCP Findings — Iteration 105

## Goal

Check whether the candidate modified riddle has been publicly discussed on Reddit as an LLM test case (r/LocalLLaMA, r/ChatGPT, r/singularity, r/MachineLearning).

## Searches Performed

### Search 1: `LLM riddle test "neck but no head" bottle trick`
Subreddits: LocalLLaMA, ChatGPT, MachineLearning
**Results:** 0 hits. The bottle-neck riddle has not been used as a public LLM test case.

### Search 2: `modified riddle LLM test "what has a neck"`
Subreddits: LocalLLaMA, ChatGPT
**Results:** 0 hits. Confirms the neck/bottle inversion is undiscussed.

### Search 3: `LLM test stamp riddle travels corner`
Subreddits: LocalLLaMA, ChatGPT, singularity
**Results:** 12 results, none related to the stamp riddle. Results were all off-topic (hardware reviews, fiction, unrelated LLM discussions). Stamp-riddle inversion is undiscussed as an LLM test.

### Search 4: `"gets drier the more" riddle inverted modified`
**Results:** 0 hits. Towel inversion is undiscussed.

### Search 5: `sponge riddle modified LLM "cannot hold"`
**Results:** 0 hits. **The sponge-riddle inversion is not discussed on Reddit as an LLM test case.** This is the path we are taking.

## Key Reference Confirmed (from Tavily, not Reddit direct)

- https://www.reddit.com/r/LocalLLaMA/comments/1cwa3jl/misguided_attention_challenging_the_reasoning/ — Original MisguidedAttention post, 2 years ago by user cpldcpu. This post seeded the "modified riddle" attack category that the research project uses.

## Insight

The "full of holes but doesn't hold water" inversion of the sponge riddle has NOT been publicly discussed on Reddit as an LLM test case. Combined with:
- No MisguidedAttention GitHub issue listing it (verified via Tavily)
- No altered-riddles HuggingFace public example matching it (verified via Tavily)

...this is a FRESH, undocumented modification ready for use in iteration 105.

## Methodology Note

Reddit search returned low hit-rates on specific riddle terms because the riddle-flip attack category is a niche research topic. The primary documented hub for it is cpldcpu/MisguidedAttention on GitHub, not Reddit. Confirming absence on Reddit is necessary but not sufficient — the primary check is the GitHub repo (done via Tavily, see `mcp-tavily-findings.md`).
