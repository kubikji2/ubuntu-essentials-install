#!/usr/bin/env bash

# heavily inspired by https://github.com/xpetresx/linux-setup/blob/master/user_dialog.sh

# path to current directory
_path=$(pwd)
_label="Install"

# if path argument provided, use it as path
if [ $# -ge 1 ];
then
    _path=$1
fi

# if label argument provided, use it as lebel in dialog
if [ $# -ge 2 ];
then
    _label=$2
fi

# TODO: improve testing in case of existing, but outdated conf file
if test -f "$_path/config"; then
    :
else
    echo "[ERROR] file $_path/config does not exist. fixing"
    _dirs=$(ls $_path/*/ -d)
    echo "$_dirs"
    for dir in $_dirs;
    do
        # cutting off the slashes based on:
        # https://stackoverflow.com/questions/4168371/how-can-i-remove-all-text-after-a-character-in-bash
        _name=${dir%*/}
        _name=${_name##*/}
        echo "INSTALL_$_name=1" >> "$_path/config"
    done
fi

# source config
source $_path/config
echo -e "[INFO-dialog] path is $_path"

# create options for dialog cmd tool using template:
# <variable-name> `(if [ ${variable-name} -eq 1 ]; then echo "on"; else echo "off"; fi)`
# '-> get variable names first: remove everything after = and then remove INSTALL_ occurences
variable_names=$(sed 's/=.*//' $_path/config | sed 's/INSTALL_*//')

# '-> iterate through the variables and compile the options
for cur_variable in $variable_names;
do 
    # bash variable aggregation based on:
    # https://stackoverflow.com/questions/917260/can-var-parameter-expansion-expressions-be-nested-in-bash#:~:text=export%20TEMP%3D%24%7BHELLO%7DWORLD%0Aecho%20%24%7B!TEMP%7D
    export TEMP=INSTALL_${cur_variable}
    source $_path/$cur_variable/description
    #echo -e "[INFO-dialog] path $_path/$cur_variable/description"
    # replacing spaces in description by underscrolls is based on:
    # https://stackoverflow.com/questions/19661267/replace-spaces-with-underscores-via-bash/19661428
    #_cur_template=("$n" "${cur_variable} ${description// /_}" "`(if [ ${!TEMP} -eq 1 ]; then echo "on"; else echo "off"; fi)`")
    
    # based on: https://stackoverflow.com/questions/16986766/spaces-in-bash-dialog
    # joined using arrays probably, do not know, do not care
    options+=( "${cur_variable}: ${description}" "`(if [ ${!TEMP} -eq 1 ]; then echo "on"; else echo "off"; fi)`" )
    #echo "${options[@]}"
done

echo "[INFO-dialog] dialog options: ${options[@]}"

# create dialog window
cmd=(dialog --stdout --no-items \
  --separate-output \
  --ok-label "${_label}" \
  --checklist "Choose configuration: hit space to mark option" 22 76 16)
choices=$("${cmd[@]}" "${options[@]}")
echo "${choices}"

# create new config file
conf=""
for cur_variable in $variable_names;
do
    export TEMP=INSTALL_${cur_variable}
    conf_line=""
    # if cur_variable is somewhere in choices set variable to 1
    if [[ $choices == *$cur_variable* ]]; then
        conf_line="INSTALL_$cur_variable=1"
    else
        conf_line="INSTALL_$cur_variable=0"
    fi
    # join conf using newline character
    # based on: https://stackoverflow.com/questions/18535902/concatenating-two-string-variables-in-bash-appending-newline
    conf="$conf"$'\n'"$conf_line"
done

# '-> save new configuration
#     '-> use citation marks to ensure newline characters as mentioned here: https://stackoverflow.com/questions/18535902/concatenating-two-string-variables-in-bash-appending-newline
echo "$conf" > $_path/config
