#!/usr/bin/env bash 

#!/bin/bash
set -e

#查看mysql服务的状态，方便调试，这条语句可以删除
echo `service mysql status`

echo 'Starting MySQL...'

service mysql start
sleep 1
echo `service mysql status`

echo 'Initializing Data...'
#导入数据
mysql < /etc/mysql/initialize.sql
# mysql < /etc/mysql/add_example_data.sql
echo 'Done #init'

sleep 1
echo `service mysql status`

mysql < /etc/mysql/privileges.sql

echo 'Done #priv'
echo `service mysql status`
echo 'All Done'

tail -f /dev/null