#!/bin/sh


nginx_user_access()
{
	chown -R www-data /var/www/*
	chmod -R 755 /var/www/*
}

ssl_generate()
{
	cd /tmp/mkcert
	mv mkcert-v1.1.2-linux-amd64 mkcert
	chmod +x mkcert
	./mkcert -install
	./mkcert localhost
	cd /tmp
}

database_setup()
{
	mysql -u root --skip-password < /tmp/database
	mysql wordpress -u root < /tmp/wordpress.sql
}

wordpress_setup()
{
	tar -xvzf latest.tar.gz
	rm -f latest.tar.gz
	mv /tmp/wordpress /var/www/localhost
	mv /tmp/wp-config.php /var/www/localhost/wordpress
}


phpmyadmin_setup()
{
	tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz
	rm -f phpMyAdmin-4.9.7-all-languages.tar.gz 
	mv phpMyAdmin-4.9.7-all-languages/ /var/www/localhost/phpmyadmin
}

cd /tmp

# if autoindex is off
#mv /var/www/html/index.nginx-debian.html /var/www/localhost/index.nginx-debian.html
service mysql start

ssl_generate
database_setup
wordpress_setup
phpmyadmin_setup
nginx_user_access


service nginx start
service php7.3-fpm start
