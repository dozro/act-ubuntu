FROM ubuntu:jammy

LABEL org.opencontainers.image.title="Ubuntu Actions Runner"
LABEL org.opencontainers.image.description="simple fake ubuntu actions runner for act"
LABEL org.opencontainers.image.authors="Rye"
LABEL org.opencontainers.image.vendor="Rye"
LABEL org.opencontainers.image.source="https://git.gay/rye/act-ubuntu"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git curl wget sudo bash ca-certificates gnupg jq tar gzip unzip coreutils && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
        nodejs npm && \
    rm -rf /var/lib/apt/lists/* && \
    corepack enable