confstatic () { 
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/length -n -t 'int' -s 100
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/length-adjust -n -t 'bool' -s true
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/mode -n -t 'int' -s 0
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/nrows -n -t 'int' -s 1
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/output-name -n -t 'string' -s "Primary"
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/size -n -t 'int' -s "22"
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/icon-size -n -t 'int' -s "20"
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/position -n -t 'string' -s 'p=8;x=0;y=0' 
xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size -n -t 'int' -s '30' 
xfconf-query -c xfce4-desktop -p /desktop-icons/show-tooltips -n -t 'bool' -s 'false' 
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -n -t 'bool' -s 'false' 
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -n -t 'bool' -s 'false' 
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -n -t 'bool' -s 'false' 
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -n -t 'bool' -s 'false' 
xfconf-query -c xfwm4 -p /general/button_layout -n -t 'string' -s 'OS|HMC' 
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/show-panel-label -n -t 'int' -s 0

##create arrays  
#default mainpanel plugin positions
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/plugin-ids -n -a -t int -s $menu -t int -s $clock -t int -s $launch -t int -s $pager -t int -s $tlist -t int -s $space -t int -s $stray -t int -s $sshot -t int -s $audio -t int -s $power -t int -s $notify -t int -s $action
#related to panel color
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/background-color -n -a -t int -s 0 -t int -s 65535 -t int -s 0 -t int -s 65535
xfconf-query -c xfce4-panel -p /panels/panel-$mainpanel/background-rgba -n -a -t int -s 1 -t int -s 1 -t int -s 1 -t int -s 0
#workspace names 
xfconf-query -c xfwm4 -p /general/workspace_names -n -a -t string -s 1 -t string -s 2 -t string -s 3 -t string -s 4
}

