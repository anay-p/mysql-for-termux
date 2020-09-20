# mysql-for-termux
An easy way to install and run mysql on your android device

## Instructions
1. Install the Termux app from [Google Play](https://play.google.com/store/apps/details?id=com.termux).
2. Open the application.
3. Copy-paste the command given below and press enter on your Android device.
4. You will be asked to answer ```Do you want to continue? [Y/n]``` a bunch of times. Each time type in 'y' and press enter.
5. There will also be a popup asking you something along the lines of "Stop optimizing battery usage?". Press 'allow'.
6. Enter the command ```setpass``` and set a password (for the user _root_).
7. Enter the command ```mysql``` to start MySQL.
8. Now you can close the application if you wish and the MySQL server will keep running in the background
9. Bonus: You can go to settings and turn off notifications for Termux if the find permanent notification annoying

## Command
```
apt update && apt upgrade; pkg install wget; wget -O installer.sh "https://raw.githubusercontent.com/TheLastAirbendr/mysql-for-termux/master/installer.sh?token=AOELVOH2LMSKCQSZAA3MGIC7M6SEM"; chmod 755 installer.sh; ./installer.sh; source "/data/data/com.termux/files/usr/etc/bash.bashrc"; rm installer.sh
```
