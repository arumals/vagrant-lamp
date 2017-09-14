#!/bin/bash

echo "Update ubuntu repositories ----------------"
apt-get update

echo "Upgrade installed packages ----------------"
apt-get upgrade

echo "Useful packages ---------------------------"
apt-get install curl tree vim nano sed -y

echo "Install Apache -----------------------------"
apt-get install -y apache2

echo "Enabling modrewrite ------------------------"
a2enmod rewrite

echo "Install PHP --------------------------------"
apt-get -y install php apache2 libapache2-mod-php php-curl php-gd php-mysql php-gettext php-zip composer

echo "Installing NodeJS --------------------------"
apt-get -y install nodejs

echo "Update apache default vhost ----------------"

VHOST=$(cat <<EOF
<VirtualHost *:80>
    ServerName app.dev
    DocumentRoot "/vagrant/public"
    <Directory "/vagrant/public">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)

echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf
service apache2 restart

echo "Installing MySQL --------------------------"
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"
apt-get -y install mysql-server phpmyadmin

echo "Restart Apache ----------------------------"
service apache2 restart
