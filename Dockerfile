# Dockerfile
FROM nginx:1.17
COPY ./nginx.conf /etc/nginx/nginx.conf
WORKDIR /code
COPY ./dist .
EXPOSE 4200:4200
CMD ["nginx", "-g", "daemon off;"]