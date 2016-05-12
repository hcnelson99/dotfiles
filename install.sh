#!/bin/bash
set -ux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
ln -s ~/dotfiles/.vimrc ~/.vimrc 
vim +PluginInstall +qall

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

git clone https://github.com/tarjoilija/zgen.git ~/.zgen
ln -s ~/dotfiles/.zshenv ~/.zshenv 
ln -s ~/dotfiles/.zshrc ~/.zshrc

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore ~/.gitignore
