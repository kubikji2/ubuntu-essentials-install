#!/usr/bin/env bash

# inspired by this:
# https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install

# get dot-net install script
wget https://dot.net/v1/dotnet-install.sh

# make it executable
sudo chmod +x ./dotnet-install.sh

# install latest version
./dotnet-install.sh --version latest --runtime aspnetcore

# clean up
rm ./dotnet-install.sh