#!/bin/bash

curl "http://localhost:4741/needs" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
