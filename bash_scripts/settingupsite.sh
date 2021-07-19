#!/bin/bash

if [ -e /var/run/nginx.pid ]
then
  echo "stopping nginx service"
  systemctl stop nginx
  # Down load the dependencies
  echo "Download the dependencies"
  apt install wget curl unzip -y
  #clear the content from html folder
  echo "clear the content from html folder"
  rm -rf /var/www/html/*
  #install apache2
  apt install apache2 -y
  systemctl start apache2
  systemctl enable apache2
  # install the Wordpress
  cd
  sudo apt update -y 
  sudo apt install wordpress php libapache2-mod-php mysql-server php-mysql -y
  cat <<EOF > /etc/apache2/sites-available/wordpress.conf
Alias /blog /usr/share/wordpress
<Directory /usr/share/wordpress>
    Options FollowSymLinks
    AllowOverride Limit Options FileInfo
    DirectoryIndex index.php
    Order allow,deny
    Allow from all
</Directory>
<Directory /usr/share/wordpress/wp-content>
    Options FollowSymLinks
    Order allow,deny
    Allow from all
</Directory>
EOF
  sudo a2ensite
  sudo service apache2 reload
fi  
