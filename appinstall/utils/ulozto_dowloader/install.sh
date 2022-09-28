#!/usr/bin/env bash

# installation based on the guidelines here:
# https://github.com/setnicka/ulozto-downloader

# make sure that pip3 is installed
sudo apt install python3-pip -y
# install upgraded numpy version system-vide
sudo pip3 install --upgrade numpy
# install tor-server
sudo apt install tor -y

# install ulozto-downloader system-wide
sudo pip3 install --upgrade ulozto-downloader[auto-captcha]
