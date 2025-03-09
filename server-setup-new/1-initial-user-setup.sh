#!/bin/bash

USER=lotbill

adduser $USER
usermod -aG sudo $USER

# Setup the home folder for the user
mkdir -p /home/$USER
chown -R $USER:$USER /home/$USER

# Setup the ssh folder for the user
mkdir -p /home/$USER/.ssh
chown -R $USER:$USER /home/$USER/.ssh
touch /home/$USER/.ssh/authorized_keys
chown -R $USER:$USER /home/$USER/.ssh/authorized_keys

