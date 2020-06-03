#!/bin/bash
set -e
set -u
#set -x
echo "method": "platform.addDefaultSubnetValidator"
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.addDefaultSubnetValidator",
    "params": {
        "id":"38peYHGBUi1xegFUVsffXeUZSPf5vTDB3",
        "payerNonce":2,
        "destination":"3gtTxKciMbtzjfQijocpFVeDQy1HgAJNh",
        "startTime":1591106347,
        "endTime":1592265599,
        "stakeAmount":10000
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P | jq .
