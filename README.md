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

![Novel LLM Research Workflow](workflow-diagram.svg)

## Workflow Steps

| Step | Command | Description |
|------|---------|-------------|
| 1 | `execute-workflow` | Check for pending questions in queue |
| 2 | `research-novel-question` | Generate a novel question using Opus (builds on previous research) |
| 3 | `verify-novel-question` | Launch 5 parallel Opus researchers to answer independently |
| 4 | Evaluate | Check consensus score from verifier |
| 5 | `commit-research` | Commit results and push to GitHub |

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
│   ├── research1.md          # Research documentation
│   ├── answer1.md            # Researcher 1's answer
│   ├── answer2.md            # Researcher 2's answer
│   ├── answer3.md            # Researcher 3's answer
│   ├── answer4.md            # Researcher 4's answer
│   ├── answer5.md            # Researcher 5's answer
│   └── verifier1.md          # Synthesis & consensus score
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

| Command | Description |
|---------|-------------|
| `/execute-workflow` | Run the full research loop |
| `/research-novel-question` | Generate a new question only |
| `/verify-novel-question` | Verify a pending question only |
| `/commit-research` | Commit and push to GitHub |

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
