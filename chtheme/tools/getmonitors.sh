#!/bin/bash
montmp=$PWD/mon.dat
echo "Monitor Name: [Background] "
xfconf-query -c xfce4-desktop -l /backdrop/screen0/ | cut -d/ -f4 | sort -u | grep ^monitor > "$montmp" 
while read file; do
echo -n "$file: "; xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$file"/workspace0/last-image | rev | cut -d\/ -f1 | rev
done < "$montmp" 
echo "Connected: "
xrandr | awk '{ print "monitor"$1":",$2 }' | grep connected | grep -v disconnected
rm "$montmp"
