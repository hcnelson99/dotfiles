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

alias vim="nvim"
alias tmux="tmux -2"
alias updmirrors="sudo reflector --country 'United States' --latest 15 --age 24 --sort rate --save /etc/pacman.d/mirrorlist"
alias snap-now="sudo systemctl start snapper-timeline.service"
alias snap-push="sudo mount /mnt/backup_drive; sudo snap-sync -n -u ce550ec6-466b-4fb6-b812-5a34485d5c85"
alias se="sudoedit"
