#!/bin/bash -eu
TARGET=https://github.com/kkuehler/dotfiles.git
DEST="$HOME/dotfiles"
git clone "$TARGET" "$DEST"
cd "$DEST"
./install
source "$HOME/.bashrc"
read -rp "Are you at the OCF? [y/N] " ocf
ocf=${ocf,,}
if [[ "$ocf" =~ ^(yes|y) ]]; then
    echo "Moving ~/.bashrc to ~/.bashrc.local"
    mv "$HOME/.bashrc" "$HOME/.bashrc.local"
fi
cd ..

# clear history
histfiles=( "lesshst"
            "histfile"
            "mysql_history"
            "nano_history"
            "sqlite_history"
            "bash_history"
            "python_history"
            )

for i in "${histfiles[@]}"; do
    echo "$i -> /dev/null"
    ln -fs /dev/null "$HOME/.$i"
done
