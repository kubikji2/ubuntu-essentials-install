#!/usr/bin/env bash

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/kvant/.local/share/flatpak/exports/share"

# install from flatpak
flatpak install flathub org.telegram.desktop -y

# add entry to ~/.local/bin
echo "flatpak run org.telegram.desktop" >> $HOME"/.local/bin/telegram"
chmod +x $HOME"/.local/bin/telegram"