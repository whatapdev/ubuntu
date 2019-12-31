FROM ubuntu:18.04

MAINTAINER Lyan Nam <i@lazysoul.com>

RUN apt-get clean && apt-get update && apt-get install -y locales

# Set locales
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

# Set Timezone
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set Korea source.list
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update && apt-get install dialog apt-utils -y --no-install-recommends \
                curl \
                wget \
                vim \
                net-tools \
                sudo \
                sysstat \
                iputils-ping \
                systemd \
                && rm -rf /var/lib/apt/lists/*
