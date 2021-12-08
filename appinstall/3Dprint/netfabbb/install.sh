
# hidden directory where the netfabb is installed
netfabb_dir=".netfabb"
# download Miro's archive
wget "https://github.com/3DprintFIT/netfabb-basic-download/releases/download/v7.4.0/netfabb-free_7.4.0_linux64.tar.gz" -P ~/Downloads/
# change directoru to home
cd ~
# make directory
mkdir ${netfabb_dir}
# extract downloaded file to netfabb directory
tar -zxvf ~/Downloads/netfabb-free_7.4.0_linux64.tar.gz --directory $netfabb_dir
# move files on level higher
mv $netfabb_dir/*/* $netfabb_dir/
# make netfabb runable
chmod +x $netfabb_dir/netfabb_free
# create alias in bashrc
echo -e "alias netfabb='~/${netfabb_dir}/netfabb_free'" >> ~/.bashrc
# source bash rc
source ~/.bashrc
# come back
cd -