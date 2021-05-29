# Name images
NAME_NGINX			:=	inception_nginx

# Path directory
PATH_SRCS			:=	srcs
PATH_NGINX			:=	$(PATH_SRCS)/services/nginx

# Path docker-compose file
PATH_DOCKER_COMPOSE	:=	$(PATH_SRCS)/docker-compose.yaml

all:				build_images
					docker-compose -f $(PATH_DOCKER_COMPOSE) up

build_images:
					docker build -t $(NAME_NGINX) $(PATH_NGINX)
					docker-compose -f $(PATH_DOCKER_COMPOSE) build

stop:		
					docker-compose -f $(PATH_DOCKER_COMPOSE) stop

down:		
					docker-compose -f $(PATH_DOCKER_COMPOSE) down

fclean:		down
		docker system prune

re:		fclean all
