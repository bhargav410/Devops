#!/bin/bash
SCRPPATH="/home/ubuntu/scripting/setupremote.sh"
USR="root"
ping -c 3 master
if [ $? -eq 0 ]
then
  for host in `cat hosts`
  do 
    echo "host is accissable and copying script and running in host srvers"
    scp -r $SCRPPATH $USR@$host:/tmp/
    echo "file copied and executing the script in host"
    ssh $USR@$host bash /tmp/setupremote.sh 
  done
fi  
