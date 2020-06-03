#!/bin/bash
set -e
set -u
#set -x

echo "method": "admin.getNodeID"
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "admin.getNodeID",
    "params":{},
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin | jq .result.nodeID
