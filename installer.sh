#!/bin/bash

apt update
apt upgrade

shopt -s expand_aliases
alias curtime="date +\"%d/%m/%Y %X: \""

echo -n "" > logs.log

for alias in start setpass
do
	echo `curtime` "Checking to see if alias '${alias}' exists..." >> logs.log
	response=`grep "${alias}=" /data/data/com.termux/files/usr/etc/bash.bashrc`
	if [ ! -n "$response" ]
	then
		echo `curtime` "Alias '${alias}' does not exist" >> logs.log
		echo `curtime` "Creating alias '${alias}'..." >> logs.log
		echo -e "alias ${alias}=\"~\\${alias}.sh\"" >> /data/data/com.termux/files/usr/etc/bash.bashrc &&
		echo `curtime` "Alias '${alias}' created successfully" >> logs.log ||
		echo `curtime` "Failed to create alias '${alias}'" >> logs.log
	else
		echo `curtime` "Alias '${alias}' already exists" >> logs.log
	fi
done

echo `curtime` "Checking to see if package 'MariaDB' is installed..." >> logs.log

dpkg -s mariadb &> /dev/null
if [ $? -eq 1 ]  # If package is not installed
then
        echo `curtime` "Package 'MariaDB' is not installed" >> logs.log
        echo `curtime` "Installing..." >> logs.log
        pkg install mariadb

        code=$?

        if [ $code -eq 100 ]  # If package was not found
        then
                echo `curtime` "Could not locate package 'MariaDB'" >> logs.log
                echo `curtime` "Failed to install package 'MariaDB'" >> logs.log
        elif [ $code -eq 0 ]  # If command executed successfully
        then
                dpkg -s mariadb &> /dev/null
                if [ $? -eq 0 ]
                then
                        echo `curtime` "Installation complete" >> logs.log
			~/start.sh &&
			echo `curtime` "MySQL server started successfully" >> logs.log ||
			echo `curtime` "MySQL server failed to start" >> logs.log
                else
			echo `curtime` "Package installation command executed but package 'MariaDB' was not installed" >> logs.log
                fi
        else
                echo `curtime` "Some unkown error occured during installation (code:${?})" >> logs.log
        fi

else
        echo `curtime` "Package 'MariaDB' is already installed" >> logs.log
	~/start.sh &&
	echo `curtime` "MySQL server started successfully" >> logs.log ||
	echo `curtime` "MySQL server failed to start" >> logs.log
fi

pkg clean

termux-wake-lock &&
`curtime` "Acquired wakelock" >> logs.log ||
`curtime` "Failed to acquire wakelock" >> logs.log
