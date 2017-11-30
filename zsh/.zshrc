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
bindkey -s '^N' "toggle^M"
bindkey -s '^G' "run^M"

bindkey -s '^F' 'vim $(fzf)^M'
bindkey '^[C' fzf-cd-widget
bindkey -s '^Z' "fg^M"

unsetopt share_history

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_materia

alias tmux="tmux -2"
alias coin="rlwrap coin"

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
    urxvt -e sh -c "echo $1 | entr -c pdflatex -halt-on-error $1" &
    (zathura ${1%.tex}.pdf &)2>/dev/null
    vim $1
}

bg() {
    BASE16_SHELL_SET_BACKGROUND=true
    base16_materia
}
