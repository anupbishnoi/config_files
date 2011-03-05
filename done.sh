#!/bin/sh

cd ~/config_files
git commit -a
git push
cd ~/code/informationgraph
git commit -a
git push
cd ~
