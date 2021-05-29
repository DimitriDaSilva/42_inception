FROM debian:buster

RUN	apt-get update && apt-get -y install \
	vim \
	wget \
	curl \
	git \
	nginx

# Nginx setup

## Following the Nginx installation guide specific for Debian / Ubuntu repo
## https://www.linode.com/docs/guides/how-to-configure-nginx/

## Folder where nginx will go fetch data to serve. Path specified in nginx.conf
RUN	mkdir /var/www/dda-silv.42.fr

## Give the ownership of the directory to www-data (user used by nginx)
RUN chown -R 999:999 /var/www/dda-silv.42.fr

## Copying the nginx.conf file. It has to be named after the name of the site
COPY conf /etc/nginx/sites-available/dda-silv.42.fr

## Linking conf files between both folders
RUN ln -s /etc/nginx/sites-available/dda-silv.42.fr /etc/nginx/sites-enabled/

## Removing the template nginx.conf (not required but cleaner)
RUN rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

# CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]
CMD ["nginx", "-g", "daemon off;"]
