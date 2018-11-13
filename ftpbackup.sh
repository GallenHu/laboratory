#!/bin/bash
# docker 版 MySQL 备份到 ftp
# 参考 https://www.vpser.net/security/linux-autobackup-ftp.html

# 待备份的数据库
Backup_Database_Name1=db_note
Backup_Database_Name2=db_bookmark

MYSQL_UserName=root
MYSQL_PassWord=yourpassword
MYSQL_DockerName=mysql5.7

FTP_HostName=yourhostname
FTP_UserName=yourname
FTP_PassWord=yourpassword
#FTP_BackupDir=backup

TodayDBBackup=db-*-$(date +"%Y%m%d").sql # *代表各个数据库名称
OldDBBackup=db-*-$(date -d -3day +"%Y%m%d").sql

# 导出 Database1 Database2
docker exec -it $MYSQL_DockerName mysqldump -u$MYSQL_UserName -p$MYSQL_PassWord $Backup_Database_Name1 > /home/backup/db-$Backup_Database_Name1-$(date +"%Y%m%d").sql
docker exec -it $MYSQL_DockerName mysqldump -u$MYSQL_UserName -p$MYSQL_PassWord $Backup_Database_Name2 > /home/backup/db-$Backup_Database_Name2-$(date +"%Y%m%d").sql

rm $OldDBBackup

cd /home/backup/
#ls -all

lftp $FTP_HostName -u $FTP_UserName,$FTP_PassWord << EOF
mrm $OldDBBackup
mput $TodayDBBackup
bye
EOF
