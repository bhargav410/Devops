#!/bin/bash
# update system 
sudo apt update -y
#down load the dependencies
sudo apt install wget unzip -y
#install nginx
sudo apt install nginx -y
#start nginx
sudo systemctl start nginx
#enable nginx
sudo systemctl enable nginx
# create a dir
mkdir -p /tmp/template
# switch dir
cd /tmp/template/
#download the html zip file
wget https://www.free-css.com/assets/files/free-css-templates/download/page268/training-studio.zip
#unzip file
unzip training-studio.zip 
#stop nginx
sudo systemctl stop nginx
#remov file from nginx root dira
sudo rm -rf /var/www/html/*
#copy the content from html folder
sudo cp -r templatemo_548_training_studio/* /var/www/html/
#start nginx
sudo systemctl start nginx
