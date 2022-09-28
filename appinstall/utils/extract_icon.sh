#!/usr/bin/env bash

# this script takes a path to the AppImage to extract and extract icon if present, the clean up the extracted mess

# if path argument provided, use it as path
if [ $# -ne 1 ];
then
    echo "[ERROR]: Single argument specifying path to the AppImage to extract is required!"
    exit 1
fi

# extract an AppImage
$1 --appimage-extract

# copy all pngs (including the icon hopefully)
cp $(pwd)/"squashfs-root/"*".png" $(pwd)

# cleanup - removing extracted archive
rm -rf $(pwd)/"squashfs-root/"
