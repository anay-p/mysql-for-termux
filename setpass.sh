#!/bin/bash

cond=""

while [ "$cond" = "" ]
do
        echo -n "Enter your new password: "
        read -s pass1
        echo -ne "\nRe-enter your new password: "
        read -s pass2
        echo

        if [ $pass1 = $pass2 ]
        then
                cond="set"
        else
                echo "The entered passwords do not match"
                echo "Please try again"
        fi
done

echo -e "alter user root@localhost identified by \"${pass1}\"" > setpass.sql
mysql mysql < setpass.sql > mysqllogs.log
rm setpass.sql

if [ ! -s mysqllogs.log ]
then
        rm mysqllogs.log
fi
