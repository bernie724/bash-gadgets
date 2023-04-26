#### bash-gadgets

##### frun.sh
```sh
bernie@demeter:~/bash-gadgets$ ./frun.sh 
::Run a flatpak app by the apps shortname::
Usage: ./frun.sh <shortnameApp>
::List available apps::
Usage: ./frun.sh [list]
bernie@demeter:~/bash-gadgets$ ./frun.sh firefox
Running: org.mozilla.firefox 
bernie@demeter:~/bash-gadgets$ ./frun.sh list
Available apps: AbiWord,dragonsapprentice,Epiphany,ffmpeg-full,firefox,Shortwave
```

##### dudir.sh
```sh
##sub-directory disk usage summary of current working dir
bernie@demeter:/usr$ dudir.sh 
791M	bin
752K	games
213M	include
6.9G	lib
4.0K	lib32
4.0K	lib64
18M	libexec
4.0K	libx32
143G	local
20K	locale
61M	sbin
2.6G	share
435M	src
Total:  154G	.
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda6       308G  211G   82G  73% /
```

##### xubuntui/xubuntui.sh [xubuntui.tgz]
Installs flatpak as the primary apps manager on apt and dpkg systems, setup and tested on xubuntu mini.
##### archi/archi.sh [archi.tgz]
Installs full system/xfce4/flatpak (vm) system from the arch installer iso.

##### chtheme/chtheme.sh
CLI single panel theme changer/maker for xfce4

```sh
Usage: ./chtheme.sh <theme>
Available Themes: 
dark
etst
greenhall
nightsky
pastel
sampledark
samplelite
waterfall

Usage: ./mktheme.sh <theme>
bernie@demeter:~/bash-gadgets/chtheme$ ./mktheme.sh darkstar
Success: Use './chtheme.sh darkstar' to apply your theme
```
