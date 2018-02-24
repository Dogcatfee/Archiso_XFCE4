#!/bin/bash
# FILE: no_aur.sh
# DESC: Remove AUR packages from packagelist, reset pacman.conf
cp ./pacman.conf.bak ./pacman.conf
# Cut https://aur.archlinux.org/ and *.git to get package name
for var in $(grep -v '^#' ./aur_git.links |  grep -Po '.*(?=\.)' | cut -c 27-100)
do
  echo $var
  # Find package name in package list, remove package from list
  sed --in-place '/'$var'/d' ./packages.x86_64
done
printf "\nAUR packages disabled in pacman.conf\n"
printf "Removed from packagelist\n-------------------------\n"
