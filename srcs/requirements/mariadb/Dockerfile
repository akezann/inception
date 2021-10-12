# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: akezanna <akezanna@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/21 10:42:40 by akezanna          #+#    #+#              #
#    Updated: 2021/09/21 10:42:41 by akezanna         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster 

RUN apt-get update
RUN apt-get install -y mariadb-server vim procps; 

COPY tools/setup.sh . 
RUN chmod +x setup.sh 

EXPOSE 3306
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf 
# Swith off the bind address 
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d 
ENTRYPOINT ["sh", "/setup.sh"]
