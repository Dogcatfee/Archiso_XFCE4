#!/bin/bash
# FILE: makefile.sh
# DESC: To get more lines 'in' Makefile
if [ ! -d "./aur_repo_x86_64" ]; then
  ./yes_build_aur.sh
fi
sudo ./build.sh -v
