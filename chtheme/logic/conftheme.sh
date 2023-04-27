#!/bin/bash
conftheme () {
##basic appearence settings 
xfconf-query -c xsettings -p /Gtk/CursorThemeName -r && sleep .5
xfconf-query -c xsettings -p /Gtk/CursorThemeName -n -t 'string' -s "$cn1"
xfconf-query -c xsettings -p /Gtk/FontName -n -t 'string' -s "$fn1"
xfconf-query -c xsettings -p /Net/ThemeName -n -t 'string' -s "$tn1"
xfconf-query -c xsettings -p /Net/IconThemeName -n -t 'string' -s "$in1"
xfconf-query -c xfwm4 -p /general/theme -n -t 'string' -s "$gt1"
##general theme settings
xfconf-query -c xfwm4 -p /general/workspace_count -n -t 'int' -s "$gwc1"
xfconf-query -c xfwm4 -p /general/popup_opacity -n -t 'int' -s "$po1"
xfconf-query -c xfwm4 -p /general/double_click_action -n -t 'string' -s "$gdc1"
xfconf-query -c xfwm4 -p /general/frame_opacity -n -t 'int' -s "$gfo1"
xfconf-query -c xfwm4 -p /general/inactive_opacity -n -t 'int' -s "$gio1"
xfconf-query -c xfwm4 -p /general/move_opacity -n -t 'int' -s "$gmo1"
xfconf-query -c xfwm4 -p /general/resize_opacity -n -t 'int' -s "$gro1"
##panel
xfconf-query -c xfce4-panel -p /panels/dark-mode -n -t 'bool' -s "$dm1"
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/background-style -n -t int -s "$bs1"
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/leave-opacity -n -t 'int' -s "$pll1"
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/enter-opacity -n -t 'int' -s "$ple1"
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/position-locked -n -t 'bool' -s "$ppl1"
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/autohide-behavior -n -t 'int' -s "$pab1"
##desktop
xfconf-query -c xfce4-desktop -p /desktop-icons/gravity -r && sleep .5 
xfconf-query -c xfce4-desktop -p /desktop-icons/gravity -n -t 'int' -s "$ddg1" 
xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-mode -n -t 'bool' -s "$dwm1"
xfconf-query -c xfce4-screensaver -p /saver/enabled -n -t 'bool' -s "$sse1"
}

confbackground () {
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace0/last-image -n -t 'string' -s "$bgdir/$bg1" 
if [ "$dwm1" = "false" ]; then
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon2"/workspace1/last-image -n -t 'string' -s "$bgdir/$bg2" 
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon3"/workspace2/last-image -n -t 'string' -s "$bgdir/$bg3" 
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon4"/workspace3/last-image -n -t 'string' -s "$bgdir/$bg4" 
fi
}

