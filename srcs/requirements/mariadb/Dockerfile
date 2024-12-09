FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 755 /var/run/mysqld

# informe docker que le conteneur ecoute sur les ports reseaux specifies
# au moment de l'execution, ex: si Mariadb veut parler avec wp
# il faut exposer le port.
# Quand  le conteneur wp essaye de se connecter au port
# de Mariadb c'est expose qui rend ca possible
EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/init.sh /bin/init.sh
RUN chmod 755 /bin/init.sh

CMD ["/bin/init.sh"]