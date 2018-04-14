#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# ~/dir(branch*) »
DIR_COLOR='\[\e[38;5;32m\]'
PAREN_COLOR='\[\e[38;5;75m\]'
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

    if [ $ret -ne 0 ]; then
        PS1+="$ERROR_COLOR$ret"
    fi

    PS1+="$DIR_COLOR\w"

    git status >/dev/null 2>&1
    in_git=$?

    if [ $in_git -eq 0 ]; then
        BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
        if git status 2>/dev/null | grep -q modified; then
            DIRTY="$DIRTY_COLOR*"
        else
            DIRTY=""
        fi

        PS1+="$PAREN_COLOR("
        PS1+="$BRANCH_COLOR$BRANCH"
        PS1+="$DIRTY"
        PS1+="$PAREN_COLOR)"
    fi
    PS1+=" $ARROW_COLOR» "
    PS1+="$RESET_COLOR"
}

PROMPT_COMMAND=prompt
