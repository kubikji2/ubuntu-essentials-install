#!/usr/bin/env bash

# install gimp using flatpak
# NOTE: it is currently recommended way of installing the gimp, see: https://www.gimp.org/downloads/
flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref -y
# add entry to ~/.local/bin
echo "flatpak run org.gimp.GIMP//stable" >> $HOME"/.local/bin/gimp"
chmod +x $HOME"/.local/bin/gimp"
