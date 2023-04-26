#!/bin/bash
chusage () {
echo "Usage: $0 <theme>"
echo "Available Themes: " 
cd "$setdir"; ls -1 | grep \\.set | cut -d\. -f1
}

mkusage () {
if [ -z "$theme" ]; then
echo "Usage: $0 <theme>"
exit
fi
if [ -f "sets/$set1" ]; then
echo "$set1 not unique"
echo -n "overwrite [y/N] "; read -n1 over
if [ "$over" != "y" ]; then
echo "Usage: $0 <theme>"
exit
fi
echo
fi
}


##a line
aline () {
ctype="~"
clen=80
until [ $clen -le 0 ]
do
echo -n "$ctype"
((clen--))
done
echo
}

