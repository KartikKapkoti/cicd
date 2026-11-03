#!/bin/bash

echo "Stopping existing React container..."

docker stop react-container || true
docker rm react-container || true
