#!/bin/bash
set -e
set -u
#set -x
echo "Stage 3 — Validation"
echo "Step 5 — wait for your node to become Validator"

read -p "Press [Enter] key to wait for your address to appear..."
watch "./platform/getCurrentValidatorsById.sh | grep 38peYHGBUi1xegFUVsffXeUZSPf5vTDB3"
