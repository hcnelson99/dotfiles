#!/bin/bash
set -ux

if [ "$(id -u)" == "0" ]; then
  echo "Run without sudo"
  exit 1
fi

mkdir -p ~/builds
cd builds
git clone https://aur.archlinux.org/cower.git
cd cower
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
makepkg -sri
cd ..
git clone https://aur.archlinux.org/pacaur.git
cd pacaur
makepkg -sri

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
