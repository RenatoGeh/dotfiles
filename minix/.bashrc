#!/bin/bash

# Ativa o bash_completion, se estiver instalado
if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# Executa o ~/.bash_aliases, se existir
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

export EDITOR="vim"

# Adiciona o diretório bin do usuário ao PATH
export PATH="~/bin:$PATH"

# Aliases
alias ls='ls'
alias ll='ls -la'
alias less='less -R'

exitstatus()
{
  if [[ $? == 0 ]]; then
    echo '[\033[38;5;70m\]✔[\033[38;5;15m\]'
  else
    echo '[\033[38;5;15m\]✘[\033[38;5;15m\]'
  fi
}

export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]✔\[\e[0m\]; else echo \[\e[31m\]✘\[\e[0m\]; fi\`\[\033[38;5;71m\][\u|\t]\[\033[38;5;15m\]:\[\033[38;5;75m\]\w\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"
