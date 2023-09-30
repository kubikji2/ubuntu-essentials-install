#!/usr/bin/env bash

# get your ubuuntu version
# based on:
# https://stackoverflow.com/questions/12426659/how-to-extract-last-part-of-string-in-bash
# and
# https://stackoverflow.com/questions/4651437/how-do-i-set-a-variable-to-the-output-of-a-command-in-bash
ubuntu_release=`lsb_release -c`
ubuntu_release=`echo "$ubuntu_release" | awk '{print $NF}'`

# based on official tutorial
# https://wiki.winehq.org/Ubuntu
# enable 32 bit architecture
sudo dpkg --add-architecture i386

# add repository and the key
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

# automatically select appropriate version
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$ubuntu_release/winehq-$ubuntu_release.sources

# update
sudo apt update

# install stable branch
sudo apt install --install-recommends winehq-stable -y