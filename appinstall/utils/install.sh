#!/usr/bin/env bash

# path to current directory
_path=$(pwd)

# if additional argument provided, use it as path
if [ $# -eq 1 ];
then
    _path=$1
fi

# source config
source $_path/config

# get all variable in config
variables=$(sed 's/=.*//' $_path/config)

#echo $variables

for cur_variable in $variables;
do
    # hack found at:
    # https://stackoverflow.com/questions/917260/can-var-parameter-expansion-expressions-be-nested-in-bash#:~:text=export%20TEMP%3D%24%7BHELLO%7DWORLD%0Aecho%20%24%7B!TEMP%7D
    export TEMP=$cur_variable
    if [ ${!TEMP} -eq 1 ];
    then
        # removing INSTALL using:
        # https://stackoverflow.com/questions/4168371/how-can-i-remove-all-text-after-a-character-in-bash
        dir_name=$(echo "${cur_variable#*_}")
        toilet "Installing $dir_name"
        #bash $_path/$dir_name/install.sh
    fi
done

