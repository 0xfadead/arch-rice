#!/bin/bash

shopt -s nocasematch
AUR=$HOME/builds # your aur build path 

echo ":: Upgrading AUR Packages..."

for DIR in $AUR/*; do
    cd $DIR
    gitret=$(git pull)
    if [ $? -eq 1 ]; then
        echo " Could not git pull $DIR"
        continue
    elif [[ "$gitret" == *"up-to-date"* ]]; then
        echo " Nothing to update for $DIR"
        continue
    fi
    echo " Upgrading $DIR..."
    makepkg -si
    cd ..
done
