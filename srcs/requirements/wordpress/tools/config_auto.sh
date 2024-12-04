#!/bin/sh


if test -f "/var/www/html/wp-config.php";
then
	echo "wordpress already set"
else

# mkdir /var/www/
# mkdir /var/www/html
cd /var/www/html

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
wp config create --allow-root \
					--dbname=$MYSQL_DATABASE \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/html'
wp core install --url=lleciak.42.fr --title=inception --admin_user=lleciak \
				--admin_password=lleciak42 --admin_email=lleciak@student.42.fr \
				--allow-root

chown -R www-data:0 /var/www/html
chmod -R g+w /var/www/html
chmod 755 -R /var/www/html/wp-content
fi

exec /usr/sbin/php-fpm7.4 -F