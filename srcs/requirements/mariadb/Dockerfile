FROM		alpine:3.13.5
RUN		apk update
RUN		apk upgrade
RUN		apk add mariadb mariadb-client bash vim

ARG		WP_BASE
ARG		SQL_R_PASS
ARG		SQL_PASS
ARG		SQL_USER

RUN		mkdir /run/mysqld

COPY		./srcs/my.cnf /etc/my.cnf
COPY		./srcs/start_mdb.sh /
RUN		chmod a+x start_mdb.sh

RUN		mariadb-install-db -u root
RUN		/start_mdb.sh

ENTRYPOINT	["mysqld"]
#CMD		["-u root"]
