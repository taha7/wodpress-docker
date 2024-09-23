include .env

DOCKER_COMPOSE = docker compose -f ./docker/compose.yaml --env-file .env

create:
	${DOCKER_COMPOSE} up -d --build

build:
	${DOCKER_COMPOSE} build

start:
	${DOCKER_COMPOSE} start

stop:
	${DOCKER_COMPOSE} stop

# The --remove-orphans flag from docker compose down allows the user to remove containers which were created in a previous run of docker compose up, but which has since been deleted from the docker-compose.yml file.
up:
	# ${DOCKER_COMPOSE} up -d --remove-orphans
	${DOCKER_COMPOSE} up -d

ps:
	${DOCKER_COMPOSE} ps

logs:
	${DOCKER_COMPOSE} logs --tail=100 -f

down:
	${DOCKER_COMPOSE} down

destroy:
	${DOCKER_COMPOSE} down -v --rmi=all --remove-orphans

restart:
	make stop start

# Connect to WordPress Docker Container
wp_shell:
	docker exec -it "${COMPOSE_PROJECT_NAME}_container__wordpress" bash

# Connect to DB Docker Container
db_shell:
	docker exec -it "${COMPOSE_PROJECT_NAME}_container__mysql" bash