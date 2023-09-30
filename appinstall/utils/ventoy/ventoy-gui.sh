#!/bin/bash 

# getting script absolute dir path
# loosely based on: https://linuxhint.com/absolute-path-script-bash/
script_path=$(realpath "${BASH_SOURCE:-$0}")
script_dir=$(dirname $script_path)

sudo $script_dir/VentoyGUI.x86_64
