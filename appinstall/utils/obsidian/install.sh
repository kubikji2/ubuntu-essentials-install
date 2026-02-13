#!/usr/bin/env bash

# 1. Add flathub repository (if not already present)
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# 2. Add flatpak to environment variables (for current session)
export XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share"

# 3. Install Obsidian using Flatpak
# App ID: md.obsidian.Obsidian
sudo flatpak install flathub md.obsidian.Obsidian -y

# 4. Add entry to ~/.local/bin for terminal access
# This allows you to just type 'obsidian' in the terminal
mkdir -p $HOME/.local/bin
echo "flatpak run md.obsidian.Obsidian" > $HOME"/.local/bin/obsidian"
chmod +x $HOME"/.local/bin/obsidian"

#echo "Obsidian Flatpak installation complete!"
#echo "You may need to restart your session for the icon to appear in the app menu."