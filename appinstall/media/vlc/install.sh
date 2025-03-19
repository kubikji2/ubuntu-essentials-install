#!/usr/bin/env bash

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share"

# install using flatpak
sudo flatpak install flathub org.videolan.VLC -y

# add entry to ~/.local/bin
echo "flatpak run org.videolan.VLC" > $HOME"/.local/bin/vlc"
chmod +x $HOME"/.local/bin/vlc"
