#!/usr/bin/env bash

target="$HOME/.Apps"
name="prusaslicer"
path=$target"/"$name

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
ln -fs $path/PrusaSlicer-2.4.2+linux-x64-GTK3-202204251120.AppImage "$HOME/.local/bin/"$name
# clean up
rm prusa3d_linux_2_4_2.zip 

# coppy icon to the .App/ directory
cp icon.png $path 
# creating entry in the menu and enabling adding to favourite
echo -e "[Desktop Entry]
Version=2.4.2
Type=Application
Name=PrusaSlicer
Comment=Slicer by Prusa Research
TryExec=$HOME/.local/bin/$name
Exec=$HOME/.local/bin/$name
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$name.desktop
