#!/bin/bash

bat=0
if [ ! -z $1 ]; then
	bat=$1
fi
BATPATH="/sys/class/power_supply/BAT$bat"
[[ ! -d $BATPATH ]] && exit  

STATUS=$(cat $BATPATH/status)
CHARGE=$(cat $BATPATH/capacity)

DONTANNOY="/tmp/alreadypingedbat"
if [[ $STATUS == "Discharging" ]]; then
    echo "⚡ $CHARGE% Bat";
    if [[ "$CHARGE" -eq 15 || "$CHARGE" -eq 14 ]]; then
        if [[ ! -f $DONTANNOY ]]; then
            notify-send -u critical "Battery life at $CHARGE%"
            touch $DONTANNOY
        fi
    fi
elif [[ $STATUS == "Charging" ]]; then
    echo " $CHARGE% Chr"
    if [[ -f $DONTANNOY ]]; then
        rm $DONTANNOY
    fi
else
    echo " $CHARGE% Chr"
fi

