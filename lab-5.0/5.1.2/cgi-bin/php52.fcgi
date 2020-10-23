#!/bin/sh
export PHP_FCGI_CHILDREN=4
export PHP_FCGI_MAX_REQUESTS=200
#export PHPRC="/var/www/php.ini" //Путь к конфигу
exec /opt/php5.2/bin/php-cgi
