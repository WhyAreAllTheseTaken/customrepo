#!/usr/bin/bash

if [ $1 = "remove" ]; then
    echo "Removing custom repo user..."
    userdel customrepo
fi

