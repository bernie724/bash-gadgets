#### Backup xfconf settings and panel before using. xfce4: Settings > Settings Manager > Panel ["Backup and Restore"]
##### After theme.conf is right. Use mktheme to create a theme to load.
```sh
#Install
git clone https://github.com/bernie724/bash-gadgets/
cd bash-gadgets/chtheme/
./getmonitors.sh 
Monitor Name: [Background] 
monitoreDP-1: xfce-verticals.png
monitorHDMI-2: 45jgm8.jpg
Connected: 
monitoreDP-1: connected
monitorHDMI-2: connected

#vim theme.conf and 
#change mon1="monitorHDMI-2" 
#change bgdir= to a backgrounds dir
./mktheme.sh #creates a basic theme of your current desktop
Usage: ./mktheme.sh <theme>
bernie@demeter:~/bash-gadgets/chtheme$ ./mktheme.sh blackcat
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
