#! /bin/bash

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

# config files

sudo apt-get update
mkdir -p ~/.config/fish/

cp $SCRIPT_DIR/config/vimrc ~/.vimrc
cp $SCRIPT_DIR/config/config.fish ~/.config/fish/config.fish

# base packages
sudo apt-get install -y ssh fish vim tmux screen htop sysstat nmap gcc gdb g++ mtools lm-sensors git apache2 python-setuptools

# php packages
#sudo apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-mysql

# python packages
sudo apt-get install -y libapache2-mod-wsgi libapache2-mod-wsgi-py3 python python-pip python3-pip sqlite3 mariadb-server libmysqlclient-dev

# dla Pillow i payments
sudo apt-get install -y libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk libssl-dev libffi-dev build-essential

# dla PDF
sudo apt-get install -y python-dev python-pip python-lxml python-cffi libcairo2 libpango1.0-0 libgdk-pixbuf2.0-0 shared-mime-info

# another packages
sudo pip3 install Django Pillow selenium django-nocaptcha-recaptcha django-subdomains geoip2  weasyprint django-countries mysqlclient django-markdownx

# instalation backup
echo -ne "\n\n\nDo you want install server backup module? [yes/no]: "

read backup_installation
if [ "$backup_installation" == "yes" ]
then

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

fi
