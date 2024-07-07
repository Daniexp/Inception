all: up

up:
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down

restart:
	docker-compose -f srcs/docker-compose.yml restart

clean:
	docker-compose -f srcs/docker-compose.yml down -v
