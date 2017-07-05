#! /bin/bash

# backup mysql
mysqldump --all-databases > ./temp/server.sql

# backup apache files
mkdir ./temp/apache
cp /etc/apache2/sites-available/* ./temp/apache/

# backup websites files
cp -r /home/internet ./temp/

# create archive
tar -czf ./backup/$(date +%u).tar.gz ./temp/server.sql ./temp/apache ./temp/internet

# cleaning
rm -r ./temp/server.sql ./temp/apache ./temp/internet
