# Ubuntu Essentials Install

Install scripts for essential programs on Ubuntu.

## Programs to add and stuff to fix

- [ ] Foxit reader
  - Abandodned, not easy way how to script this one out
- [ ] Master pdf
  - direct download link here: https://code-industry.net/public/master-pdf-editor-5.8.70-qt5.x86_64.deb
- [x] pdftk
- [x] youtube-dl from apt
- [x] [FlameShot](https://github.com/flameshot-org/flameshot) screenshots on steriods.
- [x] ulozto downloader
- [x] UnityHub
- [x] Blender
- [x] add user to the docker group without need to logout (very optional)
- [ ] install timeshift for system snapshots: `sudo apt install timeshift`
- [ ] fstl - lightway stl preview - using apt install
- [ ] Fussion360

## Roadmap

- [x] Remove snap completely
- [X] Add directory `.Apps` (or so) to store *AppImages*, link installed apps to `~/.local/bin`
  - [X] Add execution rights `chmod a+x exampleName.AppImage`
  - [x] Add AppImages to the desktop using [[this]](https://codebysamgan.com/how-to-add-appimage-application-to-menu-in-ubuntu-linux)
- [x] Remove snap from PyCharm
  - replaced by jetbrains toolbox
- [x] the spaces in install-scripts fixed 
- [ ] Add a tutorial on how to install
  - [ ] Explicitly state that during Ubuntu installation, your computer should always be connected through the ethernet to the internet and always install proprietary drivers.
- [ ] Add a tutorial how to add packages

### Additional features ideas

- ~~Add flatpack alternatives to allow a user to select between apt and flatpack [[link]](https://docs.flatpak.org/en/latest/using-flatpak.html)~~
  - Rejected since most of the software is flatpack-only for the most recent releases
