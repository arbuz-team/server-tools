#! /bin/bash
# config files

sudo apt-get update
mkdir -p ~/.config/fish/

cp ./config/vimrc ~/.vimrc
cp ./config/config.fish ~/.config/fish/config.fish

# instalation

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

echo yes | sudo apt-get install libapache2-mod-wsgi     # python2
echo yes | sudo apt-get install libapache2-mod-wsgi-py3 # python3

# python packages

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

# get actual crontab
crontab -l > ./temp/mycron

# append backup line to crontab
echo "0 3 * * * $(dirname $0)/backup.sh >> $(dirname $0)/log/stdout.log 2>> $(dirname $0)/log/stderr.log"
echo "0 3 * * * $(dirname $0)/sync_backup.sh >> $(dirname $0)/log/stdout.log 2>> $(dirname $0)/log/stderr.log"

# reload crontab
crontab ./temp/mycron
rm ./temp/mycron

