# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' max-errors 4 numeric
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/renatogeh/.zshrc'

zmodload zsh/complist

# Completion and prompt.
autoload -Uz compinit promptinit
compinit
promptinit

# Prompt.
autoload -U colors && colors
setopt PROMPT_SUBST

autoload -Uz vcs_info
precmd () { vcs_info }

# Git prompt.
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%B%[S]%b'
zstyle ':vcs_info:*' unstagedstr '%B[U]%b'
zstyle ':vcs_info:*' formats '[%b]%c%u'

set_prompt_update() {
  #if [ $? -eq 0]; then
    #echo "Yay"
    #PROMPT="%{$fg[green]%}%B✔%b%{$fg[green]%}[%n|%*]%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}\$ "
  #else
    #echo "Nay"
    #PROMPT="%{$fg[red]%}%B✘%b%{$fg[green]%}[%n|%*]%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}\$ "
  #fi
  [[ $? == 0 ]] && PROMPT="%{$fg[green]%}%B✔%b%{$fg[green]%}[%n]%{$fg[yellow]%}[%*]%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}\$ " || PROMPT="%{$fg[red]%}%B✘%b%{$fg[green]%}[%n]%{$fg[yellow]%}[%*]%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}\$ "
}
RPROMPT="%{$fg[red]%}\$vcs_info_msg_0_  %{$fg[yellow]%}%B> [%i->%?]%b%{$reset_color%}"
TMOUT=1

TRAPALRM() {
  if [ "$WIDGET" != "expand-or-complete" ]; then
    zle reset-prompt
  fi
}

typeset -a precmd_functions
precmd_functions+=(set_prompt_update)

# $PATH
typeset -U path
path=(~/bin $path[@])

#xterm colors
export TERM='screen-256color'

# Ignores history duplicates.
setopt HIST_IGNORE_DUPS

# ttyctl.
ttyctl -f

# Vi mode.
bindkey -v

# Function: undo latest cd.
cdUndoKey() {
  popd      > /dev/null
  #pushd .   > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

# Function: go up a directory.
cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

# Function: redo latest undo.
#cdRedoKey() {
  #popd     > /dev/null
  #zle      reset-prompt
  #echo
  #ls
  #echo
#}

zle -N                cdParentKey
zle -N                cdUndoKey
#zle -N                cdRedoKey
bindkey '^[^[[A'      cdParentKey
bindkey '^[^[[D'      cdUndoKey
#bindkey '^[^[[C'      cdRedoKey

# Sets Shift+Tab as previous completion.
setopt MENU_COMPLETE
#bindkey -M menuselect '^[[Z' reverse-menu-complete #undo #reverse-menu-complete
bindkey '^[[Z' undo

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

export EDITOR="nvim"

# Ctrl+S (flow control disable).
setopt NO_FLOW_CONTROL

# Aliases
alias tmux="TERM=screen-256color tmux"
alias ls='ls --color'
alias ll='ls -la --color'
alias sl='ls --color'
alias feh='feh -d'
alias less='less -R'
alias vim='sh ~/Vim/nvim-session/nvim.sh'
alias wcal="cal -y && when"

# Less syntax highlighting.
export LESS=' -R'
export LESSOPEN='|~/.lessfilter %s'
export LESSCHARSET='utf-8'

# Remap numpad keys.
xmodmap ~/.Xmodmap

# Go $GOPATH
export GOPATH=~/go

# Go added to $PATH
export PATH="$PATH:$GOPATH/bin"

# Prepending Cope to $PATH
export PATH="/usr/share/perl5/vendor_perl/auto/share/dist/Cope:$PATH"

# Ruby path.
export RUBYPATH=~/.gem/ruby/2.3.0
export PATH="$PATH:$RUBYPATH/bin"

# Colored man pages
#export PAGER="most"
export LESS="--ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --window=-4"
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Syntax highlighting.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Rehashes automatically.
zstyle ':completion:*' rehash true

# Corrects input

autoload zkbd
source ${ZDOTDIR:-$HOME}/.zkbd/xterm-256color-:0

# Command not found.
source /usr/share/doc/pkgfile/command-not-found.zsh

# Allows background running.
setopt NO_HUP

key[Insert]=${terminfo[kich1]}

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
