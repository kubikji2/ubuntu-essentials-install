#!/usr/bin/env bash

target="$HOME/.Apps"
path=$target"/prusaslicer"

# make Apps directory
mkdir -p $target
mkdir -p $path
# download the appimage
wget https://cdn.prusa3d.com/downloads/drivers/prusa3d_linux_2_4_2.zip
# unzip it to
unzip prusa3d_linux_2_4_2 -d $path
# make both prusaslicers GTK versions runable
chmod +x $path/PrusaSlicer*
# make link to the .local/bin
ln -s $path/PrusaSlicer-2.4.2+linux-x64-GTK3-202204251120.AppImage "$HOME/.local/bin/prusaslicer"
# clean up
rm prusa3d_linux_2_4_2.zip 