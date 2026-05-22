ARG UBUNTU_VERSION=rolling
FROM ubuntu:${UBUNTU_VERSION}

LABEL org.opencontainers.image.title="Ubuntu Actions Runner"
LABEL org.opencontainers.image.description="simple fake ubuntu actions runner for act"
LABEL org.opencontainers.image.authors="Rye"
LABEL org.opencontainers.image.vendor="Rye"
LABEL org.opencontainers.image.source="https://git.gay/rye/act-ubuntu"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt update && \
    apt install -y --no-install-recommends \
        git curl wget sudo bash ca-certificates gnupg jq tar gzip unzip coreutils 

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -y nodejs && \
    corepack enable

RUN apt update && apt install python3

# maybe don't use the root user lol
RUN useradd -ms /bin/bash runner
USER runner