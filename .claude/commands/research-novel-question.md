# Research Novel Question Command

This command uses an Opus researcher to generate progressively harder novel research questions that are **GENERIC and SIMPLE for humans** but **BREAK modern LLMs**.

## Goal

Generate questions like the famous "strawberry problem" - simple one-liner questions that:
- Any human child could answer correctly
- Modern frontier LLMs (GPT-5, Claude Opus, Gemini) consistently fail
- Result in < 10% consensus among 5 independent AI researchers

## Core Research Context (from research1.md)

```yaml
llm_fundamental_limitations:
  tokenization_blindness:
    description: "LLMs see tokens, not characters"
    example: "'strawberry' → ['str', 'aw', 'berry'] → model never sees individual letters"
    exploit: "Character counting, letter position, visual patterns"

  semantic_priming:
    description: "Word meaning overrides actual task"
    example: "Seeing 'ELEVEN' activates pathways for 11, not letter count 6"
    exploit: "Number words, quantity words, misleading context"

  pattern_matching_over_computation:
    description: "LLMs predict what answers LOOK LIKE, not compute"
    example: "Novel computations not in training data fail"
    exploit: "Uncommon operations, edge cases, unusual combinations"

  training_data_gaps:
    description: "Obscure behaviors may not be well-represented"
    example: "ceil() + floating-point interaction is virtually undocumented"
    exploit: "Rare Python behaviors, uncommon math operations"

successful_question_types:
  - "How many r's in strawberry?" (tokenization blindness)
  - "How many letters in ELEVEN?" (semantic priming - answer is 6, not 11)
  - "math.ceil(3 * 0.1 * 10)" (floating-point trap - returns 4, not 3)
```

## Instructions

```yaml
steps:
  - step: 1
    action: Read research-questions.yaml to find last completed question
    file: research/research-questions.yaml
    find: highest id where status = "completed"
    extract: [id, folder, score]
    note: If no completed questions exist, skip to step 3

  - step: 2
    action: Read previous research documentation
    condition: only if step 1 found a completed question
    file: research/researchN/researchN.md  # N = last completed question id
    purpose: Build on previous research insights
    output: previous_research_summary

  - step: 3
    action: Determine next question ID
    file: research/research-questions.yaml
    calculate: max(id) + 1
    output: next_id (N)

  - step: 4
    action: Create research folder
    path: research/researchN/  # N = next question ID

  - step: 5
    action: Launch Opus Researcher to generate novel question
    subagent_type: opus-researcher
    context_from_previous: previous_research_summary (from step 2, if available)
    task: |
      ## YOUR MISSION

      Generate a **SIMPLE, GENERIC question** that any human could easily answer,
      but that will BREAK modern LLMs and cause 5 independent AI researchers to disagree.

      ## RESEARCH CONTEXT (from research1.md)

      ### LLM Fundamental Limitations to Exploit:

      1. **TOKENIZATION BLINDNESS** (Most Powerful)
         - LLMs see tokens, NOT individual characters
         - "strawberry" → ['str', 'aw', 'berry'] → model never sees letters
         - Questions about: letter counting, character positions, visual patterns
         - Example: "How many r's in strawberry?" (humans: easy, LLMs: often wrong)

      2. **SEMANTIC PRIMING** (Very Effective)
         - Word meaning overrides the actual task
         - Seeing "ELEVEN" activates number 11, not letter count 6
         - Questions using: number words, quantity words, misleading context
         - Example: "How many letters in ELEVEN?" (answer: 6, LLMs often say 11)

      3. **PATTERN MATCHING OVER COMPUTATION**
         - LLMs predict what answers LOOK LIKE, not actually compute
         - Novel computations not in training data fail
         - Questions with: unusual operations, edge cases, rare combinations

      4. **VISUAL/SPATIAL REASONING**
         - LLMs cannot "see" text visually
         - Questions about: symmetry, visual patterns, spatial arrangement
         - Example: "Which letters in 'TOMATO' are symmetric?"

      ## QUESTION REQUIREMENTS

      **MUST BE:**
      - Simple one-liner (a child could understand it)
      - Generic (not domain-specific or technical)
      - Easy for any human to answer correctly
      - Hard for LLMs due to fundamental limitations above

      **MUST NOT BE:**
      - Technical/specification questions (no "in Python", no "IEEE 754")
      - Trivia or knowledge-based
      - Ambiguous (must have ONE clear correct answer)
      - Already well-known (strawberry is too famous now)

      ## QUESTION CATEGORIES TO EXPLORE

      1. **Letter/Character Counting with Interference**
         - "How many e's in 'seventeen'?" (semantic: 17, actual: 4)
         - "How many letters are in 'one hundred'?" (semantic: 100, actual: 10)
         - "What's the 3rd letter of 'EIGHT'?" (semantic interference)

      2. **Word-Level Counting with Semantic Traps**
         - "How many words in 'I have ten words in this sentence'?"
         - "Count the words: 'One Two Three Four Five'" (answer: 5, not sum)

      3. **Visual/Spatial Character Questions**
         - "Which letters in 'COOKBOOK' appear twice in a row?"
         - "What letter comes right before 'T' in 'POTATO'?"
         - "How many letters in 'BANANA' are the same as the first letter?"

      4. **Simple Arithmetic with Word Interference**
         - "If you have FOUR apples and eat TWO, how many letters are in your answer?"
         - "What number plus THREE equals EIGHT? Write it as a word and count letters."

      5. **Position and Sequence Questions**
         - "What's the middle letter of 'SEVEN'?" (answer: 'V', not 3.5)
         - "In 'TWELVE', which letter is 2 positions after 'W'?"

      ## PREVIOUS RESEARCH CONTEXT
      [PREVIOUS_RESEARCH_SUMMARY]

      ## DELIVERABLES

      1. **The Question**: A simple, one-liner question
      2. **The Answer**: The objectively correct answer
      3. **Why Humans Get It Right**: Explain the human approach
      4. **Why LLMs Will Fail**: Which limitation does this exploit?
      5. **The Wrong Answer LLMs Will Give**: Predict the common mistake
      6. **Full Research Documentation**: Your exploration process

      ## SUCCESS CRITERIA

      The question succeeds if:
      - 5 independent AI researchers give DIFFERENT answers
      - Consensus score < 10%
      - Any human would get it right immediately

    output:
      - generated_question
      - correct_answer
      - research_documentation

  - step: 6
    action: Write research documentation
    file: research/researchN/researchN.md  # e.g., research3/research3.md
    content: Full research documentation from step 5

  - step: 7
    action: Append new question to YAML
    file: research/research-questions.yaml
    format:
      id: N
      question: generated_question  # from step 5
      status: pending
      folder: researchN
      score: null
      research_status: null  # Will be set after verification

  - step: 8
    action: Return generated question
    output: generated_question
```

## Key Behavior

```yaml
rules:
  - build_on_previous_research: true
  - focus_on_generic_simple_questions: true
  - exploit_llm_fundamental_limitations: true
  - easy_for_humans_hard_for_llms: true
  - avoid_technical_specifications: true
  - goal_score_below_10_percent: true
  - document_all_research: true
```

## Question Design Philosophy

```yaml
philosophy:
  strawberry_principle: "If a 5-year-old can answer it, but GPT-5 can't, it's perfect"

  human_advantage:
    - We SEE characters directly (no tokenization)
    - We can count on fingers
    - We're not primed by word meanings during simple tasks
    - We have visual/spatial intuition

  llm_weakness:
    - Token-based processing hides characters
    - Semantic associations override task instructions
    - Pattern matching fails on novel combinations
    - No visual/spatial reasoning capability
```
