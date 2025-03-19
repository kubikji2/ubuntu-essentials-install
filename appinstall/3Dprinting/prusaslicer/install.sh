#!/usr/bin/env bash

# PRE 2.9.1

#target="$HOME/.Apps"
#name="prusaslicer"
#path=$target"/"$name
## MODIFY THIS UPON NEW RELEASE
#version="2_9_1"
#version_dots=${version//"_"/"."}
#
## make Apps directory
#mkdir -p $target
## erease possible previous installations
#rm -rf $path
#mkdir -p $path
## download the appimage
#wget https://cdn.prusa3d.com/downloads/drivers/prusa3d_linux_$version.zip
## unzip it to
#unzip -j "prusa3d_linux_"$version -d $path
## make both prusaslicers GTK versions runable
#chmod +x $path/PrusaSlicer*
## make link to the .local/bin
##ln -fs $path/PrusaSlicer*linux-x64-GTK3*.AppImage "$HOME/.local/bin/"$name
## HOT FIX
#ln -fs $path/PrusaSlicer*linux-x64-GTK3*202406270929.AppImage "$HOME/.local/bin/"$name
## clean up
#rm prusa3d_linux_$version.zip 
#
## adding icon
## getting script absolute dir path
## loosely based on: https://linuxhint.com/absolute-path-script-bash/
#script_path=$(realpath "${BASH_SOURCE:-$0}")
#script_dir=$(dirname $script_path)
## copy icon to the .App/ directory
#cp $script_dir/icon.png $path
#
## creating entry in the menu and enabling adding to sidebar
#echo -e "[Desktop Entry]
#Version=$version
#Type=Application
#Name=PrusaSlicer
#Comment=Slicer by Prusa Research
#TryExec=$HOME/.local/bin/$name
#Exec=$HOME/.local/bin/$name
#Icon=$path/icon.png
#Actions=Editor" > $HOME/.local/share/applications/$name.desktop

#!/usr/bin/env bash

# remove previous desktop entry if present
rm -f $HOME/.local/share/applications/prusaslicer.desktop

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share"

# install prusaslicer using flatpak
# NOTE: it is currently recommended way of installing the prusaslicer,
#       see https://help.prusa3d.com/article/install-prusaslicer_1903#linux-including-chrome-os
sudo flatpak install com.prusa3d.PrusaSlicer -y

# add entry to ~/.local/bin
echo "flatpak run com.prusa3d.PrusaSlicer" > $HOME"/.local/bin/prusaslicer"
chmod +x $HOME"/.local/bin/prusaslicer"
