FROM x11docker/lxde

ARG DEBIAN_FRONTEND=noninteractive

RUN packages="                                               \
    ca-certificates                                          \
    kodi                                                     \
    locales                                                  \
    pulseaudio                                               \
    tzdata"                                               && \
                                                             \
    apt-get update                                        && \
    apt-get install -y $packages                          && \
    apt-get -y --purge autoremove                         && \
    rm -rf /var/lib/apt/lists/*

# setup entry point
COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
