#!/bin/bash
#
backupdir=/home/data/sql_backup/
time=` date +%Y%m%d%H%M%S `
passwd=chevereto
dbname=chevereto
dockername=chevereto_db_1

# modify -uYOURNAME
docker exec -it $dockername mysqldump -uchevereto -p$passwd $dbname > $backupdir/chevereto$time.sql

# remove files after 7 days
find $backupdir -name "chevereto*.sql" -type f -mtime +7 -exec rm {} \; > /dev/null 2>&1
