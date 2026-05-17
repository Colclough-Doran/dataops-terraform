#!/bin/bash
set -euo pipefail

# Log all commands and their output
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Update the system
echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install required packages
echo "Installing Git, Docker, and dependencies..."
sudo apt-get install -y \
    git \
    docker.io \
    docker-buildx \
    unzip \
    curl

# Start and enable Docker
echo "Starting and enabling Docker..."
sudo systemctl start docker
sudo systemctl enable docker

# Add the current user, ssm-user, and jenkins to the docker group
CURRENT_USER=$(id -un 2>/dev/null || echo "ubuntu")
sudo usermod -aG docker "$CURRENT_USER"
sudo usermod -aG docker ssm-user 2>/dev/null || true
sudo usermod -aG docker jenkins 2>/dev/null || true

# Install AWS CLI v2 (statically linked)
echo "Installing AWS CLI v2..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
rm -rf awscliv2.zip aws

# Pull Jenkins image
echo "Pulling Jenkins Docker image..."
sudo docker pull jenkins/jenkins:lts

# Get the Docker group ID to avoid permission issues
DOCKER_GID=$(getent group docker | cut -d: -f3)

# Run Jenkins container
echo "Starting Jenkins container..."
sudo docker run -d \
  --name jenkins-main \
  -p 5000:5000 \
  -p 8080:8080 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/local/bin/aws:/usr/bin/aws:ro \
  -v $(which docker):/usr/bin/docker:ro \
  --group-add $DOCKER_GID \
  --cpus="2.0" \
  --memory="2g" \
  jenkins/jenkins:lts

echo "Bootstrap completed successfully!"