#!/bin/bash
echo "COPY"

echo "- folders"
cp -r vim-snippets ~/.vim/vim-snippets

echo "- dotfiles"
cp ~/repos/dotfiles/vimrc ~/.vimrc &>/dev/null
cp ~/repos/dotfiles/tmux.conf ~/.tmux.conf
cp ~/repos/dotfiles/bashrc ~/.bashrc

echo
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
cp ~/repos/dotfiles/composer.json ~/.composer/composer.json

echo "- gitconfig"
cp ~/repos/dotfiles/gitconfig ~/.gitconfig

echo "- inputrc"
cp ~/repos/dotfiles/inputrc ~/.inputrc
source ~/.inputrc

echo "- termux"
mkdir -p ~/.termux
cp ~/repos/dotfiles/termux ~/.termux/termux.properties
termux-reload-settings &>/dev/null

echo "- tmuxinator"
mkdir -p ~/.config
mkdir -p ~/.config/tmuxinator
cp ~/repos/dotfiles/hafah.yml ~/.config/tmuxinator/hafah.yml

echo
echo "CLOSING..."
