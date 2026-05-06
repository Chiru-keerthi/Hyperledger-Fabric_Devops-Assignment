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


Kubernetes + Helm Deployment (Planned)
-------------------------------------------------------------------------------
Hyperledger Fabric network can be containerized into Kubernetes pods
Helm charts can be used for reusable deployment templates
Enables scaling of peers and orderers
Benefit: Production-grade scalability and orchestration


Replace Cryptogen with Fabric CA (Implemented Conceptually)
-------------------------------------------------------------------------------
Fabric CA used instead of cryptogen for identity management
Provides dynamic certificate issuance
Supports real-world enterprise authentication flow
Benefit: Secure identity lifecycle management


Multi-Organization Support (Implemented)
-------------------------------------------------------------------------------
Org1 and Org2 configured using test-network
Separate peers for each organization
Independent MSP (Membership Service Provider)
Benefit: Real-world consortium blockchain structure


Private Data Collections (Conceptual)
-------------------------------------------------------------------------------
Sensitive data stored using Private Data Collections
Shared only between authorized organizations
Public ledger stores hash only
Benefit: Data privacy in enterprise blockchain


CI/CD Pipeline Automation (Implemented Conceptual Flow)
-------------------------------------------------------------------------------
GitHub Actions / Jenkins can automate:
Network startup
Chaincode deployment
Transaction execution
Benefit: End-to-end blockchain automation (DevOps workflow)


Key Features
-------------------------------------------------------------------------------
Multi-Organization Blockchain Network
Secure TLS Communication
Docker-based Deployment
Smart Contract Lifecycle Management
Ledger Query & Transaction Execution
Automation-ready CI/CD design


DevOps Highlights
-------------------------------------------------------------------------------
Infrastructure automation using Docker
Blockchain deployment on AWS EC2
Enterprise-grade distributed system simulation
CI/CD-ready architecture design
Production-like Hyperledger Fabric environment


Outcome
-------------------------------------------------------------------------------
Successfully deployed Hyperledger Fabric network
Executed chaincode transactions
Verified ledger data consistency
Designed scalable blockchain DevOps architecture
Extended system for enterprise use cases
