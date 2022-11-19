#!/usr/bin/env bash

# based on this tutorial:
# https://www.jwillikers.com/automate-flatpak-updates-with-systemd

# somehow flatpak autoupdates should be enabled on Ubuntu 20.04 and later, but it is not in some instances

# copy service
sudo cp update-system-flatpaks.service /etc/systemd/system/
# copy timer
sudo cp update-system-flatpaks.timer /etc/systemd/system/
# setup system deamon 
sudo systemctl --system enable --now update-system-flatpaks.timer
