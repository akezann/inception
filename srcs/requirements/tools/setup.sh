# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: akezanna <akezanna@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/21 10:41:45 by akezanna          #+#    #+#              #
#    Updated: 2021/09/22 11:25:14 by akezanna         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

service nginx stop 
service mysql stop 

source ../.env

sudo echo '127.0.0.1 akezanna.42.fr' >> /etc/hosts 
sudo echo '127.0.0.1 www.akezanna.42.fr' >> /etc/hosts 

docker-compose down 
docker system prune 
service docker restart 
