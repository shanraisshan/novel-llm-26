# Novel LLM-Breaking Questions Research

An automated research workflow that generates questions designed to **break modern LLMs**. The goal is to find simple, generic questions that any human can easily answer, but cause AI models to disagree.

## The Goal

Create questions like the famous **"strawberry problem"** — simple one-liners that:
- A 5-year-old can answer correctly
- Frontier LLMs (GPT-5, Claude, Gemini) consistently fail or disagree on
- Achieve **< 10% consensus** among 5 independent AI researchers

## How It Works

Run the infinite research loop:

```bash
/execute-workflow
```

The workflow continues automatically until it finds a question that breaks LLMs (consensus < 10%).

## Workflow Diagram

![Novel LLM Research Workflow](/assets/workflow-diagram.svg)

## Workflow Steps

| Step | Phase | Agents/Tools | Description |
|------|-------|--------------|-------------|
| 1 | Check State | — | Read `research-workflow-state.yaml` + `research-questions.yaml`, resume or start fresh |
| 2 | Generate | `opus-researcher` + MCP Tools | Research via Tavily/Reddit, generate novel question |
| 3 | Verify | 5× `opus-answer` | Each independently answers the question |
| 4 | Synthesize | `opus-verifier` | Combines answers, calculates consensus score |
| 5 | Evaluate | — | Score < 10% = complete, ≥ 10% = loop back |
| 6 | Commit | — | Commits all research files, pushes to GitHub |

## MCP Tools Integration

The workflow leverages external research tools via MCP (Model Context Protocol):

| Tool | Purpose | Used In |
|------|---------|---------|
| **Tavily Web Search** | Academic papers, LLM failure research, benchmark studies | Generate phase |
| **Reddit MCP** | Community-discovered failures, r/LocalLLaMA, r/MachineLearning | Generate phase |

The `opus-researcher` agent uses these tools to:
- Find latest LLM failure modes (2025-2026 research)
- Discover community-reported weaknesses
- Build on proven adversarial techniques
- Avoid known dead-ends

## Agents Summary

| Agent | Count | Purpose |
|-------|-------|---------|
| `opus-researcher` | 1 | Generates novel questions using MCP research tools |
| `opus-answer` | 5 (parallel) | Answers the question naturally, like a standard LLM |
| `opus-verifier` | 1 | Synthesizes 5 answers, identifies consensus, calculates score |

## The Infinite Loop

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   Score >= 10%  →  "need_more_research"  →  Generate harder    │
│        ↑                                         question       │
│        │                                            │           │
│        └────────────────────────────────────────────┘           │
│                                                                 │
│   Score < 10%   →  "complete"  →  SUCCESS! LLMs are broken!    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Success Criteria**: When 5 independent AI researchers give **different answers** to the same question (consensus < 10%), we've found a question that breaks LLMs.

## File Structure

```
research/
├── research-workflow-state.yaml  # Workflow execution state
├── research-questions.yaml       # All questions database
├── research-status.json          # Quick status: iterations count + status
├── research1/
│   ├── research1.md              # Question generation research (opus-researcher)
│   ├── previous-research-summary.md  # Context from previous iterations
│   ├── answer1.md                # LLM Answer 1 (opus-answer)
│   ├── answer2.md                # LLM Answer 2 (opus-answer)
│   ├── answer3.md                # LLM Answer 3 (opus-answer)
│   ├── answer4.md                # LLM Answer 4 (opus-answer)
│   ├── answer5.md                # LLM Answer 5 (opus-answer)
│   └── verifier1.md              # Synthesis & consensus score (opus-verifier)
├── research2/
│   └── ...
└── researchN/
    └── ...
```

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

Quick-access status for external tools:

```json
{
  "iterations": 8,
  "status": "need_more_research"
}
```

## Question Fields

| Field | Description |
|-------|-------------|
| `id` | Unique question number |
| `question` | The novel question being tested |
| `answer` | The correct answer (optional, for complex questions) |
| `status` | `pending` → `in_progress` → `completed` |
| `folder` | Research folder name (e.g., `research8`) |
| `score` | Consensus percentage (0-100%) |
| `research_status` | `need_more_research` (≥10%) or `complete` (<10%) |
| `started_at` | Timestamp when research began |
| `completed_at` | Timestamp when research finished |

## Commands

| Command | Description |
|---------|-------------|
| `/execute-workflow` | Run the full research loop (orchestrates everything) |
| `/research-novel-question` | Generate a new question only |
| `/verify-novel-question` | Test question with 5 LLMs + synthesize |
| `/commit-research` | Commit and push to GitHub |

## Why This Works

LLMs have fundamental limitations:

| Limitation | Description | Example |
|------------|-------------|---------|
| **Tokenization Blindness** | LLMs see tokens, not characters | "strawberry" → can't count 'r's |
| **Semantic Priming** | Word meaning overrides task | "ELEVEN" activates 11, not letter count 6 |
| **Pattern Matching** | Predict what answers look like | Novel computations fail |
| **Relational Logic** | Complex sibling/family relationships | "Each brother has 2 sisters" traps |
| **Modification Blindness** | Pattern-match to famous puzzles | Modified river crossing still gets multi-trip answer |

## Current Progress

After 8 iterations, two questions achieved **80% consensus** (first breaks from 100%):

| Iteration | Question | Score | Insight |
|-----------|----------|-------|---------|
| 6 | "A girl has 3 brothers. Each brother has 2 sisters..." | 80% | Relational reasoning caused disagreement |
| 8 | "A mother has 4 daughters. Each has 1 brother. Brother has no sisters..." | 80% | Contradiction detection partially works |

**Key Finding**: Questions where chain-of-thought reasoning **reinforces** the wrong answer, or where models try to "solve" impossible puzzles, show the most promise.

---

**Goal**: Find the next "strawberry problem" — a simple question that exposes fundamental LLM limitations.
