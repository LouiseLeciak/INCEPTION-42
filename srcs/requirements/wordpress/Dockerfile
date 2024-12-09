FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y

# pour pouvoir installer wp avec son lien de telechargement
RUN apt-get -y install wget

# installer PHP  et ses dependances avec wp
RUN apt-get install -y php php-fpm \
	php-cgi php-mysql mariadb-client \
	php-pdo php-gd php-cli

RUN mkdir /run/php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

# communique sur le port 9000 avec NGINX
EXPOSE 9000

COPY ./tools/config_auto.sh /usr/local/bin
RUN chmod +x /usr/local/bin/config_auto.sh
CMD ["/usr/local/bin/config_auto.sh"]