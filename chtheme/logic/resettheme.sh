#!/bin/bash
resettheme () {
echo
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
echo ".okay/bye!"
}

