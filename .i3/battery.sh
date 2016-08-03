#!/bin/bash

# Prints battery status.
# Takes acpi -b as argument.

CHG="Battery charging."

while read line
do
  if [ -z "$line" ]
  then
    echo $CHG
  else
    echo $line
  fi
done
