
# NGINX USER ACCESS SETUP 
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# SSL SETUP 
mkdir mkcert
cd mkcert
wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
mv mkcert-v1.1.2-linux-amd64 mkcert
chmod +x mkcert
./mkcert -install
./mkcert localhost

# MYSQL SETUP 
service mysql start
mysql -u root --skip-password < /tmp/database.txt

# SITE SETUP 
mkdir /var/www/localhost
cp /tmp/index.html /var/www/localhost

# WORDPRESS SETUP
mv /tmp/index.php /var/www/localhost

# NGINX SETUP 
cp /tmp/nginx-local  /etc/nginx/sites-available/nginx-local
rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/nginx-local /etc/nginx/sites-enabled/nginx-local

service nginx start
service php7.3-fpm start
