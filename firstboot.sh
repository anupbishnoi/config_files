#!/bin/sh

cd ~

sudo chown -R $USER /usr/local
mkdir ~/local
echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc

git config --global user.name "Anup Bishnoi"
git config --global user.email pixelsallover@gmail.com
cd config_files
git remote add github git@github.com:anupbishnoi/config_files.git
git commit -am "committing from fresh ubuntu install"
git push github master
cd ~

sudo apt-get upgrade
sudo apt-get update
sudo apt-get -y install vim adobe-flashplugin build-essential rar unrar p7zip p7zip-full gstreamer0.10-pitfdll gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-ugly gstreamer0.10-plugins-ugly-multiverse vlc-nox libssl-dev chromium-browser ack-grep

git clone git://github.com/ry/node.git
cd node
./configure --prefix=~/local
make install 
make doc
cd ..

git clone git://github.com/isaacs/npm.git
cd npm
make install

cat >>~/.npmrc <<NPMRC
root = ~/.node_libraries
binroot = ~/bin
manroot = ~/share/man
NPMRC


