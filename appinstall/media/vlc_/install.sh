#!/usr/bin/env bash

# made by combining:
# https://linuxhint.com/replace_string_in_file_bash/
# and
# https://superuser.com/questions/187440/set-default-ubuntu-video-player-as-vlc

sed -i 's/org.gnome.Totem/vlc/g' /usr/share/applications/defaults.list

sed -i 's/org.gnome.Totem/vlc/g' /usr/share/applications/mimeinfo.cache