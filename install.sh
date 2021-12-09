#!/usr/bin/env bash

user_dialog="./appinstall/utils/user_dialog.sh"
install_script="./appinstall/utils/install.sh"

# first update system...
sudo apt update
sudo apt upgrade -y

# ... and install dialog
sudo apt install dialog toilet -y

# first run dialog for categories
$user_dialog $(pwd)/appinstall "SET"
clear

# load save config
source ./appinstall/config

# get all directories in appintstall
directories=$(ls -d appinstall/*/)

echo "dirs: $directories"

# run dialogs for particular sections
for directory in $directories;
do
    # check if category is set
    # '-> get variable name based on the directory
    
    # cutting off the slashes based on:
    # https://stackoverflow.com/questions/4168371/how-can-i-remove-all-text-after-a-character-in-bash
    _name=${directory#*/}
    _name=${_name%*/}
    
    # creating tmp variable based on:
    # https://stackoverflow.com/questions/917260/can-var-parameter-expansion-expressions-be-nested-in-bash#:~:text=export%20TEMP%3D%24%7BHELLO%7DWORLD%0Aecho%20%24%7B!TEMP%7D
    export TEMP=INSTALL_${_name}

    # if category is considered, run dialog
    if [ ${!TEMP} -eq 1 ];
    then
        #echo -e "$_name/"
        #echo -e "$directories"
        #[ "$_name" == "utils" ];
        #echo $?
        # TODO replace this with dialog install: yes no
        label=$([ "$_name" == "utils" ] && echo "INSTALL" || echo "SET")
        #echo -e $label
        $user_dialog $(pwd)/appinstall/$_name $label
    fi
done

# clear mess
clear

# run installation scripts
for directory in $directories;
do
    # check if category is set
    # '-> get variable name based on the directory
    
    # cutting off the slashes based on:
    # https://stackoverflow.com/questions/4168371/how-can-i-remove-all-text-after-a-character-in-bash
    _name=${directory#*/}
    _name=${_name%*/}
    
    # creating tmp variable based on:
    # https://stackoverflow.com/questions/917260/can-var-parameter-expansion-expressions-be-nested-in-bash#:~:text=export%20TEMP%3D%24%7BHELLO%7DWORLD%0Aecho%20%24%7B!TEMP%7D
    export TEMP=INSTALL_${_name}

    # if category is considered, run dialog
    if [ ${!TEMP} -eq 1 ];
    then
        #echo -e "$_name/"
        #echo -e "$directories"
        #[ "$_name" == "utils" ];
        #echo $?
        # TODO replace this with dialog install: yes no
        label=$([ "$_name" == "utils" ] && echo "INSTALL" || echo "SET")
        #echo -e $label
        #$user_dialog $(pwd)/appinstall/$_name $label
        #echo "I would run install for $TEMP and folder $_name"
        $install_script $(pwd)/appinstall/$_name
        
    fi
done


# add symlink to the tmux config
# '-> based on: https://github.com/xpetresx/linux-setup
APP_PATH=$(pwd)
# symlink tmux settings
rm ~/.tmux.conf
ln -s $APP_PATH/conf/tmux.conf ~/.tmux.conf

source ~/.bashrc

# enable colors in terminal
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc

