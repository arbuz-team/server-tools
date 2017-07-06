#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

echo -n "Podaj nazwę użytkownika: "
read username

adduser $username
usermod -aG www-data $username
mkdir -p /home/$username/.config/fish/

cp $SCRIPT_DIR/config/vimrc /home/$username/.vimrc
cp $SCRIPT_DIR/config/config.fish /home/$username/.config/fish/

chown -R $username:$username /home/$username
