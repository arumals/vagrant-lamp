#!/bin/bash

echo "Disable interactive mode ..................."
export DEBIAN_FRONTEND=noninteractive

echo "Update ubuntu repositories ................."
apt-get update

echo "Install apt-utils"
apt-get install apt-utils

echo "Upgrade installed packages ................."
apt-get upgrade

echo "Useful packages ............................"
apt-get install -y curl 
apt-get install -y tree 
apt-get install -y vim 
apt-get install -y nano 
apt-get install -y sed
apt-get install -y libsqlite3-dev

echo "Install Pip"
apt-get install -y python-pip
pip install --upgrade pip 
pip install --upgrade virtualenv

echo "Install Apache ............................."
apt-get install -y apache2

echo "Enabling modrewrite ........................"
a2enmod rewrite

echo "Installing PHP and it's libraries .........."
apt-get -y install libapache2-mod-php \
    php-curl \
    php-gd \
    php-mysql \
    php-gettext \
    php-zip \
    php-exif \
    php-iconv \
    php-imap \
    php-mbstring \
    php-mcrypt \
    php-opcache \
    php-posix \
    php-sockets \
    php-tidy \
    php-xmlrpc \
    php-xsl \
    php-zip \
    composer \

echo "Install Codeception ........................"
wget -q http://codeception.com/codecept.phar
mv codecept.phar /usr/bin/codecept
chmod +x /usr/bin/codecept

echo "Installing Ruby and its libraries .........."
apt-get install -y ruby ruby-dev

echo "Installing mailtchaer ......................"
gem install mailcatcher
mailcatcher --http-ip=0.0.0.0

echo "Installing NodeJS .........................."
apt-get -y install nodejs

echo "Installing php.ini files ..................."
mv /home/ubuntu/php.apache2.ini /etc/php/7.0/apache2/php.ini
mv /home/ubuntu/php.cli.ini /etc/php/7.0/cli/php.ini
service apache2 restart

echo "Update apache default vhost ................"
mv /home/ubuntu/default.conf /etc/apache2/sites-enabled/000-default.conf
service apache2 restart

echo "Installing MySQL ..........................."
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"
apt-get -y install mysql-server phpmyadmin

echo "Restart Apache ............................."
service apache2 restart
