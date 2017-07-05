#! /bin/bash

# read app details
echo -n "Nazwa aplikacji: "
read app

echo -n "Domena: "
read domain

echo -n "Wordpress or Django? (W/D): "
read type


# wordpress
if [ $type == "W" ]
then

echo "\
<VirtualHost *:80>

    ServerName $domain
    # ServerAlias $domain
    DocumentRoot /home/internet/$app/
    
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

    <Directory />
        Options +Indexes +FollowSymLinks +ExecCGI
        AllowOverride All
        Order deny,allow
        Allow from all
        Require all granted
    </Directory>

</VirtualHost>
" > /etc/apache2/sites-available/$domain.conf

fi

# django
if [ $type == "D" ]
then

echo "\
<VirtualHost *:80>

    ServerName $domain
    # ServerAlias $domain
    DocumentRoot /home/internet/$app/client/static/
    Alias /static /home/internet/$app/client/static/
    
    <Directory /home/internet/$app/client/static/>
        Require all granted
    </Directory>

    WSGIScriptAlias / /home/internet/$app/server/manage/switch/wsgi.py
    WSGIDaemonProcess $app python-path=/home/internet/$app:/home/internet/system/lib/python3.5/site-packages
    WSGIProcessGroup $app

    <Directory /home/internet/$app>
        <Files wsgi.py>
            Require all granted
        </Files>
    </Directory>


    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
" > /etc/apache2/sites-available/$domain.conf

fi

# append file to apache
a2ensite /etc/apache2/sites-available/$domain.conf
service apache2 reload
