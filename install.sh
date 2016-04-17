#!/bin/bash
set -u
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&
ln -s ~/dotfiles/.vimrc ~/.vimrc &&
vim +PluginInstall +qall

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

ln -s ~/dotfiles/.antigen.zsh ~/.antigen.zsh &&
ln -s ~/dotfiles/.zshenv ~/.zshenv &&
ln -s ~/dotfiles/.zshrc ~/.zshrc
