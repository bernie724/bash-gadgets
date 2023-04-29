#!/bin/bash
source theme.conf
source logic/resettheme.sh
source logic/conftheme.sh
bgdir=/usr/share/backgrounds/xfce
dwm1=true
bg1=xfce-blue.jpg
echo -n "Removing chtheme panels and plugins."
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$menu > /dev/null 2>&1 && echo -n ".") || echo -n "!" 
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$clock > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$pager > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$tlist > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$space > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$stray > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$sshot > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$audio > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$power > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$notify > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$launch > /dev/null 2>&1 && echo -n ".") || echo -n "!"
(xfconf-query -c xfce4-panel -r -R -p /plugins/plugin-$action > /dev/null 2>&1 && echo -n ".") || echo -n "!"
sleep .5
(xfconf-query -c xfce4-panel -r -R -p /panels/panel-$mainpanel > /dev/null 2>&1 && echo -n ".") || echo -n "!"
sleep .5
(xfconf-query -c xfce4-panel -p /panels -a -t int -s 1 -t int -s 2 > /dev/null 2>&1 && echo -n ".") || echo -n "!"
sleep .5
(xfce4-panel -r > /dev/null 2>&1 && echo -n ".") || echo -n "!"
sleep .5
echo ".okay."
confbackground
resettheme
