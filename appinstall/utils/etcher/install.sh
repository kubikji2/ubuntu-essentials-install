#!/usr/bin/env bash

# based on:
# https://raspberrytips.com/install-balena-etcher-ubuntu/

curl -1sLf 'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' | sudo -E bash

sudo apt update

sudo apt install balena-etcher-electron -y
