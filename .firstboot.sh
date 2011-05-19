#!/bin/sh

git config --global branch.autosetupmerge always
git config --global push.default tracking

cd ~
rmdir Public/ Pictures/ Videos/ Documents/ Music/ Templates/
sudo chown -R $USER /usr/local
mkdir ~/local

sudo add-apt-repository ppa:passy/vim
sudo add-apt-repository ppa:couchapp/couchapp
sudo add-apt-repository ppa:mozillateam/firefox-stable
sudo add-apt-repository ppa:jerome-etienne/neoip
sudo apt-get update

sudo apt-get -y install curl zsh vim ctags vim-doc vim-scripts vim-gnome flashplugin-nonfree build-essential rar unrar p7zip p7zip-full gstreamer0.10-pitfdll gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-bad-multiverse gstreamer0.10-plugins-ugly gstreamer0.10-plugins-ugly-multiverse vlc-nox libssl-dev chromium-browser ack-grep xchm bum rcconf rake ruby1.8-dev rubygems1.8 libopenssl-ruby lynx-cur irssi rlwrap python-setuptools python-software-properties

sudo gem install localtunnel
easy_install Pygments

sudo apt-get upgrade

mkdir src
cd src
git clone git://github.com/ry/node.git
cd node
./configure --prefix=~/local
make install 
make doc
cd ..

git clone git://github.com/isaacs/npm.git
cd npm
make install
cd ..

git clone --recursive git://github.com/nvie/gitflow.git
cd gitflow
sudo make install

cd ~

npm install connect express jade step less supervisor mingy optimist npmdep http-console less coffee-script docco coffeeapp

sudo apt-get install couchdb couchapp

mkdir code
cd code
git clone git@github.com:anupbishnoi/informationgraph.git
cd informationgraph
git config --add remote.origin.push 'refs/heads/*:refs/heads/*'
git config --add remote.origin.push 'refs/tags/*:refs/tags/*'
git checkout -t origin/develop

cd ..
git clone git@github.com:anupbishnoi/coffeeapp.git
cd coffeeapp
npm link
git remote add upstream git://github.com/andrzejsliwa/coffeeapp.git
git config --add remote.origin.push 'refs/heads/*:refs/heads/*'
git config --add remote.origin.push 'refs/tags/*:refs/tags/*'
git checkout -t origin/develop

cd ~

mv .bashrc .bashrc.orig.bk

