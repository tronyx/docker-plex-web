FROM lsiobase/alpine.python
LABEL MAINTAINER=christronyxyocum

# Install packages
RUN \
 echo "***** Installing packages *****" && \
 apk add --no-cache \
  gcc \
  musl-dev \
  python3-dev \
  py3-pip \
  git \
  libxml2-dev \
  libxslt-dev && \
 echo "***** Cloning Plex Web repository into /config/plex-web *****" && \
 git clone https://github.com/banjoanton/plex-web.git /config/plex-web && \
 echo "***** Installing application requirements *****" && \
 cd /config/plex-web && \
 pip3 install --no-cache-dir -r requirements.txt && \
 echo "***** Setting permissions on /config *****" && \
 chown -R abc:abc /config && \
 echo "***** Doing some cleanup *****" && \
 rm -rf \
	/root/.cache \
	/tmp/*

# Add local files
COPY root/ /

# Ports and volumes
EXPOSE 5000
VOLUME /config
