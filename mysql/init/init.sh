#!/bin/sh
echo "execute init.sh"
CMD_MYSQL="mysql -u root -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE}"
echo "executed init.sh"
