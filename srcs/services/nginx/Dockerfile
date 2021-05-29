FROM alpine:3.13

RUN	apk update && apk add \
	vim \
	wget \
	curl \
	git \
	nginx

# Nginx setup

## Following the Nginx installation guide specific for Debian / Ubuntu repo
## https://www.linode.com/docs/guides/how-to-configure-nginx/

## Folder where nginx will go fetch data to serve. Path specified in nginx.conf
#RUN	mkdir /var/www/localhost

## Give the ownership of the directory to www-data (user used by nginx)
#RUN chown -R www-data /var/www/localhost

## Copying the nginx.conf file. It has to be named after the name of the site
COPY conf /etc/nginx/sites-available/localhost

## Linking conf files between both folders
#RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

## Removing the template nginx.conf (not required but cleaner)
#RUN rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

