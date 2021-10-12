# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: akezanna <akezanna@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/21 10:42:35 by akezanna          #+#    #+#              #
#    Updated: 2021/09/21 10:42:36 by akezanna         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster 

RUN apt-get update 
RUN apt-get install -y nginx openssl vim less net-tools procps
RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default

COPY tools/nginx.conf /etc/nginx/sites-available/default  
 
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out /etc/nginx/ssl/www.akezanna.42.fr.crt -keyout /etc/nginx/ssl/www.akezanna.42.fr.key -subj "/C=AR/ST=Berkane/CN=akezanna"
RUN chmod 777 /etc/nginx/ssl/*
RUN chmod 777 -R /var/www 
RUN chown -R www-data:www-data /var/www/
EXPOSE 443 
ENTRYPOINT ["nginx","-g","daemon off;"]

