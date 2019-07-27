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
  libxslt1-dev

# Add local files
COPY root/ /

# Ports and volumes
EXPOSE 80
VOLUME /config
