#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

mkdir $DIR/.config/{ranger,i3,mpd} -p
cp ~/.config/ranger/rc.conf $DIR/.config/ranger/
cp ~/.config/i3/config $DIR/.config/i3/
cp ~/.config/mpd/mpd.conf $DIR/.config/mpd/
mkdir $DIR/.ncmpcpp -p
cp ~/.ncmpcpp/config $DIR/.ncmpcpp/
mkdir $DIR/.vim/janus/vim/vimrc -p
cp ~/.vim/janus/vim/vimrc $DIR/.vim/janus/vim/vimrc
mkdir $DIR/.i3/
cp ~/.i3/* $DIR/.i3/

cp ~/.bashrc ~/.zshrc ~/.fehbg.sh   ~/.rtorrent.rc ~/.tmux.{conf,snap} \
  ~/.vimrc.{after,before} ~/.vim_shell_prompt.sh ~/.Xdefaults ~/.xinitrc ~/.Xmodmap\
  $DIR
