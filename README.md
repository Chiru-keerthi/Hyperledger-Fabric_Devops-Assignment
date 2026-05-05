 Hyperledger Fabric DevOps Assignment
 Overview
----------------------------------------------------------------------------
This project demonstrates deployment of a production-like Hyperledger Fabric network using Docker on AWS EC2 Ubuntu instance. It includes blockchain network setup, channel creation, chaincode deployment, and transaction execution.


Network Architecture
-------------------------------
2 Organizations (Org1 & Org2)
2 Peer Nodes
1 Orderer Node
CouchDB as state database
TLS enabled communication
Channel-based communication
Chaincode deployment and execution


Tools Used
--------------------------------
Hyperledger Fabric v2.x
Docker & Docker Compose
AWS EC2 (Ubuntu)
Fabric CLI
Bash scripting


Project Structure
-------------------------------
chaincode/
compose/
configtx/
organizations/
scripts/
screenshots/
cleanup.sh
README.md
.gitignore


Setup Steps
Start Network
--------------------------------------
cd fabric-samples/test-network
./network.sh up createChannel -ca
# Starts Fabric network, creates channel, enables TLS


Deploy Chaincode
----------------------------------------------------
./network.sh deployCC -ccn basic \
-ccp ../asset-transfer-basic/chaincode-javascript \
-ccl javascript
# Installs, approves, and commits smart contract

Invoke Transaction
------------------------------------------------------------------------
peer chaincode invoke -C mychannel -n basic \
-c '{"function":"CreateAsset","Args":["asset1","blue","5","Tom","100"]}'
# Writes data to blockchain ledger


Query Ledger
------------------------------------------------
peer chaincode query -C mychannel -n basic \
-c '{"Args":["GetAllAssets"]}'
# Reads data from blockchain ledger


Cleanup
------------------------------------
./cleanup.sh
# Stops network and removes Docker resources


End-to-End Flow
----------------------------------------------------------
Network → Channel → Chaincode → Invoke → Query → Cleanup
