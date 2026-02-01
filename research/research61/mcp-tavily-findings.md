# Tavily Web Search Findings - Research Iteration 61

## Search 1: "LLM fails simple questions humans answer easily 2025 2026"

### Key Results:

1. **Tech Lead Journal** - "AI is Smart Until It's Dumb: Why LLM Will Fail When..."
   - AI that generates complex code fails at basic math
   - Unexpected failure modes in production

2. **Into AI** - "LLMs Fail Embarrassingly At Newer Ways Of Testing"
   - LLMs misunderstand information differently from humans
   - All popular LLMs show similar failure patterns

3. **Sebastian Raschka - State of LLMs 2025**
   - Comprehensive overview of LLM capabilities and limitations
   - Reasoning models discussed in detail

4. **Mashable - Apple Research**
   - "The illusion of thinking" - Apple research shows AI reasoning models collapse on complex problems
   - Models fail spectacularly on Tower of Hanoi variations
   - "Only provide the illusion of thinking"

5. **BBC/Josh Bersin**
   - 45% of AI queries produce erroneous answers
   - Systemic issues with AI reliability

---

## Search 2: "tokenization blindness character counting LLM failures"

### Key Results:

1. **EMNLP 2025 Paper** - "The Strawberry Problem: Emergence of Character-level Understanding"
   - URL: https://aclanthology.org/2025.emnlp-main.1434.pdf
   - Key quote: "LLMs consistently fail at simple character-level tasks, such as counting letters in words, due to a fundamental limitation: tokenization"
   - "Character understanding tasks in tokenized language models are a form of 'inverse scaling': the larger the tokenizer vocabulary, the slower the model learns"

2. **Medium** - "The Counting Blind Spot in AI"
   - LLMs operate on tokens (words/subwords), not individual characters
   - Fundamental architectural limitation

3. **SecWest - Strawberry R Counting Problem**
   - GPT-4 uses step-by-step reasoning to count
   - GPT-3 used pattern matching ("what's a likely answer")
   - O1 "Strawberry" model shows improvement through chain-of-thought

4. **LessWrong** - "LLMs Can't See Pixels or Characters"
   - Direct quote: "The only way this LLM can answer the question is by memorizing information from the training data about token 1018302"
   - Token-based processing fundamentally limits character access

---

## Search 3: "LLM fails comparing decimals 9.11 vs 9.9 2025"

### Key Results:

1. **Medium - Hanning Ni** - "Why LLMs Struggle to Compare 9.11 and 9.9"
   - Highly relevant - direct analysis of numeric comparison failures
   - Not just mathematical error - rooted in number processing

2. **Generative AI Lab** - "Comparing 9.11 vs 9.9"
   - Demo showing incorrect AI responses
   - "9.11 is higher than 9.9" - common wrong answer

3. **Reddit r/ClaudeAI (2025)** - "It's 2025 already, and LLMs still mess up whether 9.11 or 9.9 is bigger"
   - STILL a problem in 2025
   - Community verification of ongoing issues

4. **16x Eval** - "9.9 vs 9.11: Which One is Bigger? It Depends on Context"
   - AI must guess context (decimal vs version number)
   - Version number context: 9.11 > 9.9
   - Decimal context: 9.9 > 9.11
   - Claude Sonnet 4 and Gemini 2.5 Pro still give wrong answers

5. **OpenAI Community** - Bug Reports
   - Multiple users reporting incorrect number comparisons
   - "ChatGPT incorrectly responded that 9.11 is greater than 9.9"

---

## Search 4: "LLM ASCII art character spatial text"

### Key Results:

1. **arXiv** - "Evading Toxicity Detection with ASCII-art"
   - LLMs fail to interpret spatially structured text
   - Token-based processing breaks spatial arrangement
   - "When input ASCII art is tokenized, the tokeniser fails to maintain the spatial structure"

2. **LinkedIn** - "LLMs excel at code, struggle with 3D spatial reasoning"
   - Geometry and spatial tasks are weak points

3. **Blog** - "ArtPrompt and Why LLMs Suck at ASCII Art"
   - Simple ASCII art (house, shapes) often fails
   - "The Art of Failing" - LLMs can't render simple spatial patterns

---

## Search 5: "Frontier LLMs Still Struggle with Simple Reasoning Tasks"

### Key Results:

1. **arXiv 2507.07313** - "Frontier LLMs Still Struggle with Simple Reasoning Tasks"
   - Direct quote: "Researchers continue to uncover surprisingly simple reasoning problems that still confuse even the most advanced LLMs"
   - Four tested task categories:
     1. Character and word counting
     2. First-order logic evaluation and negation
     3. Math word problems based on proof trees
     4. Travel planning problems
   - "The Unpuzzles dataset... illustrates that good performance on original puzzles is at least in part a consequence of memorization"

2. **NAACL 2025** - "A Linguistic and Math Expert's Struggle with Simple Word-based Counting"
   - 9 model families tested (Llama 3, Qwen, Gemma, GPT-4o, etc.)
   - Word-based counting remains problematic
   - Tokenization strategies don't fix the fundamental issue

---

## Search 6: "LLM reverse spelling backwards letters"

### Key Results:

1. **LessWrong** - "Paper: LLMs trained on 'A is B' fail to learn 'B is A'"
   - The Reversal Curse - models can't generalize in reverse
   - Fundamental limitation in associative learning

2. **Facebook Video** - "I asked the AI to spell lollipop backwards. It failed."
   - Real-world demonstrations of backward spelling failures
   - Multiple failures in succession

3. **Meta AI Research** - "Reverse Training to Nurse the Reversal Curse"
   - Official acknowledgment of reversal limitations
   - "LLMs do not generalize to 'B is a feature of A'"

4. **Peripheral Creative** - "Why Google's AI Overviews Can't Answer Simple Spelling Queries"
   - Study finding: AI Overviews fail to spell words backwards
   - Another blind spot documented

---

## Summary of Key Failure Modes Identified

1. **Character/Letter Counting** - Still problematic due to tokenization
2. **Numeric Comparison** - 9.11 vs 9.9 still fails in 2025
3. **Spatial/Visual Text** - ASCII art, spatial arrangements fail
4. **Reversal Tasks** - Backwards spelling, "B is A" from "A is B"
5. **Simple Reasoning** - Easy problems that humans solve instantly
6. **Semantic vs Structural Conflict** - When meaning conflicts with form

## Relevance to Research Iteration 61

The question "Which word comes first in the dictionary: SIX or SEVEN?" exploits:
- Semantic priming from number words (like 9.11 vs 9.9 confusion)
- Character-level access requirements (tokenization blindness)
- Conflict between semantic ordering (6 < 7) and alphabetical ordering (SEVEN < SIX)

This aligns with multiple documented failure modes from the research.
