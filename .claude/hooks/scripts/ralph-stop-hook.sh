#!/bin/bash

# Ralph Loop Stop Hook
# Blocks Claude from stopping when Ralph Loop is active

# Get project directory
if [ -n "$CLAUDE_PROJECT_DIR" ]; then
    PROJECT_DIR="$CLAUDE_PROJECT_DIR"
else
    # Fallback: derive from script location
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    PROJECT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
fi

RALPH_FILE="${PROJECT_DIR}/.claude/ralph-loop.local.md"

# Check if ralph loop file exists
if [ ! -f "$RALPH_FILE" ]; then
    exit 0
fi

# Check if Status is active
if grep -q "Status:.*active" "$RALPH_FILE"; then
    # Output blocking JSON to stdout
    echo '{"decision":"block","reason":"Ralph Loop is active. Continue executing the workflow. Run /execute-workflow to proceed with the next iteration."}'
    exit 0
fi

# Not active, allow stop
exit 0
