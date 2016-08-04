#!/bin/bash
# ~/.bashrc
source /etc/profile

# Ativa o bash_completion, se estiver instalado
if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# Executa o ~/.bash_aliases, se existir
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# Adiciona o diretório bin do usuário ao PATH
export PATH="~/bin:$PATH"

# Checa a quota de disco
QUOTA=`quota 2> /dev/null | tail -n 1 | tr -s ' '| cut -d' ' -f2 | egrep "\*$"`
if [ $QUOTA ]; then
	echo -e '\n*** Cota de disco estourada! - Apague seus arquivos ou contate um admin ***\n'
fi

# Aliases
alias tmux="TERM=screen-256color tmux"
alias ls='ls --color'
alias ll='ls -la --color'
alias feh='feh -d'
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

#xterm colors
export TERM='xterm-256color'

# Go path.
export GOPATH=~/go
# Add Go to PATH.
export PATH="$PATH:$GOPATH/bin"
