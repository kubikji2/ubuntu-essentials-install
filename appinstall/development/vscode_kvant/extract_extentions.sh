#!/usr/bin/env bash

# extract extentions and save them to the tmp_extentions.conf file
# NOTE: based on https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list
code --list-extensions | xargs -L 1 echo code --install-extension >> tmp-extention.conf