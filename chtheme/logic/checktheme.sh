#!/bin/bash
checktheme () {
#basic xfce4 theme info
aline
echo "$gt1, $tn1, $in1, $cn1, $fn1, $dm1, $bs1, $po1"
aline
gt1=$(xfconf-query -c xfwm4 -p /general/theme) # -n -t 'string' -s "'$gt1'"
tn1=$(xfconf-query -c xsettings -p /Net/ThemeName)
in1=$(xfconf-query -c xsettings -p /Net/IconThemeName)
cn1=$(xfconf-query -c xsettings -p /Gtk/CursorThemeName)
fn1=$(xfconf-query -c xsettings -p /Gtk/FontName)
dm1=$(xfconf-query -c xfce4-panel -p /panels/dark-mode)
bs1=$(xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/background-style)
po1=$(xfconf-query -c xfwm4 -p /general/popup_opacity)
echo "gt1=\"$gt1\""
echo "tn1=\"$tn1\""
echo "in1=\"$in1\""
echo "cn1=\"$cn1\""
echo "fn1=\"$fn1\""
echo "dm1=\"$dm1\""
echo "bs1=\"$bs1\""
echo "po1=\"$po1\""
echo "bg1=\"$bg1\""
aline
}

