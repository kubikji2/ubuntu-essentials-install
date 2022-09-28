#!/usr/bin/env bash

# based on instructions:
# https://obsproject.com/download

# add obs official repository
sudo add-apt-repository ppa:obsproject/obs-studio -y

# install ffmped and obs-studio
sudo apt install ffmpeg obs-studio -y