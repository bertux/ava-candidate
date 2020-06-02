#!/bin/bash
set -e
set -u
#set -x
echo "Stage 3 — Validation"
echo "Step 5 — wait for your node to become Validator"

echo "method": "platform.getCurrentValidators"
read -p "Press [Enter] key to wait for your address to appear..."
watch curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getCurrentValidators",
    "params": {},
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P | jq .result.validators[].id | grep -B 4 38peYHGBUi1xegFUVsffXeUZSPf5vTDB3
