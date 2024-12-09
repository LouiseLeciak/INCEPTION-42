# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lleciak <lleciak@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 13:00:59 by lleciak           #+#    #+#              #
#    Updated: 2024/12/09 12:56:48 by lleciak          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate

clean:
	docker volume rm -f $$(docker volume ls -q) 
	docker system prune -af
	
cleanvolumes:
	sudo rm -rf ~/data/wordpress
	sudo rm -rf ~/data/mariadb

.PHONY:
	all down re clear