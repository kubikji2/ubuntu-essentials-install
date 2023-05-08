#!/usr/bin/env bash

# variable defining the location for the AppImage
target="$HOME/.Apps"
name="caprine"
path=$target"/"$name
version="2.57.4"
fn="Caprine-$version.AppImage"
fn_template="Caprine-*.AppImage"

# make Apps directory
mkdir -p $target
mkdir -p $path

# download the AppImage
wget https://github.com/sindresorhus/caprine/releases/download/v$version/Caprine-$version.AppImage
# make it AppImage runable
chmod +x $fn
# move it to the target location
mv $fn $path
# create a link to ~/.local/bin 
ln -fs $path"/"$fn_template $HOME"/.local/bin/"$name

# coppy icon to the .App/ directory
cp icon.png $path 
# creating entry in the menu and enabling adding to favourite
echo -e "[Desktop Entry]
Version=$version
Type=Application
Name=Caprine
Comment=Unofficial Facebook messagner app.
TryExec=$HOME/.local/bin/$name
Exec=$HOME/.local/bin/$name
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$name.desktop