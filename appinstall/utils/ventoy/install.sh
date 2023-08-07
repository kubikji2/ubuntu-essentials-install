#!/usr/bin/env bash

# header variables for program location etc
target="$HOME/.Apps"
name="ventoy"
path=$target"/"$name
version="1.0.94"
fn="ventoy-"$version"-linux.tar.gz"
sup_sript="ventoy-gui.sh"

# getting script absolute dir path
# loosely based on: https://linuxhint.com/absolute-path-script-bash/
script_path=$(realpath "${BASH_SOURCE:-$0}")
script_dir=$(dirname $script_path)

# make Apps directory
mkdir -p $target
mkdir -p $path

# get the AppImage
wget "https://github.com/ventoy/Ventoy/releases/download/v"$version"/"$fn
# extract downloaded file to netfabb directory
tar -zxvf $fn --directory $path
# move files on level higher
mv $path/*/* $path/
# copy the ventoy-gui.sh script to 
cp $script_dir"/"$sup_sript $path

# create a link to ~/.local/bin 
ln -fs $path"/"$sup_sript "$HOME/.local/bin/"$name"-gui"
# clean up
rm $fn

# adding icon
# copy icon to the .App/ directory
cp $script_dir/icon.png $path

# creating entry in the menu and enabling adding to favourite
echo -e "[Desktop Entry]
Version=$version
Type=Application
Name=Ventoy GUI
Comment=Ventoy is an open source tool to create bootable USB drive with multiple ISO/WIM/IMG/VHD(x)/EFI files.
TryExec=$HOME/.local/bin/$name"-gui"
Exec=$HOME/.local/bin/$name"-gui"
Icon=$path/icon.png
Actions=Editor" > $HOME/.local/share/applications/$name.desktop
