# Research Novel Question Command

A simplified workflow that launches the opus-researcher agent to generate novel LLM-breaking questions. All research knowledge and instructions are contained in the opus-researcher agent itself.

## CRITICAL: Part of Continuous Workflow

```yaml
IMPORTANT:
  - This command is typically called from execute-workflow
  - After this command completes, the caller MUST continue to the next step
  - DO NOT stop after returning - proceed to verify-novel-question
```

## Instructions

```yaml
steps:
  - step: 1
    action: Read research-questions.yaml to find last completed question
    file: research/research-questions.yaml
    find: highest id where status = "completed"
    extract: [id, folder, score, research_status]
    output: last_completed_id

  - step: 2
    action: Determine next question ID
    file: research/research-questions.yaml
    calculate: max(id) + 1
    output: next_id (N)

  - step: 3
    action: Create research folder
    path: research/researchN/  # N = next question ID

  - step: 4
    action: Read and summarize previous research
    condition: only if step 1 found a completed question
    file: research/research{last_completed_id}/research{last_completed_id}.md
    task: Create a concise summary of key insights, what was tried, and lessons learned
    output_file: research/researchN/previous-research-summary.md
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

      Read the previous research summary at: research/researchN/previous-research-summary.md
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
    file: research/researchN/researchN.md  # e.g., research3/research3.md
    content: Full research documentation from step 5

  - step: 7
    action: Append new question to YAML
    file: research/research-questions.yaml
    format:
      id: N
      question: generated_question
      status: pending
      folder: researchN
      score: null
      research_status: null

  - step: 8
    action: Return generated question
    output: generated_question
```

## Key Behavior

```yaml
rules:
  - all_research_knowledge_in_opus_researcher: true
  - create_summary_of_previous_research: true
  - build_on_previous_iterations: true
  - opus_researcher_reads_summary_first: true
  - document_all_research: true
```

## Workflow Philosophy

This command is intentionally simple - it's just a workflow launcher. All the intelligence about:
- LLM limitations
- Question categories
- Design requirements
- Accumulated findings

...lives in the opus-researcher agent, which evolves over time with new findings.
