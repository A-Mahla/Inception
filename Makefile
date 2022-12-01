DOCKER_COMPOSE	:=	srcs/docker-compose.yml
DIR				:=	/home/amahla/data

all				:	config
					docker compose -f $(DOCKER_COMPOSE) up -d

config			:
					@mkdir -p $(DIR)/mariadb
					@mkdir -p $(DIR)/wordpress

build			:	config
					docker compose -f $(DOCKER_COMPOSE) build

down			:
					docker compose -f $(DOCKER_COMPOSE) down

prune			:
					docker system prune -f

fprune			:	down
					docker system prune -af
					docker volume prune -f
					docker network prune -f
					sudo rm -rf $(DIR)

re				:	fprune
					make all

.PHONY			:	all config build down prune fprune re
