FROM lsiobase/alpine.python
LABEL MAINTAINER=christronyxyocum

# Install packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
  gcc \
  musl-dev \
  python3-dev \
  py3-pip && \
 apk add --no-cache \
  git \
  libxml2-dev \
  libxslt-dev && \
 git clone https://github.com/banjoanton/plex-web.git /config/plex-web && \
 cd /config/plex-web && \
 pip3 install --no-cache-dir -r requirements.txt && \
 chown -R abc:abc /config && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.cache \
	/tmp/*

# Add local files
COPY root/ /

# Ports and volumes
EXPOSE 5000
VOLUME /config
