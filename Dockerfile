FROM nginx:1.15.10

RUN apt-get update && apt-get -y install --no-install-recommends \
	fcgiwrap \
	procps \
	net-tools \
	curl \
	bash \
	ffmpeg \
	mc && \
    rm -rf /etc/nginx
#    cp /usr/share/zoneinfo/Europe/Chisinau /etc/localtime

COPY etc /etc
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
