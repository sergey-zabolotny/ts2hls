FROM nginx:1.15.10-alpine

RUN apk add --no-cache \
	fcgiwrap \
	procps \
	net-tools \
	curl \
	bash \
	findutils \
	tzdata \
	ffmpeg \
	mc && \
    rm -rf /etc/nginx && \
    cp /usr/share/zoneinfo/Europe/Chisinau /etc/localtime && \
    apk del tzdata

COPY etc /etc
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
