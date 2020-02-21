#!/bin/bash

curl "http://localhost:4741/moods" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
