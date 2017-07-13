#!/bin/bash

bat=0
if [ ! -z $1 ]; then
	bat=$1
fi
BATPATH="/sys/class/power_supply/BAT$bat"
[[ ! -d $BATPATH ]] && exit  

STATUS=$(cat $BATPATH/status)
CHARGE=$(cat $BATPATH/capacity)

echo $CHARGE% # full text
echo $CHARGE% # short text

if [[ "$STATUS" -eq "Discharging" ]]; then
    if [[ $CHARGE -gt 60 ]]; then
        echo "#00FF00" #lime green
    elif [[ $CHARGE -gt 35 ]]; then
        echo "#FFFF00" #yellow
    elif [[ $CHARGE -gt 15 ]]; then
        echo "#FF8800" #orange
    else
        echo "#FF0000" #red
    fi
fi
