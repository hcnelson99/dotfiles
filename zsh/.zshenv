export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=vim

export CVSROOT=:ext:henry@cvs.fsl.cs.sunysb.edu:/scm/cvsroot
export CVS_RSH=/usr/bin/ssh

export RUST_SRC_PATH="$HOME/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

export PATH="$HOME/go/bin:$HOME/.node_modules/bin:$HOME/.nimble/bin:$HOME/.bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.local/go/bin:$PATH"

export JAVA_HOME="/usr/lib/jvm/default"
export _JAVA_AWT_WM_NONREPARENTING=1

export FZF_DEFAULT_COMMAND='rg --files --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="find . -type d 2> /dev/null"

export BORG_PASSCOMMAND='pass show borg'

export WYVERN_HOME="/home/henry/wyvern"

export AUR_PAGER="ranger"

export npm_config_prefix=~/.node_modules
export GOPATH="$HOME/.local/go"

export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"
