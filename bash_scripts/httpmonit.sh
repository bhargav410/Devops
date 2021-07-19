#!/bin/bash
PIDFILE="/var/run/apache2/apache2.pid"
echo "check the pid of the apache"

if [ -f $PIDFILE ]
then
  echo "apache2 is in running state"
else 
  echo "starting apache2"
  systemctl start apache2  
  if [ $? -eq 0 ]
  then
    echo "started apache"
  fi 
fi  
