# Execute Workflow Command

This command checks for pending research questions and executes the full research workflow. If no pending questions exist, it generates a new novel question first. After verification, it evaluates the score, updates status, and commits to GitHub.

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
    read: score from the question just verified (latest completed)
    logic:
      if_score_less_than_10:
        - update: research_status = "complete"
        - Log: "SUCCESS! Question achieved < 10% consensus. Research complete."
      if_score_greater_or_equal_10:
        - update: research_status = "need_more_research"
        - Log: "Score >= 10%. Need harder questions. Research continues."

  - step: 5
    action: Commit research to GitHub
    tool: Skill
    skill_name: commit-research
    does:
      - Stage all files in research/ folder
      - Create commit with score and status in message
      - Format: "research(N): [STATUS] score=X%"
    note: Does not push automatically - user can push manually
```

## Flow Summary

```yaml
flow:
  pending_exists:
    step_1 -> step_3 -> step_4 -> step_5  # Verify, evaluate, commit

  no_pending:
    step_1 -> step_2 -> step_3 -> step_4 -> step_5  # Generate, verify, evaluate, commit
```

## Key Behavior

```yaml
rules:
  - check_pending_questions_first: true
  - skip_generation_if_pending: true
  - folder_creation_handled_by_research_novel_question: true
  - evaluate_score_after_verification: true
  - target_score_below_10_percent: true
  - commit_after_completion: true
  - no_auto_push: true
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
  when_not_achieved: research_status = "need_more_research"
  always: commit results to git
```
