# Execute Workflow Command

This command orchestrates the full research workflow using state-based continuation. It reads the workflow state, determines what phase to execute, and continues until the workflow completes.

## RALPH LOOP INTEGRATION

```yaml
CRITICAL_RULES:
  - This workflow integrates with the Ralph Loop script (ralph.sh in root directory)
  - Status is tracked in research/research-status.json
  - Completion is signaled via <promise>COMPLETE</promise> tag
  - The script checks for this tag in the output to determine if loop should stop
  - ALWAYS read research/research-workflow-state.yaml and research/research-questions.yaml FIRST
  - Check workflow.status and workflow.current_phase
  - If status is "running", RESUME from current_phase
  - If status is "idle", START fresh workflow
  - NEVER stop until workflow.status becomes "idle" after commit
  - After EACH phase, update the state files BEFORE proceeding
  - This ensures recovery if interrupted
  - Track started_at and completed_at timestamps for each question
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
        action: "Display completion summary and signal loop status"
        on_complete:
          then: "Output promise tag if complete, otherwise workflow continues"
```

## Instructions

```yaml
steps:
  - step: 1
    action: Read workflow state
    files:
      - research/research-workflow-state.yaml
      - research/research-questions.yaml
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
    file: research/research-questions.yaml
    check: "any question with status = 'pending'"
    branching:
      if_pending_exists:
        action: |
          1. Update workflow state in research-workflow-state.yaml:
             - workflow.status = "running"
             - workflow.current_phase = "verify"
             - workflow.current_iteration = pending_question.id
          2. Write state to file
          3. IMMEDIATELY goto: PHASE_VERIFY
      if_no_pending:
        action: |
          1. Update workflow state in research-workflow-state.yaml:
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
      - Save MCP tool findings to research folder (see MCP_FINDINGS_OUTPUT below)
      - Append new question to research-questions.yaml with:
          status: pending
          started_at: current timestamp in format "DD/MM/YYYY HH:MM AM/PM PST"
          completed_at: null
    on_complete:
      - Update workflow state in research-workflow-state.yaml:
          workflow.current_phase: "verify"
          workflow.last_completed_phase: "generate"
      - Write state file
      - ">>> CONTINUE TO PHASE_VERIFY - DO NOT STOP <<<"

  ### PHASE: VERIFY ###
  - phase: PHASE_VERIFY
    action: Verify question with 5 answerers
    inline_steps:
      - Read pending question from research-questions.yaml
      - Update question status to "in_progress"
      - Launch 5 parallel opus-answer agents
      - Wait for all answer files to exist
      - Launch opus-verifier agent
      - Extract confidence score from verifier output
      - Update question: status = "completed", score = extracted_score
    on_complete:
      - Update workflow state in research-workflow-state.yaml:
          workflow.current_phase: "evaluate"
          workflow.last_completed_phase: "verify"
      - Write state file
      - ">>> CONTINUE TO PHASE_EVALUATE - DO NOT STOP <<<"

  ### PHASE: EVALUATE ###
  - phase: PHASE_EVALUATE
    action: Evaluate score and set research_status and research_activity
    inline_steps:
      - Read completed question's score
      - If score < 10:
          set research_status = "complete"
          log: "SUCCESS! Question stumped the verifiers."
        Else:
          set research_status = "need_more_research"
          log: "Score >= 10%. Need harder questions."
      - Collect any issues encountered during workflow execution:
          - MCP server failures
          - Agent spawn issues
          - Command errors
          - Tool timeouts
          - Any other execution anomalies
      - Set research_activity = collected issues (or null if none)
      - Write updated research_status AND research_activity to research-questions.yaml
    on_complete:
      - Update workflow state in research-workflow-state.yaml:
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
      - Update workflow state in research-workflow-state.yaml:
          workflow.current_phase: "commit"
          workflow.last_completed_phase: "update_agent"
      - Write state file
      - ">>> CONTINUE TO PHASE_COMMIT - DO NOT STOP <<<"

  ### PHASE: COMMIT ###
  - phase: PHASE_COMMIT
    action: Commit and push to GitHub
    inline_steps:
      - Update question's completed_at in research-questions.yaml: current timestamp in format "DD/MM/YYYY HH:MM AM/PM PST"
      - Update workflow state in research-workflow-state.yaml:
          workflow.status: "idle"
          workflow.current_phase: null
          workflow.current_iteration: null
          workflow.last_completed_phase: "commit"
      - Write state files to disk
      - Write research/research-status.json with: {"status": "complete"} or {"status": "need_more_research"}
      - git add research/  (this includes research-workflow-state.yaml, research-questions.yaml, and research-status.json)
      - git add .claude/agents/opus-researcher.md (if modified)
      - Create commit with message: "research(N): [STATUS] score=X%"
      - git push origin main
    on_complete:
      - ">>> CONTINUE TO PHASE_REPORT - DO NOT STOP <<<"

  ### PHASE: REPORT (FINAL) ###
  - phase: PHASE_REPORT
    action: Report completion to user and signal loop status
    inline_steps:
      - Display a summary table with:
          - Research iteration number
          - Question tested
          - Correct answer
          - Consensus score achieved
          - Research status (complete/need_more_research)
          - Started at timestamp
          - Completed at timestamp
          - Duration (completed_at - started_at)
          - Commit hash
      - Display recommendation message
      - Signal loop completion status (see Promise Tag section)
    output_format: |
      ## Workflow Complete - Research Iteration {N}

      | Metric | Value |
      |--------|-------|
      | **Iteration** | {N} |
      | **Question** | {question} |
      | **Answer** | {answer} |
      | **Score** | {score}% |
      | **Status** | {research_status} |
      | **Activity** | {research_activity or "Clean execution"} |
      | **Started** | {started_at} |
      | **Completed** | {completed_at} |
      | **Duration** | {duration} |
      | **Commit** | {commit_hash} |

      ### Key Insight
      {brief_insight_from_research}

      ---
      **Recommended**: Run `/compact` to summarize this conversation before starting the next iteration.
    on_complete:
      - ">>> WORKFLOW ITERATION COMPLETE <<<"
      - ">>> IF research_status = 'complete': Output <promise>COMPLETE</promise> <<<"
      - ">>> IF research_status = 'need_more_research': Output CONTINUING_RESEARCH <<<"
```

## Research Activity Tracking

```yaml
RESEARCH_ACTIVITY_FIELD:
  description: "Track execution issues, failures, and anomalies during research workflow"
  field_name: research_activity
  location: "Each question entry in research-questions.yaml"

  what_to_track:
    - MCP server failures (reddit, tavily, ide, claude-in-chrome)
    - Agent not found or spawn failures
    - Command execution errors
    - Tool call failures or timeouts
    - Network/API errors
    - Any unexpected behavior affecting execution
    - Empty or null if no issues occurred

  format: "Brief description of issue(s) or null if clean execution"

  examples:
    clean_run: null
    mcp_failure: "mcp__reddit-mcp-server failed: connection timeout"
    agent_issue: "opus-researcher agent spawn failed, retried successfully"
    multiple_issues: "tavily search timeout; verifier agent slow response"
    command_error: "git push failed: authentication error, retried"

  when_to_update:
    - During PHASE_GENERATE: Track issues with opus-researcher or MCP tools
    - During PHASE_VERIFY: Track issues with answer agents or verifier
    - During PHASE_COMMIT: Track issues with git operations
    - During PHASE_EVALUATE: Write final research_activity value to questions file

  tracking_behavior:
    - Accumulate issues throughout workflow phases
    - Write final value when writing research_status
    - If no issues, set to null
    - Be concise but specific about what failed
```

## Research Status File

```yaml
file: research/research-status.json
description: "Simple status file for Ralph Loop script"
format: |
  {"status": "need_more_research"}
  OR
  {"status": "complete"}

update_rules:
  - Write this file during PHASE_COMMIT
  - Only one key: "status"
  - Values: "need_more_research" (score >= 10%) or "complete" (score < 10%)

examples:
  need_more_research: |
    {"status": "need_more_research"}
  complete: |
    {"status": "complete"}
```

## Promise Tag (Loop Completion Signal)

```yaml
CRITICAL_BEHAVIOR:
  description: "The Ralph Loop script detects <promise>COMPLETE</promise> tag to know when to stop"

  when_research_complete:
    condition: "research_status = 'complete' (score < 10%)"
    action: "Output the promise tag to stop the loop"
    output: "<promise>COMPLETE</promise>"
    effect: "Ralph Loop script will detect this and exit successfully"

  when_need_more_research:
    condition: "research_status = 'need_more_research' (score >= 10%)"
    action: "Do NOT output the COMPLETE promise tag"
    output: "CONTINUING_RESEARCH"
    effect: "Ralph Loop script will continue to next iteration"

  IMPORTANT:
    - ONLY output <promise>COMPLETE</promise> when research is TRULY complete
    - Do NOT lie to exit the loop
    - Output CONTINUING_RESEARCH when more iterations are needed
```

## Timestamp Tracking

```yaml
timestamp_format: "DD/MM/YYYY HH:MM AM/PM PST"
timezone: Pakistan Standard Time (UTC+5)
examples:
  - "31/01/2026 09:12 PM PST"
  - "01/02/2026 10:30 AM PST"

when_to_set:
  started_at:
    phase: PHASE_GENERATE
    when: "When creating new question entry in research-questions.yaml"
    bash_command: 'date +"%d/%m/%Y %I:%M %p PST"'

  completed_at:
    phase: PHASE_COMMIT
    when: "Just before committing, update the question's completed_at"
    bash_command: 'date +"%d/%m/%Y %I:%M %p PST"'

duration_calculation:
  in_report: "Calculate completed_at - started_at and display as 'Xm Ys' or 'Xh Ym'"
```

## Anti-Stop Directives

```yaml
MANDATORY_BEHAVIOR:
  - NEVER use the Skill tool to call other commands
  - NEVER stop between phases
  - NEVER wait for user input
  - ALWAYS update state files before proceeding to next phase
  - ALWAYS check state files on entry to enable resume
  - ALWAYS include research/ folder in the commit (contains research-workflow-state.yaml, research-questions.yaml, research-status.json)
  - ALWAYS write research-status.json with {"status": "..."} before committing
  - ALWAYS set started_at when creating new question (format: "DD/MM/YYYY HH:MM AM/PM PST")
  - ALWAYS set completed_at before final commit (format: "DD/MM/YYYY HH:MM AM/PM PST")
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
    The state files are your checkpoints - update them, then continue.
```

## Recovery Behavior

```yaml
recovery:
  on_startup:
    - Read research/research-workflow-state.yaml
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

## MCP Findings Output

```yaml
MCP_FINDINGS_OUTPUT:
  description: "Save all MCP tool research findings to the research folder"
  when: "During PHASE_GENERATE, after opus-researcher completes"

  files_to_create:
    reddit_findings:
      path: research/research{N}/mcp-reddit-findings.md
      content: |
        # Reddit Research Findings

        ## Subreddits Searched
        {list of subreddits browsed or searched}

        ## Key Posts Found
        {titles, URLs, and summaries of relevant posts}

        ## Insights Extracted
        {what was learned from Reddit that informed the question}

    tavily_findings:
      path: research/research{N}/mcp-tavily-findings.md
      content: |
        # Tavily Web Search Findings

        ## Search Queries Used
        {list of search queries executed}

        ## Sources Found
        {URLs and summaries of relevant sources}

        ## Key Information Extracted
        {facts, data, or insights that informed the question}

  instructions:
    - After opus-researcher uses any mcp__reddit-mcp-server__* tools, save findings to mcp-reddit-findings.md
    - After opus-researcher uses any mcp__tavily-web-search__* tools, save findings to mcp-tavily-findings.md
    - Include raw data, URLs, and how the findings influenced question generation
    - If no MCP tools were used, skip creating those files
```

## File References

```yaml
files:
  workflow_state: research/research-workflow-state.yaml
  questions: research/research-questions.yaml
  research_status: research/research-status.json
  agent: .claude/agents/opus-researcher.md
  research_folder: research/research{N}/
  research_doc: research/research{N}/research{N}.md
  mcp_reddit: research/research{N}/mcp-reddit-findings.md
  mcp_tavily: research/research{N}/mcp-tavily-findings.md
  answers: research/research{N}/answer[1-5].md
  verifier: research/research{N}/verifier{N}.md

research_status_format:
  description: "Simple JSON status file for Ralph Loop script"
  structure: |
    {"status": "need_more_research"}
    OR
    {"status": "complete"}
```
