Hyperledger Fabric DevOps Assignment
Overview

This project demonstrates the deployment of a production-like Hyperledger Fabric blockchain network on AWS EC2 using Docker.
It simulates an enterprise blockchain environment with multiple organizations, peers, orderer service, and smart contract lifecycle management.

The project focuses on DevOps automation, blockchain deployment, and transaction workflows.

Architecture
------------------------------------------------------
Organizations:
- Org1
- Org2

Network Components:
- 2 Peer Nodes (peer0.org1, peer0.org2)
- 1 Orderer Node
- CouchDB (State Database)
- TLS Enabled Communication
- Channel: mychannel
- Chaincode: basic (asset-transfer)

  
Tech Stack
------------------------------------------------------
Hyperledger Fabric v2.x
Docker & Docker Compose
AWS EC2 (Ubuntu)
Fabric CLI Tools
Bash Automation Scripts


DevOps Workflow
------------------------------------------------------------
The complete lifecycle of the blockchain network includes:
Infrastructure setup on AWS EC2
Docker-based Fabric network initialization
Channel creation between organizations
Chaincode deployment (Smart Contract)
Transaction execution on ledger
Querying blockchain state
Cleanup of network resources


Project Structure
-------------------------------------------------
fabric-project/
│
├── chaincode/              # Smart contracts
├── compose/                # Docker compose files
├── configtx/               # Channel configuration
├── organizations/         # Crypto materials
├── scripts/               # Automation scripts
├── fabric-samples/        # Fabric binaries & test network
├── logs/                  # Execution logs
├── cleanup.sh             # Network teardown script
└── README.md


Setup & Execution
---------------------------------------------------------------
1️. Start Fabric Network
cd fabric-samples/test-network
./network.sh up createChannel -ca

What it does:
#Starts blockchain network (Orderer + Peers)
#Creates channel (mychannel)
#Enables TLS security
#Launches CouchDB state database

2️. Deploy Chaincode (Smart Contract)
./network.sh deployCC -ccn basic \
-ccp ../asset-transfer-basic/chaincode-javascript \
-ccl javascript
What it does:
#Installs smart contract on peers
#Approves and commits chaincode
#Enables asset transfer logic on blockchain

3️. Invoke Transaction
peer chaincode invoke -C mychannel -n basic \
-c '{"function":"CreateAsset","Args":["asset1","blue","5","Tom","100"]}'
What it does:
#Writes data to blockchain ledger
#Creates a new asset
#Demonstrates transaction execution

4️. Query Ledger
peer chaincode query -C mychannel -n basic \
-c '{"Args":["GetAllAssets"]}'
What it does:
#Reads blockchain state
#Verifies stored assets
#Confirms successful transactions

5️. Cleanup Network
./cleanup.sh
What it does:
#Stops all Fabric containers
#Removes Docker volumes and images
#Cleans up network artifacts


Key Features
---------------------------------------------------
Multi-Organization Blockchain Network
Secure TLS Communication
Docker-based Deployment
Smart Contract Lifecycle Management
Ledger Query & Transaction Execution
Automated Cleanup Scripts

DevOps Highlights
-------------------------------------------------------------
Infrastructure automation using Docker
Blockchain network provisioning on EC2
Smart contract deployment lifecycle
Real-world distributed system simulation
Production-like Hyperledger Fabric setup
