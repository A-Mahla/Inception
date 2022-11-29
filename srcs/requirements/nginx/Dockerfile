FROM	debian:buster

RUN		apt-get update && \
		apt-get install -y nginx && \
		apt-get -y install openssl

COPY	./conf/nginx.conf /etc/nginx/conf.d/.

RUN		mkdir	/etc/nginx/ssl \
		&& openssl req -nodes -x509 \
		-subj "/CN=amahla.42.fr" \
		-newkey rsa:2048 \
		-keyout /etc/nginx/ssl/amahla.42.fr.key \
		-out /etc/nginx/ssl/amahla.42.fr.crt

EXPOSE	443

ENTRYPOINT ["nginx","-g","daemon off;"]
