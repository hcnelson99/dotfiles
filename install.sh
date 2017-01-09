#!/bin/bash
set -ux

mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
stow vim
nvim +PlugInstall +qall

git clone https://github.com/tarjoilija/zgen.git ~/.zgen
stow zsh

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
stow spacemacs
stow X
stow git
stow bash
stow i3
stow tmux
# stow bspwm
# stow yabar
stow ncmpcpp
