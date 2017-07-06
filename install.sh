#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

# config files

sudo apt-get update
mkdir -p ~/.config/fish/

cp $SCRIPT_DIR/config/vimrc ~/.vimrc
cp $SCRIPT_DIR/config/config.fish ~/.config/fish/config.fish

# base packages

echo yes | sudo apt-get install ssh
echo yes | sudo apt-get install fish
echo yes | sudo apt-get install vim
echo yes | sudo apt-get install tmux
echo yes | sudo apt-get install screen
echo yes | sudo apt-get install htop
echo yes | sudo apt-get install sysstat
echo yes | sudo apt-get install nmap

echo yes | sudo apt-get install gcc 
echo yes | sudo apt-get install gdb 
echo yes | sudo apt-get install g++

echo yes | sudo apt-get install mtools
echo yes | sudo apt-get install lm_sensors 

echo yes | sudo apt-get install git
echo yes | sudo apt-get install apache2
echo yes | sudo apt-get install python-setuptools

# php packages

echo yes | sudo apt-get install php7.0 libapache2-mod-php7.0
echo yes | sudo apt-get install php7.0-mysql

# python packages

echo yes | sudo apt-get install libapache2-mod-wsgi     # python2
echo yes | sudo apt-get install libapache2-mod-wsgi-py3 # python3

echo yes | sudo apt-get install python 
echo yes | sudo apt-get install python-pip
echo yes | sudo apt-get install python3-pip 
echo yes | sudo apt-get install sqlite3
echo yes | sudo apt-get install mariadb-server
echo yes | sudo apt-get install libmysqlclient-dev # mysql

# dla Pillow i payments
echo yes | sudo apt-get install libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk libssl-dev libffi-dev build-essential

# dla PDF
echo yes |sudo apt-get install python-dev python-pip python-lxml python-cffi libcairo2 libpango1.0-0 libgdk-pixbuf2.0-0 shared-mime-info

echo yes | sudo pip3 install Django
echo yes | sudo pip3 install Pillow
echo yes | sudo pip3 install selenium
echo yes | sudo pip3 install django-nocaptcha-recaptcha
echo yes | sudo pip3 install django-subdomains
echo yes | sudo pip3 install geoip2 
echo yes | sudo pip3 install weasyprint
echo yes | sudo pip3 install django-countries
echo yes | sudo pip3 install mysqlclient

# instalation backup

chmod +x *.sh

# create and copy ssh key
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
ssh-copy-id server-tools@de.arbuz.team

# get actual crontab
crontab -l > $SCRIPT_DIR/temp/mycron

# append backup line to crontab
echo "0 3 * * * $SCRIPT_DIR/backup.sh >> $SCRIPT_DIR/log/stdout.log 2>> $SCRIPT_DIR/log/stderr.log" >> $SCRIPT_DIR/temp/mycron
echo "0 4 * * * $SCRIPT_DIR/sync_backup.sh >> $SCRIPT_DIR/log/stdout.log 2>> $SCRIPT_DIR/log/stderr.log" >> $SCRIPT_DIR/temp/mycron

# reload crontab
crontab $SCRIPT_DIR/temp/mycron
rm $SCRIPT_DIR/temp/mycron

