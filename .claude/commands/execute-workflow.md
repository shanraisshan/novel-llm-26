---
context: fork
---
# Execute Workflow Command

This command checks for pending research questions and executes the full research workflow. If no pending questions exist, it generates a new novel question first. After verification, it evaluates the score, updates the living opus-researcher agent with findings, and commits to GitHub.

## CRITICAL: Continuous Execution

```yaml
IMPORTANT:
  - This workflow MUST run continuously from start to finish
  - DO NOT STOP after any step - continue to the next step immediately
  - DO NOT wait for user confirmation between steps
  - The workflow is only complete when commit-research finishes (step 6)
  - If a skill/command returns, immediately proceed to the next step
```

## Prerequisites

> **Run `/compact` manually before this workflow** to ensure sufficient context space for launching 5 parallel Opus researchers.

## Instructions

```yaml
steps:
  - step: 1
    action: Check for pending questions
    file: research/research-questions.yaml
    check: any questions with status = "pending"
    branching:
      if_pending_exists:
        - Log: "Found pending question(s). Processing existing queue."
        - goto: step 3  # Skip to verify-novel-question
      if_no_pending:
        - Log: "No pending questions. Creating new question."
        - goto: step 2  # Create new question first

  - step: 2
    action: Execute research-novel-question command
    condition: only if no pending questions
    tool: Skill
    skill_name: research-novel-question
    does:
      - Reads last completed question's research for context
      - Creates summary of previous research in new folder
      - Uses opus-researcher to generate progressively harder question
      - Creates research folder (researchN/)
      - Writes research documentation (researchN/researchN.md)
      - Appends question to research-questions.yaml with pending status

  - step: 3
    action: Execute verify-novel-question workflow
    tool: Skill
    skill_name: verify-novel-question
    triggers:
      - Pick up the latest pending question
      - Launch 5 parallel Opus researchers
      - Run verifier to synthesize final answer
      - Update score in research-questions.yaml

  - step: 4
    action: Evaluate research completion status
    file: research/research-questions.yaml
    read: score and id from the question just verified (latest completed)
    logic:
      if_score_less_than_10:
        - update: research_status = "complete"
        - Log: "SUCCESS! Question achieved < 10% consensus. Research complete."
      if_score_greater_or_equal_10:
        - update: research_status = "need_more_research"
        - Log: "Score >= 10%. Need harder questions. Research continues."
        - goto: step 5  # Update the living agent

  - step: 5
    action: Update opus-researcher agent with findings
    condition: only if score >= 10% AND research_status = "need_more_research"
    file: .claude/agents/opus-researcher.md
    task: |
      Read the research documentation from the completed question:
      - research/researchN/researchN.md

      Update the "ACCUMULATED RESEARCH FINDINGS" section in opus-researcher.md:

      1. Add new entry to the findings log:
         ```yaml
         - iteration: N
           question: "[the question tested]"
           score: X%
           status: need_more_research
           insight: "[what was learned about why this failed to stump LLMs]"
           lesson: "[specific guidance for future iterations]"
         ```

      2. Update "Evolved Strategy" section if new patterns emerged

      3. Update "Next Research Directions" with new promising directions based on findings

    purpose: |
      The opus-researcher is a LIVING AGENT that evolves with each research cycle.
      By updating it with findings, it accumulates knowledge and becomes more
      capable of generating truly novel LLM-breaking questions over time.

  - step: 6
    action: Commit research to GitHub
    tool: Skill
    skill_name: commit-research
    does:
      - Stage all files in research/ folder
      - Stage .claude/agents/opus-researcher.md (if updated in step 5)
      - Create commit with score and status in message
      - Format: "research(N): [STATUS] score=X%"
    note: Does not push automatically - user can push manually
```

## Flow Summary

```yaml
flow:
  pending_exists:
    step_1 -> step_3 -> step_4 -> step_5 (if need_more_research) -> step_6

  no_pending:
    step_1 -> step_2 -> step_3 -> step_4 -> step_5 (if need_more_research) -> step_6
```

## Key Behavior

```yaml
rules:
  - CONTINUOUS_EXECUTION: true  # CRITICAL: Never stop between steps
  - DO_NOT_WAIT_FOR_USER: true  # Proceed automatically through all steps
  - check_pending_questions_first: true
  - skip_generation_if_pending: true
  - folder_creation_handled_by_research_novel_question: true
  - evaluate_score_after_verification: true
  - target_score_below_10_percent: true
  - update_living_agent_on_failure: true  # opus-researcher evolves
  - commit_after_completion: true
  - no_auto_push: true
```

## Living Agent Philosophy

```yaml
living_agent:
  what: The opus-researcher.md is not static - it evolves
  when: Every time score >= 10% (question didn't stump LLMs enough)
  how: Accumulated findings are appended to the agent definition
  why: Over time, the agent learns what works and what doesn't
  result: Progressively better at generating truly novel questions

  update_trigger:
    condition: score > 10% AND research_status = "need_more_research"
    action: Append findings to opus-researcher.md
    sections_updated:
      - "Findings Log" (new entry)
      - "Evolved Strategy" (refined approach)
      - "Next Research Directions" (new ideas)
```

## Research Status Field

```yaml
research_status_values:
  complete: "Score < 10% - Question successfully stumped the verifiers"
  need_more_research: "Score >= 10% - Questions need to be harder"
  null: "Not yet evaluated"
```

## Success Criteria

```yaml
success:
  goal: Generate questions so novel that 5 researchers disagree
  target_score: < 10%
  when_achieved: research_status = "complete"
  when_not_achieved:
    - research_status = "need_more_research"
    - opus-researcher agent is updated with learnings
  always: commit results to git
```
