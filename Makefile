.PHONY: build run clean love hello

build:
	docker-compose build

run:
	docker-compose up --detach

down:
	docker-compose down

clean: down
	docker image prune -f

love:
	docker build -t tri_demo_love ./demos/love && docker run --rm tri_demo_love

hello:
	docker build -t tri_demo_hello ./demos/hello && docker run --rm tri_demo_hello
