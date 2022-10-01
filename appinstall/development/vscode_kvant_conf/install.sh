#!/usr/bin/env bash

path="."

if [[ $# -eq 1 ]]
then
    path=$1
fi

# based on:
# https://stackoverflow.com/questions/58513266/how-to-install-multiple-extensions-in-vscode-using-command-line
cat $path"/tmp-extensions.conf" | while read extension || [[ -n $extension ]];
do
  code --install-extension $extension --force
done
