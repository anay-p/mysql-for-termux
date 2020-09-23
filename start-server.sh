#!/bin/bash

output=$(ps ax -o pid= -o comm= | grep mysqld_safe)

if [ ! -n "$output" ]
then
        echo "MySQL server is not running"
        echo "Starting..."
        useless=$(mysqld_safe -u root &)
        code=$?
        if [ $code -eq 0 ]
        then
                echo "MySQL server started successfully"
        else
                echo "MySQL server failed to start (code:${code})"
        fi
else
        echo "MySQL server is already running"
fi
