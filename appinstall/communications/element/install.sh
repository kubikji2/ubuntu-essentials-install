#!/usr/bin/env bash

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/kvant/.local/share/flatpak/exports/share"

# install discord using flatpak
sudo flatpak install flathub im.riot.Riot -y

# add entry to ~/.local/bin
echo "flatpak run im.riot.Riot" > $HOME"/.local/bin/element"
chmod +x $HOME"/.local/bin/element"