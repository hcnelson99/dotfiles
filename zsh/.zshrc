HISTSIZE=999999999
SAVEHIST=$HISTSIZE
setopt appendhistory autocd correct extendedglob notify
unsetopt beep
bindkey -v

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd "j" vi-down-line-or-history
bindkey -M vicmd "k" vi-up-line-or-history

# Case-sensitive completion (oh-my-zsh)
CASE_SENSITIVE="true"

source ~/.zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/compleat
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/pass
    zgen oh-my-zsh plugins/virtualenvwrapper
    zgen load zsh-users/zsh-syntax-highlighting

    zgen oh-my-zsh themes/agnoster

    zgen save
fi

unsetopt share_history

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_materia

alias vim="nvim"
alias tmux="tmux -2"
alias updmirrors="sudo reflector --country 'United States' --latest 15 --age 24 --sort rate --save /etc/pacman.d/mirrorlist"
alias snap-now="sudo systemctl start snapper-timeline.service"
alias coin="rlwrap coin"

backup_drive-mount() {
    sudo cryptsetup open --type luks /dev/disk/by-uuid/542dbeea-1c3f-4aea-9cdf-5c2d7c05fd61 backup_drive
    sudo mount /mnt/backup_drive
}

backup_drive-umount() {
    sudo umount /mnt/backup_drive
    sudo cryptsetup close backup_drive
}

snap-push() {
    backup_drive-mount
    sudo snap-sync -n -u 87d71995-c8b9-4a2c-aa47-0f6fb78fe4bd
    backup_drive-umount
}

alias se="sudoedit"

autotex() {
    urxvt -e sh -c "echo $1 | entr -c pdflatex -halt-on-error $1" &
    (zathura ${1%.tex}.pdf &)
    vim $1
}
