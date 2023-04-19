#!/bin/bash
##script to install custom xfce settings and use flatpak as the main desktop apps manager on ubuntu [xubuntu mini]
##on xubuntu mini after install run as root or as an admin
admid=1000
admin=$(id "$admid" | cut -d\( -f2 | cut -d\) -f1)
if [ $UID -eq 0 ]; then
isadm=$(cat /etc/sudoers | grep ^$admin)
if [ -z "$isadm" ]; then
echo -n "Add $admin to sudoers as admin..."
echo "$admin ALL=NOPASSWD: ALL" >> /etc/sudoers && echo ".okay."
fi
fi
echo -n "Update apt..."
((sudo apt update -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install vim..."
((sudo apt install vim -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install htop..."
((sudo apt install htop -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install kitty term..."
((sudo apt install kitty -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install tradtional network tools..."
((sudo apt install net-tools -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Remove apps manager..."
((sudo apt purge snapd -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Remove splashscreen..."
((sudo apt purge plymouth -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Remove greeter..."
((sudo apt purge lightdm -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install backgrounds..."
((sudo apt install mate-backgrounds -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Clean-up apt..."
((sudo apt autoremove -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Custromize system..."
mv /home/$admin/.config/xfce4/ ~/.config/xfce4.$$.xubuntu && echo -n "."
mv /home/$admin/.profile ~/.profile.$$.xubuntu 
sudo chown -R $admin /usr/local
if [ ! -h "/home/$admin/bin" ]; then
ln -s /usr/local/bin /home/$admin/bin 
fi
cp -p *.sh /home/$admin/bin && rm /home/$admin/bin/$0
cp -p .profile /home/$admin 
sudo cp -rp /usr/share/backgrounds/mate/abstract/* /usr/share/backgrounds/mate/nature/
cp -rp xfce4 /home/$admin/.config/ && echo ".okay."
echo -n "Install flatpak..."
((sudo apt install flatpak -y > /dev/null 2>&1) && echo ".okay.") || echo ".failed!"
echo -n "Install flatpak repo..."
(sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo > /dev/null 2>&1) && echo ".okay."
flist=flist.set
## isntall flatpaks from a list
echo "Installing flatpak apps from [$PWD/$flist]: "
fnum=$(cat "$flist" | wc -l)
while read set; do
shortset=$(echo "$set" | rev | cut -d. -f1 | rev | cut -d/ -f1)
echo -n "[$fnum] Installing $shortset..."
((sudo flatpak install --noninteractive -y "$set" > /dev/null 2>&1) && echo ".okay.") || (sudo flatpak install --noninteractive -y --or-update "$set" > /dev/null 2>&1 && echo ".retry okay.") || echo "...retry failed!"
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
((sudo flatpak install --noninteractive -y "$set" > /dev/null 2>&1) && echo ".okay.") || (sudo flatpak install --noninteractive -y --or-update "$set" > /dev/null 2>&1 && echo ".retry okay.") || echo "...retry failed!"
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
