HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd correct extendedglob notify
unsetopt beep
bindkey -v

# Case-sensitive completion (oh-my-zsh)
CASE_SENSITIVE="true"

source ~/.zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/compleat
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting

    zgen oh-my-zsh themes/agnoster

    zgen save
fi
