#!/bin/bash

s=$(playerctl -p spotify status)
if [ "$s" == "Playing" ]; then
  playerctl -p spotify previous
else
  cmus-remote --prev && killall -USR1 i3blocks
fi
