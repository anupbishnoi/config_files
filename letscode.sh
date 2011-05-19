#!/bin/sh

cd ~/code/coffeeapp
echo "Committing coffeeapp"
git commit -a
echo "Pulling changes for coffeeapp"
git pull

cd ~/config_files
echo "Committing config_files"
git commit -a
echo "Pulling changes for config_files"
git pull

cd ~/code/informationgraph
echo "Committing informationgraph"
git commit -a
echo "pulling changes for informationgraph"
git pull

cd ~
