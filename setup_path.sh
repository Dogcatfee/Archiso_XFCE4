#!/bin/bash

echo "Last line in pacman.conf set. Server = file://"$PWD/aur_repo_x86_64""
cp ./pacman.conf.bak ./pacman.conf
echo "Server = file://"$PWD/aur_repo_x86_64 >> pacman.conf
