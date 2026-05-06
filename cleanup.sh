#!/bin/bash

echo "Stopping Fabric network..."

# Stop docker containers
docker ps -q | xargs -r docker stop

# Remove containers
docker ps -aq | xargs -r docker rm

# Remove images (optional)
docker images -q | xargs -r docker rmi -f

# Remove volumes (CAUTION: deletes ledger data)
docker volume prune -f

# Remove generated artifacts
rm -rf organizations/ordererOrganizations
rm -rf organizations/peerOrganizations
rm -rf channel-artifacts/*
rm -rf logs/*

echo "Cleanup completed successfully!"

# Stops all running Docker containers
# Removes stopped containers
# Deletes images and volumes
# Cleans generated Fabric artifacts
