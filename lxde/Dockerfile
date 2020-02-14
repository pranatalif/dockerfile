FROM ubuntu:xenial
#FROM scratch

LABEL maintainer="alifakbarp@gmail.com"

ENV USER_ACC gns3

RUN apt-get update && apt-get install -y --no-install-recommends \
      policykit-1-gnome \
      dbus-x11 \
      lxde \
      lxlauncher \
      lxmenu-data \
      lxtask \
      procps \
	sudo net-tools python3 unzip \
	iputils-ping nano curl git wget build-essential \
	apt-transport-https \
	ca-certificates \
	perl pkg-config \
	apt-utils aufs-tools \
	software-properties-common \
	vlc psmisc \
     && groupadd -r $USER_ACC \
     && useradd -r -g $USER_ACC $USER_ACC \
     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN apt-get dist-upgrade && add-apt-repository ppa:gnome3-team/gnome3

#&& ppa-purge ppa:gnome3-team/gnome3

RUN apt-get update && apt-get install -y --no-install-recommends epiphany-browser \
   && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "#! /bin/bash\n\
echo 'x11docker/lxde: If the panel does not show an appropriate menu\n\
  and you encounter high CPU usage (seen with kata-runtime),\n\
  please run with option --init=systemd.\n\
'\n\
startlxde\n\
" >/usr/local/bin/start && chmod +x /usr/local/bin/start

WORKDIR /home/$USER_ACC
USER $USER_ACC
CMD ["/usr/local/bin/start"]