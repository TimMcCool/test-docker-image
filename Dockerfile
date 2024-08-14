FROM        python:3.12-slim

RUN         apt-get update \
            && apt-get -y install --no-install-recommends git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps locales \
            && apt-get clean \
            && rm -rf /var/lib/apt/lists/* \
            && locale-gen en_US.UTF-8
RUN         apt install ffmpeg
RUN         apt install wine

ENV         LC_ALL=en_US.UTF-8
ENV         LANG=en_US.UTF-8
ENV         LANGUAGE=en_US.UTF-8

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

CMD         [ "/bin/bash", "/entrypoint.sh" ]
