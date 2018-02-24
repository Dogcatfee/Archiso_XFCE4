#!/bin/bash
# FILE: clean_aur.sh
# DESC: Remove AUR related folders

yes | rm -r ./AUR_BUILDER
yes | rm -r ./aur_repo_x86_64
./no_aur.sh
