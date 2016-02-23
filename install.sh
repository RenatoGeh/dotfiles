#!/bin/bash

# Installing my dotfiles

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim (with Janus)
ln -s ${BASEDIR}/vimrc.after ~/.vimrc.after

# bash
ln -s ${BASEDIR}/bashrc ~/.bashrc

# less
ln -s ${BASEDIR}/lessfilter ~/.lessfilter

# urxvt
ln -s ${BASEDIR}/Xdefaults ~/.Xdefaults

# X init
ln -s ${BASEDIR}/xinitrc ~/.xinitrc

# Keyboard modmap
ln -s ${BASEDIR}/Xmodmap ~/.Xmodmap

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# i3
ln -s ${BASEDIR}/i3/battery.sh ~/.i3/.battery.sh
ln -s ${BASEDIR}/i3/i3blocks.conf ~/.i3/i3blocks.conf
ln -s ${BASEDIR}/i3/ncmpcpp.sh ~/.i3/ncmpcpp.sh

