#!/bin/bash
#single panel xfce dark conf
mon1="monitorHDMI-2"
monc="$mon1"
bgdir=/usr/local/backgrounds
ssaver=false
listbg=false
echo "Active monitors:"
xfconf-query -c xfce4-desktop -l /backdrop/screen0/ | cut -d/ -f4 | sort -u | grep ^monitor > mon.txt
while read file; do
echo -n "$file: "; xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$file"/workspace0/last-image | rev | cut -d\/ -f1 | rev
done < mon.txt
echo "If the background doesn't update.
Change your monitor <mon1> in this script"
echo -n "current: [$mon1]: "; read monc
if [ -n "$monc" ]; then
mon1="$monc"
fi

#build bg array
if [ -d "$bgdir" ]; then
bi=()
for t in $(ls $bgdir); do
bi1=$(echo "$t ")
bi+=( $bi1 )
done 
else
echo "background directory does not exist!" && exit 1
fi

if [ "$listbg" = "true" ]; then
echo "Available backgrounds:"
echo ${bi[@]}
fi

##basic xfce desktop
bg1=blackout1.jpg
#bg1=$(echo ${bi[0]})
bg2=$(echo ${bi[32]})
bg3=$(echo ${bi[2]})
bg4=$(echo ${bi[3]})
xtty=$(tty | grep tty | head -1)
echo -n "$0 will reset xfce4 [y/n] "; read -n1 resetx
if [ "$resetx" = "y" ]; then
echo
echo -n "$0 configuring xfce4..."
xfconf-query -c xfce4-panel -p /panels -t int -s 1 -a 2> /dev/null
xfconf-query -c xfce4-desktop -p /backdrop/single-workspace-mode -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace0/last-image -n -t 'string' -s "$bgdir/$bg1" #2> /dev/null
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace1/last-image -n -t 'string' -s "$bgdir/$bg2" 2> /dev/null
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace2/last-image -n -t 'string' -s "$bgdir/$bg3" 2> /dev/null
xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$mon1"/workspace3/last-image -n -t 'string' -s "$bgdir/$bg4" 2> /dev/null
xfconf-query -c xfwm4 -p /general/double_click_action -n -t 'string' -s 'shade' 2> /dev/null
xfconf-query -c xfwm4 -p /general/workspace_count -n -t 'int' -s '4' 2> /dev/null
xfconf-query -c xsettings -p /Gtk/FontName -n -t 'string' -s "URW Gothic 10" 2> /dev/null
xfconf-query -c xsettings -p /Net/ThemeName -n -t 'string' -s 'Greybird-dark' 2> /dev/null
xfconf-query -c xsettings -p /Net/IconThemeName -n -t 'string' -s 'Kora' 2> /dev/null
xfconf-query -c xfce4-panel -p /panels/dark-mode -n -t 'bool' -s 'true' 2> /dev/null
xfconf-query -c xfce4-panel -p /panels/panel-1/leave-opacity -n -t 'int' -s '75' 2> /dev/null
xfconf-query -c xfce4-panel -p /panels/panel-1/enter-opacity -n -t 'int' -s '80' 2> /dev/null
xfconf-query -c xfce4-panel -p /panels/panel-1/position-locked -n -t 'bool' -s 'true' 2> /dev/null
xfconf-query -c xfce4-panel -p /panels/panel-1/autohide-behavior -n -t 'int' -s 0
xfconf-query -c xfce4-panel -p /panels/panel-1/background-image -n -t 'string' -s ""
xfconf-query -c xfce4-panel -p /panels/panel-1/background-style -n -t 'int' -s 1
xfconf-query -c xfce4-panel -p /panels/panel-1/length -n -t 'int' -s 100
xfconf-query -c xfce4-panel -p /panels/panel-1/length-adjust -n -t 'bool' -s true
xfconf-query -c xfce4-panel -p /panels/panel-1/mode -n -t 'int' -s 0
xfconf-query -c xfce4-panel -p /panels/panel-1/nrows -n -t 'int' -s 1
xfconf-query -c xfce4-panel -p /panels/panel-1/output-name -n -t 'string' -s "Primary"
xfconf-query -c xfce4-panel -p /panels/panel-1/background-style -t int -s 1
xfconf-query -c xfce4-desktop -p /desktop-icons/gravity -n -t 'int' -s '0' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/single-click -n -t 'bool' -s 'true' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size -n -t 'int' -s '30' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/show-tooltips -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-panel -p /panels/panel-1/position -n -t 'string' -s 'p=8;x=0;y=0' 2> /dev/null
xfconf-query -c xfwm4 -p /general/frame_opacity -n -t 'int' -s '65' 2> /dev/null
xfconf-query -c xfwm4 -p /general/inactive_opacity -n -t 'int' -s '85' 2> /dev/null
xfconf-query -c xfwm4 -p /general/move_opacity -n -t 'int' -s '90' 2> /dev/null
xfconf-query -c xfwm4 -p /general/move_opacity -n -t 'int' -s '75' 2> /dev/null
xfconf-query -c xfwm4 -p /general/resize_opacity -n -t 'int' -s '70' 2> /dev/null
xfconf-query -c xfwm4 -p /general/theme -n -t 'string' -s 'Wallis' 2> /dev/null
xfconf-query -c xfwm4 -p /general/button_layout -n -t 'string' -s 'OS|HMC' 2> /dev/null
xfconf-query -c xfce4-panel -p /plugins/plugin-2/middle-click -n -t 'int' -s '1' 2> /dev/null
xfconf-query -c xfce4-panel -p /plugins/plugin-2/grouping -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-panel -p /plugins/plugin-2/show-labels -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-panel -p /plugins/plugin-2/show-tooltip -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-screensaver -p /saver/enabled -n -t 'bool' -s ''$ssaver'' 2> /dev/null
#create arrays 
xfconf-query -c xfce4-panel -p /panels/panel-1/background-color -n -a -t int -s 0 -t int -s 65535 -t int -s 0 -t int -s 65535
xfconf-query -c xfce4-panel -p /panels/panel-1/background-rgba -n -a -t int -s 1 -t int -s 1 -t int -s 1 -t int -s 0
#config terminal dark
echo '
[Configuration]
FontUseSystem=TRUE
MiscAlwaysShowTabs=FALSE
MiscBell=FALSE
MiscBellUrgent=FALSE
MiscBordersDefault=TRUE
MiscCursorBlinks=FALSE
MiscCursorShape=TERMINAL_CURSOR_SHAPE_BLOCK
MiscDefaultGeometry=80x24
MiscInheritGeometry=FALSE
MiscMenubarDefault=TRUE
MiscMouseAutohide=TRUE
MiscMouseWheelZoom=TRUE
MiscToolbarDefault=FALSE
MiscConfirmClose=TRUE
MiscCycleTabs=TRUE
MiscTabCloseButtons=TRUE
MiscTabCloseMiddleClick=TRUE
MiscTabPosition=GTK_POS_TOP
MiscHighlightUrls=TRUE
MiscMiddleClickOpensUri=FALSE
MiscCopyOnSelect=FALSE
MiscShowRelaunchDialog=TRUE
MiscRewrapOnResize=TRUE
MiscUseShiftArrowsToScroll=FALSE
MiscSlimTabs=FALSE
MiscNewTabAdjacent=FALSE
MiscSearchDialogOpacity=100
MiscShowUnsafePasteDialog=FALSE
MiscRightClickAction=TERMINAL_RIGHT_CLICK_ACTION_CONTEXT_MENU
ColorForeground=#839496
ColorBackground=#002b36
ColorCursor=#93a1a1
ColorPalette=#073642;#dc322f;#859900;#b58900;#268bd2;#d33682;#2aa198;#eee8d5;#002b36;#cb4b16;#586e75;#657b83;#839496;#6c71c4;#93a1a1;#fdf6e3
ColorBold=#93a1a1
ColorBoldUseDefault=FALSE
TabActivityColor=#dc322f ' > ~/.config/xfce4/terminal/terminalrc
#cleanup
if [ -z "$xtty" ]; then
xfce4-panel -r /dev/null 2>&1 
xfwm4 --replace > /dev/null 2>&1 &
sleep .5
fi
echo "...done!"
sleep .5
##kill for terms
aterms=$(pgrep --newest xfce4-terminal)
kill $aterms
fi

