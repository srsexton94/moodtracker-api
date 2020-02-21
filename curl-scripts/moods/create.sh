#!/bin/bash

curl "http://localhost:4741/moods" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "mood": {
      "happy": "'"${HAPPY}"'",
      "calm": "'"${CALM}"'",
      "sad": "'"${SAD}"'",
      "nervous": "'"${NERVOUS}"'",
      "motivated": "'"${MOTIVATED}"'",
      "angry": "'"${ANGRY}"'"
    }
  }'

echo
