#!/bin/bash
set -e
set -u
#set -x
echo "Stage 2 — Staking AVA"
echo "Step 3 — Send it to the Platform"

echo "method" :"avm.exportAVA"
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"avm.exportAVA",
    "params" :{
        "username": "$AVA_USERNAME",
        "password": "$AVA_PASSWORD",
        "to":"3gtTxKciMbtzjfQijocpFVeDQy1HgAJNh",
        "amount": 10000
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/X | jq .

echo "method": "platform.importAVA"
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.importAVA",
    "params": {
        "username": "$AVA_USERNAME",
        "password": "$AVA_PASSWORD",
        "to":"3gtTxKciMbtzjfQijocpFVeDQy1HgAJNh",
        "payerNonce":1
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P | jq .

echo "method": "platform.issueTx"
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.issueTx",
    "params": {
        "tx":"1117xBwcr8byBg35Kgzt3CaNhpLrnjzW76q3R5sJT7nW9kyrG7r9Lzg5zjuvgtug36nXxfJosbZwo4kU3TDcn8m6m8ihNWqdqxgdGzQVoYvnZqu5tKgSVzsRPxnv6P2e9zpYzuxASeRnWdhfRefjQYGdT2m4RyAve6yiRJCcSmyMbex2Gnm91iyjvjxHvuPEXKZ3hTbFx2xPiW5QJtvCPDY1yq5vEMCXzehWr6kxpSTpzepwsc2gn95yECvx1iLNuUXGKbT1LZnNH54JXywCmnUdUYvRwe2Ezxym6696dv8irkp1rbFQSyWLqSRCfiGwsngXDNLtVVuzNt5xdRpkwMLvdJVCmfwMuHbukRzZycmdVdepaW3iN"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P | jq .

echo "method : platform.getAccount"
read -p "Press [Enter] key to wait for balance to be 10000..."
watch curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getAccount",
    "params":{
        "address":"3gtTxKciMbtzjfQijocpFVeDQy1HgAJNh"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P | jq .result.balance
