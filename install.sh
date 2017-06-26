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

pacaur -Syu --noconfirm reflector

echo "Updating mirrorlist..."
sudo reflector --latest 15 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist

cd ~/dotfiles

sudo mkdir -p /etc/pacman.d/hooks
sudo ln -s ~/dotfiles/mirrorupgrade.hook /etc/pacman.d/hooks

UTIL="vim neovim xsel stow redshift tmux zsh pass rxvt-unicode"
DE="bspwm sxhkd polybar compton feh xbindkeys light i3lock-fancy-git-fixed unclutter-xfixes-git"
DE_PROGS="rofi rofi-pass thunar arandr"
THEMES="numix-circle-icon-theme-git adapta-gtk-theme"
XORG="xorg-server xorg-xinit xorg-xmodmap xorg-xsetroot"
NET="networkmanager networkmanager-openvpn network-manager-applet google-chrome"
FONT="gohufont fonts-meta-base ttf-font-awesome siji-git powerline-fonts-git"
AUDIO="pulseaudio"

pacaur -Syu --noconfirm --noedit "$XORG $UTIL $NET $DE $DE_PROGS $THEMES $FONT $AUDIO"
sudo systemctl enable --now NetworkManager

stow vim
mkdir -p ~/.config
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

git clone https://github.com/tarjoilija/zgen.git ~/.zgen
stow zsh
sudo chsh "$USER" -s "$(which zsh)"

stow X
stow fontconfig
stow git
stow tmux
stow bspwm
echo "Logout and in to start X"
