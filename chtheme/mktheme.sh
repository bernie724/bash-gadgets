#!/bin/bash
mon1=monitorHDMI-2
setdir="$PWD/sets"
set="$1.set"
if [ -z "$1" ]; then
echo "Usage: $0 <theme>"
exit
fi
if [ -f "sets/$set" ]; then
echo "$set not unique"
echo -n "overwrite [y/N] "; read -n1 over
if [ "$over" != "y" ]; then
echo "Usage: $0 <theme>"
exit
fi
echo
fi
gt1=$(xfconf-query -c xfwm4 -p /general/theme) # -n -t 'string' -s "'$gt1'"
tn1=$(xfconf-query -c xsettings -p /Net/ThemeName)
in1=$(xfconf-query -c xsettings -p /Net/IconThemeName)
cn1=$(xfconf-query -c xsettings -p /Gtk/CursorThemeName)
fn1=$(xfconf-query -c xsettings -p /Gtk/FontName)
dm1=$(xfconf-query -c xfce4-panel -p /panels/dark-mode)
bs1=$(xfconf-query -c xfce4-panel -p /panels/panel-1/background-style)
po1=$(xfconf-query -c xfwm4 -p /general/popup_opacity)
bg1=$(xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace0/last-image | rev | cut -d\/ -f1 | rev)
echo '#set '"$set"'
gt1="'$gt1'"
tn1="'$tn1'"
in1="'$in1'"
cn1="'$cn1'"
fn1="'$fn1'"
dm1="'$dm1'"
bs1="'$bs1'"
po1="'$po1'"
bg1="'$bg1'"
' > "$setdir"/"$set" && echo -n "Success: "
setshort=$(ls "$setdir"/"$set" | cut -d\. -f1 | rev | cut -d\/ -f1 | rev)
echo "Use './chtheme.sh $setshort' to apply your theme"
