#!/usr/bin/bash

if [ $1 = "remove" ]; then
    echo "Removing custom repo..."
    rm -rf /usr/customrepo
fi

