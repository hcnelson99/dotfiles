#!/bin/bash
set -ux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo
ln -s ~/dotfiles/.vimrc ~/.vimrc 
vim +PluginInstall +qall

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

git clone https://github.com/tarjoilija/zgen.git ~/.zgen
ln -s ~/dotfiles/.zshenv ~/.zshenv 
ln -s ~/dotfiles/.zshrc ~/.zshrc

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore ~/.gitignore

mkdir -p ~/.i3
ln -s ~/dotfiles/.i3/config ~/.i3/config
ln -s ~/dotfiles/.i3status.conf ~/.i3status.conf
ln -s ~/dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.xinitrc ~/.xinitrc
ln -s ~/dotfiles/.xbindkeysrc ~/.xbindkeysrc
