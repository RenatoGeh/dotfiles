#!/bin/bash

s=$(playerctl -p spotify status)
if [ "$s" == "Playing" ]; then
  playerctl -p spotify pause
else
  cmus-remote --pause
fi
