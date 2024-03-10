#!/usr/bin/env bash

# installation based on:
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

# install prerequisities
sudo apt-get install ca-certificates curl gnupg lsb-release -y

# add dockers GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg

# adding repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# this might solve possible issues
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# updating after adding 
sudo apt-get update

# installing docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
