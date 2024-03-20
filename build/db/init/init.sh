#!/bin/sh
echo "execute init.sh"
CMD_MYSQL="mysql -uroot -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE}"
echo "executed init.sh"
