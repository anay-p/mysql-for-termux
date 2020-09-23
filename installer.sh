#!/bin/bash

echologs()
{
	echo $(date +"%d/%m/%Y %X: ") "$@" >> logs.log
}

echo -n "" > logs.log

for name in setpass start-server start-client
do
	chmod u+x "${name}.sh" &&
	echologs "Made '${name}.sh' executable successfully" ||
	echologs "Failed to make '${name}.sh' executable (code:${?})"

	echologs "Checking to see if alias ${name} exists..."
	response=$(grep "${name}=" ~/../usr/etc/bash.bashrc)
	if [ ! -n "$response" ]
	then
		echologs "Alias '${name}' does not exist"
		echologs "Creating alias '${name}'..."
		echo -e "alias ${name}=\"~/${name}.sh\"" >> ~/../usr/etc/bash.bashrc &&
		echologs "Alias '${name}' created successfully" ||
		echologs "Failed to create alias '${name}' (code:${?})"
	else
		echologs "Alias '${name}' already exists"
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
			~/start-server.sh &&
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
	~/start-server.sh &&
	echologs "MySQL server started successfully" ||
	echologs "MySQL server failed to start (code:${?})"
fi

pkg clean

termux-wake-lock &&
echologs "Acquired wakelock" ||
echologs "Failed to acquire wakelock (code:${?})"

echo "MySQL installed successfully"
