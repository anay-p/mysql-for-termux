# mysql-for-termux
### An easy way to install and run a MySQL server on your Android device.
**Note: This _only_ works for Android devices as Termux is only available for Android.**

## Instructions
1. Install the Termux app from [Google Play](https://play.google.com/store/apps/details?id=com.termux).
2. Open the application.
3. Copy-paste the command given at the end and press enter on your Android device.
4. Now wait. This will take some time.
5. You will be asked to answer ```Do you want to continue? [Y/n]``` upto three times. Each time type in 'y' and press enter.
6. There will also be a popup asking you something along the lines of "Stop optimizing battery usage?". Press 'allow' or equivalent.
7. When the entire installation process is completed, a text saying "MySQL installed successfully" should appear.
8. Enter the command ```setpass``` and set a password (for the user _root_).
9. Enter the command ```mysql``` to start MySQL.
10. Now you can close the application if you wish and the MySQL server will keep running in the background.
11. Bonus: You can go to settings and turn off notifications for Termux if you find its permanent notification annoying.

## Command
This is the command to be entered in step 3:
```shell
apt update && apt upgrade; pkg install wget; wget -O installer.sh "https://drive.google.com/uc?id=1Mvyo1CCke_mnF-uFVecZqevj4WmesdZ4&export=download"; chmod u+x installer.sh; ./installer.sh; source "/data/data/com.termux/files/usr/etc/bash.bashrc"; rm installer.sh; echo "MySQL installed successfully"
```

## Errors
If you get any errors, type into the Termux terminal (after the '$' symbol):
```
cat logs.log
```
and submit a screenshot of the output.

## Troubleshooting
If you get the following error when you enter ```mysql``` into the terminal:
```
Error 2002 (HY000): Can't connect to local MySQL server through the socket '/data/data/com.termux/files/usr/tmp/mysqld.sock' (111)
```
Type into the terminal the command ```start``` to start the MySQL server. You should get the output: "MySQL server started".
Now try using ```mysql``` again and everything should work normally.
