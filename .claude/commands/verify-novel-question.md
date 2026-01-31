# Verify Novel Question Command

Verifies a pending question by launching 5 parallel Opus answerers and synthesizing results with a verifier agent.

## State Management

```yaml
STATE_INTEGRATION:
  on_entry:
    - This phase is called when workflow.current_phase = "verify"
    - workflow.current_iteration contains the question ID (N) being verified
  on_exit:
    - Update workflow.current_phase = "evaluate"
    - Update workflow.last_completed_phase = "verify"
    - IMMEDIATELY continue to evaluate phase - DO NOT STOP
```

## Instructions

```yaml
steps:
  - step: 1
    action: Read pending question from state
    file: research/research-state.yaml
    select: question where status = "pending" OR status = "in_progress"
    extract: [id, question, folder]
    note: Research folder already exists (created by generate phase)

  - step: 2
    action: Update question status to in_progress
    file: research/research-state.yaml
    change: questions[id].status = "in_progress"

  - step: 3
    action: Launch 5 Opus Answerers in PARALLEL
    execution: parallel
    subagent_type: opus-answer
    description: Simple LLM answerers - just answer the question naturally
    agents:
      - agent: 1
        output: research/research{N}/answer1.md
      - agent: 2
        output: research/research{N}/answer2.md
      - agent: 3
        output: research/research{N}/answer3.md
      - agent: 4
        output: research/research{N}/answer4.md
      - agent: 5
        output: research/research{N}/answer5.md
    prompt_template: |
      Answer this question:

      "{ACTUAL_QUESTION_TEXT}"

      Write your answer to {FULL_ABSOLUTE_PATH}/research/research{N}/answer{X}.md

    CRITICAL:
      - Pass the ACTUAL question text directly in the prompt
      - DO NOT reference a question.md file
      - Use the question string from research-state.yaml
      - Use FULL ABSOLUTE file paths

  - step: 4
    action: Wait for completion
    verify: all files exist
    files:
      - research/research{N}/answer1.md
      - research/research{N}/answer2.md
      - research/research{N}/answer3.md
      - research/research{N}/answer4.md
      - research/research{N}/answer5.md

  - step: 5
    action: Launch Verifier Agent
    subagent_type: opus-verifier
    input: research/research{N}/answer[1-5].md
    output: research/research{N}/verifier{N}.md
    prompt: |
      You are the opus-verifier. Read all 5 answer files in research/research{N}/ (answer1.md through answer5.md).
      Extract the key conclusions from each. Compare the answers, identify consensus and disagreements.
      Synthesize the best final answer based on the quality of reasoning and evidence provided.
      Write your complete analysis and final answer to research/research{N}/verifier{N}.md.
      Include a confidence score as a percentage (0-100%) representing the level of consensus.

  - step: 6
    action: Extract confidence score from verifier
    file: research/research{N}/verifier{N}.md
    extract: confidence_score (look for "Confidence Score: X%" or similar)
    parse: Extract numeric value

  - step: 7
    action: Update question status and score
    file: research/research-state.yaml
    updates:
      - questions[id].status = "completed"
      - questions[id].score = extracted_confidence_score

  - step: 8
    action: Update workflow state
    file: research/research-state.yaml
    updates:
      workflow.current_phase: "evaluate"
      workflow.last_completed_phase: "verify"
    then: ">>> PHASE COMPLETE - CONTINUE TO EVALUATE <<<"
```

## Key Principles

```yaml
principles:
  automatic_question_pickup: reads pending question from research-state.yaml
  folder_already_exists: created by generate phase
  simple_answering: each agent answers naturally like a standard LLM
  no_special_context: agents receive only the question, no research instructions
  parallel_execution: all 5 answer agents run simultaneously
  independent_responses: each agent thinks independently without influence
  quality_synthesis: verifier extracts consensus from multiple perspectives

CRITICAL_question_passing:
  - The question TEXT must be passed DIRECTLY in the agent prompt
  - DO NOT create or reference a question.md file
  - Extract the question string from research-state.yaml
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
    behavior: Compare, identify agreement/disagreement, produce confidence score
```

## File References

```yaml
files:
  state: research/research-state.yaml
  research_folder: research/research{N}/
  answers: research/research{N}/answer[1-5].md
  verifier: research/research{N}/verifier{N}.md
```
