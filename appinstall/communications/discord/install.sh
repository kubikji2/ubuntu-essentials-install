#!/usr/bin/env bash

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share"

# install discord using flatpak
sudo flatpak install flathub com.discordapp.Discord -y

# add entry to ~/.local/bin
echo "flatpak run com.discordapp.Discord" > $HOME"/.local/bin/discord"
chmod +x $HOME"/.local/bin/discord"