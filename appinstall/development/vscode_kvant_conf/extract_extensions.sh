#!/usr/bin/env bash

# This script extracts currently used extentions and save them into `tmp-extention.conf`

# extract extentions and save them to the tmp_extentions.conf file
# NOTE: based on https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list
code --list-extensions >> tmp-extensions.conf