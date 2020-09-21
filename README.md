# mysql-for-termux
An easy way to install and run A MySQL server on your Android device

## Instructions
1. Install the Termux app from [Google Play](https://play.google.com/store/apps/details?id=com.termux).
2. Open the application.
3. Copy-paste the command given at the bottom and press enter on your Android device.
4. Now wait. This will take some time.
5. You will be asked to answer ```Do you want to continue? [Y/n]``` a bunch of times. Each time type in 'y' and press enter.
6. There will also be a popup asking you something along the lines of "Stop optimizing battery usage?". Press 'allow'.
7. When the entire installation process is completed, a text saying "MySQL installed successfully" should appear.
8. Enter the command ```setpass``` and set a password (for the user _root_).
9. Enter the command ```mysql``` to start MySQL.
10. Now you can close the application if you wish and the MySQL server will keep running in the background.
11. Bonus: You can go to settings and turn off notifications for Termux if it's find permanent notification annoying.

## Command
```
apt update && apt upgrade; pkg install wget; wget -O installer.sh https://drive.google.com/uc?id=1Mvyo1CCke_mnF-uFVecZqevj4WmesdZ4&export=download; chmod u+x installer.sh; ./installer.sh; source "/data/data/com.termux/files/usr/etc/bash.bashrc"; rm installer.sh
```
