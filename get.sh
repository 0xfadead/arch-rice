#!/bin/bash -eux
git clone https://github.com/kkuehler/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
read -rp "Are you at the OCF? [y/N] " ocf
ocf=${ocf,,}
if [[ "$ocf" =~ ^(yes|y) ]]; then
    ./install install.ocf.conf.yaml
    exit
fi
./install
