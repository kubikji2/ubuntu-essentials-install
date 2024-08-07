#!/usr/bin/env bash

user_dialog="./appinstall/utils/user_dialog.sh"
install_script="./appinstall/utils/install.sh"

# first update system...
sudo apt update
sudo apt upgrade -y

# ... and install dialog toilet and flatpack
sudo apt install dialog toilet flatpak -y
# add flathub repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# add flatpak to environment variables
XDG_DATA_DIRS+=":/var/lib/flatpak/exports/share:/home/kvant/.local/share/flatpak/exports/share"

# create directory for the AppImages, repositories etc
mkdir -p $HOME"/.Apps"
# creating ~/.local
mkdir -p $HOME"/.local"
# creating ~/.local/bin
mkdir -p $HOME"/.local/bin"

# make sure that ~/.local/bin is added to the PATH in the .profile
grep $HOME/.profile -Pzoe 'if \[ -d \"\$HOME/.local/bin\" \] ; then*\n[ ]*PATH=\"\$HOME/\.local/bin\:\$PATH\"[ ]*\nfi' >> /dev/null
# if there is no such entry, just add it to the .profile
if [ $? -ne 0 ] ; then
    echo -e "if [ -d \"\$HOME/.local/bin\" ] ; then \n    PATH=\"\$HOME/.local/bin:\$PATH\" \nfi" >> $HOME/.profile
fi

# first run dialog for categories
$user_dialog $(pwd)/appinstall "SET"
clear

# load save config
source ./appinstall/config

# get all directories in appintstall
directories=$(ls -d appinstall/*/)

#echo "[INFO] all dirs: $directories"

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
        #echo -e "[INFO] running user dialog for: $_name/"
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
rm -f ~/.tmux.conf
ln -s $APP_PATH/conf/tmux.conf ~/.tmux.conf

# enable colors in terminal by uncommenting the particular line in bashrc
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc

# enable 256 colors for tmux
# NOPE: this enforce autorun for tmux
# echo '[ $TERM != "screen" ] && TERM=xterm-256color && exec tmux' >> ~/.bashrc

# source .bashrc 
source ~/.bashrc

