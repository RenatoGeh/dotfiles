if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Get xrandr ready for dual-monitor
# /home/renatogeh/bin/dual_monitor
# Single monitor as default
/home/renatogeh/bin/single_monitor

# Init i3wm
exec i3

