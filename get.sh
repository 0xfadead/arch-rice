#!/bin/bash -eu
TARGET=https://github.com/kkuehler/dotfiles.git
DEST="$HOME/dotfiles"

if [ ! -d "$DEST" ]; then
    git clone "$TARGET" "$DEST"
    cd "$DEST"
else
    cd "$DEST"
    git pull origin master
fi

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
            "wget-hsts"
            "bash_history"
            "zsh_history"
            "python_history"
            )

for i in "${histfiles[@]}"; do
    echo "$i -> /dev/null"
    ln -fs /dev/null "$HOME/.$i"
done
