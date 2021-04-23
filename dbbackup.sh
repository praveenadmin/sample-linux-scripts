
#!/bin/bash

DATE=`date +"%d%b%Y`
MYSQL_HOST="localhost"
MYSQL_PORT="3306"
MYSQL_USER="mithuntechnologies"
MYSQL_PASSWORD="passw0rd"
MYSQL_DBNAME="$1"
MYSQL_DBBACKUP_PATH="$2"

################Below command lets you create new directory and permissions#############

mkdir -p $DB_PATH && chmod -R 777 $DB_PATH

############Below command is to take Dump from server and Remote VM also################

mysqldump -h${MYSQL_HOST} -P${PORT} -u${MYSQL_USER} -p${PASSWORD} ${DB} > ${DB_PATH}/${DB}_${DATE}.sql

################<$?-The exit status of the last command executed>#####################

if [ $$? -eq 0 ]; then
echo "DataBackup done" 
echo "DataBackup Success" | mutt -s "DB Backup status - success" devopstraining@gmail.com
else
echo "DataBackup failed"
echo "DataBackup Failure" | mutt -s "DB Backup status - failed" devopstraining@gmail.com
fi

