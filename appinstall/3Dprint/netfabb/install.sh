
# variable defining the location for the AppImage
target="$HOME/.Apps"
path=$target"/netfabb"
fn="netfabb-free_7.4.0_linux64.tar.gz"

# make Apps directory
mkdir -p $target
mkdir -p $path

# get the AppImage
wget "https://github.com/3DprintFIT/netfabb-basic-download/releases/download/v7.4.0/netfabb-free_7.4.0_linux64.tar.gz"
# extract downloaded file to netfabb directory
tar -zxvf $fn --directory $path
# move files on level higher
mv $path/*/* $path/
# make netfabb runable
chmod +x $path"/netfabb_free"
# create a link to ~/.local/bin 
ln -s $path"/netfabb_free" $HOME"/.local/bin/netfabb"
# clean up
rm $fn
