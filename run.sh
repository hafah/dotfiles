#!/bin/bash

echo "copying..."

cp vimrc ~/.vimrc &>/dev/null
cp tmux.conf ~/.tmux.conf
cp bashrc ~/.bashrc

echo "refreshing..."
echo "- vimrc"
source ~/.vimrc &>/dev/null

echo "- tmux.conf"
if ! [ -z "$TMUX" ]; then 
    tmux source-file ~/.tmux.conf
fi

echo "- bashrc"
source ~/.bashrc

echo "- gitconfig"
cp gitconfig ~/.gitconfig

echo "- inputrc"
cp inputrc ~/.inputrc
source ~/.inputrc

echo "- termux"
mkdir ~/.termux
cp termux ~/.termux/termux.properties
termux-reload-settings
