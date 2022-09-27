#!/usr/bin/env bash

# AppImage related stuff
target="$HOME/.Apps"
name="jetbrains-toolbox"
path=$target"/"$name

# create dirs if not already present
mkdir -p $target
mkdir -p $path

# some version was selected, it might get autoupdated
_name="jetbrains-toolbox-1.26.0.13072"
_filename=$_name".tar.gz"

# downloading archive
wget https://download.jetbrains.com/toolbox/$_filename

# extracting archive
tar -xf $_filename -C $path"/"
# removing one layer of extracted content
mv $path"/"$_name"/"* $path
# removing dir with unpleasant name (see $_name)
rmdir $path"/"$_name

# make toolbox runable just to be sure
chmod +x $path/$name*
# make link to the .local/bin
ln -fs $path/$name "$HOME/.local/bin/"$name
# clean up archive
rm -f $_filename

# coppy icon to the .App/ directory
cp icon.png $path 
# creating entry in the menu and enabling adding to favourite
echo -e "[Desktop Entry]
Version=1.26.0
Type=Application
Name=JetBrains Toolbox
Comment=A suite of professional development tools for a range of languages and technologies
TryExec=$HOME/.local/bin/$name
Exec=$HOME/.local/bin/$name
Actions=Editor" > $HOME/.local/share/applications/$name.desktop