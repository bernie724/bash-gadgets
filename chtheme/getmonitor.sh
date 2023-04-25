#!/bin/bash
#basic xfce4 theme info
echo -n "Theme Name: "
xfconf-query -c xsettings -p /Net/ThemeName
echo -n "Icon Theme Name: "
xfconf-query -c xsettings -p /Net/IconThemeName
echo -n "Font Name: "
xfconf-query -c xsettings -p /Gtk/FontName
echo -n "Dark Mode: "
xfconf-query -c xfce4-panel -p /panels/dark-mode
echo
echo "Monitor Name: [Background] "
xfconf-query -c xfce4-desktop -l /backdrop/screen0/ | cut -d/ -f4 | sort -u | grep ^monitor > /tmp/mon.txt
while read file; do
echo -n "$file: "; xfconf-query -c xfce4-desktop -p /backdrop/screen0/"$file"/workspace0/last-image | rev | cut -d\/ -f1 | rev
done < /tmp/mon.txt 

