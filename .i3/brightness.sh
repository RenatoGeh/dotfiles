#!/bin/bash

# Prints brightness percentage.
# Takes two inputs:
# cat /sys/class/backlight/intel_backlight/max_brightness
# cat /sys/class/backlight/intel_backlight/brightness

# Use curly braces and semicolons to merge inputs:
# { cmd1; cmd2 } | ./brightness.sh

max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
actual=$(cat /sys/class/backlight/intel_backlight/brightness)

echo "Brightness: $(((($actual*100)/$max)))%"
