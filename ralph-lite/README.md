# Ralph Lite

A minimal demonstration of the **Ralph Wiggum loop** pattern: a bash loop that repeatedly invokes a Claude Code slash command until a completion signal is emitted.

This is a stripped-down version of the parent `ralph.sh` in the project root. Instead of running a full research workflow, it just increments a counter.

## What It Does

Each iteration of `ralph.sh`:
1. Invokes the `/execute-ralph-lite` slash command via `claude -p`.
2. The command reads `research.json`, increments `sum` by 1, writes it back.
3. If `sum >= 5`, the command emits `<promise>COMPLETE</promise>` and the loop exits.
4. Otherwise, the loop continues to the next iteration.

## Usage

From inside the `ralph-lite` directory:

```bash
# Reset the counter (optional)
echo '{"sum": 0}' > research.json

# Run the loop — give it enough iterations (>= 5) to reach the exit condition
./ralph.sh 10
```

The script will stop automatically once `sum` reaches 5, or when the max-iteration count is exhausted.

### Expected Output

```
Iteration 1
--------------------------------
Iteration: sum incremented to 1
CONTINUING_LOOP

--- End of iteration 1 ---

...

Iteration 5
--------------------------------
Iteration: sum incremented to 5
<promise>COMPLETE</promise>

========================================
LOOP COMPLETE after 5 iterations (sum reached 5)!
========================================
```

## How the Completion Signal Works

`ralph.sh` greps each iteration's output for the literal string `<promise>COMPLETE</promise>`. When the slash command emits that tag, the loop exits with status `0`. This mirrors the contract used by the main research workflow.

## Customizing

- **Change the target**: edit `.claude/commands/execute-ralph-lite.md` and swap `sum >= 5` for a different threshold.
- **Change the step**: increment by more than 1, or replace the increment with any other per-iteration work.
- **Add state**: extend `research.json` with additional fields — the command handler can track whatever it needs.

## Why This Exists

A minimal reference for understanding the Ralph Wiggum loop pattern before diving into the full research workflow in the parent directory. Useful for:
- Testing that `claude -p` works end-to-end in your environment.
- Demonstrating the `<promise>COMPLETE</promise>` exit-signal contract.
- Building your own Ralph-style loops from a known-working template.

## Running It

All commands below assume you are `cd`'d into the `ralph-lite` directory:

```bash
cd ralph-lite
```

### Run a Single Iteration (Manual, One Step at a Time)

Use this to bump the counter once and inspect the result — great for debugging the command itself without looping.

**Option A — Interactive Claude Code session:**

```bash
claude
```

Then at the prompt, type:

```
/execute-ralph-lite
```

**Option B — One-shot (non-interactive) via `claude -p`:**

```bash
claude -p "/execute-ralph-lite" --output-format text
```

**Option C — Inspect the state file directly:**

```bash
cat research.json        # before
claude -p "/execute-ralph-lite" --output-format text
cat research.json        # after — sum should be +1
```

### Run the Full Loop (Automated Until Completion)

Use this to let the loop drive itself until `sum` reaches 5 (or the max iteration cap is hit):

```bash
./ralph.sh 10
```

- The argument (`10`) is the **maximum** number of iterations — a safety cap.
- The loop exits **early** (exit code `0`) as soon as `<promise>COMPLETE</promise>` is emitted, which happens when `sum` hits 5.
- If the cap is reached first, the loop exits with code `1`.

### Reset State Between Runs

`research.json` persists across runs. To start fresh:

```bash
echo '{"sum": 0}' > research.json
```

### Common Workflows

```bash
# Full clean run
echo '{"sum": 0}' > research.json && ./ralph.sh 10

# Step through a few iterations manually, then let the loop finish
claude -p "/execute-ralph-lite" --output-format text   # sum → 1
claude -p "/execute-ralph-lite" --output-format text   # sum → 2
./ralph.sh 10                                          # runs 3 more, then stops
```
