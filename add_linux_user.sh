#! /bin/bash

echo -n "Podaj nazwę użytkownika: "
read username

adduser $username
usermod -aG www-data $username
mkdir -p /home/$username/.config/fish/

cp ./config/vimrc /home/$username/.vimrc
cp ./config/config.fish /home/$username/.config/fish/

chown -R $username:$username /home/$username
