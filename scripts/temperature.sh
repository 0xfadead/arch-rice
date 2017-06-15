#!/bin/bash 

IFS='\n'
CORE="$1"
LINE=$(sensors | grep "${CORE}")
TEMPS=$(echo "${LINE}" | egrep -o '[0-9]+\.[0-9]') 

CUR=$(echo ${TEMPS} | head -1 | tail -1)
MAX=$(echo ${TEMPS} | head -2 | tail -1)
CRT=$(echo ${TEMPS} | head -3 | tail -1)

echo ${CUR}

exit 0
