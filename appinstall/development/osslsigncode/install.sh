#!/usr/bin/env bash

target="$HOME/.Apps"
name="osslsigncode"
path=$target"/"$name
# MODIFY THIS UPON NEW RELEASE
version="2.9"
githubname="$version.tar.gz"
versionname="osslsigncode-$version"

this_dir=$(pwd)

# make Apps directory
mkdir -p $target
# erease possible previous installations
rm -rf $path
mkdir -p $path
# download the tar.gz
wget https://github.com/mtrojnar/osslsigncode/archive/refs/tags/$githubname
# extract downloaded file to target directory
tar -zxvf $githubname --directory $path

# install prerequisities
#sudo apt update && sudo apt install cmake libssl-dev libcurl4-openssl-dev zlib1g-dev python3 -y

# change dir
cd $path/$versionname

mkdir build && cd build && cmake -S ..

# come back
cd $this_dir
# remove tar.gz
rm $githubname