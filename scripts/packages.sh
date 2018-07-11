#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    exec sudo bash -c "$0 $DIST"
fi

case "$1" in
    arch)
        pacman -Syyu
        pacman -S --noconfirm vim git tmux htop curl wget ctags \
            python-pip htop rsync zip unzip pv traceroute \
            bind-tools nmap pwgen
        ;;
    fedora)
        dnf update
        dnf install -y vim git tmux htop curl wget ctags python-pip \
            python3 python3-pip rsync zip unzip pv traceroute \
            bind-utils nmap pwgen
        ;;
    debian|ubuntu)
        apt update
        apt install -y vim git tmux htop curl wget ctags python-pip \
            python3 python3-pip rsync zip unzip pv traceroute \
            dnsutils nmap pwgen
        ;;
esac
