# mysql-for-termux
**An easy way for students to install and run a MySQL server on their Android device.**  
  
Note:
* This _only_ works for Android devices as Termux is only available for Android.
* This is _only_ meant for learning purposes and must **not** be used for commercial purposes.

## Instructions
1. Install the Termux app from F-Droid [here](https://f-droid.org/packages/com.termux/).
2. Open the application, copy-paste the command given under the next heading and press enter on your Android device.  
Now the installation will begin. Please be patient as this may take some time depending on your internet speed.   
During installation, a popup will appear, asking you something along the lines of "Stop optimizing battery usage?" similar to the one shown below. Press 'allow' or equivalent.  
<img src="images/stop-optimizing-battery-usage.jpg" height="50%" width="50%" alt="Stop optimizing battery usage?"></img>  
Do not worry, this app does not consume much battery at all.
3. When the entire installation process is completed, a text saying "MySQL installed successfully" should appear at the end. Now, the MySQL server has started on your machine. Enter the command `setpass` and set a password (for the user _root_). Note that this can _only_ be done while the server is running.
4. Enter the command `start-client` to start the MySQL client or close the Termux application. The MySQL server will keep running in the background allowing you to use Python libraries like PyMySQL to connect to your databases through an app like Pydroid (avaialable on Google Play [here](https://play.google.com/store/apps/details/Pydroid_3_IDE_for_Python_3?id=ru.iiec.pydroid3)), which is a Python editor and compiler for Android.

#### Note:
You can also go to Settings and turn off notifications for Termux if you find its permanent notification bothersome.

## Command
This is the command to be entered in step 2:

```shell
yes | pkg upgrade && pkg in git python -y && cd && git clone "https://github.com/TheLastAirbendr/mysql-for-termux.git" && cd mysql-for-termux && python installer.py && source ~/../usr/etc/bash.bashrc
```

## Troubleshooting Errors
1. If you get any errors during or after installation, type into the Termux terminal (after the '$' symbol):
   ```
   cat logs.log
   ```
   and submit a screenshot of the output.
3. If you get the following error when you enter `setpass` or `start-client` into the terminal:  
  
   ```
   ERROR 2002 (HY000): Can't connect to local server through socket '/data/data/com.termux/files/usr/var/run/mysqld.sock' (2)
   ```  
   Type into the terminal the command `start-server` to start the MySQL server. You should get this output at the end: "MySQL server started". Now try using `setpass` / `start-client` again and everything should work normally.  
   If you are still getting errors anyway, then run the command `cat logs.log` and submit a screenshot of the output.
