# Ralph Loop Prompt

Execute the research workflow by running /execute-workflow. After the workflow completes and reports its summary, read the file research/research-status.json to check the current status. If the status field equals 'complete', output exactly: RESEARCH_COMPLETE_LLM_BROKEN. If the status field equals 'need_more_research', output: Continuing to next iteration... and the loop will repeat.

## Command

```bash
/ralph-loop:ralph-loop "<prompt above>" --max-iterations 100 --completion-promise "RESEARCH_COMPLETE_LLM_BROKEN"
```

## Full Command (Copy This)

```
/ralph-loop:ralph-loop "Execute the research workflow by running /execute-workflow. After the workflow completes and reports its summary, read the file research/research-status.json to check the current status. If the status field equals 'complete', output exactly: RESEARCH_COMPLETE_LLM_BROKEN. If the status field equals 'need_more_research', output: Continuing to next iteration... and the loop will repeat." --max-iterations 100 --completion-promise "RESEARCH_COMPLETE_LLM_BROKEN"
```
