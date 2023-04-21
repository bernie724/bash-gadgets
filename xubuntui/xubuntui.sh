#!/bin/bash
##script to install custom xfce settings and use flatpak as the main desktop apps manager on ubuntu [xubuntu mini]
##on xubuntu mini after install run as root or as an admin
admid=1000
if [ $UID -eq 0 ]; then
admin=$(id "$admid" | cut -d\( -f2 | cut -d\) -f1)
else
echo "$0 run as root after initial install only."
exit 1
fi
isadm=$(cat /etc/sudoers | grep ^$admin)
if [ -z "$isadm" ]; then
echo -n "Add $admin to sudoers as admin..."
echo "$admin ALL=NOPASSWD: ALL" >> /etc/sudoers && echo ".okay."
fi
echo -n "Update system repos..."
((apt update -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install updated editor..."
((apt install vim -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install system monitor..."
((apt install htop -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install another terminal..."
((apt install kitty -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install fortune..."
((apt install fortune-mod -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install tradtional network tools..."
((apt install net-tools -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install system summary tool..."
((apt install neofetch -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install backgrounds..."
((apt install mate-backgrounds -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Remove apps manager..."
((apt purge snapd -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Remove greeter..."
((apt purge lightdm -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Clean-up apt..."
((apt autoremove -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"

echo -n "Customize system..."
#echo "\d [\r]" > /etc/issue
#if [ -d /etc/update-motd.d ]; then
#mv /etc/update-motd.d /var/tmp
#fi
mv /home/$admin/.config/xfce4/ /home/$admin/.config/xfce4.$$.xubuntu && echo -n "."
mv /home/$admin/.profile /home/$admin/.profile.$$.xubuntu 
touch /home/$admin/.hushlogin
chown -R $admin /usr/local
if [ ! -h "/home/$admin/bin" ]; then
ln -s /usr/local/bin /home/$admin/bin 
fi
cp -p *.sh /home/$admin/bin && rm /home/$admin/bin/$0
cp -p .profile /home/$admin 
cp -rp /usr/share/backgrounds/mate/abstract/* /usr/share/backgrounds/mate/nature/
cp -rp xfce4 /home/$admin/.config/ && echo ".okay."
chown -R $admin /home/$admin
echo -n "Install flatpak..."
((apt install flatpak -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install flatpak repo..."
(flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo > /dev/null 2>&1) && echo ".okay."
flist=flist.set
## isntall flatpaks from a list
echo "Installing flatpak apps from [$PWD/$flist]: "
fnum=$(cat "$flist" | wc -l)
while read set; do
shortset=$(echo "$set" | rev | cut -d. -f1 | rev | cut -d/ -f1)
echo -n "[$fnum] Installing $shortset..."
((flatpak install --noninteractive -y "$set" > /dev/null 2>&1) && echo ".okay.") || (flatpak install --noninteractive -y --or-update "$set" > /dev/null 2>&1 && echo ".retry okay.") || echo "...retry failed!"
let fnum--
done < "$flist"

echo -n "Install commercial software [y/N] "; read -n1 installcom
if [ "$installcom" = "Y" -o "$installcom" = "y" ]; then
echo
fpplist=fpplist.set
echo "Installing flatpak apps from [$PWD/$flist]: "
fnum=$(cat "$fpplist" | wc -l)
while read set; do
shortset=$(echo "$set" | rev | cut -d. -f1 | rev | cut -d/ -f1)
echo -n "[$fnum] Installing $shortset..."
((flatpak install --noninteractive -y "$set" > /dev/null 2>&1) && echo ".okay.") || (flatpak install --noninteractive -y --or-update "$set" > /dev/null 2>&1 && echo ".retry okay.") || echo "...retry failed!"
let fnum--
done < "$fpplist"
fi
echo
echo "bin scripts:"
ls /home/$admin/bin
echo -n "reboot [y/N] "; read -n1 rebootnow
if [ "$rebootnow" = "Y" -o "$rebootnow" = "y" ]; then
reboot
fi
