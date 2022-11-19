#!/usr/bin/env bash

# inspired by this:
# https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install

# get dot-net install script
#wget https://dot.net/v1/dotnet-install.sh

# make it executable
#sudo chmod +x ./dotnet-install.sh

# install latest version
#./dotnet-install.sh --version latest

# clean up
#rm ./dotnet-install.sh

# set environment variables
#echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
#echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc

# setup repository
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
# install Dotnet
sudo apt-get update &&  sudo apt-get install -y dotnet-sdk-6.0