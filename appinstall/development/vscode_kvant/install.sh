#!/usr/bin/env bash

cat vscode-extensions.conf | xargs -L 1 code --install-extension