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

##### finstset.sh
```sh
bernie@demeter:~/bash-gadgets$ ./finstset.sh 
./finstset.sh installs flatpak apps from a list
Usage: ./finstset.sh <file.set>
test.set
bernie@demeter:~/bash-gadgets$ ./finstset.sh test.set
Installing runtime/org.kde.kstars.Locale/x86_64/stable
Installing app/org.kde.kstars/x86_64/stable
...

```

