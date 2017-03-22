#!/bin/bash
set -ux

stow vim
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

git clone https://github.com/tarjoilija/zgen.git ~/.zgen
stow zsh

stow X
stow fontconfig
stow git
stow bash
stow i3
stow tmux
stow ncmpcpp
