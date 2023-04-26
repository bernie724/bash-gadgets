#!/bin/bash
##load theme.conf
source theme.conf
##load usage
source logic/usage.sh
mkusage
##get the basic current theme settings
gt1=$(xfconf-query -c xfwm4 -p /general/theme) # -n -t 'string' -s "'$gt1'"
tn1=$(xfconf-query -c xsettings -p /Net/ThemeName)
in1=$(xfconf-query -c xsettings -p /Net/IconThemeName)
cn1=$(xfconf-query -c xsettings -p /Gtk/CursorThemeName)
fn1=$(xfconf-query -c xsettings -p /Gtk/FontName)
dm1=$(xfconf-query -c xfce4-panel -p /panels/dark-mode)
bs1=$(xfconf-query -c xfce4-panel -p /panels/panel-1/background-style)
po1=$(xfconf-query -c xfwm4 -p /general/popup_opacity)
psl1=$(xfconf-query -c xfce4-panel -p /plugins/plugin-"$ppb1"/show-labels) # -n -t 'bool' -s "$psl1"
bg1=$(xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace0/last-image | rev | cut -d\/ -f1 | rev)
ddg1=$(xfconf-query -c xfce4-desktop -p /desktop-icons/gravity)
##make the theme
echo '#set '"$set1"'
gt1="'$gt1'"
tn1="'$tn1'"
in1="'$in1'"
cn1="'$cn1'"
fn1="'$fn1'"
dm1="'$dm1'"
bs1="'$bs1'"
po1="'$po1'"
psl1="'$psl1'"
bg1="'$bg1'"
ddg1="'$ddg1'"
' > "$setdir"/"$set1" && echo -n "Success: "
##instruct usage
setshort=$(ls "$setdir"/"$set1" | cut -d\. -f1 | rev | cut -d\/ -f1 | rev)
echo "Use './chtheme.sh $setshort' to apply your theme"
