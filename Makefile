# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: akezanna <akezanna@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/21 10:43:15 by akezanna          #+#    #+#              #
#    Updated: 2021/09/21 11:53:45 by akezanna         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

START_PATH = ./srcs/

all: purge setup reload

setup:
	mkdir /home/akezanna/data/ && mkdir /home/akezanna/data/db/ && mkdir /home/akezanna/data/wp/
	@ cd $(START_PATH)/requirements/tools && sudo sh setup.sh
	
stop:
	@ cd $(START_PATH) && docker-compose down; 

clean: stop
	@ cd $(START_PATH) && docker system prune; 

purge: clean
	@ sudo rm -Rf /home/akezanna/data/;

reload: 
	@ cd $(START_PATH) &&  docker-compose up --build ; 

 

.PHONY: setup stop clean purge reload all 
