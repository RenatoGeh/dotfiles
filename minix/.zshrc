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
zstyle :compinstall filename '/home/renatolg/.zshrc'

zmodload zsh/complist


# Completion and prompt.
autoload -Uz compinit promptinit
compinit
promptinit

# Prompt.
autoload -U colors && colors
setopt PROMPT_SUBST
set_prompt_update() {
  [[ $? == 0 ]] && PROMPT="%{$fg[green]%}%B✔%b%{$fg[green]%}[%n]%{$fg[yellow]%}[%*]%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}\$ " || PROMPT="%{$fg[red]%}%B✘%b%{$fg[green]%}[%n]%{$fg[yellow]%}[%*]%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}\$ "
}
RPROMPT="$(set_prompt_update)"

typeset -a precmd_functions
precmd_functions+=(set_prompt_update)

# $PATH
typeset -U path
path=(~/bin $path[@])

# Ignores history duplicates.
setopt HIST_IGNORE_DUPS

# Vi mode.
bindkey -v

# Sets Shift+Tab as previous completion.
setopt MENU_COMPLETE
#bindkey -M menuselect '^[[Z' reverse-menu-complete #undo #reverse-menu-complete
bindkey '^[[Z' undo

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

export EDITOR="vim"

# Ctrl+S (flow control disable).
setopt NO_FLOW_CONTROL

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"      ]]  && bindkey   "${key[Up]}"       up-line-or-beginning-search
[[ -n "${key[Down]}"    ]]  && bindkey   "${key[Down]}"    down-line-or-beginning-search

# Aliases
alias ls='ls'
alias ll='ls -la'
alias less='less -R'

# Rehashes automatically.
zstyle ':completion:*' rehash true

# Allows background running.
setopt NO_HUP

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
