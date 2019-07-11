#!/bin/bash

# Prints battery status.
# Takes acpi -b as argument.

CHG="Battery charging."

while read -r line
do
  if [ -z "$line" ]
  then
    echo "$CHG"
  else
    echo "$line"
  fi
  p=$( echo "$line" | grep -o "[0-9]\+\%" )
  p=${p::-1}
  if ([[ "$p" -eq '30' ]] || [[ "$p" -eq '20' ]] || [[ "$p" -le '10' ]]) && [ ! -f /tmp/bat_$p ]; then
    touch > /tmp/bat_$p
    dunstify -a 'Battery' "Battery level: $p%"
  fi
done
