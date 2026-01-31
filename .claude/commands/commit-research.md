# Commit Research Command

This command commits all research files to GitHub after a research workflow completes.

## Instructions

```yaml
steps:
  - step: 1
    action: Check git status
    command: git status
    purpose: See all changed/new files in research folder

  - step: 2
    action: Stage research files
    command: git add research/
    includes:
      - research/research-questions.yaml
      - research/researchN/ (new research folders)
      - research/researchN/researchN.md (research documentation)
      - research/researchN/answer1-5.md (researcher answers)
      - research/researchN/verifierN.md (verifier synthesis)

  - step: 3
    action: Read latest completed question for commit message
    file: research/research-questions.yaml
    extract:
      - id: latest completed question id
      - score: the score achieved
      - research_status: complete or need_more_research

  - step: 4
    action: Create commit
    command: git commit
    message_format: |
      research(N): [STATUS] score=X%

      - Question: [QUESTION_PREVIEW]
      - Score: X%
      - Status: [research_status]
      - Files: researchN/

      Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
    examples:
      - "research(2): [need_more_research] score=100%"
      - "research(5): [complete] score=8%"

  - step: 5
    action: Report commit status
    output:
      - commit hash
      - files committed
      - research status
```

## Key Behavior

```yaml
rules:
  - only_commit_research_folder: true
  - include_score_in_commit_message: true
  - include_research_status_in_commit_message: true
  - do_not_push_automatically: true  # User can push manually if desired
  - use_conventional_commit_format: true
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
```
