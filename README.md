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

| Step | Command | Agents Used | Description |
|------|---------|-------------|-------------|
| 1 | `/execute-workflow` | — | Orchestrator: checks for pending questions, branches accordingly |
| 2 | `/research-novel-question` | 1× `opus-researcher` | Generate a novel question (builds on previous research) |
| 3 | `/verify-novel-question` | 5× `opus-answer` (parallel) | Each independently answers the question (like a normal LLM) |
| 4 | ↳ *(part of step 3)* | 1× `opus-verifier` | Synthesizes answers, calculates consensus score |
| 5 | ↳ *(part of step 1)* | — | Evaluates score: < 10% = complete, ≥ 10% = loop back |
| 6 | `/commit-research` | — | Commits all research files and pushes to GitHub |

### Agents Summary

| Agent | Count | Purpose |
|-------|-------|---------|
| `opus-researcher` | 1 | Generates novel questions based on previous research (deep research mode) |
| `opus-answer` | 5 (parallel) | Answers the question naturally, like a standard LLM (no special context) |
| `opus-verifier` | 1 | Synthesizes 5 answers, identifies consensus/disagreements, calculates score |

## The Infinite Loop

The workflow runs in an **infinite loop** until success:

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

## Why This Works

LLMs have fundamental limitations:

| Limitation | Description | Example |
|------------|-------------|---------|
| **Tokenization Blindness** | LLMs see tokens, not characters | "strawberry" → can't count 'r's |
| **Semantic Priming** | Word meaning overrides task | "ELEVEN" activates 11, not letter count 6 |
| **Pattern Matching** | Predict what answers look like | Novel computations fail |
| **No Visual Reasoning** | Can't "see" text spatially | Position-based questions fail |

## File Structure

```
research/
├── research-questions.yaml    # Central tracker for all questions
├── research1/
│   ├── research1.md          # Question generation research (opus-researcher)
│   ├── answer1.md            # LLM Answer 1 (opus-answer)
│   ├── answer2.md            # LLM Answer 2 (opus-answer)
│   ├── answer3.md            # LLM Answer 3 (opus-answer)
│   ├── answer4.md            # LLM Answer 4 (opus-answer)
│   ├── answer5.md            # LLM Answer 5 (opus-answer)
│   └── verifier1.md          # Synthesis & consensus score (opus-verifier)
├── research2/
│   └── ...
└── researchN/
    └── ...
```

## Question Status

Each question in `research-questions.yaml` has:

```yaml
- id: 2
  question: "What is the last letter of the word 'FIRST'?"
  status: completed
  folder: research2
  score: 100                        # Consensus percentage
  research_status: need_more_research  # or "complete" if < 10%
```

## Commands

| Command | Agents | Description |
|---------|--------|-------------|
| `/execute-workflow` | 1 + 5 + 1 | Run the full research loop (orchestrates all other commands) |
| `/research-novel-question` | 1× opus-researcher | Generate a new question only (deep research mode) |
| `/verify-novel-question` | 5× opus-answer + 1× opus-verifier | Test question with 5 LLMs and synthesize results |
| `/commit-research` | — | Commit and push to GitHub |

## Success Example

When we achieve a question that breaks LLMs:

```yaml
- id: 42
  question: "..."
  score: 8                    # Only 8% consensus!
  research_status: complete   # SUCCESS - LLMs are broken!
```

This means 5 AI researchers gave 5 different answers to a simple question that any human could answer correctly.

---

**Goal**: Find the next "strawberry problem" — a simple question that exposes fundamental LLM limitations.
