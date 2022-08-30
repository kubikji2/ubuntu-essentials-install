#!/usr/bin/env bash

# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/kvant/.local/share/flatpak/exports/share"

# install from flatpak
flatpak install flathub com.slack.Slack -y
# this fucking thing wasn't fixed since May 17 2022 FFS
# see: https://github.com/flathub/com.slack.Slack/issues/168
flatpak update --commit='e42dd12ad288509cb4c7f94c7a370f9c72f7ddf03b202fbe3c2a7c9f6979b249' com.slack.Slack

# add entry to ~/.local/bin
echo "flatpak run com.slack.Slack" >> $HOME"/.local/bin/slack"
chmod +x $HOME"/.local/bin/slack"