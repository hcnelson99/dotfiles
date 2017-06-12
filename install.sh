#!/bin/bash
set -eu

if [ "$(id -u)" == "0" ]; then
  echo "Run without sudo"
  exit 1
fi

sudo echo "Beginning installation..."

mkdir -p ~/builds
cd ~/builds
git clone https://aur.archlinux.org/cower.git
cd cower
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
yes | makepkg -sri
cd ..
git clone https://aur.archlinux.org/pacaur.git
cd pacaur
yes | makepkg -sri

yes | pacaur -S reflector

echo "Updating mirrorlist..."
sudo reflector --latest 15 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist

cd ~/dotfiles

sudo mkdir -p /etc/pacman.d/hooks
sudo ln -s ~/dotfiles/mirrorupgrade.hook /etc/pacman.d/hooks

UTIL="vim neovim stow redshift tmux zsh rxvt-unicode"
DE="bspwm sxhkd rofi i3lock-fancy-git unclutter-xfixes-git xfce4"
XORG="xorg-server xorg-xinit xorg-xmodmap"
NET="google-chrome"
FONT="gohufont fonts-meta-base"

echo "Select a xorg provider"
pacaur -S $XORG

yes | pacaur -Syu --noedit $UTIL $NET $DE $FONT

stow vim
mkdir -p ~/.config
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

git clone https://github.com/tarjoilija/zgen.git ~/.zgen
stow zsh
sudo chsh $USER -s `which zsh`
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa bspwm

stow X
stow fontconfig
stow git
stow i3
stow tmux
stow bspwm
echo "Logout and in to start X"
