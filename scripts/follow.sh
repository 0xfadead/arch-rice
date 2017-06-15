#!/bin/bash

# Blame your friends that put 
# spaces in their directory names 
target=$(fc -lnr | perl -lne 'print $1 and last if 
    /^\s*(?:cp|mv).*?((?:[^\s\0]|(?<=\\) |(?:(?<=")(?:.*?)(?=")))+$)/')

if [ -z "${target}" ]; then
    echo "No recent cp or mv cmds."
else
    eval cd "$target"
fi

