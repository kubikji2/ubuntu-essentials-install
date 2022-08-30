#!/usr/bin/env bash

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/kvant/.local/share/flatpak/exports/share"

# install gimp using flatpak
# NOTE: it is currently recommended way of installing the gimp, see: https://www.gimp.org/downloads/
flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref -y

# add entry to ~/.local/bin
echo "flatpak run org.gimp.GIMP//stable" >> $HOME"/.local/bin/gimp"
chmod +x $HOME"/.local/bin/gimp"
