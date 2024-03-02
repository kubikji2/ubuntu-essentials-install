#!/usr/bin/env bash

#!/usr/bin/env bash

target="$HOME/.Apps"
name="kdenlive"
path=$target"/"$name
# MODIFY THIS UPON NEW RELEASE
version="23.08"
version_full=$version".5"
appimage_name=kdenlive-$version_full-x86_64.AppImage 
# https://download.kde.org/stable/kdenlive/23.08/linux/kdenlive-23.08.5-x86_64.AppImage

# make Apps directory
mkdir -p $target
# erease possible previous installations
rm -rf $path
mkdir -p $path
# download the appimage
wget https://download.kde.org/stable/kdenlive/$version/linux/$appimage_name
# move app image
mv $appimage_name $path
# make both prusaslicers GTK versions runable
chmod +x $path/$appimage_name
# make link to the .local/bin
ln -fs $path/$appimage_name "$HOME/.local/bin/"$name


# fixing issues with missing: /lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.XX' not found
# based on:
# https://stackoverflow.com/questions/65349875/where-can-i-find-glibcxx-3-4-29
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc- -y
sudo apt-get upgrade libstdc++6 -y

# adding icon
# getting script absolute dir path
# loosely based on: https://linuxhint.com/absolute-path-script-bash/
#script_path=$(realpath "${BASH_SOURCE:-$0}")
#script_dir=$(dirname $script_path)
# copy icon to the .App/ directory
#cp $script_dir/icon.png $path

# creating entry in the menu and enabling adding to sidebar
#echo -e "[Desktop Entry]
#Version=$version_full
#Type=Application
#Name=KdenLive
#Comment=Kdenlive video editing software
#TryExec=$HOME/.local/bin/$name
#Exec=$HOME/.local/bin/$name
#Icon=$path/icon.png
#Actions=Editor" > $HOME/.local/share/applications/$name.desktop
