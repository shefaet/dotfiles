#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    files=$(echo * | sed 's/install.sh//' | sed 's/README.md//')
else
    files=$@
fi

for file in $files; do
    if [ -e $HOME/.$file ]; then
        echo "Backing up existing ~/.$file to ~/.${file}.bak"
        rm -rf $HOME/.${file}.bak
        mv $HOME/.${file} $HOME/.${file}.bak
    fi
    echo "Creating symlink    ~/.$file to ./$file"
    ln -s $(pwd)/$file $HOME/.${file}
done
