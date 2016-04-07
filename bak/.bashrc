#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# PS functions

exitstatus()
{
  if [[ $? == 0 ]]; then
    echo '[\033[38;5;70m\]✔[\033[38;5;15m\]'
  else
    echo '[\033[38;5;15m\]✘[\033[38;5;15m\]'
  fi
}

#export PS1="$(exitstatus)\E[4#102m\E[3#30m\E[4#49m\E[3#92m█\E[4#102m\E[3#39m\u|\t\w\\$ \[$(tput sgr0)\]"
#export PS1='$(exitstatus)\033[38;5;71m\][\u|\t]\033[38;5;15m\]:\033[38;5;75m\]\w\033[38;5;15m\]\\$ \[$(tput sgr0)\]'

export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]✔\[\e[0m\]; else echo \[\e[31m\]✘\[\e[0m\]; fi\`\[\033[38;5;71m\][\u|\t]\[\033[38;5;15m\]:\[\033[38;5;75m\]\w\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

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

# Colored man pages
#export PAGER="most"
export LESS="--RAW-CONTROL-CHARS"
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Tmux color fix
alias tmux="TERM=screen-256color-bce tmux"
