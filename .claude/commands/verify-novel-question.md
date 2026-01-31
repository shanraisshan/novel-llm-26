# Creative Research Workflow

A comprehensive research workflow that leverages 5 parallel Opus answerers to test how LLMs respond to novel questions, then synthesizes the results to measure consensus.

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
    action: Launch 5 Opus Answerers
    execution: parallel
    subagent_type: opus-answer
    description: Simple LLM answerers - just answer the question naturally
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
    prompt_instructions: |
      IMPORTANT: Pass the actual question text directly in the prompt.
      DO NOT reference a question.md file - the question text goes directly in the prompt.
      Replace [QUESTION] with the actual question string from research-questions.yaml.
      Replace [OUTPUT_FILE] with the full absolute file path.
    prompt_template: |
      Answer this question:

      [ACTUAL QUESTION TEXT FROM research-questions.yaml - NOT a file reference]

      Write your answer to [FULL ABSOLUTE PATH e.g. /Users/.../research/research3/answer1.md]

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
  simple_answering: each agent answers naturally like a standard LLM
  no_special_context: agents receive only the question, no research instructions
  parallel_execution: all 5 answer agents run simultaneously
  independent_responses: each agent thinks independently without influence
  quality_synthesis: verifier extracts consensus from multiple perspectives

CRITICAL_question_passing:
  - The question TEXT must be passed DIRECTLY in the agent prompt
  - DO NOT create or reference a question.md file
  - Extract the question string from research-questions.yaml
  - Include the actual question text in the Task prompt
  - Example: 'Answer this question: "Which word has more letters: FOUR or FIVE?"'
```

## Agent Roles

```yaml
agents:
  opus-answer:
    count: 5
    purpose: Answer the question naturally (like pasting into ChatGPT)
    behavior: No research, no special instructions, just answer

  opus-verifier:
    count: 1
    purpose: Synthesize 5 answers and calculate consensus score
    behavior: Compare, identify agreement/disagreement, score
```

## Fallback Behavior

```yaml
fallback:
  - condition: research-questions.yaml is empty, missing, or has no pending questions
    action: Ask user "What question would you like me to research comprehensively?"

  - condition: $ARGUMENTS is provided
    action: Use that as the question instead of reading from file
```
