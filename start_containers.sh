#!/bin/bash

# Change to the node-app directory
cd /home/ubuntu/node-app || { echo "Directory /home/ubuntu/node-app does not exist."; exit 1; }

# Check if Docker is running
if ! systemctl is-active --quiet docker; then
    echo "Docker is not running. Starting Docker..."
    sudo systemctl start docker
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose could not be found. Please install Docker Compose."
    exit 1
fi

# Bring up the containers using Docker Compose
echo "Starting Docker containers..."
docker-compose up -d

# Check if containers started successfully
if [ $? -eq 0 ]; then
    echo "Containers started successfully."
else
    echo "Error occurred while starting containers."
    exit 1
fi
