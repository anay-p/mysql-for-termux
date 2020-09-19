#!/bin/bash

apt update
apt upgrade
pkg install mariadb && echo $(date +"%d.%m.%Y %X: ") Successfully installed MariaDB > ~/mysql/log.txt || echo $(date +"%d.%m.%Y %X: ") Failed to install MariaDB > ~/mysql/log.txt
mysql_upgrade
pkg install python && echo $(date +"%d.%m.%Y %X: ") Successfully installed Python >> ~/mysql/log.txt || echo $(date +"%d.%m.%Y %X: ") Failed to install Python >> ~/mysql/log.txt
mkdir ~/mysql && echo $(date +"%d.%m.%Y %X: ") Successfully created directory mysql >> ~/mysql/log.txt || echo $(date +"%d.%m.%Y %X: ") Failed to create directory mysql >> ~/mysql/log.txt
wget -O ~/mysql/start.py https://drive.google.com/uc?id=1FFbBUnSHePyOaL2ET5AfN6ek6ROuqmCU&export=download && echo $(date +"%d.%m.%Y %X: ") Successfully downloaded start.py >> ~/mysql/log.txt || echo $(date +"%d.%m.%Y %X: ") Failed to download start.py >> ~/mysql/log.txt
echo -e "\nalias start=\"python \"~/mysql/start.py\"\"" >> /data/data/com.termux/files/usr/etc/bash.bashrc && echo $(date +"%d.%m.%Y %X: ") Successfully created alias start >> ~/mysql/log.txt || echo $(date +"%d.%m.%Y %X: ") Failed to create alias start >> ~/mysql/log.txt
wget -O ~/mysql/set_password.py <google drive url> && echo $(date +"%d.%m.%Y %X: ") Successfully downloaded set_password.py >> ~/mysql/log.txt || echo $(date +"%d.%m.%Y %X: ") Failed to download set_password.py >> ~/mysql/log.txt
echo "alias setpass=\"python \"~/mysql/set_password.py\"\"" >> /data/data/com.termux/files/usr/etc/bash.bashrc && echo $(date +"%d.%m.%Y %X: ") Successfully created alias setpass >> ~/mysql/log.txt || echo $(date +"%d.%m.%Y %X: ") Failed to create alias setpass >> ~/mysql/log.txt
python ~/mysql/start.py && echo $(date +"%d.%m.%Y %X: ") Successfully started MySQL server >> ~/mysql/log.txt || echo $(date +"%d.%m.%Y %X: ") Failed to start MySQL server >> ~/mysql/log.txt
termux-wake-lock && echo $(date +"%d.%m.%Y %X: ") Successfully acquired wakelock >> ~/mysql/log.txt || echo $(date +"%d.%m.%Y %X: ") Failed to acquired wakelock >> ~/mysql/log.txt
pkg clean