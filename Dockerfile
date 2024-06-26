FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG VERSION=no-version

ENV VERSION=$VERSION

RUN apt-get update -y && \
    apt-get install -y software-properties-common wget unzip && \
    add-apt-repository -y ppa:kicad/kicad-dev-nightly && \
    apt-get install kicad-nightly ffmpeg -y && \ 
    rm -rf /var/lib/apt/lists/* && \
    wget -O Inter.zip https://github.com/rsms/inter/releases/download/v4.0/Inter-4.0.zip && \
    unzip -d inter/ Inter.zip && \
    mv inter /usr/share/fonts/ && \
    wget -O FantasqueSansMono.zip https://github.com/belluzj/fantasque-sans/releases/download/v1.8.0/FantasqueSansMono-Normal.zip && \
    unzip -d fantasquesansmono/ FantasqueSansMono.zip && \
    mv fantasquesansmono /usr/share/fonts/ && \
    wget -O Monaspace.zip https://github.com/githubnext/monaspace/releases/download/v1.000/monaspace-v1.000.zip && \
    unzip -d monaspace/ Monaspace.zip && \
    mv monaspace /usr/share/fonts/ && \
    fc-cache -fv

COPY *.sh /usr/bin/

RUN chmod a+rx /usr/bin/render-pcb.sh && chmod a+rx /usr/bin/kicad_animation.sh

WORKDIR /pwd
