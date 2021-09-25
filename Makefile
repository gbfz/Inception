SHELL	=	/bin/bash
USER	=	meldora

all:	init

build:
	@echo "127.0.0.1	meldora.42.fr" >> /etc/hosts
	@mkdir -p /home/meldora/data/v_wordpress/
	@mkdir -p /home/meldora/data/v_mariadb/
	@env UID=${USER} docker-compose -f srcs/docker-compose.yml build

run:
	@env UID=${USER} docker-compose -f srcs/docker-compose.yml up -d

init:	build run

stop:
	@env UID=${USER} docker-compose -f srcs/docker-compose.yml stop

down:
	@env UID=${USER} docker-compose -f srcs/docker-compose.yml down

fclean:	down
	@- docker volume rm -f $$(docker volume ls -q)
	@- docker rmi $$(docker images -qa)
	@- docker network rm $$(docker network ls -q) 2> /dev/null

vclean:
	@rm -rf /home/meldora/data/v_wordpress/*
	@rm -rf /home/meldora/data/v_mariadb/*

re:	fclean init

info:
	docker ps -a
	@echo "---"
	docker images -a
	@echo "---"
	docker volume ls
	@echo "---"
	docker network ls
