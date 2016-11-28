#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias v='emacsclient -n'
alias ls='ls --color=always'
PS1='[\u@\h \W]\$ '

export HISTFILESIZE=
export HISTSIZE=
