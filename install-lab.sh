#!/bin/bash
name="Jiri Kvant Kubik"
email="jiri.kub@gmail.com"
sudo apt update
sudo apt upgrade
# Install essential utils
sudo apt install -Y tmux vim git net-tools gtkterm htop ncdu tree zip tar okular owncloud-client
# Setting up tmux conf based on currently deployed setup in COMROB lab
cat tmux.conf >> ~/.tmux.conf
# Install drawing and writing utils
sudo apt install -Y inkscape gimp libreoffice
# Install media related stuf
sudo apt install -Y vlc easytag
# Install chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install google-chrome-stable
# Install comrob related repositories
mkdir comrob
cd comrob/
#TODO make following as function/separate script
## clone robot deployment system
git clone https://gitlab.fel.cvut.cz/bayerja1/robot_deployment_systems.git
cd robot_deployment_system/
git config user.email $email
git config user.name $name
cd ..

## clone walking robot production
git clone https://gitlab.fel.cvut.cz/bayerja1/walking_robots_production.git
cd walking_robots_prodution/
git config user.email $email
git config user.name $name
cd ..

## clone darpa detection gui
git clone https://gitlab.fel.cvut.cz/kubikji2/darpa-detection-gui
cd darpa-detection-gui/
git config user.email $email
git config user.name $name
cd ..

# installing ROS and stuff related to the robot deployment
cd robot_deployment_systems/install_scripts/
./1_create_default_workspace.sh
./2_install_default_comrob_driver.sh
./3_install_sensor_drivers.sh
./4_install_rds_autonomy.sh
./5_install_stdr.sh
