#!/usr/bin/env bash

target="$HOME/.Apps"
name="appimagetool"
path=$target"/"$name
# MODIFY THIS UPON NEW RELEASE
#version="2_7_1"
#version_dots=${version//"_"/"."}

# make Apps directory
mkdir -p $target
# erease possible previous installations
rm -rf $path
mkdir -p $path
# download the appimage
wget https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage
# move to target
mv appimagetool-x86_64.AppImage $path
# make both prusaslicers GTK versions runable
chmod +x $path/appimagetool*
# make link to the .local/bin
ln -fs $path/appimagetool-x86_64.AppImage "$HOME/.local/bin/"$name

# install required libs
sudo apt-get install fuse3 -y


# adding icon
# getting script absolute dir path
# loosely based on: https://linuxhint.com/absolute-path-script-bash/
#script_path=$(realpath "${BASH_SOURCE:-$0}")
#script_dir=$(dirname $script_path)
# copy icon to the .App/ directory
#cp $script_dir/icon.png $path

# creating entry in the menu and enabling adding to sidebar
#echo -e "[Desktop Entry]
#Version=$version
#Type=Application
#Name=PrusaSlicer
#Comment=Slicer by Prusa Research
#TryExec=$HOME/.local/bin/$name
#Exec=$HOME/.local/bin/$name
#Icon=$path/icon.png
#Actions=Editor" > $HOME/.local/share/applications/$name.desktop