# AutoResearch Analysis: karpathy/autoresearch vs novel-llm-26

**Author:** Research comparison report
**Date:** 2026-04-20
**Subject:** How closely is `novel-llm-26` related to, inspired by, or divergent from Andrej Karpathy's [`karpathy/autoresearch`](https://github.com/karpathy/autoresearch)?

---

## TL;DR

`novel-llm-26` and `karpathy/autoresearch` are **spiritual siblings, not forks**. They share the same core idea — *let an AI agent run a research loop autonomously overnight, accept or reject its own work based on an evaluator, and converge toward a target* — but they target completely different research objects:

| | `karpathy/autoresearch` | `novel-llm-26` |
|---|---|---|
| Research object | A GPT training script | A natural-language question |
| Artifact the agent edits | `train.py` (code) | `research-questions.yaml` + `opus-researcher.md` (prose) |
| Evaluator | `val_bpb` (validation bits-per-byte, numeric) | Consensus % among 5 LLM judges |
| Goal | *Minimize* a loss metric | *Minimize* LLM agreement (< 10%) |
| Substrate | Python / PyTorch / CUDA | Claude Code CLI / MCP / bash |
| Direction of attack | Use LLMs to **improve** an LLM | Use LLMs to **break** an LLM |

They converge at the architectural layer (agentic inner loop, self-contained state, single-artifact mutation, evaluator-driven backpressure) and diverge everywhere below it. Overall verdict: `novel-llm-26` is best described as an **implementation of the same "autonomous overnight research agent" pattern that Karpathy popularized, applied to a very different problem class** — specifically, a meta-circular one (using LLMs to adversarially probe LLMs).

---

## 1. What is `karpathy/autoresearch`?

### Mission
Give an AI agent a small but real LLM training setup, point it at a Markdown instruction file, and let it experiment autonomously overnight — modifying training code, evaluating validation metrics, keeping what works, discarding what doesn't. A satirical/serious vision of *frontier AI research delegated to agent swarms*, starting from the humble primordial soup of a single repo.

### Architecture

Three files, each with a strict role:

| File | Who edits it | Role |
|---|---|---|
| `prepare.py` | Humans only | Data prep + runtime utilities — **the agent cannot touch this** |
| `train.py` | **Agent only** | Model, optimizer, architecture, hyperparameters |
| `program.md` | Humans only | Instructions, guardrails, research direction |

### The inner loop
1. Read `program.md` for context.
2. Edit `train.py`.
3. Run a **fixed 5-minute** training run.
4. Check `val_bpb` (validation bits-per-byte — lower = better, vocab-independent).
5. Keep the change if better, revert if worse.
6. Loop. ~12 experiments per hour, ~100 per overnight session.

### Stack
- Python 3.10+, PyTorch, Muon + AdamW
- Derived from a simplified single-GPU version of nanochat (GPT)
- Single NVIDIA GPU (H100 target; community forks for MacOS/Windows/AMD)
- `uv` for dependencies

### Design philosophy
- **Single modifiable file** to keep scope sane.
- **Fixed time budget** so runs are platform-independent and comparable across arbitrary architecture mutations.
- **Minimal dependencies, self-contained.**
- **Platform-agnostic metric** (bits-per-byte survives vocab changes, unlike perplexity).

---

## 2. What is `novel-llm-26`?

### Mission
Find the "next strawberry problem" — a simple one-liner a five-year-old can answer, but that frontier LLMs (Claude, GPT, Gemini) consistently fail or disagree on. Success criterion: **< 10% consensus** among 5 independent LLM judges.

After **103 iterations**, it found one: *"I follow you everywhere but I get LONGER the closer you get to the sun. What am I?"* — scored 0% consensus by exploiting **modification blindness** (all 5 judges pattern-matched to the classic "shadow" riddle, missing the inverted condition).

### Architecture

A **six-phase state machine** wrapped in a **Ralph Wiggum outer loop**:

```
ralph.sh (bash)
   └── claude -p prompt.md
          └── /execute-workflow
                 └── idle → generate → verify → evaluate → update_agent → commit → report
```

| Phase | Actor | Output |
|---|---|---|
| generate | `opus-researcher` + MCP (Tavily, Reddit) | Novel question in YAML |
| verify | 5 × `opus-answer` (parallel, isolated) | `answer1.md` … `answer5.md` |
| evaluate | `opus-verifier` | Consensus score |
| update_agent | System | Appends findings to `opus-researcher.md` |
| commit | `git` | Pushes to GitHub |
| report | System | Emits `<promise>COMPLETE</promise>` or `CONTINUING_RESEARCH` |

### Stack
- Claude Code CLI, opus model
- MCP servers: Tavily (web search), Reddit
- Bash + YAML + Markdown (no Python, no GPU)
- State stored in `research-workflow-state.yaml`, `research-questions.yaml`, `research-status.json`

### Design philosophy (from `docs/implementation.md`)
Explicitly framed as a **reference implementation of the nine principles of self-evolving agentic loops** (Disrupt Labs course material). The system self-documents its Ralph Wiggum pattern, state machine, accumulating intelligence, multi-agent consensus, binary backpressure, LLM-as-judge, and constitutional governance choices.

---

## 3. Side-by-side architecture comparison

| Dimension | `karpathy/autoresearch` | `novel-llm-26` |
|---|---|---|
| **Outer loop** | Implicit (agent harness spawns runs) | **Explicit** — `ralph.sh` spawns fresh Claude per iteration |
| **Inner loop length** | 5 min (wall-clock training) | ~6 min (Claude Code iteration) |
| **Artifact mutated by agent** | `train.py` (code) | `opus-researcher.md` + new question rows in YAML |
| **Human-only instruction file** | `program.md` | `prompt.md` + `CLAUDE.md` + command Markdown files |
| **Evaluator** | `val_bpb` (deterministic numeric loss) | Jury of 5 LLMs + 1 LLM synthesizer (stochastic consensus %) |
| **Accept criterion** | "Is new val_bpb better?" | "Is consensus < 10%?" |
| **State persistence** | Git (implicit, via agent committing) | Explicit YAML state machine, resumable mid-phase |
| **Parallelism** | Serial (1 experiment at a time on 1 GPU) | **5-wide parallelism** during verify |
| **Memory of past work** | Git log + accumulated training results | **`opus-researcher.md` grows by ~15 lines per iteration**, now ~1,549 lines |
| **External research capability** | None — closed world | MCP tools (Tavily, Reddit) feed real-world LLM-failure data into prompts |
| **Termination signal** | None stated — runs until user stops | `<promise>COMPLETE</promise>` token detected by bash |
| **Compute substrate** | Single H100 GPU | Claude API / Anthropic servers |
| **Hard budget** | 5 min per run | No per-iteration cap; outer loop caps iterations |
| **Reproducibility** | High (deterministic-ish training) | Low (LLM sampling) — the multi-agent jury is the workaround |

---

## 4. Shared DNA (the inspired-by parts)

These are the points at which `novel-llm-26` clearly shares genetic material with — or at minimum converges on the same design language as — `karpathy/autoresearch`:

1. **Autonomous overnight research premise.** Both repos are predicated on "point it at the problem, walk away, come back to results." Neither assumes a human in the loop during iteration.

2. **One editable artifact.** Karpathy constrains the agent to `train.py`; `novel-llm-26` constrains the researcher to edit only the questions YAML + its own agent file. Both deliberately narrow the action space to make iteration tractable.

3. **Evaluator-driven acceptance.** Both use a single scalar evaluation signal to gate whether an iteration's work is kept or rejected. Karpathy: `val_bpb`. novel-llm-26: consensus %. The shape is identical — *run, measure, decide, repeat*.

4. **Fixed-cost iteration.** Karpathy fixes wall-clock training to 5 minutes so architecture mutations are comparable. `novel-llm-26` fixes the iteration *structure* (the 6-phase state machine) so question candidates are comparable. Different axis, same discipline.

5. **Self-contained and minimal.** Both consciously refuse infrastructure bloat. Karpathy: single GPU, no distributed training. `novel-llm-26`: bash + YAML + Markdown, no database, no orchestrator.

6. **Research-as-code, committed to git.** Both treat the agent's output as version-controlled artifacts rather than ephemeral logs. Every iteration is recoverable from history.

7. **Ralph Wiggum resemblance.** Karpathy's agent loop is conceptually a Ralph Wiggum (spawn → act → evaluate → repeat). `novel-llm-26` makes it explicit and literal, with `ralph.sh` and binary backpressure via the `<promise>` tag.

---

## 5. Where they diverge sharply

1. **Research object: model vs. prompt.** Karpathy is doing *ML research* — mutating PyTorch code to improve a real neural network. `novel-llm-26` is doing *prompt/benchmark research* — mutating natural-language questions to find adversarial inputs. One lives in weight space; the other lives in prompt space.

2. **Direction of the arrow.** Karpathy points the loop at **making an LLM better**. `novel-llm-26` points the loop at **breaking an LLM**. They are, in a literal sense, gradient-opposite applications of the same architectural template.

3. **Evaluator trustworthiness.** `val_bpb` is a cheap, deterministic, well-understood loss. Consensus % from 5 LLM judges is stochastic, model-biased, and — as `novel-llm-26`'s own README honestly admits — "pure Ralph Wiggum energy: I'm asking an LLM to do novel research, then asking 5 copies of the same LLM to QA that research." Karpathy's evaluator is almost free and nearly unbiased; `novel-llm-26`'s is expensive and known-biased, which is why it wraps 5 agents and a synthesizer around a single judgment.

4. **Compute substrate.** Karpathy's bottleneck is GPU-hours. `novel-llm-26`'s bottleneck is Anthropic API calls. This dictates everything downstream: parallelism strategy, cost envelope, iteration cadence.

5. **Accumulating-intelligence mechanism.** Karpathy's agent gets smarter *across* runs only to the extent its harness feeds prior trajectories back in. `novel-llm-26` has a **deliberate, structural, append-only memory**: after every non-winning iteration, findings are grafted into `opus-researcher.md`. By iteration 104 the researcher file had grown to ~1,549 lines of accumulated lore. This is a meaningful architectural addition that Karpathy's repo does not prescribe.

6. **External knowledge ingestion.** Karpathy's agent is closed-world (it has its own code + prior runs). `novel-llm-26`'s researcher has MCP-based web search and Reddit access, so it ingests real-world LLM failure reports mid-loop. This changes the loop's character from *pure search* to *search + literature review*.

7. **Meta-circularity.** Karpathy's loop is non-circular: agents improve training code, and the resulting model is a separate artifact. `novel-llm-26`'s loop is reflexively meta-circular: the same model family is simultaneously the researcher, the 5 judges, the verifier, and the target being broken. The README flags this as a known flaw, not a feature.

8. **Parallelism topology.** Karpathy: sequential experiments, GPU-limited. `novel-llm-26`: 5-way parallel verify step specifically to reduce judge variance. Completely different reasons for being parallel (or not).

9. **Termination.** Karpathy has no clear "done" — it's an optimization loop, more-is-better. `novel-llm-26` has a crisp success condition (< 10% consensus) and a termination signal the outer shell script actually reads. Different problem shape (optimization vs. search) → different termination semantics.

---

## 6. What `novel-llm-26` adds on top of the autoresearch pattern

Assuming `novel-llm-26` took inspiration from (or at least converged with) Karpathy's template, these are the genuine additions:

- **Explicit resumable state machine** (`research-workflow-state.yaml`). Karpathy's repo has no equivalent — crashes presumably restart from scratch.
- **Multi-agent jury for evaluation.** Mitigates the variance of LLM-as-judge with a crowd-of-judges + synthesizer pattern.
- **Structural append-only memory** in the researcher agent file. A deliberate implementation of *explicit* memory rather than relying on context windows.
- **MCP tool integration.** External knowledge pulled in during iteration — the agent is not running on vibes alone.
- **Binary backpressure via a parseable token** (`<promise>COMPLETE</promise>`), which lets an outer bash loop make control decisions without reading LLM output.
- **Mapped to a teaching framework.** The repo is explicitly positioned as a reference implementation for a nine-principle self-evolving agentic loops curriculum — Karpathy's is positioned as a demo, not a pedagogical reference.

---

## 7. What `karpathy/autoresearch` has that `novel-llm-26` lacks

- **A trustworthy, cheap evaluator.** `val_bpb` is close to a ground-truth signal. `novel-llm-26`'s evaluator is known-biased and the repo says so openly.
- **Real problem-solving surface area.** Karpathy's agent can genuinely discover better architectures, optimizers, training recipes. `novel-llm-26` is bounded by the space of questions that break its own judges — a narrower, more gimmicky target.
- **A deterministic substrate.** PyTorch produces reproducible numbers under fixed seeds. Claude responses don't.
- **Potential real-world utility.** An improved training recipe is genuinely useful. A collection of adversarial riddles is more curio than capability.
- **Genuinely novel artifact.** Karpathy's loop can in principle discover techniques that weren't in any training corpus. `novel-llm-26`'s loop is bounded by what the researcher LLM already knows about LLM weaknesses.

---

## 8. Relationship verdict

Best characterization of the relationship:

> **`novel-llm-26` is an independent implementation of the same "agentic overnight research loop" design pattern that `karpathy/autoresearch` instantiates, applied to a different problem (adversarial prompt discovery) on a different substrate (Claude Code instead of PyTorch), with some architectural additions (explicit state machine, multi-agent jury, structural memory, MCP tools).**

There is no evidence of direct code sharing, forking, or textual borrowing — the tech stacks are disjoint (Python/CUDA vs. bash/Markdown/Claude). The relationship is at the **pattern** level, not the **implementation** level. If asked to place the two on a spectrum:

```
Fork ----------- Port ----------- Inspired-by ----------- Parallel invention ----------- Unrelated
                                         ↑
                                   novel-llm-26
```

It sits closest to *inspired-by / parallel invention* — the agentic overnight research loop is now a design pattern in the ambient ecosystem (alongside Ralph Wiggum, LLM-as-judge, MCP), and `novel-llm-26` is a well-documented instance of that pattern rather than a descendant of any specific prior repo.

The giveaway that this is pattern-level rather than code-level lineage: `novel-llm-26`'s own `docs/implementation.md` frames itself as a reference implementation of a *nine-principle* agentic loops framework — Karpathy's repo is one exemplar of that framework, not its progenitor.

---

## 9. Interesting cross-repo observations

- **Both accept the Ralph Wiggum pattern as load-bearing.** Karpathy implicitly (the agent harness spawns runs); `novel-llm-26` explicitly (`ralph.sh`). This strongly suggests the pattern has crystallized into common practice for this class of system.
- **Both chose one-file-modifiable boundaries.** This is not obvious — most agentic systems let agents touch many files. Constraining the mutation surface appears to be a recurring lesson.
- **Both reject in-context memory in favor of file-system memory.** Karpathy via git history; `novel-llm-26` via the append-growing agent file. Neither trusts the model's context window as the long-term store.
- **Neither is a benchmark in the traditional sense.** Karpathy's evaluator is narrow (one metric, one task); `novel-llm-26`'s is narrower still (one model family judging itself). Both are closer to *search systems with an evaluator stub* than to actual benchmarks.
- **Both are honest about their limits.** Karpathy frames autoresearch as satirical/aspirational; `novel-llm-26`'s README leads with a "⚠️ WARNING" about its own circularity. This intellectual honesty is, in itself, a shared cultural marker.

---

## 10. Summary table

| Question | Answer |
|---|---|
| Did `novel-llm-26` fork `karpathy/autoresearch`? | No. |
| Did it port it? | No — disjoint stacks. |
| Is it inspired by it? | Almost certainly at the pattern level, even if not consciously lineage-traced. |
| Are they solving the same problem? | No — improving an LLM vs. breaking an LLM. |
| Do they share an architectural template? | Yes — autonomous overnight research loop with evaluator-driven acceptance. |
| Which has the more trustworthy evaluator? | `karpathy/autoresearch` (by a wide margin). |
| Which has the more elaborate orchestration? | `novel-llm-26` (state machine, multi-agent jury, MCP). |
| Which is more reproducible? | `karpathy/autoresearch`. |
| Which is more ambitious in goal? | `karpathy/autoresearch` (real ML research). |
| Which is more pedagogically documented? | `novel-llm-26`. |
| Relationship in one phrase | *Spiritual sibling, not descendant.* |

---

## References

- `karpathy/autoresearch` — https://github.com/karpathy/autoresearch
- `novel-llm-26` README (this repo root)
- `novel-llm-26/reports/self-evolving-loops-analysis.md` (self-documented architecture mapping)
- `novel-llm-26/CLAUDE.md` (project instructions)
- `novel-llm-26/ralph.sh` (outer loop implementation)
