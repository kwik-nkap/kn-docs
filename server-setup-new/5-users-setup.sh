#!/bin/bash

NEW_USER=bitbucket

sudo adduser $NEW_USER

# Add User to Sudoers
# sudo usermod -aG sudo $NEW_USER

# Add User to Docker Group
sudo usermod -aG docker $NEW_USER

# Setup the home folder for the user
sudo mkdir -p /home/$NEW_USER
sudo chown -R $NEW_USER:$NEW_USER /home/$NEW_USER

# Setup the ssh folder for the user
sudo mkdir -p /home/$NEW_USER/.ssh
sudo chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh
sudo touch /home/$NEW_USER/.ssh/authorized_keys
sudo chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh/authorized_keys

