#!/bin/bash


repo_dir=$PWD/aur_repo_x86_64
if [ "$1" != "" ]; then
    echo "Using custom repo at $1 : remember to use absalute paths."
    repo_dir=$1
else
    echo "Using default directory at $repo_dir"
fi

#Set repo directory
base_dir=$PWD

#Configure Pacman
echo "Last line in pacman.conf set. Server = file://"$repo_dir""
cp ./pacman.conf.bak ./pacman.conf
echo "[custom]" >> ./pacman.conf
echo "SigLevel = Optional TrustAll" >> ./pacman.conf
echo "Server = file://"$repo_dir >> pacman.conf
