#!/usr/bin/env bash

# variable defining the location for the AppImage
target="$HOME/.Apps"
name="caprine"
path=$target"/"$name
fn="Caprine-2.56.1.AppImage"

# make Apps directory
mkdir -p $target
mkdir -p $path

# download the AppImage
wget https://github.com/sindresorhus/caprine/releases/download/v2.56.1/Caprine-2.56.1.AppImage
# make it AppImage runable
chmod +x $fn
# move it to the target location
mv $fn $path
# create a link to ~/.local/bin 
ln -fs $path"/"$fn $HOME"/.local/bin/"$name

# coppy icon to the .App/ directory
cp icon.png $path 
# creating entry in the menu and enabling adding to favourite
echo -e "[Desktop Entry]
Version=2021.01
Type=Application
Name=Caprine
Comment=free software application for creating solid 3D computer-aided design objects.
TryExec=$HOME/.local/bin/$name
Exec=$HOME/.local/bin/$name
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$name.desktop