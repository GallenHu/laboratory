#!/bin/bash
wget -P /etc/yum.repos.d/ https://raw.githubusercontent.com/GallenHu/scripts/master/data/nginx.repo

yum -y update

yum list nginx

echo 'type "yum install -y nginx" to install'
