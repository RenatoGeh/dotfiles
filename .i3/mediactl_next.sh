#!/bin/bash

s=$(playerctl -p spotify status)
if [ "$s" == "Playing" ]; then
  playerctl -p spotify next
else
  cmus-remote --next && killall -USR1 i3blocks
fi
