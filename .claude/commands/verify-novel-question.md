# Creative Research Workflow

A comprehensive research workflow that leverages 5 parallel Opus researchers to provide diverse, well-researched answers without limiting the model's creativity or thinking.

## Instructions

```yaml
steps:
  - step: 1
    action: Read latest pending question
    file: research/research-questions.yaml
    select: highest id where status = pending
    extract: [id, question, folder]
    note: Research folder already exists (created by research-novel-question)

  - step: 2
    action: Update question status
    file: research/research-questions.yaml
    change: status from "pending" to "in_progress"

  - step: 3
    action: Launch 5 Opus Researchers
    execution: parallel
    subagent_type: opus-researcher
    agents:
      - agent: 1
        output: research/researchN/answer1.md
      - agent: 2
        output: research/researchN/answer2.md
      - agent: 3
        output: research/researchN/answer3.md
      - agent: 4
        output: research/researchN/answer4.md
      - agent: 5
        output: research/researchN/answer5.md
    prompt_template: |
      Research and answer the following question comprehensively.
      Use WebSearch to find the most accurate and up-to-date information.
      Think deeply, explore multiple angles, and provide your best answer with full reasoning.
      Write your complete answer to [OUTPUT_FILE].
      Question: [QUESTION]

  - step: 4
    action: Wait for completion
    verify: all files exist (answer1.md through answer5.md)

  - step: 5
    action: Launch Verifier Agent
    subagent_type: opus-verifier
    input: research/researchN/answer[1-5].md
    output: research/researchN/verifierN.md
    tasks:
      - Read all 5 answer files
      - Extract and compare key conclusions
      - Identify consensus and disagreements
      - Synthesize best final answer
      - Calculate confidence/consistency score
    prompt_template: |
      You are the opus-verifier. Read all 5 answer files in research/researchN/ (answer1.md through answer5.md).
      Extract the key conclusions from each. Compare the answers, identify consensus and disagreements.
      Synthesize the best final answer based on the quality of reasoning and evidence provided.
      Write your complete analysis and final answer to research/researchN/verifierN.md following your standard verification format.

  - step: 6
    action: Extract confidence score from verifier
    file: research/researchN/verifierN.md
    extract: confidence_score (e.g., "95%")

  - step: 7
    action: Update question status and score
    file: research/research-questions.yaml
    updates:
      - status: "completed"
      - score: extracted confidence score (e.g., 95)

  - step: 8
    action: Report completion
    output:
      - location of verifierN.md
      - final confidence score
```

## Key Principles

```yaml
principles:
  automatic_question_pickup: reads latest pending question from research-questions.yaml
  folder_already_exists: created by research-novel-question command
  no_creativity_limits: each agent thinks deeply without constraints
  independent_research: each agent conducts own web searches and analysis
  parallel_execution: all 5 research agents run simultaneously
  diverse_perspectives: independent thinking leads to varied approaches
  quality_synthesis: verifier extracts best answer from multiple perspectives
```

## Fallback Behavior

```yaml
fallback:
  - condition: research-questions.yaml is empty, missing, or has no pending questions
    action: Ask user "What question would you like me to research comprehensively?"

  - condition: $ARGUMENTS is provided
    action: Use that as the question instead of reading from file
```
