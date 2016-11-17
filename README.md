## Syncthing in Docker
[![build status badge](https://travis-ci.org/youmingdot/docker-syncthing.svg)](https://travis-ci.org/youmingdot/docker-syncthing)
[![layers badge](https://images.microbadger.com/badges/image/youmingdot/syncthing.svg)](https://microbadger.com/images/youmingdot/syncthing)
### Supported tags and respective Dockerfile links

+ `0.14.11`, `0.14`, `latest` [(0.14/Dockerfile)](https://github.com/youmingdot/docker-syncthing/blob/master/0.14/Dockerfile)

------
### Author
+ You Ming (youming@funcuter.org)

------
### Usage
##### Generate key and config
```
$ docker run --rm -v /syncthing:/etc/syncthing youmingdot/shadowsocks:latest -g /etc/syncthing
```

##### Run Syncthing
```
$ docker run -d --name syncthing -p 22000:22000 -v /syncthing:/etc/syncthing youmingdot/shadowsocks:latest
```
The default key and config directory is /etc/syncthing.

##### Run with an web GUI
```
$ docker run -d --name syncthing -p 22000:22000 -p 8384:8384 -v /syncthing:/etc/syncthing youmingdot/shadowsocks:latest
```
You can enable web GUI in config and set address and port for it.

------
### Apologize for my poor English
If there's any grammar or word mistakes, please point out.
如果发现有语法或者用词错误，敬请指出。
