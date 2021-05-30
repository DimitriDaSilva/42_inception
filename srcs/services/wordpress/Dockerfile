FROM debian:buster

# PhpMyAdmin setup

RUN apt-get update && apt-get -y install wget \
										php \
										php-cli \
										php-cgi \
										php-mbstring \
										php-fpm \
										php-mysql \
										php-curl \
										php-gd \
										php-intl \
										php-soap \
										php-xml \
										php-xmlrpc \
										php-zip

RUN mkdir /var/www
RUN mkdir /var/www/dda-silv.42.fr
RUN mkdir /var/www/dda-silv.42.fr/phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz

## --strip-components=1 is for removing one level of the file tree structure /a/b/c/files -> /b/c/files
## -C <destination>
RUN tar -zxf phpMyAdmin-5.1.0-all-languages.tar.gz --strip-components=1 -C /var/www/dda-silv.42.fr/phpmyadmin
RUN rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz

## Moving our modified config php file from the srcs
COPY config.inc.php /var/www/dda-silv.42.fr/phpmyadmin

# WordPress setup

## Following this guide: https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-nginx-mariadb-and-php-on-debian-10

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -zxf latest.tar.gz --strip-components=1 -C /var/www/dda-silv.42.fr
RUN rm -rf latest.tar.gz
COPY wp-config.php /var/www/dda-silv.42.fr

## Do the basic WP page setup
## We need the wp commands. For that I followed this guide https://www.liquidweb.com/kb/install-wp-cli/
RUN wget -O wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp
RUN mv wp /usr/local/bin/
RUN wp core install --allow-root --url=dda-silv.42.fr --path=/var/www/dda-silv.42.fr --title="Hello world!" --admin_name=admin --admin_password=password --admin_email=admin@admin.com
