#!/bin/bash

#Set repo directory
repo_dir=aur_repo_x86_64
base_dir=$PWD

#Configure Pacman
echo "Last line in pacman.conf set. Server = file://"$PWD/$repo_dir""
cp ./pacman.conf.bak ./pacman.conf
echo "[custom]" >> ./pacman.conf
echo "SigLevel = Optional TrustAll" >> ./pacman.conf
echo "Server = file://"$PWD/aur_repo_x86_64 >> pacman.conf

#Fetch AUR builder
git clone https://github.com/Dogcatfee/AUR_BUILDER
cat ./aur_git.links | grep -v '^#' | grep h > ./AUR_BUILDER/git.links


cd ./AUR_BUILDER
./git_build_packages.sh ./$repo_dir
./init_custom_repo.sh ./$repo_dir
cd $base_dir
cp -r ./AUR_BUILDER/$repo_dir ./
cd ./AUR_BUILDER && ./clean.sh
