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
bs1=$(xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/background-style)
po1=$(xfconf-query -c xfwm4 -p /general/popup_opacity)
psl1=$(xfconf-query -c xfce4-panel -p /plugins/plugin-"$tlist"/show-labels) # -n -t 'bool' -s "$psl1"
dwm1=$(xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-mode)
ddg1=$(xfconf-query -c xfce4-desktop -p /desktop-icons/gravity)
bg1=$(xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace0/last-image | rev | cut -d\/ -f1 | rev)
if [ "$dwm1" = "false" ]; then
bg2=$(xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace1/last-image | rev | cut -d\/ -f1 | rev)
bg3=$(xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace2/last-image | rev | cut -d\/ -f1 | rev)
bg4=$(xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace3/last-image | rev | cut -d\/ -f1 | rev)
fi
##make the theme
if [ "$dwm1" = "true" ]; then
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
ddg1="'$ddg1'"
dwm1="'$dwm1'"
bg1="'$bg1'"
' > "$setdir"/"$set1" && echo -n "Success: "
elif [ "$dwm1" = "false" ]; then
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
ddg1="'$ddg1'"
dwm1="'$dwm1'"
bg1="'$bg1'"
bg2="'$bg2'"
bg3="'$bg3'"
bg4="'$bg4'"
' > "$setdir"/"$set1" && echo -n "Success: "
fi

##instruct usage
setshort=$(ls "$setdir"/"$set1" | cut -d\. -f1 | rev | cut -d\/ -f1 | rev)
echo "Use './chtheme.sh $setshort' to apply your theme"
