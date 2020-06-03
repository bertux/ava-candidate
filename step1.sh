#!/bin/bash
set -e
set -u
#set -x
echo "Stage 2 — Staking AVA"
echo "Step 1 - Create a User and Addresses"

echo "method : keystore.createUser"
curl -s -X POST --data '{
     "jsonrpc": "2.0",
     "id": 1,
     "method": "keystore.createUser",
     "params": {
         "username": "$AVA_USERNAME",
         "password": "$AVA_PASSWORD"
     }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/keystore | jq .

echo "method : avm.createAddress"
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :2,
    "method" :"avm.createAddress",
    "params" :{
        "username": "$AVA_USERNAME",
        "password": "$AVA_PASSWORD"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/X | jq .

curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.createAccount",
    "params": {
        "username": "$AVA_USERNAME",
        "password": "$AVA_PASSWORD"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P | jq .
