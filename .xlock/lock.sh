#!/bin/bash

# Option 1.
#ICON=$HOME/.xlock/icon.png
#TMPBG=/tmp/__screen.png
#scrot $TMPBG
#convert $TMPBG -scale 10% -scale 1000% $TMPBG
#convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
#i3lock -u -i $TMPBG

# Option 2.
#TMPBG=/tmp/__screen.png
#LOCK=~/.xlock/alt-icon.png
#RES=1920x1080
#ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG
#i3lock -i $TMPBG

# Option 3.
ICON=$HOME/.xlock/alt-icon.png
TMPBG=/tmp/__screen.png
LOCK=~/.xlock/alt-icon.png
scrot $TMPBG
convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -i $TMPBG

