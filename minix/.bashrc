#!/bin/bash

export EDITOR="vim"

export PATH="~/bin:$PATH"

# Aliases
alias ls='ls'
alias ll='ls -la'
alias less='less -R'
alias exit='exit'

exitstatus()
{
  if [[ $? == 0 ]]; then
    echo '[\033[38;5;70m\]✔[\033[38;5;15m\]'
  else
    echo '[\033[38;5;15m\]✘[\033[38;5;15m\]'
  fi
}

export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]✔\[\e[0m\]; else echo \[\e[31m\]✘\[\e[0m\]; fi\`\[\033[38;5;71m\][\u|\t]\[\033[38;5;15m\]:\[\033[38;5;75m\]\w\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"
