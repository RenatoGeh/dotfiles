#!/bin/bash

while sleep 1; do grep -w cpu /proc/stat ; done | \
    awk '{
        print (o2+o4-$2-$4)*100/(o2+o4+o5-$2-$4-$5) "%"
        o2=$2;o4=$4;o5=$5}'
