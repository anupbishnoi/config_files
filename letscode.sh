#!/bin/sh

cd ~/config_files
echo "pulling changes for config_files"
git commit -a
git pull

cd ~/code/informationgraph
echo "pulling changes for informationgraph"
git commit -a
git pull

cd ~
