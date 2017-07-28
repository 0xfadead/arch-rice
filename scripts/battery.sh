#!/bin/bash

bat=0
if [ ! -z $1 ]; then
	bat=$1
fi
BATPATH="/sys/class/power_supply/BAT$bat"
[[ ! -d $BATPATH ]] && exit  

STATUS=$(cat $BATPATH/status)
CHARGE=$(cat $BATPATH/capacity)

if [[ $STATUS == "Discharging" ]]; then
    if [[ "$CHARGE" -eq 15 || "$CHARGE" -eq 10 ]]; then
        notify-send -u critical "Battery life at $CHARGE%"
    fi
	echo "⚡ $CHARGE% Bat";
elif [[ $STATUS == "Charging" ]]; then
    echo " $CHARGE% Chr"
else
    echo " $CHARGE% Chr"
fi

