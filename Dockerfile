FROM lsiobase/nginx:3.10
LABEL MAINTAINER=christronyxyocum

# Install packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
	python3-dev \
	py3-pip && \
 apk add --no-cache \
  git \
	python3

# Add local files
COPY root/ /

# Ports and volumes
EXPOSE 80
VOLUME /config
