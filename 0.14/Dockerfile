# Syncthing
# AUTHOR You Ming

FROM debian:jessie

MAINTAINER You Ming <youming@funcuter.org>

ENV SYNCTHING_VERSION v0.14.11

# Install
RUN buildDeps="wget ca-certificates" \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && wget -O syncthing.tar.gz "https://github.com/syncthing/syncthing/releases/download/$SYNCTHING_VERSION/syncthing-linux-amd64-$SYNCTHING_VERSION.tar.gz" \
    && mkdir -p /usr/local/syncthing \
    && tar -xzf syncthing.tar.gz -C /usr/local/syncthing --strip-components=1 \
    && rm syncthing.tar.gz \
    && mkdir ln -s /usr/local/syncthing/syncthing /usr/sbin/syncthing \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
# Configure
    && mkdir -p /etc/syncthing

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 22000 8384

CMD ["syncthing"]
