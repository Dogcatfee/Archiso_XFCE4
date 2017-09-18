#!/bin/bash

echo "AUR packages disabled in pacman.conf"
cp ./pacman.conf.bak ./pacman.conf
#yes | rm -r aur_repo_x86_64
