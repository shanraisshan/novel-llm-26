# Ralph Loop Prompt

Execute the research workflow by running /execute-workflow. After the workflow completes, read the file research/research-status.json to check the current status.

**Exit Conditions:**
- If status equals "complete" → Output exactly: <promise>LOOP_DONE</promise>
- If status equals "need_more_research" → Output exactly: CONTINUING_RESEARCH

**CRITICAL:** You MUST output one of these two exact strings based on the status. The loop depends on detecting <promise>LOOP_DONE</promise> to exit.

## Command

```bash
/ralph-loop:ralph-loop "<prompt above>" --max-iterations 100 --completion-promise "LOOP_DONE"
```

## Full Command (Copy This)

```
/ralph-loop:ralph-loop "Execute the research workflow by running /execute-workflow. After the workflow completes, read the file research/research-status.json to check the current status. Exit Conditions: If status equals 'complete', output exactly: <promise>complete</promise>. If status equals 'need_more_research', output exactly: CONTINUING_RESEARCH." --max-iterations 100 --completion-promise "complete"
```
