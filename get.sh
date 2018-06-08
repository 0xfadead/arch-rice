#!/bin/bash -eu
TARGET=https://github.com/kkuehler/dotfiles.git
DEST=~/dotfiles
git clone "$TARGET" "$DEST"
cd "$DEST"
./install
source ~/.bashrc
read -rp "Are you at the OCF? [y/N] " ocf
ocf=${ocf,,}
if [[ "$ocf" =~ ^(yes|y) ]]; then
    mv ~/.bashrc ~/.bashrc.local
fi
cd ..
