#!/bin/bash -eu
CWD="$HOME/dotfiles/scripts"
OCF_SUBNET_V4='169.229.226.0/24'

# check if dig is installed
which dig &>/dev/null

if [[ $? == 1 ]]; then
    return 0
fi

# get our public ip from OpenDNS
IP=$(dig -4 +short myip.opendns.com @resolver1.opendns.com)

# now check if it's in the ocf subnet
IN_SUBNET=$("$CWD"/in_subnet.pl "$IP" "$OCF_SUBNET_V4")
IN_SUBNET=${IN_SUBNET,,}

if [[ "$IN_SUBNET" =~ (yes|y) ]]; then
    echo "It seems you're at the OCF..."
    echo "Moving ~/.bashrc to ~/.bashrc.local"
    mv -f "$HOME/.bashrc" "$HOME/.bashrc.local"
fi
