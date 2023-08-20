#!/usr/bin/env bash

# how is it called in the terminal
name="photon-workshop"
# how executible is called
file="AnycubicPhotonWorkshop_V3.1.4.exe"
# where executible is placed
target=$HOME/.Apps/anycubic-photon-workshop

# create directory to store executible
mkdir -p $target
# copy file to the storing dir
cp $HOME/Downloads/$file $target

# creating install script
touch $target/install.sh
# making it runable
chmod +x $target/install.sh
# placing shebang to the install script
echo -e "#!/usr/bin/env bash" > $target/install.sh
# placing execution command
echo -e "wine $target/$file" >> $target/install.sh

# creating symlink to the local bin
ln -sf $target/install.sh "$HOME/.local/bin/"install-$name

# creating run script
touch $target/run.sh
# make it runable
chmod +x $target/run.sh
# adding shebang to the run script
echo -e "#!/usr/bin/env bash" > $target/run.sh
# plcing execution command
echo -e "wine .wine/drive_c/Program\ Files/AnycubicPhotonWorkshop/AnycubicPhotonWorkshop.exe" >> $target/run.sh

# creating symlink to the local bin
ln -sf $target/run.sh "$HOME/.local/bin/"$name

# printing
echo "Integration done!"
echo "to install program to wine run:"
echo "install-$name"
echo "Note: do nt change the path pls."
echo "Then to run the photon shop run:"
echo "$name"
echo "enjoy!"


