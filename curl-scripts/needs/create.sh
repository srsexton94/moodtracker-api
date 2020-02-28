#!/bin/bash

curl "http://localhost:4741/needs" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "need": {
      "hunger": "'"${HUNGER}"'",
      "comfort": "'"${COMFORT}"'",
      "bladder": "'"${BLADDER}"'",
      "energy": "'"${ENERGY}"'",
      "fun": "'"${FUN}"'",
      "social": "'"${SOCIAL}"'",
      "hygiene": "'"${HYGIENE}"'",
      "environment": "'"${ENVIRONMENT}"'"
    }
  }'

echo
