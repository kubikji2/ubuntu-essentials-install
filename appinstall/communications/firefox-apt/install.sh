#!/usr/bin/env bash

# DOES NOT WORK

exit

# based on:
# - https://askubuntu.com/questions/1399383/how-to-install-firefox-as-a-traditional-deb-package-without-snap-in-ubuntu-22
# Gemini 3.0 used to automate snap removal

# adding repository
sudo add-apt-repository ppa:mozillateam/ppa

# set apti priority over snap
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001

Package: firefox
Pin: version 1:1snap*
Pin-Priority: -1
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

# Attempt to remove the firefox snap
sudo snap remove firefox

if [ $? -ne 0 ]; then
    echo "Warning: Snap removal failed or encountered issues. Applying AppArmor workaround..."

    # Remove the specific AppArmor profiles that block the APT version and cause removal errors
    # -f ensures the command doesn't fail if the files are already gone
    sudo rm -f /etc/apparmor.d/usr.bin.firefox
    sudo rm -f /etc/apparmor.d/local/usr.bin.firefox
    
    # Reload AppArmor to apply changes. This ensures the kernel drops the old profiles immediately so the new APT-installed Firefox can claim those paths without conflict.
    sudo systemctl reload apparmor.service 2>/dev/null || true

    sudo systemctl stop var-snap-firefox-common-host\\x2dhunspell.mount
    sudo systemctl disable var-snap-firefox-common-host\\x2dhunspell.mount
    
    sudo snap remove firefox
fi


sudo apt install firefox -y

# make double sure that uninstall firefow updates do not install snap version
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox