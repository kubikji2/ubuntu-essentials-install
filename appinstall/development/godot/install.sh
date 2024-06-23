#!/usr/bin/env bash

target="$HOME/.Apps"
name="godot"
# MODIFY THIS UPON NEW RELEASE
version="4_2_2"
version_dots=${version//"_"/"."}
path=$target"/"$name$version_dots
filename=Godot_v$version_dots-stable_linux.x86_64
archive_name=$filename.zip


# make Apps directory
mkdir -p $target
# erease possible previous installations
rm -rf $path
mkdir -p $path
# download the appimage
wget https://github.com/godotengine/godot/releases/download/$version_dots-stable/$archive_name
# unzip it to
unzip -j $archive_name -d $path
# make link to the .local/bin
ln -fs $path/$filename "$HOME/.local/bin/"$name
# clean up
rm $archive_name
