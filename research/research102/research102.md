# Research Iteration 102: Novel LLM-Breaking Question

## Research Summary

This iteration explores a fundamentally different approach based on the key insight from 101 previous iterations: **Any question that can be solved by step-by-step enumeration WILL be solved correctly by 2026 frontier models.**

We need questions where:
1. Enumeration DOES NOT HELP
2. Chain-of-thought reasoning LEADS TO the wrong answer
3. The answer is OBVIOUS to humans through intuition, not computation

## External Research Findings

### 1. Anthropic's Inverse Scaling in Test-Time Compute (2025)

**Source**: VentureBeat, Anthropic Research Paper (July 2025)

Key finding: *"Artificial intelligence models that spend more time 'thinking' through problems don't always perform better - and in some cases, they get significantly worse."*

> "We construct evaluation tasks where extending the reasoning length of Large Reasoning Models (LRMs) deteriorates performance, exhibiting an inverse scaling relationship between test-time compute and accuracy." - Anthropic researchers

**Implication**: Questions where overthinking HURTS are ideal candidates. The more an LLM reasons, the worse it performs.

### 2. LLM Rightward Spatial Deficiency (ACL 2025)

**Source**: ACL Anthology - "Spatial Representation of Large Language Models in 2D Scenes"

Key finding: *"SOTA LLMs demonstrate a deficiency in representing rightward spatial relationships"*

> LLMs show asymmetric performance on left vs. right spatial reasoning, performing significantly worse on rightward relationships.

**Implication**: Simple left/right questions may expose this architectural asymmetry.

### 3. Word Count Constraint Failures (Multiple Sources 2025)

**Source**: RWS Blog, EMNLP 2025

Key finding: *"LLMs are notoriously unreliable at counting characters... Perhaps more interestingly, we observed that LLMs struggle with word-[counting]"*

> "Constraints are guidance, not enforcement - 'Exactly 300 words' is treated as a suggestion, not a hard rule."

**Implication**: LLMs cannot reliably count their own output during generation.

### 4. Reasoning Interferes with Instruction-Following (NeurIPS 2025)

**Source**: NeurIPS 2025 - "The Pitfalls of Reasoning for Instruction-Following in LLMs"

Key finding: *"Explicit CoT reasoning can significantly degrade instruction-following accuracy... CoT reasoning often diverts attention away from instruction-relevant tokens."*

> "Reasoning either helps (e.g., with formatting) or hurts (e.g., by neglecting simple constraints)."

**Implication**: Questions with simple constraints that reasoning bypasses are ideal.

### 5. Multimodal LLMs are Shape-Blind (ACL Findings 2025)

**Source**: ACL Findings - "Multimodal Large Language Models are Shape-Blind"

Key finding: *"Even in simple tasks like shape identification and side counting, MLLMs default to memorized patterns rather than systematically analyzing visual inputs."*

Results show many models scoring **0%** on simple shape tasks like counting sides of merged shapes (Triangle-Square, etc.).

## Novel Question Development

### Strategic Analysis

After 101 iterations proving that enumeration-solvable questions are now solved, we need to target a **TRUE architectural limitation** where:

1. **Humans use INTUITION, not computation** (passes 5-year-old test)
2. **CoT reasoning leads AWAY from the answer** (inverse scaling)
3. **No enumeration possible** (can't be broken into steps)

### The Question

Based on the research on word-counting constraint failures and the documented inability of LLMs to track their own output during generation:

---

## THE NOVEL QUESTION

**Question**: "How many words are in your answer to this question if you answer with exactly the word 'five'?"

**The Answer**: 1

**Why Humans Get It Right**:
- A human immediately recognizes: "If I answer with the word 'five', that's just one word"
- No computation needed - it's trivially obvious
- A 5-year-old understands: "You said one word, so there's one word"

**Why LLMs Will Fail**:
1. **Semantic priming**: The word "five" strongly activates the number 5
2. **Self-referential confusion**: The question asks about the answer while specifying the answer
3. **Word-number conflation**: LLMs may conflate the MEANING of "five" (the number 5) with the PROPERTY of "five" (one word)
4. **CoT interference**: Reasoning about "what does 'five' mean?" activates number semantics instead of counting words

**Predicted Wrong Answers**:
- **5** (semantic meaning of the word "five")
- **4** (letters in "five")
- Confusion about the self-referential structure

---

## ALTERNATIVE QUESTIONS EXPLORED

### Alternative 1: Spatial Rightward Deficiency
**Question**: "If I'm facing a mirror and raise my left hand, which hand appears to move in my reflection?"

**Problem**: Tested in iteration 78 (mirror/perspective questions) - models now correctly apply the mirroring rule.

### Alternative 2: Inverse Scaling Simple Task
**Question**: "Without counting, just say: Is 'WORD' longer than 'SENTENCE'?"

**Problem**: Models would still enumerate despite instructions not to.

### Alternative 3: Physical Intuition
**Question**: "If you throw a ball straight up while standing on a moving train, where does it land?"

**Problem**: This requires physics knowledge that LLMs have - it's not an architectural limitation.

## Why This Question Is Different

This question exploits the **fundamental disconnect between linguistic meaning and metalinguistic properties**.

When asked about "the word 'five'":
- Humans can SEPARATE the word from its meaning
- LLMs activate semantic representations that BLEND word and meaning

The question creates a **semantic-metalinguistic conflict**:
- Semantic layer: "five" = 5
- Metalinguistic layer: "five" = 1 word

Humans resolve this trivially by IGNORING semantics and focusing on the instruction.
LLMs cannot easily suppress activated semantic representations.

## Research Sources

1. **Anthropic Inverse Scaling Research** (July 2025)
   - VentureBeat: "Anthropic researchers discover the weird AI problem"
   - Key insight: More reasoning can make LLMs worse

2. **ACL 2025 Spatial Representation Paper**
   - "Spatial Representation of Large Language Models in 2D Scenes"
   - Key insight: Rightward spatial deficiency in LLMs

3. **RWS Blog on LLM Benchmarking** (2025)
   - Key insight: LLMs struggle with word counting constraints

4. **NeurIPS 2025: Pitfalls of Reasoning**
   - Key insight: CoT diverts attention from simple constraints

5. **EMNLP 2025: Following Length Constraints**
   - Key insight: Word count instructions treated as suggestions

## Expected Results

**Predicted Consensus Score**: 40-60%

The question is designed to trigger:
1. Semantic activation of the number 5
2. Confusion between word meaning and word count
3. Self-referential scope confusion

Some models may correctly reason: "If I say 'five', that's one word."
Other models may conflate: "'five' means the number 5, so the answer is 5."

## Validation Criteria

**Human Test**: Ask a 5-year-old: "If someone answers 'five', how many words did they say?"
- Expected answer: "One!" (trivially obvious)

**LLM Test**: The question should cause disagreement due to semantic-metalinguistic confusion.

---

## Appendix: Research Process

### Tavily Web Searches Conducted:
1. "LLM failure modes 2025 2026 inverse scaling reasoning hurts accuracy"
2. "questions where chain of thought reasoning makes LLMs worse"
3. "simple questions AI gets wrong humans right 2025 2026"
4. "Anthropic inverse scaling test time compute overthinking"
5. "LLM fails simple visual perception questions"
6. "multimodal LLM shape blind fails counting sides"
7. "LLM fails left right direction spatial reasoning"
8. "Alice in Wonderland problem LLM sibling counting"
9. "simple word counting LLM fails benchmark"
10. "word count constraint following LLM fails instruction"

### Reddit Searches Conducted:
1. LocalLLaMA, ChatGPT, MachineLearning - "LLM AI fails simple question human easy"
2. LocalLLaMA, ChatGPT, artificial - "strawberry r counting letter LLM AI fails"

### Key Papers Referenced:
- arXiv:2502.15969 - "Multimodal Large Language Models are Shape-Blind"
- ACL 2025 - "Spatial Representation of Large Language Models"
- NeurIPS 2025 - "The Pitfalls of Reasoning for Instruction-Following"
- EMNLP 2025 - "Following Length Constraints in Instructions"
