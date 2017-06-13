#!/bin/bash

set -eu 
[[ -z "$(pgrep i3lock)" ]] || exit
i3lock -t -i ~/.config/i3/lockbg.png
sleep 1 
