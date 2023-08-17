#!/bin/bash

# Update the system
apt-get update
apt-get upgrade -y

# Add services to go through firewall
# ufw allow http
# ufw allow ssh
# ufw allow https
# ufw enable

# Install dependencies
sudo apt-get install -y ca-certificates curl gnupg

# Import Docker repository keys
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker && Docker Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 

# Enable the Docker service
systemctl enable --now docker
