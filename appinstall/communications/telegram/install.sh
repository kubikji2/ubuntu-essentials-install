#!/usr/bin/env bash

# set 
flatpak install flathub org.telegram.desktop -y

# setup alias
echo "alias telegram='flatpak run org.telegram.desktop'" >> $HOME/.bashrc