# Execute Workflow Command

This command orchestrates the full research workflow using state-based continuation. It reads the workflow state, determines what phase to execute, and continues until the workflow completes.

## STATE-BASED CONTINUATION SYSTEM

```yaml
CRITICAL_RULES:
  - ALWAYS read research/research-state.yaml FIRST
  - Check workflow.status and workflow.current_phase
  - If status is "running", RESUME from current_phase
  - If status is "idle", START fresh workflow
  - NEVER stop until workflow.status becomes "idle" after commit
  - After EACH phase, update the state file BEFORE proceeding
  - This ensures recovery if interrupted
```

## State Machine

```yaml
state_machine:
  idle:
    description: "No workflow running"
    action: "Check for pending questions or start new iteration"
    transitions:
      - condition: "pending question exists"
        next_phase: verify
        set_status: running
      - condition: "no pending questions"
        next_phase: generate
        set_status: running

  running:
    phases:
      generate:
        action: "Execute research-novel-question logic"
        on_complete:
          update: "workflow.current_phase = 'verify'"
          then: "IMMEDIATELY proceed to verify phase"

      verify:
        action: "Execute verify-novel-question logic"
        on_complete:
          update: "workflow.current_phase = 'evaluate'"
          then: "IMMEDIATELY proceed to evaluate phase"

      evaluate:
        action: "Read score, set research_status"
        on_complete:
          update: "workflow.current_phase = 'update_agent'"
          then: "IMMEDIATELY proceed to update_agent phase"

      update_agent:
        action: "Update opus-researcher.md with findings"
        condition: "only if score >= 10"
        on_complete:
          update: "workflow.current_phase = 'commit'"
          then: "IMMEDIATELY proceed to commit phase"

      commit:
        action: "Execute commit-research logic"
        on_complete:
          update: "workflow.status = 'idle', workflow.current_phase = null"
          then: "IMMEDIATELY proceed to report phase"

      report:
        action: "Display completion summary and recommend /compact"
        on_complete:
          then: "Workflow complete"
```

## Instructions

```yaml
steps:
  - step: 1
    action: Read workflow state
    file: research/research-state.yaml
    extract:
      - workflow.status
      - workflow.current_phase
      - workflow.current_iteration
    decision:
      if_status_is_running:
        log: "Resuming workflow from phase: {current_phase}"
        goto: "Resume at current_phase"
      if_status_is_idle:
        log: "Starting fresh workflow"
        goto: step 2

  - step: 2
    action: Check for pending questions
    file: research/research-state.yaml
    check: "any question with status = 'pending'"
    branching:
      if_pending_exists:
        action: |
          1. Update workflow state:
             - workflow.status = "running"
             - workflow.current_phase = "verify"
             - workflow.current_iteration = pending_question.id
          2. Write state to file
          3. IMMEDIATELY goto: PHASE_VERIFY
      if_no_pending:
        action: |
          1. Update workflow state:
             - workflow.status = "running"
             - workflow.current_phase = "generate"
             - workflow.current_iteration = max(questions.id) + 1
          2. Write state to file
          3. IMMEDIATELY goto: PHASE_GENERATE

  ### PHASE: GENERATE ###
  - phase: PHASE_GENERATE
    action: Generate novel question
    inline_steps:
      - Read last completed question's research for context
      - Create research folder: research/research{N}/
      - Create previous-research-summary.md in that folder
      - Launch opus-researcher agent to generate question
      - Write research documentation to research{N}/research{N}.md
      - Append new question to research-state.yaml with status: pending
    on_complete:
      - Update workflow state:
          workflow.current_phase: "verify"
          workflow.last_completed_phase: "generate"
      - Write state file
      - ">>> CONTINUE TO PHASE_VERIFY - DO NOT STOP <<<"

  ### PHASE: VERIFY ###
  - phase: PHASE_VERIFY
    action: Verify question with 5 answerers
    inline_steps:
      - Read pending question from research-state.yaml
      - Update question status to "in_progress"
      - Launch 5 parallel opus-answer agents
      - Wait for all answer files to exist
      - Launch opus-verifier agent
      - Extract confidence score from verifier output
      - Update question: status = "completed", score = extracted_score
    on_complete:
      - Update workflow state:
          workflow.current_phase: "evaluate"
          workflow.last_completed_phase: "verify"
      - Write state file
      - ">>> CONTINUE TO PHASE_EVALUATE - DO NOT STOP <<<"

  ### PHASE: EVALUATE ###
  - phase: PHASE_EVALUATE
    action: Evaluate score and set research_status
    inline_steps:
      - Read completed question's score
      - If score < 10:
          set research_status = "complete"
          log: "SUCCESS! Question stumped the verifiers."
        Else:
          set research_status = "need_more_research"
          log: "Score >= 10%. Need harder questions."
      - Write updated research_status to state file
    on_complete:
      - Update workflow state:
          workflow.current_phase: "update_agent"
          workflow.last_completed_phase: "evaluate"
      - Write state file
      - ">>> CONTINUE TO PHASE_UPDATE_AGENT - DO NOT STOP <<<"

  ### PHASE: UPDATE_AGENT ###
  - phase: PHASE_UPDATE_AGENT
    action: Update opus-researcher agent with findings
    condition: "Only if research_status = 'need_more_research'"
    inline_steps:
      - Read research documentation from research{N}/research{N}.md
      - Read current .claude/agents/opus-researcher.md
      - Append new finding to "Findings Log" section
      - Update "Evolved Strategy" if needed
      - Update "Next Research Directions" if needed
      - Write updated opus-researcher.md
    on_complete:
      - Update workflow state:
          workflow.current_phase: "commit"
          workflow.last_completed_phase: "update_agent"
      - Write state file
      - ">>> CONTINUE TO PHASE_COMMIT - DO NOT STOP <<<"

  ### PHASE: COMMIT ###
  - phase: PHASE_COMMIT
    action: Commit and push to GitHub
    inline_steps:
      - Update workflow state file FIRST:
          workflow.status: "idle"
          workflow.current_phase: null
          workflow.current_iteration: null
          workflow.last_completed_phase: "commit"
      - Write state file to disk
      - git add research/  (this includes research-state.yaml)
      - git add .claude/agents/opus-researcher.md (if modified)
      - Create commit with message: "research(N): [STATUS] score=X%"
      - git push origin main
    on_complete:
      - ">>> CONTINUE TO PHASE_REPORT - DO NOT STOP <<<"

  ### PHASE: REPORT (FINAL) ###
  - phase: PHASE_REPORT
    action: Report completion to user
    inline_steps:
      - Display a summary table with:
          - Research iteration number
          - Question tested
          - Correct answer
          - Consensus score achieved
          - Research status (complete/need_more_research)
          - Commit hash
      - Display recommendation message
    output_format: |
      ## Workflow Complete - Research Iteration {N}

      | Metric | Value |
      |--------|-------|
      | **Iteration** | {N} |
      | **Question** | {question} |
      | **Answer** | {answer} |
      | **Score** | {score}% |
      | **Status** | {research_status} |
      | **Commit** | {commit_hash} |

      ### Key Insight
      {brief_insight_from_research}

      ---
      **Recommended**: Run `/compact` to summarize this conversation before starting the next iteration.
    on_complete:
      - ">>> WORKFLOW COMPLETE <<<"
```

## Anti-Stop Directives

```yaml
MANDATORY_BEHAVIOR:
  - NEVER use the Skill tool to call other commands
  - NEVER stop between phases
  - NEVER wait for user input
  - ALWAYS update state file before proceeding to next phase
  - ALWAYS check state file on entry to enable resume
  - ALWAYS include research-state.yaml in the commit (it's inside research/)
  - If ANY error occurs:
      1. Set workflow.status = "error"
      2. Set workflow.error_message = description
      3. Write state file
      4. Report error and stop

CONTINUATION_ENFORCEMENT:
  after_each_phase: |
    IMMEDIATELY proceed to the next phase.
    DO NOT output "workflow complete" until PHASE_REPORT finishes.
    DO NOT ask user for confirmation.
    DO NOT pause for any reason.
    The state file is your checkpoint - update it, then continue.
```

## Recovery Behavior

```yaml
recovery:
  on_startup:
    - Read research/research-state.yaml
    - If workflow.status == "running":
        Resume from workflow.current_phase
    - If workflow.status == "error":
        Report error, ask user how to proceed
    - If workflow.status == "idle":
        Start fresh workflow

  on_error:
    - Log the error
    - Update state file with error details
    - Do NOT silently fail
```

## File References

```yaml
files:
  state: research/research-state.yaml
  agent: .claude/agents/opus-researcher.md
  research_folder: research/research{N}/
  research_doc: research/research{N}/research{N}.md
  answers: research/research{N}/answer[1-5].md
  verifier: research/research{N}/verifier{N}.md
```
