#!/bin/bash
set -e
set -u
#set -x
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     : 1,
    "method" :"avm.createFixedCapAsset",
    "params" :{
        "name": "BTU Protocol",
        "symbol":"BTU",
        "initialHolders": [
            {
                "address": "$AVA_X_ADDRESS",
                "amount": 10000000
            }
        ],
        "username":"$AVA_USERNAME",
        "password":"$AVA_PASSWORD"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/X | jq .
