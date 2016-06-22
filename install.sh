#!/bin/bash
set -ux

mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc 
vim +PlugInstall +qall

ln -s ~/dotfiles/.bashrc ~/.bashrc 
ln -s ~/dotfiles/.bash_profile ~/.bash_profile

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

ln -s ~/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.i3
ln -s ~/dotfiles/.i3/config ~/.i3/config
ln -s ~/dotfiles/.i3status.conf ~/.i3status.conf
ln -s ~/dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.xinitrc ~/.xinitrc
ln -s ~/dotfiles/.xbindkeysrc ~/.xbindkeysrc
