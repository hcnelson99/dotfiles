#!/bin/bash
set -eu

if [ "$(id -u)" == "0" ]; then
  echo "Run without sudo"
  exit 1
fi

sudo echo "Beginning installation..."

# mkdir -p ~/builds
# cd ~/builds
# git clone https://aur.archlinux.org/cower.git
# cd cower
# gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
# yes | makepkg -sri
# cd ..
# git clone https://aur.archlinux.org/pacaur.git
# cd pacaur
# yes | makepkg -sri
#
# yes | pacaur -S reflector
#
# echo "Updating mirrorlist..."
# sudo reflector --latest 15 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist

cd ~/dotfiles

UTIL="vim neovim stow redshift"
I3="i3-gaps rofi i3lock-fancy i3status"
XORG="xorg-server xorg-xinit xorg-xmodmap feh"
NET="networkmanager networkmanager-openvpn network-manager-applet google-chrome"
AUDIO="pulseaudio"

echo "Select a xorg provider"
pacaur -S $XORG

yes | pacaur -Syu --noedit $UTIL $NET $AUDIO $I3

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
