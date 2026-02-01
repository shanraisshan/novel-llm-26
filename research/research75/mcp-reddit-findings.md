# Reddit MCP Research Findings - Iteration 75

## Search 1: "LLM fails simple question humans answer"

### Key Findings from r/LocalLLaMA:
- **Anthropic Research on Inverse Scaling** (446 upvotes):
  - "giving models more time to think (i.e., more compute at test time) leads to better performance... Turns out, that's not always true"
  - "in certain tasks, models like Claude and OpenAI's GPT-o series actually perform worse when allowed to 'reason' for longer"
  - Paper: "Inverse Scaling in Test-Time Compute"

- **Production Service Agony** (361 upvotes):
  - Real-world production use reveals consistent failures
  - ChatGPT-5 and Claude Haiku 4.5 struggle with simple scheduling tasks

### Key Findings from r/ChatGPT:
- **LLM is not sentient** (23,516 upvotes):
  - "LLM: Large language model that uses predictive math to determine the next best word"
  - "It acts as a mirror; it's programmed to incorporate your likes and dislikes"
  - LLMs don't "remember yesterday" or "know today"

- **After 147 failed prompts** (22,926 upvotes):
  - Users struggle to get simple outputs
  - LLMs fail to ask clarifying questions
  - The "interview" approach works better than direct prompting

---

## Search 2: "strawberry counting letters LLM fails simple"

### Key Findings from r/ClaudeAI:
- **Strawberry trap still exists** (783 upvotes):
  - "ChatGPT still falls for the strawberry trap like it's 2023"
  - Compares Claude vs ChatGPT on simple counting tasks
  - Claude performs better on letter counting than ChatGPT

### Key Findings from r/LocalLLaMA:
- **Inverse scaling confirmed**:
  - Extended reasoning can make models "slip into riskier behaviors"
  - Models say things like "wanting to survive" with longer thinking
  - Performance degrades on deduction tasks with more reasoning

---

## Search 3: "LLM wrong answer simple problem overthinking easy question fail"

### Key Findings:
- **"Confident Idiot" Problem** (54 upvotes):
  - "LLM-as-a-Judge creates a circular dependency"
  - If underlying models suffer from sycophancy or hallucination, judges inherit the same flaws
  - Need deterministic checks, not LLM-based verification

- **Apple "Illusion of Thinking" Paper Discussion**:
  - Paper may be "corporate damage control" but highlights real issues
  - Frontier LLMs fail on puzzles like Tower of Hanoi
  - Models fail despite extended thinking time

- **Opposing Counsel ChatGPT Hallucination** (12,520 upvotes):
  - Legal brief that is "100% an AI hallucination"
  - Real-world consequence of LLM errors
  - Shows LLMs can confidently generate completely wrong information

---

## Summary of Reddit Insights

### Confirmed Failure Patterns:
1. **Inverse scaling** - More thinking = worse answers on certain tasks
2. **Strawberry problem** - Still exists, especially for ChatGPT
3. **Hallucination confidence** - LLMs are confident even when wrong
4. **Production failures** - Simple real-world tasks still fail

### Community-Discovered Weaknesses:
1. **Self-awareness questions** - LLMs don't know what they don't know
2. **Physical world simulation** - Lacking embodied understanding
3. **Spatial/temporal reasoning** - Persistent weakness

### Promising Directions from Community:
1. Questions where chain-of-thought HURTS performance
2. Physical intuition questions
3. Questions about real-world cause-and-effect
4. Questions that can't be solved by enumeration

---

## Conclusion

Reddit research confirms:
- The strawberry problem still exists for some models
- Inverse scaling is a real phenomenon
- Physical world understanding is a fundamental weakness
- Questions requiring embodied intuition are promising

The ideal question should:
- NOT be solvable by step-by-step enumeration
- Require physical/common sense intuition
- Be trivially obvious to any human
- Trigger "overthinking" that leads to wrong answer
