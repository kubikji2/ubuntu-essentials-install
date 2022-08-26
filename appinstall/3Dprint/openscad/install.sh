#!/usr/bin/env bash

# variable defining the location for the AppImage
target="$HOME/.Apps"
path=$target"/openscad"
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
ln -s $path"/"$fn $HOME"/.local/bin/openscad"
