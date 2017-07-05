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
    zgen load zsh-users/zsh-syntax-highlighting

    zgen oh-my-zsh themes/arrow

    zgen save
fi

alias vim="nvim"
alias tmux="tmux -2"
alias c="urxvt &"
alias updmirrors="sudo reflector --country 'United States' --latest 15 --age 24 --sort rate --save /etc/pacman.d/mirrorlist"
alias snap="sudo btrfs subvolume snapshot -r / /@snapshots/"root-$(date "+%FT%T")" && sudo btrfs subvolume snapshot -r /home /@snapshots/"home-$(date "+%FT%T")""
