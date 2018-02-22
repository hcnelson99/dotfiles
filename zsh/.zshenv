export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=vim

export CVSROOT=:ext:henry@cvs.fsl.cs.sunysb.edu:/scm/cvsroot
export CVS_RSH=/usr/bin/ssh

export RUST_SRC_PATH="$HOME/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

export PATH="$HOME/.bin:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

export JAVA_HOME="/usr/lib/jvm/default"
export _JAVA_AWT_WM_NONREPARENTING=1

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="find . -type d 2> /dev/null"

export BORG_PASSCOMMAND='pass show borg'
