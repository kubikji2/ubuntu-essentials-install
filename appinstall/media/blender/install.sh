#!/usr/bin/env bash

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share"

# install using flatpak
sudo flatpak install flathub org.blender.Blender -y

# add entry to ~/.local/bin and make it executable
echo "flatpak run org.blender.Blender" > $HOME"/.local/bin/blender"
chmod +x $HOME"/.local/bin/blender"