FROM nginx:latest

MAINTAINER Maksym Kheilyk "maksym.kheilyk@gmail.com"

EXPOSE 80 443

ENV NGINX_VERSION 1.9.6

COPY conf/nginx/nginx.conf /etc/nginx/nginx.conf
COPY conf/openssl/certs/localhost.crt /etc/nginx/ssl/localhost.crt;
COPY conf/openssl/certs/ca.cert.pem /etc/nginx/ssl/ca.cert.pem
COPY conf/openssl/private/localhost.key /etc/nginx/ssl/localhost.key
COPY project/ /usr/share/nginx/project

CMD ["nginx", "-g", "daemon off;"]