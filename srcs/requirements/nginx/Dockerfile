FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx

# dossier pour stocker le certif et la clef pour une connexion securisee
RUN mkdir -p /etc/nginx/ssl

# outil principale pour la getsion/creation de certificats ssl
RUN apt-get install -y openssl

#generer un certificat ssl afin de creer un certificat TSL/SSL
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lleciak.42.fr/UID=lleciak"

#stocker les fichier de config NGINX
RUN mkdir -p /var/run/nginx

#copier ma conf dans celle de nginx, permet de la modifier comme je veux

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# root principal
RUN chmod 755 /var/www/html

# utilisateur principal
RUN chown -R www-data:www-data /var/www/html

#lancer nginx en premier plan pour que le container ne se stop pas
CMD [ "nginx", "-g", "daemon off;" ]