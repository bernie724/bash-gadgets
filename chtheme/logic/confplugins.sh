#!/bin/bash
confplugins () {
##create panel 1 array
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/plugin-ids -n -a -t int -s $menu -t int -s $clock -t int -s $launch -t int -s $pager -t int -s $tlist -t int -s $space -t int -s $stray -t int -s $sshot -t int -s $audio -t int -s $power -t int -s $notify -t int -s $action

##create plugins
xfconf-query -c xfce4-panel -p /plugins/plugin-$menu -n -t 'string' -s "applicationsmenu"
xfconf-query -c xfce4-panel -p /plugins/plugin-$clock -n -t 'string' -s "clock"
xfconf-query -c xfce4-panel -p /plugins/plugin-$pager -n -t 'string' -s "pager"
xfconf-query -c xfce4-panel -p /plugins/plugin-$tlist -n -t 'string' -s "tasklist"
xfconf-query -c xfce4-panel -p /plugins/plugin-$space -n -t 'string' -s "separator"
xfconf-query -c xfce4-panel -p /plugins/plugin-$stray -n -t 'string' -s "systray"
xfconf-query -c xfce4-panel -p /plugins/plugin-$sshot -n -t 'string' -s "screenshooter"
xfconf-query -c xfce4-panel -p /plugins/plugin-$audio -n -t 'string' -s "pulseaudio"
xfconf-query -c xfce4-panel -p /plugins/plugin-$power -n -t 'string' -s "power-manager-plugin"
xfconf-query -c xfce4-panel -p /plugins/plugin-$notify -n -t 'string' -s "notification-plugin"
xfconf-query -c xfce4-panel -p /plugins/plugin-$launch -n -t 'string' -s "launcher"
xfconf-query -c xfce4-panel -p /plugins/plugin-$action -n -t 'string' -s "actions"

##create launcher array
xfconf-query -c xfce4-panel -p /plugins/plugin-$launch/items -n -a -t string -s "xfce4-terminal-emulator.desktop" -t string -s "xfce4-web-browser.desktop" -t string -s "xfce4-file-manager.desktop" #-t string -s "xfce4-settings-manager.desktop" 
##create actions icons
xfconf-query -c xfce4-panel -p /plugins/plugin-$action/items -n -a -t string -s "+lock-screen" -t string -s "-switch-user" -t string -s "-separator" -t string -s "-suspend" -t string -s "-hibernate" -t string -s "-hybrid-sleep" -t string -s "-separator" -t string -s "-shutdown" -t string -s "-restart" -t string -s "-separator" -t string -s "+logout" -t string -s "-logout-dialog"
##create tasklist properties
xfconf-query -c xfce4-panel -p /plugins/plugin-$tlist/middle-click -n -t 'int' -s '1' 
xfconf-query -c xfce4-panel -p /plugins/plugin-$tlist/grouping -n -t 'bool' -s 'false' 
xfconf-query -c xfce4-panel -p /plugins/plugin-$tlist/show-tooltip -n -t 'bool' -s 'false' 
xfconf-query -c xfce4-panel -p /plugins/plugin-$tlist/show-labels -n -t 'bool' -s "$psl1" 
xfconf-query -c xfce4-panel -p /plugins/plugin-$space/expand -n -t 'bool' -s "true"
xfconf-query -c xfce4-panel -p /plugins/plugin-$space/style -n -t 'int' -s "0"
##workspace changer properties
xfconf-query -c xfce4-panel -p /plugins/plugin-$pager/rows -n -t 'int' -s "1" 
xfconf-query -c xfce4-panel -p /plugins/plugin-$pager/miniature-view -n -t 'bool' -s "false" 
##clock setup
xfconf-query -c xfce4-panel -p /plugins/plugin-$clock/mode -n -t 'int' -s "0" 
xfconf-query -c xfce4-panel -p /plugins/plugin-$clock/tooltip-format -n -t string -s "%T"
##menu properties
xfconf-query -c xfce4-panel -p /plugins/plugin-$menu/button-icon -n -t 'string' -s "xfce4_xicon3" 
xfconf-query -c xfce4-panel -p /plugins/plugin-$menu/button-title -n -t 'string' -s "Menu" 
xfconf-query -c xfce4-panel -p /plugins/plugin-$menu/show-button-title -n -t 'bool' -s "true" 
xfconf-query -c xfce4-panel -p /plugins/plugin-$menu/show-generic-names -n -t 'bool' -s "true" 
xfconf-query -c xfce4-panel -p /plugins/plugin-$menu/show-tooltips -n -t 'bool' -s "false" 
xfconf-query -c xfce4-panel -p /plugins/plugin-$action/appearance -n -t int -s 0

##testing
#xfconf-query -c xfce4-panel -p /plugins/plugin-14 -n -t 'string' -s "actions" 
#xfconf-query -c xfce4-panel -p /plugins/plugin-$ppc1 -n -t 'string' -s "clock" 
#xfconf-query -c xfce4-panel -p /plugins/plugin-11 -r 
#xfconf-query -c xfce4-panel -p /plugins/plugin-11 -n -t 'string' -s "launcher"
#panel plugin arrays
#xfconf-query -c xfce4-panel -p /plugins/plugin-7 -n -t string -s screenshooter
#action array buttons on or off
#terminal shortcuts
#xfconf-query -c xfce4-panel -p /plugins/plugin-$launch -r
#xfconf-query -c xfce4-panel -p /plugins/plugin-11/items -n -a -t string -s "16825475001.desktop" -t string -s "16825475722.desktop"
}