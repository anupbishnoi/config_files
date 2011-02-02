#!/bin/sh

cd ~

sudo chown -R $USER /usr/local
mkdir ~/local

sudo add-apt-repository ppa:passy/vim
sudo apt-get update

sudo apt-get -y install curl zsh vim ctags vim-doc vim-scripts vim-gnome flashplugin-nonfree build-essential rar unrar p7zip p7zip-full gstreamer0.10-pitfdll gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-ugly gstreamer0.10-plugins-ugly-multiverse vlc-nox libssl-dev chromium-browser ack-grep xchm

sudo apt-get upgrade

chsh -s /bin/zsh

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


