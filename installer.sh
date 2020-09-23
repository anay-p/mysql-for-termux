#!/bin/bash

apt update
apt upgrade

echologs()
{
	echo $(date +"%d/%m/%Y %X: ") "$@" >> logs.log
}

echo -n "" > logs.log

for filename in start.sh setpass.sh
do
	chmod u+x "${filename}.sh" &&
	echologs "Made '${filename}.sh' executable successfully" ||
	echologs "Failed to make '${filename}.sh' executable (code:${?})"
done

echologs "Checking to see if alias 'start-server' exists..."
response=$(grep "start-server=" ~/../usr/etc/bash.bashrc)
if [ ! -n "$response" ]
then
	echologs "Alias 'start-server' does not exist"
	echologs "Creating alias 'start-server'..."
	echo -e "alias start-server=\"~/start.sh\"" >> ~/../usr/etc/bash.bashrc &&
	echologs "Alias '${alias}' created successfully" ||
	echologs "Failed to create alias '${alias}' (code:${?})"
else
	echologs "Alias '${alias}' already exists"
fi

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
