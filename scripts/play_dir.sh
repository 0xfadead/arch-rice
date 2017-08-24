#!/bin/bash

# Kills recent background job (ffmpeg)
# and then quits the session
ctrl_c() { kill %%; exit; }

trap ctrl_c INT

echo $filez
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -s|--shuffle)
	filez=$($filez | sort -R)
    shift # past argument
    ;;
    --default)
	#filez=$($filez | sort)
    DEFAULT=YES
    ;;
    *)
    ;;
esac
shift # past argument or value
done

filez=$(find . -maxdepth 1 -mindepth 1 -printf '%f\n')
for track in *; do
    echo "Starting track "; echo "$track"
    ffplay -nodisp -autoexit "$track"
done


