#!/bin/bash

# Blame your friends that put 
# spaces in their directory names 
target=$(fc -lnr | perl -lne 'print $1 and last if /^\s*(?:cp|mv).*?((?:[^\s\0]|(?<=\\) |(?:(?<=")(?:.*?)(?=")))+$)/')

if [ -z "$target" ]; then
    echo "No recent cp or mv cmds."
else
    target=$(eval realpath "$target")
    # In case a custom filename was given...
    if [ -f "$target" ]; then
        target=$(dirname "$target")
    fi 
    cd "$target"
fi

