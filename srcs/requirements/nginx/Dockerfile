FROM		alpine:3.13.5

RUN		apk update && apk upgrade \
		&& apk add vim bash nginx openssl \
		&& mkdir /run/nginx/

RUN		openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Meldora Foundation./CN=meldora.42.fr" -addext "subjectAltName=DNS:meldora.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY		./srcs/default.conf /etc/nginx/conf.d/default.conf

EXPOSE		443
ENTRYPOINT	["nginx"]
CMD		["-g", "daemon off;"]

