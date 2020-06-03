#!/bin/bash
set -e
set -u
#set -x
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :2,
    "method" :"avm.getBalance",
    "params" :{
        "address":"X-2SmrGG5csmy6ccCdDFixWXiUVmGVmM8i9",
        "assetID":"pajBFBfFnq1UUs28DwcTE4i2nxTtKQGG5Kte9X8egxjyMqBRs"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/X | jq .result.balance
