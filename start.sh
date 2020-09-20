#!/bin/bash

output=`mysqld_safe -u root &`
if [[ $output == *"Starting"* ]]
then
    echo "MySQL server started"
else
    echo "MySQL server is already running"
fi
