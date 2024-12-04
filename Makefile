# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lleciak <lleciak@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/03 13:00:59 by lleciak           #+#    #+#              #
#    Updated: 2024/12/03 13:03:07 by lleciak          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p /home/lleciak/data/wordpress
	mkdir -p /home/lleciak/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up --build
	cd -

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate

clean:
	docker volume rm -f $$(docker volume ls -q) 
	docker system prune -af

.PHONY:
	all down re clear