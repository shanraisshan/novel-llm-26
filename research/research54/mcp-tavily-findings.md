# Tavily Web Search Findings

## Search Queries Used
- "LLM fails simple questions humans answer 2025 2026"
- "VLM memorization bias counterfactual images"
- "spatial reasoning failures language models"
- "inverted competence profile LLM visual tasks"

## Sources Found

### 1. VLMBias Research (ICLR 2026)
- **URL**: vlmsarebiased.github.io, arXiv:2505.23941
- **Finding**: VLMs achieve 100% on normal images but only ~17% on counterfactual images
- **Key stat**: 75.70% of errors are "bias-aligned" (memorized answer instead of actual observation)
- **Example**: Models fail to count stripes on a 4-striped Adidas-like logo (answer "3" from memory)

### 2. Spatial Reasoning Failures
- **Source**: GVGAI-LLM (arXiv:2508.08501), Hacker News
- **Finding**: LLMs frequently misinterpret spatial layouts, reversing coordinates
- **Quote**: "Most VLMs cannot reliably tell if a character is facing left or right"

### 3. Apple's "Illusion of Thinking" Paper
- **Finding**: LLMs fail to induce proper world models
- **Quote**: "Everything they do is through mimicry, rather than abstracted cognition"

### 4. Inverted Competence Profile (Jan 2026)
- **Source**: youssefh.substack.com
- **Finding**: 44.4% accuracy gap between best model (49.7%) and humans (94.1%)
- **Key insight**: Most frontier MLLMs perform below the level of a 3-year-old on visual primitives

## Key Information Extracted

The VLMBias research is the most relevant finding. It demonstrates that:
1. Models have memorized facts about common objects
2. When presented with counterfactual versions, they default to memorized answers
3. This happens even with explicit instructions to look carefully
4. The same mechanism should apply to text-only LLMs

This directly informed the question design: ask about a piano with an explicitly listed number of keys, testing whether the model counts the list or defaults to memorized "52 white keys" or "88 total keys" facts.
