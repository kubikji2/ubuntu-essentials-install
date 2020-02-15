#!/bin/bash
sudo apt update
sudo apt upgrade
# Install essential utils
sudo apt install -Y tmux vim git net-tools gtkterm htop ncdu tree zip tar okular owncloud-client
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
git clone https://gitlab.fel.cvut.cz/bayerja1/robot_deployment_systems.git
git clone https://gitlab.fel.cvut.cz/bayerja1/walking_robots_production.git
t clone https://gitlab.fel.cvut.cz/kubikji2/darpa-detection-gui
# installing ROS and stuff related to the robot deployment
cd robot_deployment_systems/install_scripts/
./1_create_default_workspace.sh
./2_install_default_comrob_driver.sh
./3_install_sensor_drivers.sh
./4_install_rds_autonomy.sh
./5_install_stdr.sh
