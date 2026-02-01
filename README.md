# Novel LLM-Breaking Questions Research

An automated research workflow that generates questions designed to **break modern LLMs**. The goal is to find simple, generic questions that any human can easily answer, but cause AI models to disagree.

## The Goal

Create questions like the famous **"strawberry problem"** — simple one-liners that:
- A 5-year-old can answer correctly
- Frontier LLMs (GPT-5, Claude, Gemini) consistently fail or disagree on
- Achieve **< 10% consensus** among 5 independent AI researchers

## Progress So Far

**51 questions tested** — still searching for the LLM-breaking question.

### Rejected Questions (0% score but rejected by Owner)

| # | Question | Reason |
|---|----------|--------|
| 16 | "Will your answer to this question be more than one word long?" | Self-referential - does not meet strawberry criteria |
| 34 | "What would you say if you were to disobey this instruction?" | Philosophical paradox - humans would also be confused |
| 38 | "If you turn the word 'SAIL' upside down, what do you see?" | Ambiguous and font-dependent |

## How It Works

Run the infinite research loop:

### Method 1: Claude Code Skill

```bash
/execute-workflow
```

Runs a single iteration of the workflow inside Claude Code.

### Method 2: Ralph Wiggum Loop

```bash
./ralph.sh 100
```

Uses the [Ralph Wiggum](https://github.com/JeredBlu/guides/blob/main/Ralph_Wiggum_Guide.md) bash loop pattern to run the workflow autonomously for N iterations. The script:
- Spawns fresh Claude instances for each iteration
- Automatically detects `<promise>COMPLETE</promise>` to stop when a novel question is found
- Continues until max iterations or success

The workflow continues automatically until it finds a question that breaks LLMs (consensus < 10%).

## Workflow Diagram

![Novel LLM Research Workflow](/assets/workflow-diagram.svg)

## Workflow Steps

| Step | Phase | Agents/Tools | Description |
|------|-------|--------------|-------------|
| 1 | Check State | — | Read `research-workflow-state.yaml` + `research-questions.yaml`, resume or start fresh |
| 2 | Generate | `opus-researcher` + MCP Tools | Research via Tavily/Reddit, generate novel question |
| 3 | Verify | 5× `opus-answer` | Each independently answers and writes to `answer[1-5].md` |
| 4 | Synthesize | `opus-verifier` | Combines answers, calculates consensus score |
| 5 | Evaluate | — | Score < 10% = complete, ≥ 10% = loop back |
| 6 | Commit | — | Commits all research files, pushes to GitHub |

## MCP Tools Integration

The `opus-researcher` agent uses these MCP tools:

| Tool | Purpose |
|------|---------|
| **Tavily Web Search** | Academic papers, LLM failure research |
| **Reddit MCP** | Community-discovered failures |

## Agents Summary

| Agent | Count | Purpose |
|-------|-------|---------|
| `opus-researcher` | 1 | Generates novel questions using MCP research tools |
| `opus-answer` | 5 (parallel) | Each writes answer to designated `answer[1-5].md` file |
| `opus-verifier` | 1 | Reads all 5 answer files, identifies consensus, calculates score |

## State Files

### research-workflow-state.yaml

Tracks workflow execution state:

```yaml
workflow:
  status: idle | running | error
  current_phase: generate | verify | evaluate | update_agent | commit | report
  current_iteration: <number>
  last_completed_phase: <phase_name>
```

### research-questions.yaml

Stores all questions tested:

```yaml
questions:
  - id: 8
    question: "A mother has 4 daughters..."
    answer: "This scenario is impossible/contradictory..."
    status: completed
    folder: research8
    score: 80
    research_status: need_more_research
    started_at: "31/01/2026 09:20 PM PST"
    completed_at: "31/01/2026 09:28 PM PST"
```

### research-status.json

Quick-access status:

```json
{
  "status": "need_more_research"
}
```

## Why This Works

LLMs have fundamental limitations:

| Limitation | Description | Example |
|------------|-------------|---------|
| **Tokenization Blindness** | LLMs see tokens, not characters | "strawberry" → can't count 'r's |
| **Semantic Priming** | Word meaning overrides task | "ELEVEN" activates 11, not letter count 6 |
| **Pattern Matching** | Predict what answers look like | Novel computations fail |
| **Relational Logic** | Complex sibling/family relationships | "Each brother has 2 sisters" traps |
| **Modification Blindness** | Pattern-match to famous puzzles | Modified river crossing still gets multi-trip answer |

---

**Goal**: Find the next "strawberry problem" — a simple question that exposes fundamental LLM limitations.

---

## References

- [Ralph Wiggum Guide](https://github.com/JeredBlu/guides/blob/main/Ralph_Wiggum_Guide.md) — The bash loop method used for running this research workflow
