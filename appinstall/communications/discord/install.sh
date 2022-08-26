#!/usr/bin/env bash

# install flatpack
sudo apt install flatpak -y
# add repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/kvant/.local/share/flatpak/exports/share"
# install discord using 
flatpak install flathub com.discordapp.Discord -y
