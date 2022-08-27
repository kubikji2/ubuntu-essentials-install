#!/usr/bin/env bash

# install using flatpak
flatpak install flathub org.videolan.VLC -y
# add entry to ~/.local/bin
echo "flatpak run org.videolan.VLC" >> $HOME"/.local/bin/vlc"
chmod +x $HOME"/.local/bin/vlc"
