# Reddit MCP Research Findings - Iteration 69

## Search 1: LLM fails simple question humans easy strawberry problem

**Subreddits:** LocalLLaMA, MachineLearning, ChatGPT, artificial

### Key Posts Found:

1. **r/LocalLLaMA - "The Confident Idiot Problem"**
   - Score: 59 upvotes
   - Discusses LLM-as-a-Judge circular dependency
   - Models suffer from sycophancy

2. **r/MachineLearning - "How does LLM solves new math problems?"**
   - Score: 136 upvotes
   - Discussion of chain-of-thought mechanism
   - LLMs predict next tokens, creating internal feedback loop

3. **r/ChatGPT - "As an M.D., here's my 100% honest opinion"**
   - Score: 5205 upvotes
   - Medical doctor discusses AI diagnostic capabilities
   - Important for understanding where LLMs fail in domain-specific tasks

4. **r/artificial - "Anthropic cofounder admits he is now deeply afraid"**
   - Score: 207 upvotes
   - Quote: "We are dealing with a real and mysterious creature, not a simple and predictable machine"

## Search 2: Character counting tokenization failure

**Subreddits:** LocalLLaMA, MachineLearning, ChatGPT

### Key Posts Found:

1. **r/LocalLLaMA - "Heretic: Fully automatic censorship removal"**
   - Score: 3033 upvotes
   - Discusses model architecture and how to modify it

2. **r/MachineLearning - "I built a tool to benchmark tokenizers across 100+ languages"**
   - Score: 89 upvotes
   - TL;DR: "Your fine-tune's multilingual performance might suck because of tokenization, not architecture"
   - Explains why proprietary models are better at non-English tasks

3. **r/MachineLearning - "Adapting Karpathy's baby GPT into a character-level discrete diffusion model"**
   - Score: 137 upvotes
   - Character-level models vs token-level models discussion

4. **r/ChatGPT - "GPT-5 Is a Step Backward: Real Testing, Real Failures"**
   - Score: 99 upvotes
   - User reports GPT-5 is "slower, less efficient, and deeply frustrating in actual complex tasks"

## Search 3: 9.11 vs 9.9 comparison problem

**Source:** r/ClaudeAI post - direct link

### Key Finding:

**Post Title:** "It's 2025 already, and LLMs still mess up whether 9.11 or 9.9 is bigger."
- Score: 74 upvotes
- Author: Quick-Knowledge1615
- Content: "BOTH are 4.1 models, but GPT flubbed the 9.11 vs. 9.9 question while Claude nailed it."

**Top Comments:**
1. "you have to give it context. Ask it if float value of 9.9 is greater than float value of 9.11. 9.9 doesn't just have to be a number. it could be a date."
   - This reveals the AMBIGUITY that causes failures

2. "Semver though?"
   - Raises the semantic versioning interpretation (9.11 > 9.9 in version numbers)

3. "Bigger is ambiguous. Ask the LLM to tell you why it is ambiguous."
   - Highlights the fundamental issue: word "bigger" is contextually interpreted

### Key Insight from this Post:
The 9.11 vs 9.9 problem persists because:
1. Ambiguous context (decimal vs version vs date)
2. Semantic training data bias (version numbers are common in code)
3. Models pattern-match to training data rather than computing

## Search 4: Recent LLM wrong simple questions

**Subreddits:** LocalLLaMA, ChatGPT (sorted by new, past month)

### Key Posts Found:

1. **r/LocalLLaMA - "LLMs are great until you point them at actual company data"**
   - Score: 3 upvotes
   - "It just generates confidently wrong answers because it has no idea..."

2. **r/LocalLLaMA - "LLMs will never become General Intelligence"**
   - Score: 0 upvotes (controversial)
   - "LLMs are statistical compression of human discourse. Frozen weights. Words without experience."

3. **r/ChatGPT - "Thoughts on Claude vs ChatGPT vs Gemini after using all three for a year"**
   - Score: 8 upvotes
   - "Claude is in fact the LLM you should use if you actually care about reasoning depth"

## Summary: Community-Discovered Failure Modes

From Reddit research, the following failure patterns emerge:

### Tokenization-Related:
- Character counting still problematic despite chain-of-thought
- Multilingual tokenization disparities
- Non-English performance gaps

### Numeric Processing:
- 9.11 vs 9.9 confusion (version vs decimal)
- Ambiguity in "bigger" interpretation
- Context-dependent number interpretation

### Reasoning Failures:
- Sycophancy (agreeing when challenged)
- Confidently wrong answers
- Pattern matching over computation

### Promising Direction:
The 9.11 vs 9.9 problem is STILL ACTIVE in 2025. However, Claude solved it according to the post. Need to find a VARIANT that:
1. Has the same ambiguity mechanism
2. But hasn't been specifically trained away
3. And passes the 5-year-old test (humans answer instantly)
