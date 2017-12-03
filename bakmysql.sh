#!/bin/bash
#
backupdir=/bak/mysql_backup
time=` date +%Y%m%d%H%M%S `
passwd=<yourpassword>
dbname=hi_note

/usr/bin/mysqldump -u root -p$passwd $dbname | gzip > $backupdir/database$time.sql.gz
# remove files after 7 days
find $backupdir -name "name_*.sql.gz" -type f -mtime +7 -exec rm {} ; > /dev/null 2>&1

# git
cd $backupdir
git add .
git commit -m $time
git push origin master
