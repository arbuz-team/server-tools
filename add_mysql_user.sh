#! /bin/bash

echo -n "Podaj nazwę bazy danych: "
read database

echo -n "Podaj nazwę użytkownika "
read username

echo -n "Podaj hasło użytkownika: "
read password


create_database="CREATE DATABASE $database CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
create_user="CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';"
privileges="GRANT ALL PRIVILEGES ON $database . * TO '$username'@'localhost';"

command="$create_database $create_user $privileges FLUSH PRIVILEGES;"
mysql -u root -e "$command"

# show command
echo "$command"
