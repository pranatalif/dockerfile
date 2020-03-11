FROM debian:jessie

# Install Chromium
RUN sed -i.bak 's/jessie main/jessie main contrib non-free/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    chromium \
    curl apt-transport-https sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release nano \
    chromium-l10n \
    libcanberra-gtk-module \
    libexif-dev \
    libpango1.0-0 \
    libv4l-0 \
    pepperflashplugin-nonfree \                                                                          
    --no-install-recommends && \
    mkdir -p /etc/chromium.d/

# Autorun x11vnc
#CMD ["/usr/bin/chromium", "--user-data-dir=/data"]
CMD ["/usr/bin/chromium", "--no-sandbox", "--user-data-dir=/data"]