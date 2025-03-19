#!/usr/bin/env bash

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share"

# install freecad using flatpak
flatpak install flathub net.meshlab.MeshLab -y

# add entry to ~/.local/bin
echo "flatpak run net.meshlab.MeshLab" > $HOME"/.local/bin/meshlab"
chmod +x $HOME"/.local/bin/meshlab"