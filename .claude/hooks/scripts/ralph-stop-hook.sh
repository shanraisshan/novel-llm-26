#!/bin/bash

# Ralph Loop Stop Hook
# Blocks Claude from stopping when research is still needed
# Checks research/research-status.json for status field

# Path to research status file
STATUS_FILE="${CLAUDE_PROJECT_DIR}/research/research-status.json"

# Check if status file exists
if [ -f "$STATUS_FILE" ]; then
    # Extract status field using grep and sed (portable)
    STATUS=$(grep -o '"status"[[:space:]]*:[[:space:]]*"[^"]*"' "$STATUS_FILE" | sed 's/.*"status"[[:space:]]*:[[:space:]]*"\([^"]*\)"/\1/')

    # If status is "need_more_research", block the stop
    if [ "$STATUS" = "need_more_research" ]; then
        echo '{"decision":"block","reason":"Ralph Loop is active. Continue executing the workflow. Run /execute-workflow to proceed with the next iteration."}'
        exit 0
    fi
fi

# Status is "complete" or file doesn't exist - allow stop
exit 0
