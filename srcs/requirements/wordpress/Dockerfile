FROM		alpine:3.13.5
RUN		apk update && apk upgrade
RUN		apk add wget vim bash php7 php7-fpm php7-mysqli php7-json

RUN		mkdir -p /var/www/meldora
RUN		wget http://wordpress.org/latest.tar.gz && \
		tar -xzvf latest.tar.gz && \
		cp -r wordpress/* /var/www/meldora/ && \
		rm -rf wordpress && rm -f latest.tar.gz

RUN		sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php7/php-fpm.d/www.conf

WORKDIR		/var/www/meldora/
COPY		./srcs/wp-config.php .
ARG		BASE
ARG		USER
ARG		PASS
ARG		DB_HOST
RUN		sed -i "s/_WP_BASE/${BASE}/g" wp-config.php
RUN		sed -i "s/_WP_PASS/${PASS}/g" wp-config.php
RUN		sed -i "s/_SQL_USER/${USER}/g" wp-config.php
RUN		sed -i "s/_SQL_HOST/${DB_HOST}/g" wp-config.php

WORKDIR 	/
ENTRYPOINT	["/usr/sbin/php-fpm7"]
CMD		["-F"]
