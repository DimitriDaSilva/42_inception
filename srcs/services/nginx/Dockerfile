FROM debian:buster

RUN	apt-get update && apt-get -y install nginx openssl

# Nginx setup

## Following the Nginx installation guide specific for Debian / Ubuntu repo
## https://www.linode.com/docs/guides/how-to-configure-nginx/

## Copying the nginx.conf file. It has to be named after the name of the site
COPY nginx.conf /etc/nginx/sites-available/dda-silv.42.fr

## Linking conf files between both folders
RUN ln -sf /etc/nginx/sites-available/dda-silv.42.fr /etc/nginx/sites-enabled/

## Following this guide: https://linuxize.com/post/creating-a-self-signed-ssl-certificate/
## Used openssl and doesn't require prompt input (cf. -subj flag)

RUN openssl req -newkey rsa:2048 \
			-x509 \
			-sha256 \
			-days 3650 \
			-nodes \
			-out /etc/ssl/certs/dda-silv.42.fr.crt \
			-keyout /etc/ssl/private/dda-silv.42.fr.key \
			-subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisboa/OU=dda-silv/CN=www.dda-silv.42.fr.com"

CMD ["nginx", "-g", "daemon off;"]
