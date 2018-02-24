#!/bin/bash
# FILE: yes_build_aur.sh
# DESC: Download aur packages from file, build packages, enable in pacman.conf
#Set repo directory
repo_dir=aur_repo_x86_64
base_dir=$PWD

#Fetch AUR builder
git clone https://github.com/Dogcatfee/AUR_BUILDER
cat ./aur_git.links | grep -v '^#' | grep h > ./AUR_BUILDER/git.links

cd ./AUR_BUILDER
./git_build_packages.sh ./$repo_dir
./init_custom_repo.sh ./$repo_dir
cd $base_dir
cp -r ./AUR_BUILDER/$repo_dir ./
cd ./AUR_BUILDER && ./clean.sh

# Add packages and pacman.conf
cd $base_dir
./yes_aur.sh
