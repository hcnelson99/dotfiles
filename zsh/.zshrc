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

    zgen load junegunn/fzf shell/completion.zsh
    zgen load junegunn/fzf shell/key-bindings.zsh

    zgen oh-my-zsh themes/af-magic

    zgen save
fi

export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"

BUILD_TYPE=debug

run() {
    if [ "$#" -eq 0 ]; then
        if [ "${BUILD_TYPE}" = "debug" ]; then
            echo ${RUN_DEBUG_COMMAND}
            ${RUN_DEBUG_COMMAND}
        else
            echo ${RUN_RELEASE_COMMAND}
            ${RUN_RELEASE_COMMAND}
        fi
    else
        if [ "${BUILD_TYPE}" = "debug" ]; then
            RUN_DEBUG_COMMAND=("${@:1}")
        else
            RUN_RELEASE_COMMAND=("${@:1}")
        fi
    fi
}

build() {
    if [ "$#" -eq 0 ]; then
        if [ "${BUILD_TYPE}" = "debug" ]; then
            echo ${BUILD_DEBUG_COMMAND}
            ${BUILD_DEBUG_COMMAND}
        else
            echo ${BUILD_RELEASE_COMMAND}
            ${BUILD_RELEASE_COMMAND}
        fi
    else
        if [ "${BUILD_TYPE}" = "debug" ]; then
            BUILD_DEBUG_COMMAND=("${@:1}")
        else
            BUILD_RELEASE_COMMAND=("${@:1}")
        fi
    fi
}

toggle() {
    if [ "${BUILD_TYPE}" = "release" ]; then
        BUILD_TYPE=debug
    else
        BUILD_TYPE=release
    fi
    echo ${BUILD_TYPE}
}

bindkey -s '^B' "build^M"
bindkey -s '^H' "toggle^M"
bindkey -s '^G' "run^M"

bindkey -s '^P' 'vim $(fzf)^M'
bindkey '^[C' fzf-cd-widget
bindkey -s '^Z' "fg^M"

unsetopt share_history

alias andrew="sshfs andrew:/afs/andrew.cmu.edu/usr15/hnelson1/private ~/andrew"

alias tmux="tmux -2"
alias coin="rlwrap coin"
alias vim='v'

alias updmirrors="sudo reflector --country 'United States' --latest 15 --age 24 --sort rate --save /etc/pacman.d/mirrorlist"
alias snap-now="sudo systemctl start snapper-timeline.service"
alias se="sudoedit"

backup_drive-mount() {
    sudo cryptsetup open --type luks /dev/disk/by-uuid/936af459-502b-4a66-a6aa-4942b8429fe4 backup_drive
    sudo mount /mnt/backup_drive
}

backup_drive-umount() {
    sudo umount /mnt/backup_drive
    sudo cryptsetup close backup_drive
}

snap-push() {
    backup_drive-mount
    sudo snap-sync -n -u 07aaa7bd-3616-44d2-91c8-d36f07fbfbcd
    backup_drive-umount
}

autotex() {
    vim $1
    (zathura ${1%.tex}.pdf &)2>/dev/null
    echo $1 | entr -c pdflatex -halt-on-error $1
}
