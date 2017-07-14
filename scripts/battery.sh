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
	echo "⚡ $CHARGE% Bat";
elif [[ $STATUS == "Charging" ]]; then
    echo " $CHARGE% Chr"
else
    echo " $CHARGE% Chr"
fi

