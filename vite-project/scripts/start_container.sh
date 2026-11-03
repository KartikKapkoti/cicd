#!/bin/bash

set -e

ECR_REGISTRY="150619449300.dkr.ecr.ap-south-1.amazonaws.com"

DEPLOYMENT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE_URI=$(cat "$DEPLOYMENT_DIR/imageUri.txt")

echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin "$ECR_REGISTRY"

echo "Pulling React image: $IMAGE_URI"
docker pull "$IMAGE_URI"

echo "Starting React container..."
docker run -d \
  --name react-container \
  --restart unless-stopped \
  -p 80:80 \
  "$IMAGE_URI"

echo "Deployment completed!"
