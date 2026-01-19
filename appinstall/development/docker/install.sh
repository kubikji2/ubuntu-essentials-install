#!/usr/bin/env bash

# installation based on:
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

# 1. remove existing docker if present

# 1.1. uninstall conflicting packages
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1) -y

# 1.2 uninstall existing docker
sudo apt purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras -y

# delete data
#sudo rm -rf /var/lib/docker
#sudo rm -rf /var/lib/containerd

# Remove source list and keyrings
sudo rm /etc/apt/sources.list.d/docker.sources
sudo rm /etc/apt/keyrings/docker.asc


# 2. install docker from apt repository

# 2.1. install prerequisities
sudo apt-get install ca-certificates curl gnupg lsb-release -y

# 2.2 Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 2.3. Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# 2.4 updating after adding 
sudo apt-get update

# 2.5 installing docker packeges
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


# 3. install docker desktop
package_name="docker-desktop-amd64.deb"

rm -f $package_name

wget "https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" -O $package_name

mv $package_name /tmp

# 3.1. fixing permissions
# see: https://askubuntu.com/questions/908800/what-does-this-apt-error-message-download-is-performed-unsandboxed-as-root

sudo apt update
sudo apt install /tmp/$package_name -y

rm /tmp/$package_name