#!/bin/bash
docker-compose down
docker volume rm  explorer_pgdata
docker volume rm  explorer_walletstore

rm -rf ./organizations
mkdir organizations
cp -r ../fabric-samples/test-network/organizations/peerOrganizations/ ./organizations/
cp -r ../fabric-samples/test-network/organizations/ordererOrganizations/ ./organizations/

export EXPLORER_CONFIG_FILE_PATH=./config.json
export EXPLORER_PROFILE_DIR_PATH=./connection-profile
export FABRIC_CRYPTO_PATH=./organizations

docker-compose up -d

