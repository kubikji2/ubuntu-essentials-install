#!/usr/bin/env bash

# variable defining the location for the AppImage
target="$HOME/.Apps"
name="openscad"
path=$target"/"$name
fn="OpenSCAD-2021.01-x86_64.AppImage"

# make Apps directory
mkdir -p $target
mkdir -p $path

# get the AppImage
wget https://files.openscad.org/OpenSCAD-2021.01-x86_64.AppImage
# make it AppImage runable
chmod +x $fn
# move it to the target location
mv $fn $path
# create a link to ~/.local/bin 
ln -fs $path"/"$fn $HOME"/.local/bin/"$name

# adding icon
# getting script absolute dir path
# loosely based on: https://linuxhint.com/absolute-path-script-bash/
script_path=$(realpath "${BASH_SOURCE:-$0}")
script_dir=$(dirname $script_path)
# copy icon to the .App/ directory
cp $script_dir/icon.png $path

# creating entry in the menu and enabling adding to favourite
echo -e "[Desktop Entry]
Version=2021.01
Type=Application
Name=OpenSCAD
Comment=Free software application for creating solid 3D computer-aided design objects.
TryExec=$HOME/.local/bin/$name
Exec=$HOME/.local/bin/$name
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$name.desktop
