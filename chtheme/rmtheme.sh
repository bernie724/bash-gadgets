#!/bin/bash
theme="$1"
set1="$theme.set"
setdir="$PWD/sets"
if [ -n "$theme" ]; then
 if [ -f "$setdir/$set1" ]; then
 rm "$setdir/$set" && echo "theme "$theme" removed"
 else
 echo "no set $setdir/$set1"
 fi
else
echo "$0 removes a theme"
echo "Usage: $0 <theme>"
echo "Themes: " 
cd "$setdir"; ls -1 | grep \\.set | cut -d\. -f1
fi
