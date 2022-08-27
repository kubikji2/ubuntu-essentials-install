#!/usr/bin/env bash

# install using flatpak
flatpak install flathub com.spotify.Client -y
# add entry to ~/.local/bin
echo "flatpak run com.spotify.Client" >> $HOME"/.local/bin/spotify"
chmod +x $HOME"/.local/bin/spotify"
