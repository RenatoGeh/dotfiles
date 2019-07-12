#!/bin/bash

s=$(playerctl -p spotify status)
if [ "$s" == "Playing" ]; then
  playerctl -p spotify play
else
  cmus-remote --play
fi
