# Research Novel Question Command

Generates a novel LLM-breaking question using the opus-researcher agent. All research knowledge is contained in the opus-researcher agent itself.

## State Management

```yaml
STATE_INTEGRATION:
  on_entry:
    - This phase is called when workflow.current_phase = "generate"
    - workflow.current_iteration contains the next question ID (N)
  on_exit:
    - Update workflow.current_phase = "verify"
    - Update workflow.last_completed_phase = "generate"
    - IMMEDIATELY continue to verify phase - DO NOT STOP
```

## Instructions

```yaml
steps:
  - step: 1
    action: Read state and find last completed question
    file: research/research-state.yaml
    find: highest id in questions where status = "completed"
    extract: [id, folder, score, research_status]
    output: last_completed_id

  - step: 2
    action: Determine next question ID
    file: research/research-state.yaml
    calculate: max(questions.id) + 1
    output: next_id (N)

  - step: 3
    action: Create research folder
    path: research/research{N}/

  - step: 4
    action: Read and summarize previous research
    condition: only if step 1 found a completed question
    file: research/research{last_completed_id}/research{last_completed_id}.md
    task: Create a concise summary of key insights
    output_file: research/research{N}/previous-research-summary.md
    format: |
      # Previous Research Summary (Research {last_completed_id})

      ## Question Attempted
      [The question that was tested]

      ## Score Achieved
      [The consensus score]

      ## Key Insights
      [What was learned about LLM weaknesses]

      ## What Worked
      [Approaches that showed promise]

      ## What Failed
      [Approaches that didn't work]

      ## Lessons for Next Iteration
      [Specific guidance for the next research cycle]

  - step: 5
    action: Launch Opus Researcher
    subagent_type: opus-researcher
    task: |
      ## YOUR MISSION

      Generate a novel LLM-breaking question. Follow the instructions in your
      "NOVEL LLM-BREAKING QUESTION RESEARCH" section.

      ## PREVIOUS RESEARCH CONTEXT

      Read the previous research summary at: research/research{N}/previous-research-summary.md
      (if it exists - this is research iteration N)

      BUILD ON TOP of previous research:
      - Don't repeat failed approaches
      - Escalate difficulty based on what was learned
      - Use insights from the Accumulated Research Findings in your agent definition

      ## DELIVERABLES

      1. The Question (simple one-liner)
      2. The Answer (objectively correct)
      3. Why Humans Get It Right
      4. Why LLMs Will Fail
      5. Predicted Wrong Answer
      6. Full Research Documentation

    output:
      - generated_question
      - correct_answer
      - research_documentation

  - step: 6
    action: Write research documentation
    file: research/research{N}/research{N}.md
    content: Full research documentation from step 5

  - step: 7
    action: Append new question to state file
    file: research/research-state.yaml
    append_to: questions
    format:
      id: N
      question: generated_question
      status: pending
      folder: research{N}
      score: null
      research_status: null

  - step: 8
    action: Update workflow state
    file: research/research-state.yaml
    updates:
      workflow.current_phase: "verify"
      workflow.last_completed_phase: "generate"
    then: ">>> PHASE COMPLETE - CONTINUE TO VERIFY <<<"
```

## Key Behavior

```yaml
rules:
  all_research_knowledge_in_opus_researcher: true
  create_summary_of_previous_research: true
  build_on_previous_iterations: true
  opus_researcher_reads_summary_first: true
  document_all_research: true
  update_state_on_completion: true
  never_stop_after_completion: true
```

## File References

```yaml
files:
  state: research/research-state.yaml
  agent: .claude/agents/opus-researcher.md
  research_folder: research/research{N}/
  research_doc: research/research{N}/research{N}.md
  previous_summary: research/research{N}/previous-research-summary.md
```
