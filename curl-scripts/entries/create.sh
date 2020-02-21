#!/bin/bash

curl "http://localhost:4741/entries" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "entry": {
      "need_id": "'"${NEED}"'",
      "mood_id": "'"${MOOD}"'"
    }
  }'

echo
