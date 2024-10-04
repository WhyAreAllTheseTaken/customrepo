#!/usr/bin/bash

echo "Creating custom repo user..."
useradd -r customrepo
chown -R customrepo /usr/customrepo

