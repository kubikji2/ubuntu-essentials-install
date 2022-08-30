#!/usr/bin/env bash

# install from flatpak
flatpak install flathub org.telegram.desktop -y

# add entry to ~/.local/bin
echo "flatpak run org.telegram.desktop" >> $HOME"/.local/bin/telegram"
chmod +x $HOME"/.local/bin/telegram"