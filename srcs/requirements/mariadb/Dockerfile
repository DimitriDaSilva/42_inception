# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dda-silv <dda-silv@student.42lisboa.c      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/21 11:10:16 by dda-silv          #+#    #+#              #
#    Updated: 2022/02/07 12:21:04 by dda-silv         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install the base OS container
# Docker syntax: FROM <image name>:<tag>
# In this case, the tag is the version of the image as buster is debian's
# v10 code name
FROM debian:buster

# Update, upgrade package list and install mariadb
# Docker syntax: RUN <shell command>
# The directive RUN creates a shell terminal to run the command
RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY ./conf/ /etc/mysql/mariadb.conf.d/
COPY ./tools/ ${HOME}/tools/

RUN service mysql start && mysql --user=root --password= < ${HOME}/tools/init.sql

CMD ["mysqld"]
