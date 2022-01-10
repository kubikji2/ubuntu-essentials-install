#!/usr/bin/env bash

# based on:
# https://linuxize.com/post/how-to-install-zoom-on-ubuntu-20-04/

wget https://zoom.us/client/latest/zoom_amd64.deb -P ~/Downloads/

sudo apt install ~/Downloads/zoom_amd64.deb -y

