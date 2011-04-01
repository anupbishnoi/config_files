#!/bin/sh

cd ~/config_files
echo "pulling changes for config_files"
git pull

cd ~/code/informationgraph
echo "pulling changes for informationgraph"
git pull

coffee --watch --compile ~/code/informationgraph/home/_attachments/scripts/*.coffee &
coffee --watch --compile ~/code/informationgraph/home/vendor/ig/_attachments/*.coffee &
echo "listening to coffeescript changes for ig and igapp"

cd ~
