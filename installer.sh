#!/bin/bash

apt update
apt upgrade

echologs()
{
	echo $(date +"%d/%m/%Y %X: ") "$@" >> logs.log
}

echo -n "" > logs.log

wget -O setpass.sh "https://drive.google.com/uc?id=1sT6WUgypphXFqnjHQk3Eu3lVINX8eEt5&export=download" &&
echologs "Downloaded 'setpass.sh' successfully" ||
echologs "Failed to download 'setpass.sh' (code:${?})"

wget -O start.sh "https://drive.google.com/uc?id=1qA8ErY0OoCkblPRHSosRTHcUy9xGCx0u&export=download" &&
echologs "Downloaded 'start.sh' successfully" ||
echologs "Failed to download 'start.sh' (code:${?})"

echo "mysql -u root -p" > mysql.sh &&
echologs "Created file 'mysql.sh' successfully" ||
echologs "Failed to create file 'mysql.sh' (code:${?})"

for file in start.sh setpass.sh mysql.sh
do
	chmod u+x "${file}" &&
	echologs "Made '${file}' executable successfully" ||
	echologs "Failed to make '${file}' executable (code:${?})"
done

for alias in start setpass mysql
do
	echologs "Checking to see if alias '${alias}' exists..."
	response=$(grep "${alias}=" /data/data/com.termux/files/usr/etc/bash.bashrc)
	if [ ! -n "$response" ]
	then
		echologs "Alias '${alias}' does not exist"
		echologs "Creating alias '${alias}'..."
		echo -e "alias ${alias}=\"~/${alias}.sh\"" >> /data/data/com.termux/files/usr/etc/bash.bashrc &&
		echologs "Alias '${alias}' created successfully" ||
		echologs "Failed to create alias '${alias}' (code:${?})"
	else
		echologs "Alias '${alias}' already exists"
	fi
done

echologs "Checking to see if package 'MariaDB' is installed..."

dpkg -s mariadb &> /dev/null
if [ $? -eq 1 ]
then
        echologs "Package 'MariaDB' is not installed"
	echologs "Installing..."
        pkg install mariadb

        code=$?

        if [ $code -eq 100 ]
        then
                echologs "Could not locate package 'MariaDB'"
                echologs "Failed to install package 'MariaDB'"
        elif [ $code -eq 0 ]
        then
                dpkg -s mariadb &> /dev/null
                if [ $? -eq 0 ]
                then
                        echologs "Installation complete"
			~/start.sh &&
			echologs "MySQL server started successfully" ||
			echologs "MySQL server failed to start (code:${?})"
                else
			echologs "Package installation command executed but package 'MariaDB' was not installed"
                fi
        else
                echologs "Some unkown error occured during installation (code:${code})"
        fi

else
        echologs "Package 'MariaDB' is already installed"
	~/start.sh &&
	echologs "MySQL server started successfully" ||
	echologs "MySQL server failed to start (code:${?})"
fi

pkg clean

termux-wake-lock &&
echologs "Acquired wakelock" ||
echologs "Failed to acquire wakelock (code:${?})"
