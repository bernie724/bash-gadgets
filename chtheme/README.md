### Basic single panel xfce4 theme changer
#### Backup xfconf settings and panel before using. xfce4: Settings > Settings Manager > Panel ["Backup and Restore"]
##### After theme.conf is right. Use ./mktheme to create a theme to load.
```sh
##Install
git clone https://github.com/bernie724/bash-gadgets/
cd bash-gadgets/chtheme/
./getmonitors.sh 
Monitor Name: [Background] 
monitoreDP-1: xfce-verticals.png
monitorHDMI-2: 45jgm8.jpg
Connected: 
monitoreDP-1: connected
monitorHDMI-2: connected

##Change theme sample run
./chtheme.sh 
Usage: ./chtheme.sh <theme>
Available Themes: 
blackcat
darkspace
litebeach
redspider
./chtheme.sh redspider
current: [monitorHDMI-2]: #replace with the connected monitor
reset xfce [y/N] #reset will close xfce terminals, usually needed the first run 
Theme redspider loaded

##After the only desktop panel has been created (chtheme.sh run once) 
##items on the panel can be added, removed and/or moved when using mktheme.sh

##to create your own themes from a desktop setup (not everything is absorbed, only stuff I have got to)
#vim theme.conf and 
#change mon1="monitorHDMI-2" to a connected monitor
#change bgdir= to a backgrounds dir
#change your desktop to your a desired combination i.e. theme/font/style/bg
./mktheme.sh #creates a basic theme of the current desktop
Usage: ./mktheme.sh <theme>
./mktheme.sh blackcat
Success: Use './chtheme.sh blackcat' to apply your theme
```

1. blackcat
![darkcat](https://user-images.githubusercontent.com/20193396/234690865-b1d6e9b8-86db-4181-9037-be2acccf3d9b.png)
2. darkspace
![darkspace](https://user-images.githubusercontent.com/20193396/234690950-666134c7-96ef-4f1f-b4ac-8c9287593333.png)
3. redspider 
![redspider](https://user-images.githubusercontent.com/20193396/234690971-84c14d03-faaa-46ad-b91d-09027f4f6444.png)
4. litebeach
![litebeach](https://user-images.githubusercontent.com/20193396/234691109-3f7712b5-eacb-4452-bdd2-cefbd523d58d.png)

```sh
./chtheme.sh 
Usage: ./chtheme.sh <theme>
Available Themes: 
blackcat
darkspace
litebeach
redspider
./chtheme.sh litebeach
current: [monitorHDMI-2]: 
reset xfce [y/N] 
Theme litebeach loaded
```
