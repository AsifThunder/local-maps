#!/bin/sh
set -e

SERVICE="$1"
TARGET_STATUSES="$2"
STATUS_FILE="/data/${SERVICE}.status.txt"

if [ -z "$SERVICE" ] || [ -z "$TARGET_STATUSES" ]; then
  echo "Usage: $0 <service> <status1[,status2,...]>"
  exit 1
fi

# Convert comma-separated statuses into positional parameters
IFS=',' ; set -- $TARGET_STATUSES

while true; do
  if [ ! -f "$STATUS_FILE" ]; then
    echo "Status file '$STATUS_FILE' does not exist yet."
    sleep 5
    continue
  fi

  CURRENT_STATUS=$(cat "$STATUS_FILE")

  for STATUS in "$@"; do
    if [ "$CURRENT_STATUS" = "$STATUS" ]; then
      echo "Service '$SERVICE' reached status '$CURRENT_STATUS'."
      exit 0
    fi
  done

  sleep 5
done