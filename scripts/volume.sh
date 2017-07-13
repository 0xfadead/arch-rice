#!/bin/bash


ACTIVESINK=$(pacmd list-sinks | \
perl -lne 'm/\* index: ([0-9]+)/ && print $1')

case $1 in 
    1)
        pactl set-sink-volume $ACTIVESINK +10%
        ;;
    2)
        pactl set-sink-volume $ACTIVESINK -10%
        ;;
    esac

# notify i3blocks of new volume
pkill -RTMIN+10 i3blocks
