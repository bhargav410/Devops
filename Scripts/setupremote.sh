#!/bin/bash
apt remove nginx -y
apt remove apache2 -y
DIR="/tmp/template"
URL='https://www.tooplate.com/zip-templates/2109_the_card.zip'
SVC="nginx"
DEP="wget curl unzip"
yum --help
if  [ $? - eq 0 ]
then
  echo "installing dependencies"	
  yum install $DEP -y
  echo " Os family is Linux "
  yum install $SVC -y
  systemctl start $SVC
  systemctl enable $SVC
  echo "Download the package and move to nginx root folder"
  mkdir -p $DIR
  rm -rf $DIR/*
  cd $DIR
  wget $URL
  unzip 2109_the_card.zip the-card
  echo "stopping service and copying data"
  systemctl stop $SVC
  mv the-card/* /var/www/html/*
  echo "Data copied and starting service"
  systemctl start $SVC
  echo "installation compleated"
  if [ -f /var/run/nginx/ngin.pid ]
  then
    echo "service is up and running"
  fi
else
  echo "OS family is debian"
  echo "installing dependencies"
  apt update -y
  apt install $DEP -y
  echo " Os family is Linux "
  apt install $SVC -y
  systemctl start $SVC
  systemctl enable $SVC
  echo "Down load the package and move to nginx root folder"
  mkdir -p $DIR
  rm -rf $DIR/*
  cd $DIR
  wget $URL 
  unzip 2109_the_card.zip
  echo "stopping service and copying data"
  systemctl stop $SVC
  cp -r 2109_the_card/* /var/www/html/
  echo "Data copied and starting service"
  systemctl start $SVC
  echo "installation compleated"
  if [ -f /var/run/nginx/ngin.pid ]
  then
    echo "service is up and running"	
  fi
fi  

