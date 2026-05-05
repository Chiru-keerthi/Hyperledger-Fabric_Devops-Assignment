Hyperledger Fabric DevOps Assignment
 Overview
This project demonstrates deployment of a production-like Hyperledger Fabric network using Docker on AWS EC2.

Network Architecture
-------------------------------------------------
1 Organization (Org1 & Org2 from test-network)
2 Peer nodes
1 Orderer node
CouchDB as state database
TLS enabled communication
Channel creation & Chaincode deployment


Tools Used
-----------------------
Hyperledger Fabric v2.x
Docker & Docker Compose
AWS EC2 (Ubuntu)
Fabric CLI


Setup Steps
---------------------------------
Start Network
cd fabric-samples/test-network
./network.sh up createChannel -ca
#Brings up Hyperledger Fabric network (orderer, peers, CouchDB), creates channel and enables TLS.


Deploy Chaincode
---------------------------------------------------
./network.sh deployCC -ccn basic \
-ccp ../asset-transfer-basic/chaincode-javascript \
-ccl javascript
#Packages, installs, approves and commits the smart contract (basic) on the channel.


Invoke Transaction
------------------------------------------------------------------------
peer chaincode invoke -C mychannel -n basic \
-c '{"function":"CreateAsset","Args":["asset1","blue","5","Tom","100"]}'
#Executes a blockchain transaction to create a new asset and write data to the ledger.


Query Ledger
--------------------------------------------
peer chaincode query -C mychannel -n basic \
-c '{"Args":["GetAllAssets"]}'
#Reads blockchain ledger data to verify stored assets and successful transactions.

Cleanup Script
-----------------------
./cleanup.sh
#Stops Fabric network and removes Docker containers, images, volumes and artifacts.
