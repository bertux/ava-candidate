#!/bin/bash
set -e
set -u
#set -x
echo "Stage 3 — Validation"
echo "Step 4 — add your node as Pending Validator"

./admin/getNodeID.sh

./platform/addDefaultSubnetValidator.sh

echo "method": "platform.sign"
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.sign",
    "params": {
        "username": "$AVA_USERNAME",
        "password": "$AVA_PASSWORD",
        "tx":"1112MrvuSsEjvPVETPibpPYSPdzfaqFBpSPZTYs8Dk81vi86rpJ5UdUXTkqL1mBdqDT874rP4wbpKdErRDiTcfGCuNKfRDmxq78HTHedeyYpF1C61JX4fx6CMe73DKTobuYZTNQEhGyHZ36KPrY65WEii5f9sq4iB93rgeehgNawkMBJ5YPUwNhThagmceihPLpGtcukAg64R72G",
        "signer":"3gtTxKciMbtzjfQijocpFVeDQy1HgAJNh"
    },
    "id": 2
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P | jq .

echo "method": "platform.issueTx"
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.issueTx",
    "params": {
        "tx":"1112MrvuSsEjvPVETPibpPYSPdzfaqFBpSPZTYs8Dk81vi86rpJ5UdUXTkqL1mBdqDT874rP4wbpKdErRDiTcfGCuNKfRDmxq78HTHedeyYpF1C61JbdaZrxccXJN1aZ8HzB53WxMPFgq7nmKrHwxDhKu2ddX6D1keYsb9t3xQJRKkJibygskd9kfrecBx4oSiNX4za2VAFtSiZn"
    },
    "id": 3
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P | jq .

echo "method" :"avm.getTxStatus"
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :6,
    "method" :"avm.getTxStatus",
    "params" :{
"txID": "27KzCu1fHxJ7AUrv9AzKNceBWyiPweBg66Ac3taswdAjV2J7Sf"}
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/X | jq .result.status


echo "method": "platform.getPendingValidators"
read -p "Press [Enter] key to wait for your address to appear..."
watch curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getPendingValidators",
    "params": {},
    "id": 4
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P | jq .result.validators[].id | grep -B 4 38peYHGBUi1xegFUVsffXeUZSPf5vTDB3
