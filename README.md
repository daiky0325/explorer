docker-compose down

rm -rf ./organizations
mkdir organizations
cp -r ../fabric-samples/test-network/organizations/peerOrganizations/ ./organizations/
cp -r ../fabric-samples/test-network/organizations/ordererOrganizations/ ./organizations/

ls organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/
ls organizations/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/
ls organizations/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp/keystore/

docker-compose down
docker volume rm  explorer_pgdata
docker volume rm  explorer_walletstore
