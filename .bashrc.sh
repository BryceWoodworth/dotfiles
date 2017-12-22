#!/bin/bash

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable vi-bindings for command line
set -o vi

# Disable XOFF/XON (so CTRL-s doesn't make vim hang)
stty -ixon

# lesspipe makes less work better with binary/compressed/etc files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If bash completion is not enabled by default then we definitely want to enable it
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# Set default permissions to 755 for directories and 644 for files
umask 022

# ------------- #
# Aliases below #
# ------------- #

# Enable color support of ls and alias to default
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias rgrep='rgrep --color=auto'
fi

# Set a convenient nonrecursive ls command
alias sl='ls -alhd'

# Declare a command for showing git show from vim
vimgitshow() { git show "$1" | vim - "+set filetype=${1##*.}"; }

# Force tmux to accept 256 color
alias tmux='tmux -2'

# git super-log!
alias gsl='git log --all --decorate --oneline --graph --color=always  --pretty=format:'\''%C(auto)%h%C(auto)%d %s %C(cyan)(%aN, %ar)'\'
