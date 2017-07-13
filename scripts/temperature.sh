#!/bin/bash 

IFS='\n'
CORE="$1"
LINE=$(sensors | grep "$CORE")

# Lookahead keeps numbers ints 
TEMPS=$(echo "$LINE" | grep -Po '[0-9]+(?=\.)') 

CUR=$(echo $TEMPS | head -1 | tail -1)
MAX=$(echo $TEMPS | head -2 | tail -1)
CRT=$(echo $TEMPS | head -3 | tail -1)

echo $CUR% # short text
echo $CUR% # long text

if [ "$CUR" -ge "$MAX" -o "$CUR" -ge "$CRT" ]; then
    echo "#FF0000"
fi

exit 0
