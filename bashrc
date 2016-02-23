#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export PS1="[\u|\t]:\w\\$ \[$(tput sgr0)\]"

#xterm colors
export TERM='xterm-256color'

# Go $GOPATH
export GOPATH=~/go

# Go added to $PATH
export PATH="$PATH:$GOPATH/bin"

# Remap numpad keys
xmodmap ~/.Xmodmap

# Adds pygmentize to less
export LESS=' -R'
export LESSOPEN='|~/.lessfilter %s'

# bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

# pkgfile
source /usr/share/doc/pkgfile/command-not-found.bash
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh
