#!/usr/bin/env bash

# based on: https://code.visualstudio.com/docs/setup/linux

# install wget and gpg if not present
sudo apt-get install wget gpg -y
# get key or something
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# clean up
rm -f packages.microsoft.gpg
# install additional stuff

sudo apt install apt-transport-https
# update dependencies
sudo apt update
# instlal code
sudo apt install code