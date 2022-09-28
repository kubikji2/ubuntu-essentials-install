#!/usr/bin/env bash

# adding user to the group
# based on:
# https://www.howtogeek.com/50787/add-a-user-to-a-group-or-second-group-on-linux/
sudo usermod -a -G docker $USER
# updating group without reboot
# see: https://serverfault.com/questions/74934/refresh-supplementary-group-memberships-without-logging-in-again
sudo gpasswd -a $USER docker

