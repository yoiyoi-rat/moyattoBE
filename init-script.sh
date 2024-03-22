#!/bin/bash
set -e

# create_tables.sql を実行
mysql -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < build/db/init/create_tables.sql

# その他の起動処理
