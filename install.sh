#!/bin/bash
set -eux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&
ln -s .vimrc ~/.vimrc &&
vim +PluginInstall +qall

ln -s .tmux.conf ~/.tmux.conf
