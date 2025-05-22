.PHONY: all

all: clone frontend-build build up

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

frontend-build:
	cd frontend && npm install && npm run build
	mkdir -p nginx/frontend_dist
	cp -r frontend/dist/front-golden-eggs/* nginx/frontend_dist/

build:
	docker-compose build

up:
	docker-compose up -d
