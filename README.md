A Docker image for [Plex Web](https://github.com/banjoanton/plex-web) using the `lsiobase/alpine.python` base image.

# christronyxyocum/docker-plex-web

Feel free to submit Pull Requests and report any Issues that you may have found.

## Plex Web

PlexWeb is a web app for Plex servers. Connect to your server via your URL and token to access features like viewing current activity and adding playlists based on IMDb lists. Based on Flask.

## Usage

```
docker create \
  --name plex-web \
  -e PGID=<gid> -e PUID=<uid>  \
  -p 5000:5000 \
  tronyx/plex-web
```

Then start the container with:

```
docker start plex-web
```

For Docker-Compose you can use something similar to the below:

```
plpp:
  container_name: plex-web
  image: tronyx/plex-web
  restart: on-failure
  ports:
    - "5000:5000"
```

## Parameters

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container. So `-p 5000:5000` would expose port 5000 from inside the container to be accessible from the host's IP on port 5000 and `http://192.168.x.x:5000` would show you what's running INSIDE the container on port 5000.

* `-p 5000` - The port(s)
* `-e PGID` Used for GroupID - see below for explanation
* `-e PUID` Used for UserID - see below for explanation

It is based on Alpine Linux with an s6 overlay.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

Point your web browser to `DOCKER-HOST-IP:PLEX-WEB-PORT`, IE: `http://192.168.x.x:5000` and you will first be prompted to add your Plex Server URL and token. The URL for your Plex Server should be in the following format: `http://192.168.1.4:32400`

## Info

* Shell access whilst the container is running: `docker exec -it plex-web /bin/bash`
* To monitor the logs of the container in real-time: `docker logs -f plex-web`
* Container version number: `docker inspect -f '{{ index .Config.Labels "build_version" }}' plex-web`
* Image version number: `docker inspect -f '{{ index .Config.Labels "build_version" }}' tronyx/plex-web`
