#!/usr/bin/env bash

# current version
version=7.2
# variable defining the location for the AppImage
target="$HOME/.Apps"
name="SweetHome3D-$version"
path=$target"/"$name
archivename=$name".tgz"
runfile="SweetHome3D"

# remove existing file for reinstalling
rm -rf $path

# prepare structure
mkdir -p $target
mkdir -p $path

# download current version
wget http://sourceforge.net/projects/sweethome3d/files/SweetHome3D/SweetHome3D-$version/SweetHome3D-$version-linux-x64.tgz/download -O $archivename

# extract archive to particular dir
tar -zxvf $archivename --directory $path
# move files on level higher
mv $path/*/* $path/

# setup link
ln -sf ~/.Apps/$name/$runfile ~/.local/bin/sweethome3d

# remove archive
rm $archivename

# download furniture
furniture_version=1.9.1
furniture_archive=furniture-$furniture_version.zip
furniture_path=~/Documents/$name/furniture-$furniture_version

# create path for furniture
mkdir -p $furniture_path

# download archive
wget http://sourceforge.net/projects/sweethome3d/files/SweetHome3D-models/3DModels-$furniture_version/3DModels-Contributions-$furniture_version.zip/download -O $furniture_archive

# unzop archive
unzip -o $furniture_archive -d $furniture_path

# removee archive
rm $furniture_archive