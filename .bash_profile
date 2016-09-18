#
# ~/.bash_profile
#

export CVSROOT=":ext:henry@cvs.fsl.cs.sunysb.edu:/scm/cvsroot"
export CVS_RSH="/usr/bin/ssh"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
