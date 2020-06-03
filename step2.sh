#!/bin/bash
set -e
set -u
#set -x
echo "Stage 2 — Staking AVA"
echo "Step 2 - Acquire Funds"

echo "go to https://faucet.ava.network/ to get 20k AVA"
read -p "Then press [Enter] key to wait for balance to be 20000..."

echo "method : avm.getBalance"
watch curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :7,
    "method" :"avm.getBalance",
    "params" :{
        "address":"X-2SmrGG5csmy6ccCdDFixWXiUVmGVmM8i9",
        "assetID"  :"AVA"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/X | jq .result.balance
