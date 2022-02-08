PATH_DOCKER_COMPOSE	:=	srcs/docker-compose.yml

all:	up

up:
		docker-compose -f $(PATH_DOCKER_COMPOSE) up -d --build

start:		
		docker-compose -f $(PATH_DOCKER_COMPOSE) start

stop:		
		docker-compose -f $(PATH_DOCKER_COMPOSE) stop

down:		
		docker-compose -f $(PATH_DOCKER_COMPOSE) down

build:		
		docker-compose -f $(PATH_DOCKER_COMPOSE) build

ps:		
		docker-compose -f $(PATH_DOCKER_COMPOSE) ps

logs:
		docker-compose -f $(PATH_DOCKER_COMPOSE) logs $(CONTAINER_NAME)

clean:	stop

fclean:	down
		docker system prune -f

re:		clean all

.PHONY: all up start stop down build ps logs fclean re
