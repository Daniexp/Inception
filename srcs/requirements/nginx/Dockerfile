FROM debian:12.6

RUN apt-get update && apt-get install -y nginx

#COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/selfsigned.crt /etc/nginx/conf/selfsigned.crt
COPY conf/selfsigned.key /etc/nginx/conf/selfsigned.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
