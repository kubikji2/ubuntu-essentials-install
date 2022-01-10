# Notes regarding VSCode extensions

Based on this [StarOverflow answer](https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list) to export currently installed VScode extensions, one must firstly update VScode on the origin machine (done auto-magically, when installed through `snap` as done in this git install scripts).

Secondly, the install extentions are exported into file `vscode-extensions.conf` using:

``code --list-extensions | xargs -L 1 echo code --install-extension >> vscode-extensions.conf``

Then the same file (somehow) transported to the host machine:

``cat vscode-extensions.conf | xargs -L 1 code --install-extension``

Note that [StarOverflow answer](https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list) also mentions ways how to export and import settings on Windows.
