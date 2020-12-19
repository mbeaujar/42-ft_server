#!/bin/sh


nginx_user_access_setup()
{
	chown -R www-data /var/www/*
	echo "\n\n\nJE SUIS LA\n\n\n"
	chmod -R 755 /var/www/*
}

ssl_setup()
{
	mkdir mkcert
	cd mkcert
	wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
	mv mkcert-v1.1.2-linux-amd64 mkcert
	chmod +x mkcert
	./mkcert -install
	./mkcert localhost
}

mysql_setup()
{
	mysql -u root --skip-password < /tmp/database.txt
}

file_localhost_setup()
{
	mkdir /var/www/localhost
	mv /tmp/index.html /var/www/localhost
	mv /tmp/index.php /var/www/localhost
}

wordpress_setup()
{
	cd /tmp
	wget -c https://wordpress.org/latest.tar.gz
	tar -xvzf latest.tar.gz
	mv /tmp/wordpress /var/www/localhost
	mv /tmp/wp-config.php /var/www/localhost/wordpress
}


phpmyadmin_setup()
{
	cd /tmp
	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
	tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz
	mv phpMyAdmin-4.9.7-all-languages/ /var/www/localhost/phpmyadmin
}


nginx_setup()
{
	cp /tmp/nginx-local  /etc/nginx/sites-available/nginx-local
	rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
	ln -s /etc/nginx/sites-available/nginx-local /etc/nginx/sites-enabled/nginx-local
}

service mysql start

nginx_user_access_setup
ssl_setup 
mysql_setup
file_localhost_setup
wordpress_setup
phpmyadmin_setup
nginx_user_access_setup
nginx_setup

service nginx start
service php7.3-fpm start





