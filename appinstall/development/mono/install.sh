#!/usr/bin/env bash

# based on:
# https://www.mono-project.com/download/stable/

# adding mono repository
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update

# installing mono devel
sudo apt install -y mono-devel mono-complete mono-dbg