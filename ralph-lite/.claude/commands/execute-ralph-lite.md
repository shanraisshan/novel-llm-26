# Execute Ralph Lite Command

Minimal Ralph Wiggum loop demo. Each invocation increments a counter in `research.json`. When the counter reaches 5, signals loop completion.

## RALPH LOOP INTEGRATION

```yaml
CRITICAL_RULES:
  - This command integrates with ralph.sh (in ralph-lite directory)
  - State is tracked in ralph-lite/research.json (field: sum)
  - Completion is signaled via <promise>COMPLETE</promise> tag
  - The script checks for this tag in the output to decide whether to stop
  - Continuation is signaled via CONTINUING_LOOP tag
```

## Steps

1. Read `ralph-lite/research.json` using the Read tool.
2. Parse the current value of `sum`.
3. Increment `sum` by 1.
4. Overwrite `ralph-lite/research.json` with the new value using the Write tool.
5. Output the current iteration status to the user.
6. Evaluate the exit condition:
   - If `sum >= 5`: output the literal text `<promise>COMPLETE</promise>` on its own line.
   - Otherwise: output the literal text `CONTINUING_LOOP` on its own line.

## Expected Output Format

```
Iteration: sum incremented to <N>
<promise>COMPLETE</promise>   # when sum >= 5
CONTINUING_LOOP               # when sum < 5
```

## Important Notes

- Never skip the increment step.
- Always write the file back before emitting the completion/continuation tag.
- The promise tag MUST be on its own line so ralph.sh can detect it.
- Do not reset `sum` back to 0 — the loop relies on monotonic progress.
