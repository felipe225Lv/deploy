# Etapa 1: build del frontend
FROM node:18 AS build-stage
WORKDIR /app
COPY frontend/ ./
RUN npm install
RUN npm run build

# Etapa 2: servidor nginx
FROM nginx:alpine
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build-stage /app/dist/front-golden-eggs/browser/ /usr/share/nginx/html/
