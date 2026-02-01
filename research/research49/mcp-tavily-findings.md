# Tavily Web Search Findings

## Search Queries Used

1. "LLM fails simple questions humans answer correctly 2025 2026"
2. "LLM inherently frail cannot generalize puzzle variations 2026"
3. "LLM fails letter spacing word boundaries simple text tasks"
4. "LLM fails at which is bigger comparisons semantic interference number words"
5. "alphabetical order OR comes first alphabetically LLM confusion wrong answer"
6. "LLM fails first last ordinal confusion alphabet letter position"

## Sources Found

### Primary Sources

1. **Mind Matters AI (2026)**: "Large Language Models (LLMs) Are Inherently Frail and Unreliable"
   - https://mindmatters.ai/2026/01/large-language-models-llms-are-inherently-frail-and-unreliable/
   - Key insight: LLMs stumble on slight variations of classic puzzles, answering the original rather than the modified question

2. **arXiv (2405.11357)**: "Large Language Models Lack Understanding of Character Composition"
   - https://arxiv.org/html/2405.11357v3
   - Finding: LLMs fail to demonstrate character composition understanding even on simple tasks

3. **Nature (Scientific Reports)**: "The Two Word Test as a semantic benchmark for large language models"
   - https://www.nature.com/articles/s41598-024-72528-3
   - Finding: Tasks trivial for humans can reveal semantic processing limitations

4. **arXiv (2412.18626)**: "Why Do Large Language Models (LLMs) Struggle to Count Letters?"
   - https://arxiv.org/html/2412.18626v1
   - Finding: LLMs struggle with tasks that appear easy, like letter counting

5. **Abstract Heresies Blog**: "LLM Failures"
   - http://funcall.blogspot.com/2025/07/llm-failures.html
   - Finding: LLM refused to put function definitions in alphabetical order

6. **LinkedIn (Ethan Mollick)**: "How LLMs fail at counting letters"
   - https://www.linkedin.com/posts/emollick_it-is-easy-to-find-simple-tasks-that-llms-activity-7236470005901455362-GdDS
   - Finding: Simple tasks like letter counting expose fundamental LLM limitations

## Key Information Extracted

### Core Insights

1. **Generalization Failure**: LLMs cannot generalize to slight variations of problems they've been trained on. They pattern-match to the original problem structure.

2. **Semantic Interference**: When word meanings conflict with the actual task, LLMs show degraded performance.

3. **Multi-step Processing**: Tasks requiring multiple steps with reference tracking are more challenging.

4. **Alphabetical Ordering**: Multiple sources confirm LLMs struggle with alphabet-related tasks beyond simple recitation.

### How These Findings Influenced Question Design

The research pointed to a novel approach combining:
- **Semantic interference** (using "first" and "last" with conflicting meanings)
- **Alphabet position comparison** (requires stored knowledge, not enumeration)
- **Reference tracking** (must maintain which letter came from which word)
- **Counter-intuitive structure** (the word "LAST" provides the letter that comes FIRST alphabetically)

This combination exploits multiple documented failure modes simultaneously while remaining trivially easy for humans who can sing the ABC song.
