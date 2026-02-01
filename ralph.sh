#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"

if [ -z "$1" ]; then
  echo "Usage: $0 <iterations>"
  exit 1
fi

for ((i=1; i<=$1; i++)); do
  echo "Iteration $i"
  echo "--------------------------------"
  
  result=$(claude -p "$(cat "$PROJECT_ROOT/prompt.md")" --output-format text 2>&1) || true

  echo "$result"

  if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
    echo ""
    echo "========================================"
    echo "NOVEL QUESTION FOUND after $i iterations!"
    echo "========================================"
    exit 0
  fi

  echo ""
  echo "--- End of iteration $i ---"
  echo ""
done

echo "Reached max iterations ($1)"
exit 1