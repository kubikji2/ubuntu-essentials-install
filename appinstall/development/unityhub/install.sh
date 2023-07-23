#!/usr/bin/env bash

# AppImage related stuff
target="$HOME/.Apps"
name="unity-hub"
path=$target"/"$name
fn="UnityHub.AppImage"
# create dirs if not already present
mkdir -p $target
mkdir -p $path

# download unity hub
wget https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage

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
Version=2.4.6.
Type=Application
Name=UnityHub
Comment=.
TryExec=$HOME/.local/bin/$name
Exec=$HOME/.local/bin/$name
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$name.desktop