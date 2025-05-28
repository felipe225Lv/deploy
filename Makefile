.PHONY: all

all: clone build up

clone:
	@if [ -d "./backend/.git" ]; then \
		echo "Actualizando backend..."; \
		cd backend && git pull origin main; \
	else \
		echo "Clonando backend..."; \
		git clone https://github.com/estebanp22/back-golden-eggs.git ./backend; \
	fi
	@if [ -d "./frontend/.git" ]; then \
		echo "Actualizando frontend..."; \
		cd frontend && git pull origin main; \
	else \
		echo "Clonando frontend..."; \
		git clone https://github.com/estebanp22/front-golden-eggs.git ./frontend; \
	fi

build:
	docker compose build

up:
	docker compose up -d
