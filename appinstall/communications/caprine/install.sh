#!/usr/bin/env bash

# variable defining the location for the AppImage
target="$HOME/.Apps"
path=$target"/caprine"
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
ln -s $path"/"$fn $HOME"/.local/bin/caprine"