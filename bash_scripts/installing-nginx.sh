#!/bin/bash
yum --help
if [ $? -eq 0 ]
then
  echo "OS family is Linux"
  yum install nginx -y 
  systemctl start nginx
  systemctl enable nginx
else
  echo "OS family is Debian"	
  apt install nginx -y
  systemctl start nginx
  systemctl enable nginx
  echo "installed nginx and started"
fi

if [ -f /var/run/nginx.pid ]
then
  echo "Nginx is in running state"	
else
  echo "Nginx is in stopped state and starting nginx"
  systemctl start nginx
  echo "started nginx because it is in stopped state"  
fi  
