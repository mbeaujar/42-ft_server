FROM debian:buster

RUN apt-get update && apt-get upgrade &&  apt-get install -y vim sudo wget libnss3-tools 
RUN apt-get -y install nginx 
RUN apt-get -y install php7.3  php7.3-cli php7.3-cgi php7.3-mbstring php7.3-fpm php7.3-mysql
RUN apt-get -y install mariadb-server

COPY srcs/init_container.sh /tmp
COPY srcs/nginx-local /tmp
COPY srcs/index.html /tmp
COPY srcs/index.php /tmp
COPY srcs/database.txt /tmp
COPY srcs/wp-config.php /tmp
EXPOSE 80
EXPOSE 443
