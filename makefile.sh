#!/bin/bash


if [ ! -d "./aur_repo_x86_64" ]; then
  ./yes_build_aur.sh
fi


sudo ./build.sh -v
