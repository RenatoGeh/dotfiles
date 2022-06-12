# GRC colorizer
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

setopt histignorespace
setopt HIST_IGNORE_SPACE

# Git prompt.
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%B%[S]%b'
zstyle ':vcs_info:*' unstagedstr '%B[U]%b'
zstyle ':vcs_info:*' formats '[%b]%c%u'

# Prompt
set_prompt_update() {
  [[ $? == 0 ]] && PROMPT="%{$fg[green]%}%B✔%b%{$fg[green]%}[%n]%{$fg[yellow]%}[%*]%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}\$ " || PROMPT="%{$fg[red]%}%B✘%b%{$fg[green]%}[%n]%{$fg[yellow]%}[%*]%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}\$ "
}
RPROMPT="%{$fg[red]%}\$vcs_info_msg_0_  %{$fg[yellow]%}%B> [%i->%?]%b%{$reset_color%}"

# $PATH
typeset -U path
path=(~/bin $path[@])

#xterm colors
export TERM='screen-256color-bce'
#export TERM='xterm-direct'

# Julia
export JULIA_NUM_THREADS=8

# Ignores history duplicates.
setopt HIST_IGNORE_DUPS

# ttyctl.
ttyctl -f

# Vi mode.
bindkey -v
bindkey "^R" history-incremental-pattern-search-backward

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

export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

# Ctrl+S (flow control disable).
setopt NO_FLOW_CONTROL

# Aliases
alias vim='nvim'
alias vimdiff='nvim -d'
#alias tmux="TERM=$TERM tmux"
alias ls='ls --color'
alias ll='ls -la --color'
alias sl='ls --color'
alias feh='feh -d'
#alias less='less -R'
alias wcal="cal -y && when"
alias go-bundle="~/go/bin/bundle"
#alias start-rvm="source ~/.rvm/scripts/rvm"
alias tree='tree -C'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias playmidi='fluidsynth -a alsa -m alsa_seq -l -i /usr/share/soundfonts/FluidR3_GM.sf2'
alias scrot='scrot /tmp/%F-%X_\$wx\$h.png'
alias maim='maim -s /tmp/$(date +%s).png | xclip -selection c -t image/png'
alias maim_screen='/usr/bin/maim /tmp/$(date +%s).png'

# kw
alias kw='~/.config/kw/kw'

alias spot-pp='playerctl -p spotify play-pause'
alias spot-next='playerctl -p spotify next'
alias spot-prev='playerctl -p spotify previous'
alias spotify='/home/renatogeh/bin/spotify'

# External brazilian keyboard
alias switch-br-key='setxkbmap br abnt2'

# Latexmk
alias mklatex='latexmk -pdf -shell-escape -verbose -file-line-error -interaction=nonstopmode'
alias cllatex='latexmk -C'

# Git
function gvshow() {
  mkdir -p /tmp/gvshow
  if [ $? -ne 0 ]; then return 1; fi
  t="$(mktemp -p /tmp/gvshow/).${1##*.}"
  if [ $? -ne 0 ]; then return 2; fi
  git show "$1" > "$t"
  if [ $? -ne 0 ]; then return 3; fi
  nvim -R "$t"
}

# Browser
#export BROWSER="chromium:$BROWSER"

# Less syntax highlighting.
#export LESS=' -R -N'
#export LESSOPEN='|~/.lessfilter %s'
#export LESSCHARSET='utf-8'

# Rehashes automatically.
zstyle ':completion:*' rehash true

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M MB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

# Corrects input

autoload zkbd
source ${ZDOTDIR:-$HOME}/.zkbd/xterm-256color-:0

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
HISTSIZE=10000
bindkey -v
SAVEHIST=10000
setopt appendhistory
# End of lines configured by zsh-newuser-install

# Disable r as alias to !!
disable r

# Jump words
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Extended glob
setopt extended_glob

# Syntax highlighting.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zplug
source ~/.zplug/init.zsh

# Powerlevel9k
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode vcs)
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_TIME_FOREGROUND='black'
#POWERLEVEL9K_TIME_BACKGROUND='154'
#POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=" "
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "
#POWERLEVEL9K_DIR_HOME_BACKGROUND='154'
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='154'

# Powerlevel9k
zplug "romkatv/powerlevel10k", as:theme, depth:1

# calc.plugin.zsh
#zplug "arzzen/calc.plugin.zsh", use:calc.plugin.zsh
alias ccalc='/usr/bin/calc'

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
export PYTHONPATH="${PYTHONPATH}:/home/renatogeh/ta/mac0318/duckievillage/duckietown/src"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
