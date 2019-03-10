#!/bin/sh

cp ./.env.local ./.env;

chmod -R 777 /application/bootstrap/cache;
chmod -R 777 /application/storage;

set -e
while ! (timeout 3 bash -c "</dev/tcp/${MYSQL_HOST}/${MYSQL_PORT}")
do
	echo -e "waiting for mysql, to start...";
	sleep 3;
done;

php artisan l5-swagger:generate;
php artisan migrate --force;

php composer.phar install;

service cron start;
service supervisor start;


php-fpm;

