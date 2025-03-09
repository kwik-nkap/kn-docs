#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install necessary dependencies
sudo apt install -y \
    curl \
    git \
    openvswitch-switch-dpdk \
    apt-transport-https \
    ca-certificates \
    software-properties-common

# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world

# Add current user to the docker group
sudo usermod -aG docker $USER

# Basic security measures
# Install UFW (Uncomplicated Firewall)
sudo apt install -y ufw

# Allow SSH and HTTP/HTTPS through the firewall
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Enable the firewall
sudo ufw enable

# Install Fail2Ban for additional security
sudo apt install -y fail2ban

# Start and enable Fail2Ban service
sudo systemctl start fail2ban
sudo systemctl enable fail2ban

# # Setup Swapfile
# sudo fallocate -l 8G /swapfile
# sudo chmod 600 /swapfile
# sudo mkswap /swapfile
# sudo swapon /swapfile
# sudo cp /etc/fstab /etc/fstab.bak
# echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
# sudo sysctl vm.swappiness=20
# sudo sh -c "echo 'vm.swappiness=20' >> /etc/sysctl.conf"
# sudo sysctl vm.vfs_cache_pressure=50
# sudo sh -c "echo 'vm.vfs_cache_pressure=50' >> /etc/sysctl.conf"


# Print completion message
echo "Initialization complete."