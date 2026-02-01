# Tavily MCP Research Findings for Iteration 53

## Search 1: "LLM fails simple questions humans answer easily 2025 2026"

### Key Findings:

1. **Temple University Study (July 2025)** - Research by Vlad Ayzenberg found preschoolers' visual object recognition is much better than AI capabilities. "AI models are useful, but they make mistakes that no human would."

2. **mindprison.cc - "The Question That No LLM Can Answer"** - Article discusses vision test failures where LLMs cannot identify shortest/longest objects when bars are staggered or a red circle is added. After billions of images, models don't understand simple concepts like length.

3. **BBC Study (October 2025)** - Found 45% of AI queries produce erroneous answers. LLMs incorrectly answered "who is the Pope," "who is the Chancellor of Germany," and misattributed sources from 2006 as current.

4. **r/LLMDevs Post** - Community request for "stupid simple questions that ALL LLMs can't answer but a human can" - confirms ongoing interest in this problem space.

## Search 2: "Novel adversarial prompts language models tokenization failures"

### Key Findings:

1. **TokenBreak (June 2025)** - Novel adversarial attack targeting tokenization layer. Manipulates how input text is broken into tokens to bypass content classifiers.

2. **UCLA StarAI Lab - Adversarial Tokenization Paper (ACL 2025)** - Demonstrates vulnerability of subword language models to adversarial tokenizations. Developed AdvTok algorithm for finding adversarial tokenizations.

3. **arXiv:2405.17067 - "Tokenization Matters!"** - Constructed ADT (Adversarial Dataset for Tokenizer) to challenge LLMs' tokenization, demonstrating incorrect tokenization leads to unsatisfactory output.

4. **Break-The-Chain Paper** - Shows perturbations increase token-level entropy and variance, making models less confident and more prone to errors.

## Search 3: "Simple questions AI gets wrong humans answer 2025 visual perception"

### Key Findings:

1. **Temple University (July 2025)** - Human visual system is far more data efficient than current AI. Even 3-year-olds outperform AI on visual object recognition.

2. **arXiv Paper** - "Humans Perceive Wrong Narratives from AI Reasoning Texts" - Shows mismatch between AI reasoning text and human interpretation.

3. **The Debrief** - Study shows top AI models struggle with visual reasoning. GPT-4o managed only 17% accuracy while humans scored 84% on visual cognition tasks.

4. **ICML 2025 - "Bongard in Wonderland"** - Vision-Language Models fail on simple visual puzzles (Bongard problems). Even elementary concepts like spirals pose significant challenges.

## Search 4: "LLM failure modes common sense reasoning easy problems 2025"

### Key Findings:

1. **GSM-NoOp Dataset** - Shows LLMs consistently incorporate irrelevant numerical information into calculations. Models fail to distinguish crucial information from distractors.

2. **HellaSwag Benchmark 2025** - Commonsense knowledge is not written down. Humans reach 95.6% accuracy, most open models stay around 80%. Models fail because training data lacks grounded physical actions.

3. **llm-quiz.com** - Highlights: Visual-spatial reasoning (LLMs lack spatial awareness), common sense (no embodied experience), contextual understanding, relational understanding, logical reasoning failures.

4. **Alice in Wonderland Paper (ICLR 2025)** - Simple task "Alice has N brothers and M sisters. How many sisters does Alice's brother have?" breaks SOTA LLMs including GPT-4 and Claude 3 Opus.

## Search 5: "Alice in Wonderland LLM simple reasoning problem failure 2025"

### Key Findings:

1. **Dramatic breakdown** documented across GPT-3.5/4/4o, Claude 3 Opus, Gemini, Llama 2/3, Mistral, Mixtral, Dbrx, Command R+

2. **Correct answer**: Alice's brother has M+1 sisters (Alice herself is one of the sisters)

3. **Key failure mode**: Models attempt basic arithmetical operations on numbers mentioned rather than understanding relational logic

4. **Models express overconfidence** in wrong solutions with plausible-sounding confabulations

5. **Chain-of-thought prompting fails** to fix the problem

## Search 6: "LLM visual reasoning spatial perception font letter shape failure 2025"

### Key Findings:

1. **GeoGramBench** - LLMs exceed 80% on local primitive recognition but performance on global abstract integration never surpasses 50%

2. **MLLMs are Shape-Blind (ACL 2025)** - Models succeed in basic arithmetic but fail when vision and language must work together. Tendency to map less common shapes to familiar ones.

3. **VSP Benchmark** - Even strong MLLMs have clear deficiencies in visual spatial planning. When environment is described by text instead of image, performance increases vastly.

4. **Spatial Reasoning in LLMs (Emergent Mind)** - LLMs excel in simple spatial tasks but face significant challenges with complex, multi-hop, and abstract geometric reasoning.

## Synthesis for Question Design

Based on these findings, the most promising directions are:
1. **Relational reasoning** (Alice in Wonderland style) - still breaks models
2. **Visual/perceptual questions** requiring actual "seeing"
3. **Questions where enumeration cannot help** - spatial relationships, directional reasoning
4. **Self-referential scope ambiguity** (our previous partial success)

The Alice in Wonderland research is particularly relevant - it shows relational reasoning about family relationships still fails. However, that specific question may now be in training data. We need a NOVEL relational reasoning question with a similar structure.
