#!/usr/bin/env bash
set -euo

cargo run --release --                  \
    --postgres-url "${POSTGRES_URL}"    \
    --ethereum-rpc "${ETHEREUM_URL}"    \
    --ipfs "${IPFS_URL}"
