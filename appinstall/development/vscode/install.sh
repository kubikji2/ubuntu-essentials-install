#!/usr/bin/env bash
#set -e # Exit immediately if a command fails

# 1. Cleanup old/conflicting definitions
# This is the "Magic" part for 24.04 compatibility.
# It ensures we don't have multiple files arguing over the same repo.
sudo rm -f /etc/apt/sources.list.d/vscode.list /etc/apt/sources.list.d/vscode.sources

# 2. Prepare environment
sudo apt-get update
sudo apt-get install wget gpg apt-transport-https -y

# 3. Handle Keyring
# Ensure the directory exists (necessary for 20.04)
sudo mkdir -p /etc/apt/keyrings

# Get the key, dearmor it, and install it to the modern location
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
rm -f packages.microsoft.gpg

# 4. Add the Repository
# We use the .list format because it is compatible with 20.04, 22.04, and 24.04.
# By using the 'signed-by' tag, we avoid the old 'apt-key' security warnings.
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

# 5. Install
sudo apt-get update
sudo apt-get install code -y

echo "Visual Studio Code installation complete!"