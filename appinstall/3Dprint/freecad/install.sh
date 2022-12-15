#!/usr/bin/env bash

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/kvant/.local/share/flatpak/exports/share"

# install freecad using flatpak
sudo flatpak install flathub org.freecadweb.FreeCAD -y

# add entry to ~/.local/bin
echo "flatpak run org.freecadweb.FreeCAD" > $HOME"/.local/bin/freecad"
chmod +x $HOME"/.local/bin/freecad"