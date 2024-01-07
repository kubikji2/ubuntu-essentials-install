#!/usr/bin/env bash

target="$HOME/.Apps"
name="Obsidian"
path=$target"/"$name
# MODIFY THIS UPON NEW RELEASE
version="1.5.3"
filename=$name"-"$version".AppImage"
#version="2_7_1"
#version_dots=${version//"_"/"."}
alias_name="obsidian"

# make Apps directory
mkdir -p $target
# erease possible previous installations
rm -rf $path
mkdir -p $path
# download the appimage
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v$version/$filename
# make it runable
chmod +x $filename
# copy it to
cp $filename $path
# make link to the .local/bin
ln -fs $path/$filename "$HOME/.local/bin/"$alias_name
# clean up
rm $filename 

# adding icon
# getting script absolute dir path
# loosely based on: https://linuxhint.com/absolute-path-script-bash/
script_path=$(realpath "${BASH_SOURCE:-$0}")
script_dir=$(dirname $script_path)
# copy icon to the .App/ directory
cp $script_dir/icon.png $path

# creating entry in the menu and enabling adding to sidebar
echo -e "[Desktop Entry]
Version=$version
Type=Application
Name=$name
Comment=Slicer by Prusa Research
TryExec=$HOME/.local/bin/$alias_name
Exec=$HOME/.local/bin/$alias_name
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$alias_name.desktop
