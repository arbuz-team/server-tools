#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

# backup mysql
mysqldump --all-databases > $SCRIPT_DIR/temp/server.sql

# backup apache files
mkdir $SCRIPT_DIR/temp/apache
cp /etc/apache2/sites-available/* $SCRIPT_DIR/temp/apache/

# backup websites files
cp -r /home/internet $SCRIPT_DIR/temp/

# create archive
tar -czf $SCRIPT_DIR/backup/$(date +%u).tar.gz -C $SCRIPT_DIR/temp/ .

# cleaning
rm -r $SCRIPT_DIR/temp/server.sql $SCRIPT_DIR/temp/apache $SCRIPT_DIR/temp/internet
