#!/usr/bin/env bash

# install possibly missing curl
sudo apt install curl -y

# based on:
# https://pureinfotech.com/install-microsoft-teams-linux/
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
sudo apt update
sudo apt install teams
