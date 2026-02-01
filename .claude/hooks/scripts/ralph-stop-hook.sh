#!/bin/bash

# Ralph Loop Stop Hook
# Blocks Claude from stopping when Ralph Loop is active
# Uses RALPH_LOOP_ACTIVE environment variable from settings.json

# Check if RALPH_LOOP_ACTIVE is set to "true"
if [ "$RALPH_LOOP_ACTIVE" = "true" ]; then
    # Output blocking JSON to stdout
    echo '{"decision":"block","reason":"Ralph Loop is active. Continue executing the workflow. Run /execute-workflow to proceed with the next iteration."}'
    exit 0
fi

# Not active, allow stop
exit 0
