#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export CVSROOT=":ext:henry@cvs.fsl.cs.sunysb.edu:/scm/cvsroot"
export CVS_RSH="/usr/bin/ssh"
alias ls='ls --color=always'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
