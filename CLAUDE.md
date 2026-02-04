# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an automated research workflow that generates questions designed to break modern LLMs. The goal is to find simple, generic questions that any human can easily answer but cause AI models to disagree (< 10% consensus among 5 independent AI researchers). Think "strawberry problem" - one-liners that expose fundamental LLM limitations.

**Status**: Research complete. Question #103 achieved 0% consensus.

## Running the Workflow

### Single Iteration (Inside Claude Code)
```
/execute-workflow
```

### Automated Loop (Ralph Wiggum Pattern)
```bash
./ralph.sh 100    # Run up to 100 iterations
```

The loop stops when `<promise>COMPLETE</promise>` is detected (score < 10%).

## Architecture

### Workflow Phases
```
idle → generate → verify → evaluate → update_agent → commit → report
```

1. **Generate**: `opus-researcher` agent creates a novel question using MCP tools (Tavily, Reddit)
2. **Verify**: 5 parallel `opus-answer` agents independently answer the question
3. **Evaluate**: `opus-verifier` synthesizes answers and calculates consensus score
4. **Update Agent**: If score ≥ 10%, updates opus-researcher with findings
5. **Commit**: Pushes research to GitHub
6. **Report**: Outputs completion summary; signals loop status via promise tag

### Key Agents
| Agent | Purpose |
|-------|---------|
| `opus-researcher` | Generates novel questions using web research |
| `opus-answer` (×5) | Answers question naturally like a standard LLM |
| `opus-verifier` | Synthesizes 5 answers, calculates consensus % |

### State Files
- `research/research-workflow-state.yaml` - Workflow status, current phase, iteration
- `research/research-questions.yaml` - All questions with scores and statuses
- `research/research-status.json` - Simple status for ralph.sh loop detection

### Research Output Structure
```
research/research{N}/
├── research{N}.md           # Full research documentation
├── previous-research-summary.md
├── answer1.md through answer5.md
├── verifier{N}.md           # Consensus analysis
├── mcp-reddit-findings.md   # Reddit research (if used)
└── mcp-tavily-findings.md   # Web search findings (if used)
```

## Skills (Slash Commands)

| Command | Description |
|---------|-------------|
| `/execute-workflow` | Run full research iteration |
| `/research-novel-question` | Generate phase only |
| `/verify-novel-question` | Verify phase only |
| `/commit-research` | Commit phase only |

## Hooks System

Sound effects play on various Claude Code events. Configured in `.claude/settings.json`, handled by `.claude/hooks/scripts/hooks.py`.

- Config: `.claude/hooks/config/hooks-config.json`
- Local override: `.claude/hooks/config/hooks-config.local.json`
- Logs: `.claude/hooks/logs/hooks-log.jsonl`

## LLM Limitations Being Exploited

1. **Tokenization Blindness**: LLMs see tokens, not characters
2. **Semantic Priming**: Word meaning overrides task (ELEVEN → 11, not 6 letters)
3. **Pattern Matching**: Predict what answers look like vs. computing
4. **Modification Blindness**: Pattern-match to famous puzzles without noticing inversions
5. **Relational Logic**: Complex family/sibling relationships

## Important Notes

- The opus-researcher agent contains accumulated findings and evolved strategy
- Each research iteration builds on previous findings (via previous-research-summary.md)
- Timestamps use format: "DD/MM/YYYY HH:MM AM/PM PST"
- Workflow is state-machine based and resumable if interrupted
