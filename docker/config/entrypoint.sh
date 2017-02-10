#!/usr/bin/env bash

echo "=============================="
echo -e "\tStarting Setup... \r0%"
echo "=============================="

# Create MySQL DB for TYPO3
HOST="db"
USERNAME="t3kit"
PASSWORD="t3kit1234"
DATABASE="t3kit"

if [ -f /var/www/shared/db/$DATABASE.sql ]; then
	echo -e "\tInstall DB $DATABASE from database dump... \r50%"
	mysql -hdb -uroot -p1234 $DATABASE < /var/www/shared/db/$DATABASE.sql
	rm /var/www/shared/site/FIRST_INSTALL
else
	echo -e "\tNo database dump found, skipping import ($DATABASE.sql)... \r50%"
fi

echo "Provision complete!"
echo "=============================="
echo "========== INFO =============="
echo "=============================="
echo "TYPO3 Backend Login: admin"
echo "TYPO3 Backend Password: admin1234"
echo "TYPO3 Install Tool Password: admin1234"
echo "------------------------------"
echo "DB Host (container scope): $HOST"
echo "DB Name: $DATABASE"
echo "DB User: $USERNAME"
echo "DB Password: $PASSWORD"
echo "=============================="
echo "=============================="
echo "Open site in browser using IP address 0.0.0.0:8082 or localhost:8082"

exec "$@"
