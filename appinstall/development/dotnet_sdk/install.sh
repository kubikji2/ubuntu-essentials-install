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

# get your ubuntu version
# based on:
# https://www.ionos.com/digitalguide/server/know-how/check-ubuntu-version/
# https://stackoverflow.com/questions/12426659/how-to-extract-last-part-of-string-in-bash
# and
# https://stackoverflow.com/questions/4651437/how-do-i-set-a-variable-to-the-output-of-a-command-in-bash
ubuntu_release=`lsb_release -r`
ubuntu_release=`echo "$ubuntu_release" | awk '{print $NF}'`


# setup repository
wget https://packages.microsoft.com/config/ubuntu/$ubuntu_release/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# decrease priority of ubuntu repositories when using the dot net
# based on: 
# https://stackoverflow.com/questions/73753672/a-fatal-error-occurred-the-folder-usr-share-dotnet-host-fxr-does-not-exist
tmp_pref_file="tmp.pref"
echo -e "Package: dotnet* aspnet* netstandard*" >> $tmp_pref_file
echo -e "Pin: origin "archive.ubuntu.com"" >> $tmp_pref_file
echo -e "Pin-Priority: -10" >> $tmp_pref_file
echo -e "" >> $tmp_pref_file
echo -e "Package: dotnet* aspnet* netstandard*" >> $tmp_pref_file
echo -e "Pin: origin "security.ubuntu.com"" >> $tmp_pref_file
echo -e "Pin-Priority: -10" >> $tmp_pref_file

sudo mv $tmp_pref_file "/etc/apt/preferences.d/99microsoft-dotnet.pref"


# install Dotnet
sudo apt-get update &&  sudo apt-get install -y dotnet-sdk-7.0