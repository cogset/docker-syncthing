## Syncthing in Docker
[![build status badge](https://travis-ci.org/cogset/syncthing.svg)](https://travis-ci.org/cogset/syncthing)
[![layers badge](https://images.microbadger.com/badges/image/cogset/syncthing.svg)](https://microbadger.com/images/cogset/syncthing)
### Supported tags and respective Dockerfile links

+ `0.14.19`, `0.14`, `latest` [(0.14/Dockerfile)](https://github.com/cogset/syncthing/blob/master/0.14/Dockerfile)

------
### Author
+ You Ming (youming@funcuter.org)

------
### Usage
##### Generate key and config
```
$ docker run --rm -v /syncthing:/etc/syncthing cogset/syncthing:latest -g /etc/syncthing
```

##### Run Syncthing
```
$ docker run -d --name syncthing -p 22000:22000 -v /syncthing:/etc/syncthing cogset/syncthing:latest
```
The default key and config directory is /etc/syncthing.

##### Run with an web GUI
```
$ docker run -d --name syncthing -p 22000:22000 -p 8384:8384 -v /syncthing:/etc/syncthing cogset/syncthing:latest
```
You can enable web GUI in config and set address and port for it.
