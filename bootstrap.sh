say "Update repositories"
apt-get update

say "Upgrade packages"
apt-get upgrade

say "packages"
apt-get install curl tree vim nano -y

say "Install Apache"
apt-get install -y apache2

say "Enable rewrites"
a2enmod rewrite

say "Install PHP"
apt-get -y install php apache2 libapache2-mod-php php-curl php-gd php-mysql php-gettext php-zip composer

say "NodeJS"
apt-get -y install nodejs

say "MySQL"
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password root"
debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none"
apt-get -y install mysql-server phpmyadmin

say "Restart Apache"
service apache2 restart
