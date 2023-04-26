confstatic () { 
xfconf-query -c xfce4-panel -p /panels/panel-1/length -n -t 'int' -s 100
xfconf-query -c xfce4-panel -p /panels/panel-1/length-adjust -n -t 'bool' -s true
xfconf-query -c xfce4-panel -p /panels/panel-1/mode -n -t 'int' -s 0
xfconf-query -c xfce4-panel -p /panels/panel-1/nrows -n -t 'int' -s 1
xfconf-query -c xfce4-panel -p /panels/panel-1/output-name -n -t 'string' -s "Primary"
xfconf-query -c xfce4-panel -p /panels/panel-1/size -n -t 'int' -s "22"
xfconf-query -c xfce4-panel -p /panels/panel-1/icon-size -n -t 'int' -s "20"
xfconf-query -c xfce4-desktop -p /desktop-icons/single-click -n -t 'bool' -s 'true' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size -n -t 'int' -s '30' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/show-tooltips -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-filesystem -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -n -t 'bool' -s 'false' 2> /dev/null
xfconf-query -c xfwm4 -p /general/button_layout -n -t 'string' -s 'OS|HMC' 2> /dev/null
xfconf-query -c xfce4-panel -p /panels/panel-1/position -n -t 'string' -s 'p=8;x=0;y=0' 2> /dev/null

xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/show-panel-label -n -t 'int' -s 0
#create color arrays  
xfconf-query -c xfce4-panel -p /panels/panel-1/background-color -n -a -t int -s 0 -t int -s 65535 -t int -s 0 -t int -s 65535
xfconf-query -c xfce4-panel -p /panels/panel-1/background-rgba -n -a -t int -s 1 -t int -s 1 -t int -s 1 -t int -s 0
xfconf-query -c xfwm4 -p /general/workspace_names -n -a -t string -s 1 -t string -s 2 -t string -s 3 -t string -s 4
xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -n -a -t int -s 1 -t int -s 12 -t int -s 4 -t int -s 2 -t int -s 3 -t int -s 5 -t int -s 7 -t int -s 6 -t int -s 8 -t int -s 9 -t int -s 10 -t int -s 14 -t int -s 13
}

