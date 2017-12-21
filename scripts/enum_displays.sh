#!/bin/bash

# all displays detected by the OS 
CONNECTED=$(xrandr | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
# start with primary display 
LAST=$(xrandr | grep -E " connected primary [1-9]+" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")

for display in $CONNECTED
do
    if [[ "$display" == "$LAST" ]]; then
        continue 
    fi
    xrandr --output "$display" --auto --right-of "$LAST" 
    LAST="$display"
done
