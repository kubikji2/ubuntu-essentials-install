#!/usr/bin/env bash

path="."

if [[ $# -eq 1 ]]
then
    path=$1
fi

cat $path"/vscode-extensions.conf" | xargs -L 1 code --install-extension