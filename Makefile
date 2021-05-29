PATH_DOCKER_COMPOSE	:=	srcs/docker-compose.yaml

all:	up

up:
		docker-compose -f $(PATH_DOCKER_COMPOSE) up -d --build

start:		
		docker-compose -f $(PATH_DOCKER_COMPOSE) start

stop:		
		docker-compose -f $(PATH_DOCKER_COMPOSE) stop

down:		
		docker-compose -f $(PATH_DOCKER_COMPOSE) down

logs:
		docker-compose -f $(PATH_DOCKER_COMPOSE) logs $(CONTAINER_NAME)

clean:	stop

fclean:	down
		docker system prune -f

re:		clean all

.PHONY: all up start stop down logs fclean re
