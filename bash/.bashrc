#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

DIR_COLOR='\[\e[38;5;32m\]'
BRANCH_COLOR='\[\e[38;5;78m\]'
DIRTY_COLOR='\[\e[38;5;214m\]'
RESET_COLOR='\[\e[39m\]'
ERROR_COLOR='\[\e[31m\]'

if [ $UID -eq 0 ]; then
    ARROW_COLOR='\[\e[31m\]'
else
    ARROW_COLOR='\[\e[38;5;105m\]'
fi

prompt() {
    ret=$?
    PS1=""

    user=$(whoami)

    if [[ $user != "henry" ]]; then
        PS1+="$PAREN_COLOR$user$RESET_COLOR in "
    fi

    PS1+="$DIR_COLOR\w"

    GIT=$(git status --porcelain=v1 2>/dev/null)
    in_git=$?

    if [ $in_git -eq 0 ]; then
        BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        DIRTY=""
        if echo "$GIT" | grep -qE '^M.'; then
            DIRTY+="s"
        fi
        if echo "$GIT" | grep -qE '^.M'; then
            DIRTY+="*"
        fi
        if echo "$GIT" | grep -qE '^\?\?'; then
            DIRTY+="u"
        fi

        PS1+="$RESET_COLOR $BRANCH_COLOR$BRANCH"
        if [ ! -z "$DIRTY" ]; then
            PS1+="$DIRTY_COLOR($DIRTY)"
        fi
    fi
    PS1+="\n"
    if [ $ret -ne 0 ]; then
        PS1+="$ERROR_COLOR$ret "
    fi
    PS1+="$ARROW_COLOR» "
    PS1+="$RESET_COLOR"
}

PROMPT_COMMAND=prompt
