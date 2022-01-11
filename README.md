# mysql-for-termux
**An easy way for students to install and run a MySQL server on their Android device.**

Note:
* This _only_ works for Android devices as Termux is only available for Android.
* This is _only_ meant for learning purposes and must **not** be used for commercial purposes.

## Instructions
1. Install the Termux app from F-Droid [here](https://f-droid.org/packages/com.termux/).
2. Open the application, copy-paste the command given in the next section and press enter. Now the installation will begin. Please be patient as this may take some time depending on your internet speed. During installation, a popup similar to the one shown below will appear, asking you something along the lines of "Stop optimizing battery usage?". Press 'allow' or equivalent. This is required so that the MySQL server can keep running in the background even when the Termux app is closed.
<br><img src="https://user-images.githubusercontent.com/59292344/148974612-16484f5d-2ea4-4d23-bffe-79b27c292947.jpg" height="25%" width="25%" alt="Stop optimizing battery usage?"></img><br>
3. When the entire installation process is completed, a message saying "MySQL installed successfully" should appear at the end. Now, the MySQL server has started on your machine. Enter the command `setpass` and set the password (for now) as 1234. Note that this sets the password for the user _root_. Also note that this can _only_ be done while the server is running.
4. To confirm that the server has been set up correctly, you must first install PyMySQL, which is a Python library that allows you to connect to your MySQL databases through Python, and then run the sample.py file. To do so, enter the command `pip install pymysql` to install it and then `python sample.py` to run the file. You should see the following output:
<br><img src="https://user-images.githubusercontent.com/59292344/148978144-26d6303d-7164-4a63-b452-10498f14794d.jpg" height="25%" width="25%" alt="Output of sample.py"></img><br>
You can change your password to something else by entering the command `setpass` after confirming that the outputs match.
5. Enter the command `start-client` to start the MySQL client. You will be asked to enter a password. Type in the password you had last set up using `setpass`. You can now use MySQL commands to create and manage databases on your phone.
<br><img src="https://user-images.githubusercontent.com/59292344/148980705-bc5ba593-1cbc-40c6-aff0-a4bb1cdcb92c.jpg" height="25%" width="25%" alt="MySQL client"></img><br>
6. Close the Termux application. The MySQL server will keep running in the background. You can use Python libraries, like PyMySQL mentioned before, to create and manage databases through an app like Pydroid (avaialable on Google Play [here](https://play.google.com/store/apps/details/Pydroid_3_IDE_for_Python_3?id=ru.iiec.pydroid3)), which is a Python IDE and compiler for Android.
<br><img src="https://user-images.githubusercontent.com/59292344/148981256-5ab39250-a42c-4286-b588-c99724a8e0ca.jpg" height="25%" width="25%" alt="Output of sample.py"></img>
<img src="https://user-images.githubusercontent.com/59292344/148981280-34ca2fe5-db13-4f5f-8da2-d4fa396c8277.jpg" height="25%" width="25%" alt="Output of sample.py"></img><br>
#### Note:
You can also go to settings and turn off notifications for Termux if you find its permanent notification bothersome.

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
