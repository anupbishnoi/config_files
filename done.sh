#!/bin/sh

cd ~/code/coffeeapp
git commit -a
echo "pushing changes to coffeeapp"
git push

cd ~/config_files
git commit -a
echo "pushing changes to config_files"
git push

cd ~/code/informationgraph
git commit -a
echo "pushing changes to informationgraph"
git push

cd ~
