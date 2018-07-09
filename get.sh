#!/bin/bash -eu
TARGET=https://github.com/kkuehler/dotfiles.git
DEST="$HOME/dotfiles"

git clone "$TARGET" "$DEST"
cd "$DEST"
./install
scripts/ocf.sh
cd ..

echo
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
