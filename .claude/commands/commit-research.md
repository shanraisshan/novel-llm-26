# Commit Research Command

Commits all research files to GitHub and pushes to origin. This is the final phase of the workflow.

## State Management

```yaml
STATE_INTEGRATION:
  on_entry:
    - This phase is called when workflow.current_phase = "commit"
    - workflow.current_iteration contains the question ID (N) just completed
  on_exit:
    - Update workflow.status = "idle"
    - Update workflow.current_phase = null
    - Update workflow.current_iteration = null
    - Update workflow.last_completed_phase = "commit"
    - WORKFLOW COMPLETE - safe to stop
```

## Instructions

```yaml
steps:
  - step: 1
    action: Check git status
    command: git status
    purpose: See all changed/new files

  - step: 2
    action: Stage research files
    command: git add research/
    includes:
      - research/research-workflow-state.yaml
      - research/research-questions.yaml
      - research/research{N}/ (new research folders)
      - research/research{N}/research{N}.md (research documentation)
      - research/research{N}/answer1-5.md (researcher answers)
      - research/research{N}/verifier{N}.md (verifier synthesis)

  - step: 3
    action: Stage opus-researcher agent if modified
    command: git add .claude/agents/opus-researcher.md
    condition: only if file was modified in update_agent phase

  - step: 4
    action: Read latest completed question for commit message
    files:
      - research/research-workflow-state.yaml
      - research/research-questions.yaml
    extract:
      - id: workflow.current_iteration (or latest completed question id)
      - score: questions[id].score
      - research_status: questions[id].research_status
      - question: questions[id].question (for preview)

  - step: 5
    action: Create commit
    command: git commit
    message_format: |
      research(N): [STATUS] score=X%

      - Question: [QUESTION_PREVIEW - first 60 chars]
      - Score: X%
      - Status: [research_status]
      - Files: research{N}/

      Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
    examples:
      - "research(2): [need_more_research] score=100%"
      - "research(7): [complete] score=8%"

  - step: 6
    action: Push to origin
    command: git push origin main
    purpose: Push committed changes to remote repository

  - step: 7
    action: Update workflow state to idle
    file: research/research-workflow-state.yaml
    updates:
      workflow.status: "idle"
      workflow.current_phase: null
      workflow.current_iteration: null
      workflow.last_completed_phase: "commit"

  - step: 8
    action: Report commit status
    output:
      - commit_hash: from git commit output
      - files_committed: list of staged files
      - research_status: complete or need_more_research
      - push_status: success or failure
      - message: ">>> WORKFLOW COMPLETE <<<"
```

## Key Behavior

```yaml
rules:
  stage_research_folder: true
  stage_opus_researcher_if_modified: true
  include_score_in_commit_message: true
  include_research_status_in_commit_message: true
  push_to_origin_after_commit: true
  use_conventional_commit_format: true
  update_state_to_idle_on_complete: true
```

## Commit Message Format

```yaml
format:
  type: "research"
  scope: "(N)"  # Question ID
  status: "[complete]" or "[need_more_research]"
  body:
    - Question preview (truncated if long)
    - Score percentage
    - Research status
    - Files included
  footer:
    - Co-Authored-By line
```

## File References

```yaml
files:
  workflow_state: research/research-workflow-state.yaml
  questions: research/research-questions.yaml
  agent: .claude/agents/opus-researcher.md
  research_folder: research/research{N}/
```
