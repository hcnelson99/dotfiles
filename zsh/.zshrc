HISTSIZE=999999999
SAVEHIST=$HISTSIZE
bindkey -v

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd "j" vi-down-line-or-history
bindkey -M vicmd "k" vi-up-line-or-history

# Case-sensitive completion (oh-my-zsh)
CASE_SENSITIVE="true"

# set default_user for agnoster prompt
DEFAULT_USER='henry'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)

source ~/.zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/compleat
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/pass
    zgen load zsh-users/zsh-syntax-highlighting

    zgen load junegunn/fzf shell/completion.zsh
    zgen load junegunn/fzf shell/key-bindings.zsh

    zgen load romkatv/powerlevel10k powerlevel10k
    # zgen load sindresorhus/pure pure
    # zgen oh-my-zsh themes/agnoster
    # zgen load hcnelson99/zsh themes/af-magic

    zgen save
fi

# source /etc/profile.d/vte.sh
# source ~/zsh/themes/af-magic.zsh-theme

setopt auto_pushd autocd correct extendedglob notify
setopt inc_append_history_time 
unsetopt beep share_history inc_append_history

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

bindkey -s '^Z' "fg^M"
bindkey -s '^B' "build^M"
bindkey -s '^H' "toggle^M"
bindkey -s '^G' "run^M"

bindkey -s '^P' 'F=$(fzf) && vim ${F}^M'
bindkey '^[C' fzf-cd-widget

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

backup_drive-mount() {
    sudo cryptsetup open --type luks /dev/disk/by-uuid/936af459-502b-4a66-a6aa-4942b8429fe4 backup_drive
    sudo mount /mnt/backup_drive
}

backup_drive-umount() {
    sudo umount /mnt/backup_drive
    sudo cryptsetup close backup_drive
}

autotex() {
    vim $1
    (zathura ${1%.tex}.pdf &)2>/dev/null
    echo $1 | entr -c pdflatex -halt-on-error $1
}

# OPAM configuration
. /home/henry/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
