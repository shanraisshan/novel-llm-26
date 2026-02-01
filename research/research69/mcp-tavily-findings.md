# Tavily MCP Research Findings - Iteration 69

## Search 1: LLM tokenization character blindness

**Query:** "LLM fails simple questions humans answer correctly 2025 2026 tokenization character blindness"

### Key Findings:

1. **Strawberry Problem Still Relevant** (arsturn.com)
   - "An LLM might struggle to simply count the letter 'r' in 'strawberry' because it processes the word as fragmented tokens, not individual characters."
   - Core insight: tokenization fundamentally prevents character-level access

2. **Breaking Down LLM Thought Process** (medium.com/@danisaysskol)
   - LLM sees three separate words: 'st', 'raw', and 'berry', rather than the complete word or individual letters
   - Even with chain-of-thought, models often second-guess correct answers

3. **ISI at NAACL '25 Conference** (isi.edu)
   - Research paper: "Why Can't LLMs Count the Letters in 'Strawberry'?"
   - "The Genius Paradox: A Linguistic and Math Expert's Struggle with Simple Word-based Counting Problems"

4. **Tokenization Confusion** (specterops.io)
   - Meta's Prompt Guard 2 model shows how "confusing" Unigram tokenization can lead to misclassification

## Search 2: Adversarial prompts and easy problems

**Query:** "novel adversarial prompts language models easy problems wrong answer 2025"

### Key Findings:

1. **MIT News Research** (news.mit.edu)
   - "Researchers discover a shortcoming that makes LLMs less reliable"
   - "Large language models can learn to mistakenly link certain sentence patterns with specific topics - and may then repeat these patterns instead of reasoning"

2. **Ohio State University Study** (facebook.com/groups)
   - "New research reveals AI systems abandon correct answers"
   - LLMs tend to not defend their initial correct answers when challenged

3. **Nature Study - Helpfulness Backfires** (nature.com)
   - "LLMs exhibit a vulnerability arising from being trained to be helpful: a tendency to comply with illogical requests"
   - Models generate false information even when they have knowledge to identify the request as illogical

4. **ICML 2025** (icml.cc)
   - "From passive to active reasoning: Can large language models ask the right questions under incomplete information?"
   - Research on LLMs' inability to ask clarifying questions

## Search 3: LLM counting and math failures

**Query:** "LLM counting letters wrong fails simple math strawberry problem 2025 2026"

### Key Findings:

1. **Neuro-Symbolic AI Solution** (arsturn.com)
   - LLMs fail at math because they're designed for semantic meaning, not symbol manipulation
   - Counting is trivial for humans but requires symbolic processing

2. **Why AI Gets Strawberry Wrong** (medium.com/@JerryCuomo)
   - "Counting letters is trivial for humans, but language models are optimized for meaning, not symbols"
   - Same pattern in math - LLMs predict what answers LOOK LIKE

3. **Reasoning Models 2025** (louisbouchard.ai)
   - Reasoning models now explicitly spell s-t-r-a-w-b-e-r-r-y and count
   - Chain-of-thought has SOLVED simple character counting for 2026 models

## Search 4: Simple question benchmarks

**Query:** "simple question AI wrong answer humans correct benchmark failure mode"

### Key Findings:

1. **IEEE Spectrum - AI Reasoning Failures** (spectrum.ieee.org)
   - "AI's Wrong Answers Are Bad. Its Wrong Reasoning Is Worse"
   - Models stick to their guns regardless of whether they're right or wrong
   - Training doesn't optimize for good reasoning processes

2. **Stanford Report** (news.stanford.edu)
   - "Why AI still struggles to tell fact from belief"
   - AI often fails to recognize when a human holds a false belief
   - Models have biased and inconsistent mental models of who they interact with

3. **Nature Benchmark** (nature.com)
   - New benchmark showing LLMs achieve >90% on MMLU but fail on expert-level questions
   - Benchmark saturation is a major problem

## Search 5: Visual/spatial reasoning failures

**Query:** "AI fails spatial reasoning easy question visual perception blind spot 2025"

### Key Findings:

1. **ACL 2025 Paper** (aclanthology.org)
   - "Unveiling Spatial Blind Spots in Vision-Language Models"
   - "Critical blind spots in existing models underscore the need for more advanced spatial reasoning techniques"

2. **OpenReview** (openreview.net)
   - "Mind the Gap: Diagnosing Spatial Reasoning Failures"
   - "Spatial reasoning is a known blind spot in multimodal AI"

3. **Bongard in Wonderland - ICML 2025** (icml.cc)
   - "Visual Puzzles that Still Make AI..."
   - "Significant gap remains between human visual reasoning capabilities and machine cognition"

4. **Turing Eye Test** (techwithram.medium.com)
   - "Pixels, Patterns, but No Poetry: AI's New Vision Blind Spot"
   - "A set of image puzzles that humans solve instantly but AI cannot"

## Search 6: Decimal comparison issues

**Query:** "LLM fails arithmetic comparison greater than less than decimal mistake 2025"

### Key Findings:

1. **Reddit r/ClaudeAI** (reddit.com)
   - "It's 2025 already, and LLMs still mess up whether 9.11 or 9.9 is bigger"
   - User suggestion: "You have to give it context. Ask if float value..."
   - 9.9 could be interpreted as a date, version number, or decimal

2. **NumericBench** (arxiv.org)
   - Comprehensive benchmark for numerical reasoning abilities
   - Evaluates: number recognition, arithmetic operations, contextual retrieval, comparison, summary, logical reasoning
   - LLMs struggle on precise value retrieval and dynamic comparisons

3. **Karthick.ai** (karthick.ai)
   - "Why Large Language Models Fail at Precision Regression"
   - LLMs often fail when required to produce precise numerical outputs
   - Fundamental consequence of their architecture

## Search 7: SimpleBench/SimpleQA failures

**Query:** "SimpleBench OR SimpleQA LLM benchmark easy questions wrong answers 2025"

### Key Findings:

1. **SimpleQA Verified** (arxiv.org)
   - 1,000-prompt benchmark for evaluating LLM short-form factuality
   - Even best models struggle with basic factual accuracy

2. **Reddit r/singularity** (reddit.com)
   - "Simple bench has been updated"
   - "Tests things that are easy for most humans but difficult for LLMs"
   - "Good benchmark for fuzzy, hard-to-define intelligence"

3. **Chinese SimpleQA** (ACL 2025)
   - 3000 high-quality questions across 6 major topics
   - Properties: Diverse, High-quality, Static, Easy-to-evaluate

## Summary: Promising Directions for Iteration 69

Based on this research, the following directions remain promising:

1. **Visual/Spatial Properties of Text** - LLMs cannot "see" letters
2. **Decimal Comparison with Ambiguity** - Version number vs decimal confusion
3. **Physical World Reasoning** - Embodied knowledge gaps
4. **Self-Referential Properties** - What models know about their own behavior
5. **Semantic vs Literal Processing** - Word meaning overriding task

### Key Insight:
The strawberry problem IS now solved by chain-of-thought enumeration in 2026 frontier models. Need questions where enumeration CANNOT help or where the enumeration itself is misleading.
