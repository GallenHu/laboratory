#!/bin/bash
# install mysql5.7
# for debian 8, debian 9
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

Install_Mysql_57()
{
    echo "choose mysql-5.7 in mysql-apt-config GUI \n"
    wget http://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
    dpkg -i mysql-apt-config_0.8.12-1_all.deb
    apt-get update
    apt-get install mysql-server -y
}
Install_Mysql_57
