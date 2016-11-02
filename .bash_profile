#
# ~/.bash_profile
#

export CVSROOT=":ext:henry@cvs.fsl.cs.sunysb.edu:/scm/cvsroot"
export CVS_RSH="/usr/bin/ssh"

export RUST_SRC_PATH="/home/henry/.cargo/src/rustc-nightly/src/"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
