#!/bin/bash
#B.Thompson
##load theme.conf
source theme.conf
##load the functions
source logic/usage.sh
source logic/defaulttheme.sh
source logic/conftheme.sh
source logic/confstatic.sh
source logic/conftheme.sh
source logic/checktheme.sh
source logic/resettheme.sh
##simple single panel desktop changer; reads files created with mktheme.sh in sets dir
if [ -f sets/"$set1" ]; then
defaulttheme
source sets/"$set1"
monc="$mon1"
echo -n "current: [$mon1]: "; read monc
 if [ -n "$monc" ]; then
 mon1="$monc"
 fi
## panel 1 and only
xfconf-query -c xfce4-panel -p /panels -t int -s 1 -a 2> /dev/null
confstatic
conftheme
confplugins
confbackground
echo -n "reset xfce [y/N] "; read -n1 resetxf; echo
 if [ "$resetxf" = "y" -o "$resetxf" = "Y" ]; then
 #checktheme #verify
 resettheme
 else
echo "Theme $theme loaded"
 #checktheme
 fi
elif [ -z $theme ]; then
chusage
else
echo "$theme is not a theme"
chusage
fi
