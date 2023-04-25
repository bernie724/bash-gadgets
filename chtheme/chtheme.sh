#!/bin/bash
theme="$1"
mon1="monitorHDMI-2"
bgdir=/usr/local/backgrounds
bg1=none #set in each theme function
set="$theme.set"

usage () {
echo "Usage: $0 <theme>"
echo "Available Themes: " 
cd sets; ls -1 | grep \\.set | cut -d\. -f1
}

if [ -z "$theme" ]; then
usage
exit 1
fi

chtheme () {
monc="$mon1"
echo -n "current: [$mon1]: "; read monc
if [ -n "$monc" ]; then
mon1="$monc"
fi
xfconf-query -c xfce4-panel -p /panels -t int -s 1 -a 2> /dev/null #panel 1 and only
confstatic
conftheme
confbackground
echo -n "reset xfce [y/N] "; read -n1 resetxf
if [ "$resetxf" = "y" -o "$resetxf" = "Y" ]; then
checktheme
resettheme
else
checktheme
fi
}

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
bs1=$(xfconf-query -c xfce4-panel -p /panels/panel-1/background-style)
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

conftheme () {
xfconf-query -c xsettings -p /Gtk/CursorThemeName -r
xfconf-query -c xsettings -p /Gtk/CursorThemeName -n -t 'string' -s "$cn1"
xfconf-query -c xsettings -p /Gtk/FontName -n -t 'string' -s "$fn1"
xfconf-query -c xsettings -p /Net/ThemeName -n -t 'string' -s "$tn1" 
xfconf-query -c xfwm4 -p /general/theme -n -t 'string' -s "$gt1" 
xfconf-query -c xsettings -p /Net/IconThemeName -n -t 'string' -s "$in1"
xfconf-query -c xfce4-panel -p /panels/dark-mode -n -t 'bool' -s "$dm1" 
xfconf-query -c xfce4-panel -p /panels/panel-1/background-style -t int -s "$bs1" 
xfconf-query -c xfwm4 -p /general/popup_opacity -n -t 'int' -s "$po1" 
xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-mode -n -t 'bool' -s "$dwm1"
xfconf-query -c xfwm4 -p /general/double_click_action -n -t 'string' -s "$gdc1"
xfconf-query -c xfwm4 -p /general/workspace_count -n -t 'int' -s "$gwc1"
xfconf-query -c xfwm4 -p /general/frame_opacity -n -t 'int' -s "$gfo1"
xfconf-query -c xfwm4 -p /general/inactive_opacity -n -t 'int' -s "$gio1"
xfconf-query -c xfwm4 -p /general/move_opacity -n -t 'int' -s "$gmo1"
xfconf-query -c xfwm4 -p /general/resize_opacity -n -t 'int' -s "$gro1"
xfconf-query -c xfce4-panel -p /panels/panel-1/leave-opacity -n -t 'int' -s "$pll1"
xfconf-query -c xfce4-panel -p /panels/panel-1/enter-opacity -n -t 'int' -s "$ple1"
xfconf-query -c xfce4-panel -p /panels/panel-1/position-locked -n -t 'bool' -s "$ppl1"
xfconf-query -c xfce4-panel -p /panels/panel-1/autohide-behavior -n -t 'int' -s "$pab1"
xfconf-query -c xfce4-screensaver -p /saver/enabled -n -t 'bool' -s "$sse1"
}

confbackground () {
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace0/last-image -n -t 'string' -s "$bgdir/$bg1" #2> /dev/null
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace1/last-image -n -t 'string' -s "$bgdir/$bg2" 2> /dev/null
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace2/last-image -n -t 'string' -s "$bgdir/$bg3" 2> /dev/null
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace3/last-image -n -t 'string' -s "$bgdir/$bg4" 2> /dev/null
}

defaulttheme () {
##var
gt1="Greybird"
tn1="Greybird"
fn1="URW Gothic 10"
in1="elementary Xfce"
cn1="elementary"
dm1="false"
bs1="0"
po1="99"
bg1="darkmnt.jpg"

dwm1="true"
gdc1="shade"
gwc1="2"
gfo1="85"
gio1="90"
gmo1="95"
gro1="80"
pll1="90"
ple1="95"
ppl1="true"
pab1="0"
sse1="false"
}


confstatic () { 
xfconf-query -c xfce4-panel -p /panels/panel-1/length -n -t 'int' -s 100
xfconf-query -c xfce4-panel -p /panels/panel-1/length-adjust -n -t 'bool' -s true
xfconf-query -c xfce4-panel -p /panels/panel-1/mode -n -t 'int' -s 0
xfconf-query -c xfce4-panel -p /panels/panel-1/nrows -n -t 'int' -s 1
xfconf-query -c xfce4-panel -p /panels/panel-1/output-name -n -t 'string' -s "Primary"
xfconf-query -c xfce4-desktop -p /desktop-icons/gravity -n -t 'int' -s '0' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/single-click -n -t 'bool' -s 'true' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size -n -t 'int' -s '30' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/show-tooltips -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfwm4 -p /general/button_layout -n -t 'string' -s 'OS|HMC' 2> /dev/null
xfconf-query -c xfce4-panel -p /panels/panel-1/position -n -t 'string' -s 'p=8;x=0;y=0' 2> /dev/null
xfconf-query -c xfce4-panel -p /plugins/plugin-2/middle-click -n -t 'int' -s '1' 2> /dev/null
xfconf-query -c xfce4-panel -p /plugins/plugin-2/grouping -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-panel -p /plugins/plugin-2/show-labels -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-panel -p /plugins/plugin-2/show-tooltip -n -t 'bool' -s 'false' 2> /dev/null
#create arrays 
xfconf-query -c xfce4-panel -p /panels/panel-1/background-color -n -a -t int -s 0 -t int -s 65535 -t int -s 0 -t int -s 65535
xfconf-query -c xfce4-panel -p /panels/panel-1/background-rgba -n -a -t int -s 1 -t int -s 1 -t int -s 1 -t int -s 0
}

resettheme () {
echo
aline
echo -n "Reconfiguring xfce4 wait.."
xfce4-panel -q > /dev/null 2>&1 
sleep 1 && echo -n "." 
pkill xfconfd > /dev/null 2>&1
sleep 1 && echo -n "." 
(xfce4-panel &) > /dev/null 2>&1
sleep 5 && echo -n "."
xfce4-panel -r > /dev/null 2>&1
echo ".okay."
echo -n "closing xfce4 terminals.."
aterms=$(pgrep --newest xfce4-terminal)
sleep 2
kill $aterms > /dev/null 2>&1
echo ".okay/bye!."
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

if [ -f sets/"$set" ]; then
defaulttheme
source sets/"$set"
chtheme
else
echo "$theme is not a theme"
usage
fi
