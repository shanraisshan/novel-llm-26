# Ralph Loop Prompt

Execute `/execute-workflow` to run one complete research iteration.

The workflow handles everything autonomously:
- Generates novel questions via opus-researcher
- Verifies with 5 parallel answerers
- Evaluates and updates the research agent
- Commits results to git
- Writes status to `research/research-status.json`

## Exit Conditions

The workflow will output one of:

- `<promise>COMPLETE</promise>` - Novel question found (score < 10%)
- `CONTINUING_RESEARCH` - Need more iterations (score >= 10%)
