#!/bin/bash

printf "\nAUR packages disabled in pacman.conf\n"
printf "Removed from packagelist\n-------------------------\n"
cp ./pacman.conf.bak ./pacman.conf
#yes | rm -r aur_repo_x86_64

# Cut https://aur.archlinux.org/ and *.git to get package name
for var in $(grep -v '^#' ./aur_git.links |  grep -Po '.*(?=\.)' | cut -c 27-100)
do
  echo $var
  # Find package name in package list, remove package from list
  sed --in-place '/'$var'/d' ./packages.x86_64
done
