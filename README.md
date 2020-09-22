# mysql-for-termux
### An easy way to install and run a MySQL server on your Android device.
**Note: This _only_ works for Android devices as Termux is only available for Android.**

## Instructions
1. Install the Termux app from Google Play [here](https://play.google.com/store/apps/details?id=com.termux).
2. Open the application, copy-paste the command given under the next heading and press enter on your Android device. Now the installation will being. Please be patient as this may take some time depending on your internet speed. You will be asked to answer ```Do you want to continue? [Y/n]``` upto three times. Each time type in 'y' and press enter. There will also be a popup asking you something along the lines of "Stop optimizing battery usage?". Press 'allow' or equivalent.
3. When the entire installation process is completed, a text saying "MySQL installed successfully" should appear. Enter the command ```setpass``` and set a password (for the user _root_).
4. Enter the command ```mysql``` to start MySQL.

#### Note:
1. Now you can close the application if you wish and the MySQL server will keep running in the background allowing you to use Python libraries like pymysql to connect to your databases through an app like Pydroid (avaialable on Google Play [here](https://play.google.com/store/apps/details/Pydroid_3_IDE_for_Python_3?id=ru.iiec.pydroid3)), which is a Python editor and compiler for Android.
2. You can also go to Settings and turn off notifications for Termux if you find its permanent notification bothersome.

## Command
This is the command to be entered in step 3:

> apt update && apt upgrade; pkg install wget; wget -O installer.sh "https://drive.google.com/uc?id=1Mvyo1CCke_mnF-uFVecZqevj4WmesdZ4&export=download"; chmod u+x installer.sh; ./installer.sh; source "/data/data/com.termux/files/usr/etc/bash.bashrc"; rm installer.sh; echo "MySQL installed successfully"


## Errors
If you get any errors during or after installation, type into the Termux terminal (after the '$' symbol):
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
