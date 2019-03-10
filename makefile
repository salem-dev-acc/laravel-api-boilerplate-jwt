docker_name = project-php-fpm
docker_image = project-php-fpm

idu = $(shell id -u)
idg = $(shell id -g)

start: #start docker container #
	@CURRENT_UID=$(idu):$(idg) docker-compose -f docker-compose-local.yml up -d

stop: #stop docker container
	@docker-compose -f docker-compose-local.yml down

lint: #create feature
	@clear; docker exec -it $(docker_name) bash -c './vendor/bin/phpstan analyse -- app && ./vendor/squizlabs/php_codesniffer/bin/phpcs -p --standard=PSR2 --colors app/'
