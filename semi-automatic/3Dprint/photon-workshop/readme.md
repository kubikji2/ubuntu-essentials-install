# Anycubic Photon Workshop

A way how to install and run Anycubic Photon Workshop on Linux.

## Installation instruction

1. Install `wine` either by automated scripts in `appinstall/utils/wine` or from the instructions [here](https://wiki.winehq.org/Ubuntu)
2. Download `exe` file from [here](https://www.anycubic.com/pages/firmware-software)
3. Check the filename in the `~/Downloads/` and in the `integrate.sh` script in this dir, modify if needed
4. Run `integrate.sh` script, no sudo needed
5. Install photon workshop to the wine using: `install-photon-workshop`
   - Note: do not change the path
6. Run photon workshop anytime anywhere via: `photon-wokshop`
