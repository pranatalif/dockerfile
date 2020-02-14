FROM ubuntu:18.04

LABEL maintainer="alifakbarp@gmail.com"

RUN apt-get update && apt-get -y --no-install-recommends install net-tools \
	iputils-ping apt-utils \
	apt-transport-https \
	ca-certificates \
	sudo gcc autoconf automake libtool \
	m4 perl pkg-config \
	nano curl git wget build-essential \
	apt-utils aufs-tools \
	software-properties-common \
   && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sudo -i
RUN git clone https://github.com/sgeto/dhcpstarv.git 
WORKDIR /dhcpstarv
RUN autoreconf -i && ./configure && make && make install
