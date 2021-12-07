#!/usr/bin/env bash

# heavily inspired by https://github.com/xpetresx/linux-setup/blob/master/user_dialog.sh

# path to current directory
_path=$(pwd)

# if additional argument provided, use it as path
if [ $# -eq 1 ];
then
    _path=$1
fi

# source config
source $_path/config

# create options for dialog cmd tool using template:
# <variable-name> `(if [ ${variable-name} -eq 1 ]; then echo "on"; else echo "off"; fi)`
# '-> get variable names first: remove everything after = and then remove INSTALL_ occurences
variable_names=$(sed 's/=.*//' $_path/config | sed 's/INSTALL_*//')
# '-> iterate through the variables and compile the options
options=""
for cur_variable in $variable_names;
do 
    # bash variable aggregation based on:
    # https://stackoverflow.com/questions/917260/can-var-parameter-expansion-expressions-be-nested-in-bash#:~:text=export%20TEMP%3D%24%7BHELLO%7DWORLD%0Aecho%20%24%7B!TEMP%7D
    export TEMP=INSTALL_${cur_variable}
    _cur_template="$cur_variable `(if [ ${!TEMP} -eq 1 ]; then echo "on"; else echo "off"; fi)`"
    # joining using: https://www.cyberciti.biz/faq/howto-linux-unix-bash-append-textto-variables/
    options="$options $_cur_template"
done

echo "$options"

# create dialog window
cmd=(dialog --stdout --no-items \
  --separate-output \
  --ok-label "Install" \
  --checklist "Choose configuration: hit space to mark option" 22 76 16)
choices=$("${cmd[@]}" ${options})
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
echo "$conf" > config
