FROM	debian:buster

RUN		apt-get update && \
		apt-get install -y redis

COPY	./conf/cache.conf /tmp/.

RUN		cat < /tmp/cache.conf >> /etc/redis/redis.conf

EXPOSE	6379

ENTRYPOINT redis-server --protected-mode no
