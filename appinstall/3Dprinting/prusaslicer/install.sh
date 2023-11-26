#!/usr/bin/env bash

target="$HOME/.Apps"
name="prusaslicer"
path=$target"/"$name
# MODIFY THIS UPON NEW RELEASE
version="2_7_0"
version_dots=${version//"_"/"."}

# make Apps directory
mkdir -p $target
# erease possible previous installations
rm -rf $path
mkdir -p $path
# download the appimage
wget https://cdn.prusa3d.com/downloads/drivers/prusa3d_linux_$version.zip
# unzip it to
unzip -j "prusa3d_linux_"$version -d $path
# make both prusaslicers GTK versions runable
chmod +x $path/PrusaSlicer*
# make link to the .local/bin
ln -fs $path/PrusaSlicer*linux-x64-GTK3*.AppImage "$HOME/.local/bin/"$name
# clean up
rm prusa3d_linux_$version.zip 

# adding icon
# getting script absolute dir path
# loosely based on: https://linuxhint.com/absolute-path-script-bash/
script_path=$(realpath "${BASH_SOURCE:-$0}")
script_dir=$(dirname $script_path)
# copy icon to the .App/ directory
cp $script_dir/icon.png $path

# creating entry in the menu and enabling adding to sidebar
echo -e "[Desktop Entry]
Version=2.4.2
Type=Application
Name=PrusaSlicer
Comment=Slicer by Prusa Research
TryExec=$HOME/.local/bin/$name
Exec=$HOME/.local/bin/$name
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$name.desktop
