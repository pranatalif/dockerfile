FROM gns3/ubuntu:xenial

LABEL maintainer="alifakbarp@gmail.com"

RUN apt-get update && apt-get install -y --no-install-recommends net-tools \
	net-tools python3 \
	iputils-ping \
	apt-transport-https \
	ca-certificates \
	sudo gcc autoconf automake libtool \
	m4 perl pkg-config \
	nano curl git wget build-essential ccache \
	apt-utils aufs-tools \
	software-properties-common \
	libboost-dev libboost-all-dev libboost-system-dev \
	liblog4cplus-dev libssl-dev \
	postgresql-server-dev-all libpq-dev \
   && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://gitlab.isc.org/isc-projects/kea.git
WORKDIR /kea
RUN autoreconf -i && ./configure --with-pgsql --enable-perfdhcp --enable-shell && make && sudo make install && sudo ldconfig

ENTRYPOINT ["/usr/local/sbin/kea-dhcp4"]
# CMD ["-c", "/usr/local/etc/kea/kea-dhcp4.conf"]

# to install mysql instead of poster
# https://blog.wjacobsen.dk/wp-content/uploads/2018/12/keadhcp-install.txt
