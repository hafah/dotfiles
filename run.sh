#!/bin/bash
echo "COPY"

echo "- folders"
cp -r vim-snippets ~/.vim/vim-snippets
echo "- dotfiles"
cp vimrc ~/.vimrc &>/dev/null
cp tmux.conf ~/.tmux.conf
cp bashrc ~/.bashrc

echo ""
echo "REFRESH"
echo "- vimrc"
source ~/.vimrc &>/dev/null

echo "- tmux.conf"
if ! [ -z "$TMUX" ]; then 
    tmux source-file ~/.tmux.conf
fi

echo "- bashrc"
source ~/.bashrc

echo "- composer"
cp composer.json ~/.composer/composer.json

echo "- gitconfig"
cp gitconfig ~/.gitconfig

echo "- inputrc"
cp inputrc ~/.inputrc
source ~/.inputrc

echo "- termux"
mkdir -p ~/.termux
cp termux ~/.termux/termux.properties
termux-reload-settings &>/dev/null

