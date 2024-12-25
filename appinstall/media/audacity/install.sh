#!/usr/bin/env bash

# variable defining the location for the AppImage
target="$HOME/.Apps"
name="audacity"
path=$target"/"$name
version="3.7.1"
fn="audacity-linux-$version-x64-22.04.AppImage"
fn_template="audacity-*.AppImage"

# make Apps directory
mkdir -p $target
mkdir -p $path

# download the AppImage 
wget https://github.com/audacity/audacity/releases/download/Audacity-$version/audacity-linux-$version-x64-22.04.AppImage
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
Version=$version
Type=Application
Name=Audacity
Comment=Audio editing software.
TryExec=$HOME/.local/bin/$name
Exec=$HOME/.local/bin/$name
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$name.desktop