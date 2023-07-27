#!/usr/bin/env bash

# variable defining the location for the AppImage
target="$HOME/.Apps"
name="etcher"
path=$target"/"$name
version="1.18.11"
fn="balenaEtcher-$version-x64.AppImage"
fn_template="balenaEtcher-*.AppImage"

# make Apps directory
mkdir -p $target
mkdir -p $path

# download the AppImage
wget https://github.com/balena-io/etcher/releases/download/v$version/balenaEtcher-$version-x64.AppImage
# make it AppImage runable
chmod +x $fn
# move it to the target location
mv $fn $path
# create a link to ~/.local/bin 
ln -fs $path"/"$fn_template $HOME"/.local/bin/"$name

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
Name=Etcher
Comment=Flash OS images to SD cards and USB drives, safely and easily.
TryExec=$HOME/.local/bin/$name
Exec=$HOME/.local/bin/$name
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$name.desktop
