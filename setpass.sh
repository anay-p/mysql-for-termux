#!/bin/bash

echo -n "New password: "
read -s pass1
echo -ne "\nRetype new password: "
read -s pass2
echo

if [ ! $pass1 = $pass2 ]
then
        echo "Sorry, passwords do not match."
else
        echo -e "alter user root@localhost identified by \"${pass1}\"" > setpass.sql
        mysql mysql < setpass.sql > mysqllogs.log &&
        echo "New password was successfully set." ||
        echo "Failed to set new password"
        rm setpass.sql
        if [ ! -s mysqllogs.log ]
        then
                rm mysqllogs.log
        fi
fi
