#!/bin/bash

apt update
apt upgrade

shopt -s expand_aliases
alias curtime="date +\"%d/%m/%Y %X: \""

echo `curtime` "Checking to see if package MariaDB is installed..." > logs.log

dpkg -s $pkg &> /dev/null
if [ $? -eq 1 ]  # If package is not installed
then

        echo `curtime` "Package is not installed" >> logs.log
        echo `curtime` "Installing..." >> logs.log
        pkg install mariadb

        code=$?

        if [ $code -eq 100 ]  # If package was not found
        then
                echo `curtime` "Could not locate package" >> logs.log
                echo `curtime` "Package installation failed" >> logs.log
        elif [ $code -eq 0 ]  # If command executed successfully
        then
                dpkg -s $pkg &> /dev/null
                if [ $? -eq 0 ]
                then
                        echo `curtime` "Installation complete" >> logs.log
                        mysql_upgrade
                else
                        echo `curtime` "Package was not installed" >> logs.log
                fi
                pkg clean
        else
                echo `curtime` "Some unkown error occured during installation (code:${?})" >> logs.log
        fi

else
        echo `curtime` "Package is already installed" >> logs.log
fi
