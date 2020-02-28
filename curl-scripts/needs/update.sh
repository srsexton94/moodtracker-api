# Ex: TOKEN=tokengoeshere ID=idgoeshere TEXT=textgoeshere sh curl-scripts/examples/update.sh

curl "http://localhost:4741/needs/${ID}" \
  --include \
  --request PATCH \
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
