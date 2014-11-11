#!/usr/bin/env bash

# Vi editing
set -o vi
stty erase ^?

# Don't close on Ctrl-D
set -o ignoreeof

# Useful aliases
if [[ "$OSTYPE" == "linux-gnu" || "$OSTYPE" == "Linux" || "$OSTYPE" == "cygwin" ]]; then
    alias ls='ls --color'
    export LS_COLORS='fi=37:di=32:ln=36:ex=31'
elif [[ "$OSTYPE" == darwin* ]]; then
    alias ls='ls -G'
fi
alias l='ls'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -lha'
alias cl='clear'
alias less='less -R'

# Git autocompletion
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash

# Git prompt
[ -f ~/.git-prompt.sh ] && . ~/.git-prompt.sh

# Colors
COLOR_OFF='\[\e[0m\]'
BLACK='\[\e[0;30m\]'
RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
PURPLE='\[\e[0;35m\]'
CYAN='\[\e[0;36m\]'
WHITE='\[\e[0;37m\]'

# PS1
_PS1_HOST=${GREEN}\\h${COLOR_OFF}
_PS1_WORKINGDIR=${YELLOW}\\w${COLOR_OFF}
_PS1_GIT_BRANCH=${CYAN}'$(__git_ps1)'${COLOR_OFF}
_PS1_TIME=${BLUE}\\D{%T}${COLOR_OFF}
export PS1="\n${_PS1_HOST}:${_PS1_WORKINGDIR}${_PS1_GIT_BRANCH}\n[${_PS1_TIME}] >> "

export PAGER=less
export EDITOR=vim
export LANG="en_US.UTF-8"

# functions for correctly setting DISPLAY in existing tmux windows
if [ -z $TMUX ]; then
    echo $DISPLAY > ~/.DISPLAY
fi
function refresh-display {
    export DISPLAY=$(cat ~/.DISPLAY)
    echo "DISPLAY set to $DISPLAY"
}
