#!/bin/bash
#
# RESTORE
# mongorestore -uroot -p hinoteapp -d noteapp --dir /tmp/noteapp/ --authenticationDatabase admin
#
backupdir=/home/data/sql_backup/
time=` date +%Y%m%d%H%M%S `
passwd=examplepassword
dbname=noteapp
dockername=hinote_mongo

docker exec -it $dockername mongodump -h 127.0.0.1 --port 27017 -u=root -p=$passwd --authenticationDatabase admin -d $dbname -o /tmp

docker exec -it $dockername tar -zcvf /tmp/$dbname$time.tar.gz /tmp/$dbname

docker cp $dockername:/tmp/$dbname$time.tar.gz $backupdir

# remove files after 7 days
find $backupdir -name "noteapp*.tar.gz" -type f -mtime +7 -exec rm {} \; > /dev/null 2>&1
