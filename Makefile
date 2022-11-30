DOCKER_COMPOSE	:=	srcs/docker-compose.yml
DB_DIR			:=	/home/amahla/data/mariadb
WP_DIR			:=	/home/amahla/data/wordpress

all				:	config
					docker compose -f $(DOCKER_COMPOSE) up

config			:
					@mkdir -p $(DB_DIR)
					@mkdir -p $(WP_DIR)

build			:	config
					docker compose -f $(DOCKER_COMPOSE) build

down			:
					@docker compose -f $(DOCKER_COMPOSE) down

prune			:
					@docker system prune -f

fprune			:	down
					@docker system prune -af
					@docker volume prune -f
					@docker network prune -f
					@rm -rf $(DB_DIR)
					@rm -rf $(WP_DIR)

re				:	fprune
					make all

.PHONY			:	all config build down prune fprune re
