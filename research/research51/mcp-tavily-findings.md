# Tavily Web Search Findings

## Search Queries Used
- "LLM character counting failures 2025 2026"
- "simple reasoning tasks LLMs fail"
- "frontier LLMs struggle counting"

## Sources Found

### 1. arxiv.org/html/2412.18626v1
**Title**: "Why Do Large Language Models Struggle to Count Letters?"
**Key Findings**:
- LLMs concentrate errors on letters with multiplicity > 1
- The issue is LLMs may be unable to identify letters with multiplicity larger than one within a token
- Chain-of-thought enumeration CAN bypass this, but requires explicit prompting

### 2. arxiv.org/html/2507.07313v1
**Title**: "Frontier LLMs Still Struggle with Simple Reasoning Tasks"
**Key Findings**:
- Word counting performance degrades with number of words to count
- Character counting fails at scale
- "Accuracy of all models completely collapses beyond a certain complexity threshold"

### 3. GeoGramBench (Emergent Mind)
**Title**: Spatial Reasoning Benchmarks
**Key Findings**:
- LLMs exceed 80% on local primitive recognition
- Performance on global abstract integration never surpasses 50%
- "Middle Score Anomaly" - models achieve 30-50% on tasks humans solve perfectly or fail entirely

### 4. Medium Article on Spatial Reasoning
**Key Findings**:
- "All of the LLMs failed immediately on the easiest problems" for mental box folding tasks
- LLMs are much better at reasoning from photos than from abstract drawings

## Key Information Extracted

The research suggests that while simple single-step counting is now often solved via chain-of-thought enumeration, **two-step aggregation tasks** remain challenging:
1. Tasks requiring first counting/identifying elements
2. Then aggregating or filtering based on a criterion

This informed the question design for iteration 51 - asking "how many letters appear more than once" requires:
1. First counting each letter's frequency
2. Then counting how many distinct letters meet the "more than once" criterion

The potential for semantic ambiguity ("how many letters" vs "how many distinct letters") adds another layer of difficulty.
