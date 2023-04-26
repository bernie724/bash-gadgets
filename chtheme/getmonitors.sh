#!/bin/bash
echo "Monitor Name: [Background] "
xfconf-query -c xfce4-desktop -l /backdrop/screen0/ | cut -d/ -f4 | sort -u | grep ^monitor > /tmp/mon.txt
while read file; do
echo -n "$file: "; xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$file"/workspace0/last-image | rev | cut -d\/ -f1 | rev
done < /tmp/mon.txt 
echo "Connected: "
xrandr | awk '{ print "monitor"$1":",$2 }' | grep connected | grep -v disconnected

